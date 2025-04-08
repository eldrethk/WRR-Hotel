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
    public class HotelLayoutRepository : GenericRepository<HotelLayout>, IHotelLayout
    {
        protected new WRRContext context;
        private readonly ILogger<HotelLayoutRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };

        public HotelLayoutRepository(WRRContext context, ILogger<HotelLayoutRepository> looger) : base(context)
        {
            this.context = context;
            this._logger = looger;
        }

        public HotelLayout Get(int hotelId)
        {
            HotelLayout hotelLayout = new HotelLayout();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));  
            
            try
            {
                hotelLayout = DapperHelper.GetRecord<HotelLayout>("dbo.genSelHotelLayout", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting hotel layout for hotel ID {hotelId}", hotelId);
            }
            return hotelLayout;
        }

        public void UpdateCSS(HotelLayout hotelLayout)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelLayout.HotelID));
            parameters.Add(P("CSS", hotelLayout.HotelCSS ?? string.Empty));
          
            try
            {
                DapperHelper.ExecuteQuery("dbo.genInsHotelCSS", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating hotel CSS for hotel ID {hotelId}", hotelLayout.HotelID);
            }
        }

        public void UpdateEmailLayout(HotelLayout hotelLayout)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelLayout.HotelID));
            parameters.Add(P("Logo", hotelLayout.EmailHotelLogo ?? string.Empty));
            parameters.Add(P("EmailHeader", hotelLayout.EmailHeaderImage ?? string.Empty));

            try
            {
                DapperHelper.ExecuteQuery("dbo.genInsHotelEmail", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating hotel email layout for hotel ID {hotelId}", hotelLayout.HotelID);
            }
        }

        public void UpdateFooter(HotelLayout hotelLayout)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelLayout.HotelID));
            parameters.Add(P("Footer", hotelLayout.FooterFileName ?? string.Empty));
      
            try
            {
                DapperHelper.ExecuteQuery("dbo.genInsHotelFooter", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating hotel footer for hotel ID {hotelId}", hotelLayout.HotelID);
            }
        }

        public void UpdateHeader(HotelLayout hotelLayout)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelLayout.HotelID));
            parameters.Add(P("Header", hotelLayout.HeaderFileName ?? string.Empty));
          
            try
            {
                DapperHelper.ExecuteQuery("dbo.", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating hotel header for hotel ID {hotelId}", hotelLayout.HotelID);
            }
        }
    }
}
