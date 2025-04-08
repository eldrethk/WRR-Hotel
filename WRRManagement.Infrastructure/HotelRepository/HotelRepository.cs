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
    public class HotelRepository : GenericRepository<Hotel>, IHotel
    {
        protected new WRRContext context;
        private readonly ILogger<HotelRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };

        public HotelRepository(WRRContext context, ILogger<HotelRepository> _logger) : base(context)
        {
            this.context = context;
            this._logger = _logger;
        }

        public Hotel GetHotel(int id)
        {
            Hotel hotel = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", id));
  
            try
            {
                hotel = DapperHelper.GetRecord<Hotel>("dbo.genSelHotel", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting hotel with ID {id}", id);
            }
            return hotel;
        }

        public void Update(Hotel hotel)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotel.HotelID));
            parameters.Add(P("Name", hotel.Name ?? string.Empty));
            parameters.Add(P("Address1", hotel.Address1 ?? string.Empty));
            parameters.Add(P("Address2", hotel.Address2 ?? string.Empty));
            parameters.Add(P("City", hotel.City ?? string.Empty));
            parameters.Add(P("State", hotel.State ?? string.Empty));
            parameters.Add(P("Zipcode", hotel.ZipCode ?? string.Empty));
            parameters.Add(P("FreePhone", hotel.TollFreePhone ?? string.Empty));
            parameters.Add(P("LocalPhone", hotel.LocalPhone ?? string.Empty));
            parameters.Add(P("CheckIn", hotel.CheckIn ?? string.Empty));
            parameters.Add(P("CheckOut", hotel.CheckOut ?? string.Empty));
            parameters.Add(P("Email", hotel.Email ?? string.Empty));
            parameters.Add(P("AdminEmail", hotel.AdminEmail ?? string.Empty));
            parameters.Add(P("Website", hotel.Website ?? string.Empty));
            parameters.Add(P("Desc", hotel.Description ?? string.Empty));

            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdHotel", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating hotel with ID {id}", hotel.HotelID);
            }
        }
    }
}
