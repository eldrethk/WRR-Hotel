using Microsoft.Extensions.Logging;
using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.RoomTypes;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.RoomTypeRespository
{
    public class RoomAllocationRepository : GenericRepository<RoomAllocation>, IRoomAllocation
    {
        protected new WRRContext context;
        protected IRoomType roomRep;
        private readonly ILogger<RoomAllocationRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public RoomAllocationRepository(WRRContext context, IRoomType room, ILogger<RoomAllocationRepository> logger) : base(context)
        {
            this.context = context;
            this.roomRep = room;
            this._logger = logger;
        }

        public int Add(int RoomTypeID, DateTime AllocationDate, int Qty)
        {
            int id = 0;
            if (RoomTypeID> 0)
            {             
                List<ParameterInfo> parameters = new List<ParameterInfo>();
                parameters.Add(P("RoomID", RoomTypeID));
                parameters.Add(P("Date", AllocationDate));
                parameters.Add(P("Quantity", Qty));
                try
                {
                    id = DapperHelper.ExecuteQuery("dbo.genInsAllocation", parameters, context);
                }
                catch (Exception ex) 
                {
                    _logger.LogError(ex, "Error occurred while adding room allocation: {@roomAllocation}", new { RoomTypeID, AllocationDate, Qty });
                }
            }
            return id; ;
        }

        public void AddAllocationBack(int roomtypeID, DateTime date)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomTypeID", roomtypeID));
            parameters.Add(P("Date", date));

            try
            {
                DapperHelper.ExecuteQuery("dbo.genRollBackAllocation", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while rolling back room allocation: {@roomtypeID}, {@date}", roomtypeID, date);
            }
        }

        public void AddDateRange(int RoomTypeID, DateTime start, DateTime end, int Qty)
        {
            if (start > DateTime.MinValue && end > DateTime.MinValue)
            {
                DateTime temp = start;
                while (temp <= end)
                {
                    Add(RoomTypeID, temp, Qty); 
                    temp = temp.AddDays(1);
                }
            }
          
        }

        public bool AllocationIsValid(int roomId, DateTime start, DateTime end)
        {
            bool valid = false;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomId));
            parameters.Add(P("Start", start));
            parameters.Add(P("End", end));
            try
            {
                valid = DapperHelper.ExecuteQueryBool("dbo.genVerifyRoomAvailabilityForRoomAllocation", parameters, context, "@Valid");
            }
            catch(Exception ex)
            {
                _logger.LogError(ex, "Error occurred to check validation of allocaiton for {roomID} for {start} - {end}", roomId, start, end);
            }
            return valid;

        }

        public List<RoomAllocation> GetAllForRoom(int roomId)
        {
            List<RoomAllocation> allocations = new List<RoomAllocation>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomId", roomId));
 
            try
            {
                allocations = DapperHelper.GetRecords<RoomAllocation>("dbo.genSelAllocationByRoomID", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while validating allocations for room ID {roomId}", roomId);
            }
            return allocations;
        }

        public RoomAllocation GetByID(int allocationId)
        {
            RoomAllocation allocation = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("AllocationID", allocationId));
  
            try
            {
                allocation = DapperHelper.GetRecord<RoomAllocation>("dbo.genSelAllocationByID", parameters, context);
                string roomname = roomRep.GetById(allocation.RoomTypeID).Name ?? string.Empty;
                allocation.RoomName = roomname;
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving allocation with ID {allocationId}", allocationId);
            }
            return allocation ?? new RoomAllocation();
        }

        public int GetQuantityForDay(int roomId, DateTime date)
        {
            int quantity = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomId));
            parameters.Add(P("PickedDate", date));

            try
            {
                quantity = DapperHelper.ExecuteQuery("dbo.genSelAllocationByDay", parameters, context);
               
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting allocation quantity for room ID {roomId} on date {date}", roomId, date);
            } 
            return quantity;
        }

        public int LowestAllocation(int roomId, DateTime start, DateTime end)
        {
            int quantity = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomId));
            parameters.Add(P("Start", start));
            parameters.Add(P("End", end));
       
            try
            {
                quantity = DapperHelper.ExecuteQueryInt("dbo.genSelLowQtyForRoomAllocation", parameters, context, "@Qty");
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving lowest allocation for room ID {roomId} between {start} and {end}", roomId, start, end);
            }
            return quantity;
        }

        public void UpdateQuantity(int qty, int allocationId)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("AllocationID", allocationId));
            parameters.Add(P("Quantity", qty));
          
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdAllocation", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating allocation with ID {allocationId} to quantity {qty}", allocationId, qty);
            }

        }
    }
}
