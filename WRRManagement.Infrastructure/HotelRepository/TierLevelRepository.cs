using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.Hotels;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.HotelRepository
{
    public class TierLevelRepository : GenericRepository<TierLevel>, ITierLevel
    {
        protected new WRRContext context;
        private readonly ILogger<TierLevelRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public TierLevelRepository(WRRContext context, ILogger<TierLevelRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(int hotelID , DateTime date, char tier)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelID));
            parameters.Add(P("Date", date));
            parameters.Add(P("Level", tier));
      
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsTierLevel", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding tier level: {@tierLevel}", new { hotelID, date, tier });
            }
            return id;
        }
        public void AddDateRange(int hotelID, DateTime start, DateTime end, char tier)
        {
            if (start > DateTime.MinValue && end > DateTime.MinValue && hotelID > 0)
            {
                DateTime temp = start;
                while (temp <= end)
                {
                    int id = Add(hotelID, temp, tier);
                    temp = temp.AddDays(1);
                }
            }
        }

        public char GetTierForDate(int hotelId, DateTime date)
        {
            string tier = string.Empty;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));
            parameters.Add(P("Date", date));
            
            try
            {
                tier = DapperHelper.ExecuteQueryString("dbo.genSelTierLevelByDate", parameters, context, "@Tier");
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting tier level for hotel ID {hotelId} on date {date}", hotelId, date);
            }
            if(string.IsNullOrEmpty(tier))
            {
                return 'a';
            }            
            return Convert.ToChar(tier.ToLower());
        
        }

        public List<TierLevel> GetTierLevelsForHotel(int hotelId)
        {
            List<TierLevel> levels = new List<TierLevel>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));
          
            try
            {
                levels = DapperHelper.GetRecords<TierLevel>("dbo.genSelTierLevelByHotelID", parameters, context);            
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting tier levels for hotel ID {hotelId}", hotelId);
            }
            return levels;
        }

        public void Update(char tier, int tierLevelId)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("TierLevelID", tierLevelId));
            parameters.Add(P("Tier", tier));
       
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdTierLevel", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating tier level ID {tierLevelId} to {tier}", tierLevelId, tier);
            }    
            
        }
    }
}
