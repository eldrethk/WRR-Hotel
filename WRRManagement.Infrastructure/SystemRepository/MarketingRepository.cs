using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.System;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.SystemRepository
{
    public class MarketingRepository : GenericRepository<OptInEmails>, IOptInEmails
    {
        protected new WRRContext context;
        private readonly ILogger<MarketingRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public MarketingRepository(WRRContext context, ILogger<MarketingRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(string email, int hotelID, string firstname, string lastname, string state)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("Email", email));
            parameters.Add(P("HotelID", hotelID));
            parameters.Add(P("FirstName", firstname));
            parameters.Add(P("LastName", lastname));
            parameters.Add(P("State", state));
                      
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsOptInEmail", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding opt-in email: {@email}", new { email, hotelID, firstname, lastname, state });
            }
            return id;
        }

        public List<OptInEmails> GetAll(int hotelId, DateTime start, DateTime end)
        {
            List<OptInEmails> list = new List<OptInEmails>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));
            parameters.Add(P("StartDate", start));
            parameters.Add(P("EndDate", end));
    
            try
            {
                list = DapperHelper.GetRecords<OptInEmails>("dbo.genSelEmailList", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving opt-in emails: {@hotelId}, {@start}, {@end}", hotelId, start, end);
            }
            return list;
        }
    }
}
