using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.Reservation;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.ReservationRepository
{
    public class ReservationAmenityRepository : IReservationAmenity
    {
        protected WRRContext context;
        private readonly ILogger<ReservationAmenityRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };

        public ReservationAmenityRepository(WRRContext context, ILogger<ReservationAmenityRepository> logger) 
        {
            this.context = context;
            this._logger = logger;
        }
        public int AddBookedAmenity(ReservationAmenity reservationAmenity)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("ReservationID", reservationAmenity.ReservationID));
         
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsReservationAmenity", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding booked amenity: {@reservationAmenity}", reservationAmenity);
            }
            return id;
        }

        public int AddPackageBookedAmenity(ReservationAmenity reservationAmenity)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("ReservationID", reservationAmenity.ReservationID));
         
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsReservationAmenity", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding package booked amenity: {@reservationAmenity}", reservationAmenity);
            }
            return id;  
        }

        public List<ReservationAmenity> GetAmenitiesBookedForPackage(int reservationId)
        {
            List<ReservationAmenity> list = new List<ReservationAmenity>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("ReservationID", reservationId));
            try
            {
                list = DapperHelper.GetRecords<ReservationAmenity>("dbo.genSelReservationAmenity", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting amenities booked for package with reservation ID {reservationId}", reservationId);
            }
            return list;
        }

        public List<ReservationAmenity> GetAmenitiesBookedForRackRate(int reservationId)
        {
            List<ReservationAmenity> list = new List<ReservationAmenity>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("ReservationID", reservationId));
            try
            {
                list = DapperHelper.GetRecords<ReservationAmenity>("dbo.rptAmenityBookedByReservID", parameters, context);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting amenities booked for rack rate with reservation ID {reservationId}", reservationId);
            }
            return list;
    }
}
}
