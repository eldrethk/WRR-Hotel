using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.RoomTypes;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.RoomTypeRespository
{
    public class MinStayRepository : GenericRepository<MinStay>, IMinStay
    {
        protected new WRRContext context;
        private readonly ILogger<MinStayRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public MinStayRepository(WRRContext context, ILogger<MinStayRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(int RoomTypeID, DateTime StayDate, int Qty)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", RoomTypeID));
            parameters.Add(P("Date", StayDate));
            parameters.Add(P("Quantity", Qty));            

            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsMinStay", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding min stay: {@minStay}", new { RoomTypeID, StayDate, Qty });
            }
            return id;
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

        public MinStay GetById(int id)
        {
            MinStay minStay = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("MinStayID", id));
  
            try
            {
                minStay = DapperHelper.GetRecord<MinStay>("dbo.genSelMinStayByID", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting min stay by ID: {@minStay}", new { id });
            }
            return minStay;
        }

        public List<MinStay> GetAllForRoom(int roomId)
        {
            List<MinStay> stays = new List<MinStay>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomId));
          
            try
            {                
                stays = DapperHelper.GetRecords<MinStay>("dbo.genSelMinStayByRoomID", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting all min stays for room ID {roomId}", roomId);
            }
            return stays;
        }

        public int GetQuantityForDate(int roomId, DateTime date)
        {
            int quantity = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomId));
            parameters.Add(P("PickedDate", date));

            try
            {
                quantity = DapperHelper.ExecuteQuery("dbo.genSelMinStayByDate", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting min stay quantity for room ID {roomId} on date {date}", roomId, date);
            }
            return quantity;
        }
    

        public void Update(int Quantity, int minStayId)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("Quantity", Quantity));
            parameters.Add(P("MinStayID", minStayId));
     
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdMinStay", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating min stay with ID {minStayId}", minStayId);
            }             
        }

    }
}
