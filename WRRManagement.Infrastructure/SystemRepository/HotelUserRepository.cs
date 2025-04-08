using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.Hotels;
using WRRManagement.Domain.System;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.SystemRepository
{
    public class HotelUserRepository : GenericRepository<HotelUser>, IHotelUser
    {
        protected new WRRContext context;
        private readonly ILogger<HotelUserRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public HotelUserRepository(WRRContext context, ILogger<HotelUserRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int AddUserToHotel(string userId, int hotelId)
        {
            int id = 0;
            List<ParameterInfo> parameter = new List<ParameterInfo>();
            parameter.Add(P("UserID", userId));
            parameter.Add(P("hotelId", hotelId));
         
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsHotelUser", parameter, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding user to hotel: {@userId}, {@hotelId}", userId, hotelId);
            }
            return id;
         }

        public List<Hotel> GetHotelsForUser(string userId)
        {
            List<Hotel> hotels = new List<Hotel>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("UserID", userId));
         
            try
            {
                hotels = DapperHelper.GetRecords<Hotel>("dbo.genSelHotelsAssociatedUser", parameters, context);
            }
            catch(Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting hotels for user: {@userId}", userId);
            }
            return hotels;
        }

        public List<HotelUser> GetUserForHotel(int hotelId)
        {
            List<HotelUser> list = new List<HotelUser>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));
           
            try
            {
                list = DapperHelper.GetRecords<HotelUser>("dbo.genSelUserForHotel", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting users for hotel ID {hotelId}", hotelId);
            }
            return list;
        }
    }
}
