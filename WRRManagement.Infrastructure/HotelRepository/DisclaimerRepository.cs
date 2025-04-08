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
    public class DisclaimerRepository : GenericRepository<Disclaimer>, IDisclaimer
    {
        protected new WRRContext context;
        private readonly ILogger<DisclaimerRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public DisclaimerRepository(WRRContext context, ILogger<DisclaimerRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public Disclaimer GetDisclaimer(int hotelId)
        {
            Disclaimer disclaimer = new Disclaimer();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));
        
            try
            {
                disclaimer = DapperHelper.GetRecord<Disclaimer>("dbo.genSelDisclaimer", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving disclaimer for hotel ID {hotelId}", hotelId);
            }
            return disclaimer;
        }

        public void Update(Disclaimer disclaimer)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("Disclaimer", disclaimer.DisclaimerText));
            parameters.Add(P("Email", disclaimer.EmailDisclaimerText));
            parameters.Add(P("HotelID", disclaimer.HotelID));         

            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdDisclaimer", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating disclaimer for hotel ID {hotelId}", disclaimer.HotelID);
            }
        }
    }
}
