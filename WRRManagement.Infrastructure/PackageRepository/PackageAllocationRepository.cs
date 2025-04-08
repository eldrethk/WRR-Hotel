using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.Packages;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.PackageRepository
{
    public class PackageAllocationRepository : GenericRepository<PackageAllocation>, IPackageAllocation
    {
        protected new WRRContext context;
        private readonly ILogger<PackageAllocationRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public PackageAllocationRepository(WRRContext context, ILogger<PackageAllocationRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(int roomid, int packageid, DateTime date, int qty)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomid));
            parameters.Add(P("packageid", packageid));
            parameters.Add(P("Date", date));
            parameters.Add(P("Quantity", qty));
                        
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsPackageAllocation", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding package allocation: {@packageAllocation}", new { roomid, packageid, date, qty });
            }
            return id;  
        }

        public void AddDateRange(int roomid, int packageid, DateTime start, DateTime end, int qty)
        {
            DateTime temp = start;
            while(temp <= end)
            {
                int id = Add(roomid, packageid, temp, qty);
                temp = temp.AddDays(1);
            }
        }

        public bool AllocationIsValid(int roomid, int packageid, DateTime start, DateTime end)
        {
            bool valid = false;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomid));
            parameters.Add(P("PackageID", packageid));
            parameters.Add(P("Start", start));
            parameters.Add(P("End", end));

            try
            {
                valid = DapperHelper.ExecuteQueryBool("dbo.genVerifyRoomAvailabilityForPackageAllocation", parameters, context, "@Valid");
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while verifying room availability for package allocation: {@packageAllocation}", new { roomid, packageid, start, end });
            }
            return valid;
        }

        public PackageAllocation GetPackageAllocation(int AllocationID)
        {
            PackageAllocation packageAllocation = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("AllocationID", AllocationID));
           
            try
            {
                packageAllocation = DapperHelper.GetRecord<PackageAllocation>("dbo.genSelPackageAllocationByID", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving package allocation with ID {AllocationID}", AllocationID);
            }
            return packageAllocation;
        }

        public List<PackageAllocation> GetPackageAllocations(int packageID, int roomTypeID)
        {
            List<PackageAllocation> packageAllocations = new List<PackageAllocation>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomTypeID));
            parameters.Add(P("PackageID", packageID));

            try
            {
                packageAllocations = DapperHelper.GetRecords<PackageAllocation>("dbo.genSelPackageAllocationByRoomID", parameters, context);
            }
            catch(Exception e) 
            {
                _logger.LogError(e, "Error occurred while retrieving package allocations for Package ID {packageID} and Room Type ID {roomTypeID}", packageID, roomTypeID);
            }
            return packageAllocations;
        }
     
        public List<Package> GetPackageWithAllocations(int hotelId)
        {
            List<Package> packageAllocation = new List<Package>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));
            
            try
            {
                packageAllocation = DapperHelper.GetRecords <Package>("dbo.genSelPackagesWithAllocation", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving packages with allocations for Hotel ID {hotelId}", hotelId);
            }
            return packageAllocation;
        }

        public int LowestAllocation(int roomid, int packageid, DateTime start, DateTime end)
        {
            int Qty = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomid));
            parameters.Add(P("PackageID", packageid));
            parameters.Add(P("Start", start));
            parameters.Add(P("End", end));
                      
            try
            {
                Qty = DapperHelper.ExecuteQueryInt("dbo.genSelLowQtyForPackageAllocation", parameters, context, "@Qty");
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving lowest allocation for package: {@packageAllocation}", new { roomid, packageid, start, end });
            }
            return Qty;
        }

        public void RollBackAllocation(int roomid, int packageid, DateTime date)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomTypeID", roomid));
            parameters.Add(P("PackageID", packageid));
            parameters.Add(P("Date", date));

            try
            {
                DapperHelper.ExecuteQuery("dbo.genRollBackPackageAllocation", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while rolling back package allocation: {@packageAllocation}", new { roomid, packageid, date });
            }
        }

        public void Update(int Qty, int AllocationID)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("AllocationID", AllocationID));
            parameters.Add(P("Quantity", Qty));
               
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdPackageAllocation", parameters, context);
            }
            catch(Exception e) 
            {
                _logger.LogError(e, "Error occurred while updating package allocation: {@packageAllocation}", new { AllocationID, Qty });
            }
        }

        
    }
}
