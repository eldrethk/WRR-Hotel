using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.RoomTypes;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.RoomTypeRespository
{
    public class RackRateRespository : GenericRepository<RackRate>, IRackRate
    {
        protected WRRContext context;
        private readonly ILogger<RackRateRespository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public RackRateRespository(WRRContext context, ILogger<RackRateRespository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(RackRate rackRate)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("Start", rackRate.StartDate));
            parameters.Add(P("End", rackRate.EndDate));
            parameters.Add(P("RoomID", rackRate.RoomTypeID));
            parameters.Add(P("TierA", rackRate.TierARate));
            parameters.Add(P("TierB", rackRate.TierBRate));
            parameters.Add(P("TierC", rackRate.TierCRate));
            parameters.Add(P("TierD", rackRate.TierDRate));
       
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsRackRate", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding rack rate: {@rackRate}", rackRate);
            }
            return id;

        }

        public bool CheckDates(int roomId, DateTime startDate, DateTime endDate)
        {
            bool valid = false;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("roomid", roomId));
            parameters.Add(P("startdate", startDate));
            parameters.Add(P("enddate", endDate));
         
            try
            {
                valid = DapperHelper.ExecuteQueryBool("dbo.genVerifyDateRange", parameters, context, "valid");
                //valid = DapperHelper.GetRecord<bool>("dbo.genVerifyDateRanage", parameters, context);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while checking rack rate dates: {@rackRate}", new { roomId, startDate, endDate });
            }
            return valid;
        }

        public RackRate GetById(int id)
        {
            RackRate? rate = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RackRateID", id));
        
            try
            {
                rate = DapperHelper.GetRecord<RackRate>("dbo.genSelRackRateByID", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting rack rate by ID: {@rackRate}", new { id });
            }
            return rate ?? new RackRate() { };
        }

        public List<RackRate> GetByRoomId(int roomId)
        {
            List<RackRate> rates = new List<RackRate>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomId));

            try
            {
                rates = DapperHelper.GetRecords<RackRate>("dbo.genSelRackRateByRoomID", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting rack rates by room ID: {@rackRate}", new { roomId });
            } 
            return rates;
        }

        public RackRate GetRatesForReservation(int roomid, DateTime temp)
        {
            RackRate? rate = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomid));
            parameters.Add(P("Temp", temp));
        
            try
            {
                rate = DapperHelper.GetRecord<RackRate>("dbo.genSelRackRateByDate", parameters, context);
                if (rate == null)
                {
                    rate = new RackRate();
                    _logger.LogCritical("Rack Rates are returning null for room {room} for {date}", roomid, temp);
                }
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting rack rate for reservation: {@rackRate}", new { roomid, temp });
            }
            return rate ?? new RackRate() { }   ;
        }

        public void Invisible(int rackRateId)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RackRateID", rackRateId));
        
            try
            {
                DapperHelper.ExecuteQuery("dbo.genInvisibleRackRate", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while making rack rate invisible: {@rackRate}", new { rackRateId });
            }
            
        }

        public void Update(RackRate rackRate)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("Start", rackRate.StartDate));
            parameters.Add(P("End", rackRate.EndDate));
            parameters.Add(P("RateID", rackRate.RackRateID));
            parameters.Add(P("TierA", rackRate.TierARate));
            parameters.Add(P("TierB", rackRate.TierBRate));
            parameters.Add(P("TierC", rackRate.TierCRate));
            parameters.Add(P("TierD", rackRate.TierDRate));
         
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdRackRate", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating rack rate: {@rackRate}", rackRate);
            }

        }

        public void Visible(int rackRateId)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RackRateID", rackRateId));
           
            try
            {
                DapperHelper.ExecuteQuery("dbo.genVisibleRackRate", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while making rack rate visible: {@rackRate}", new { rackRateId });
            }
        }
    }
}
