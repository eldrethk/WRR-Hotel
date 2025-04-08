using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Reservation;
using WRRManagement.Infrastructure.Data;
using WRRManagement.Domain.Base;
using Microsoft.Extensions.Logging;

namespace WRRManagement.Infrastructure.ReservationRepository
{
    public class ReportManagerRepository : IReservationQue
    {
        protected WRRContext context;
        private readonly ILogger<ReportManagerRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };

        public ReportManagerRepository(WRRContext context, ILogger<ReportManagerRepository> logger)
        {
            this.context = context;
            this._logger = logger;
        }
        public int AddReservationQue(ReservationQue reservationQue)
        {
            int ID = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("ReservationID", reservationQue.ReservationID));
            parameters.Add(P("BookedDate", reservationQue.BookedDate));
            parameters.Add(P("CusName", reservationQue.CustomerName));
            parameters.Add(P("ReservationType", reservationQue.ReservationType));
            parameters.Add(P("HotelID", reservationQue.HotelID));
         
            try
            {
                ID = DapperHelper.ExecuteQuery("dbo.rptSelReservationQue", parameters, context);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding reservation queue: {@reservationQue}", reservationQue);
            }
            return ID;
        }

        public Amenitity_Booked GetAmenitity30BookReport(int hotelID)
        {
            throw new NotImplementedException();
        }

        public List<BookedAmenity> GetBookedAmenities(int hotelID, DateTime start, DateTime end)
        {
            throw new NotImplementedException();
        }

        public List<BookedAmenity> GetPackageBookedAmenities(int hotelID, DateTime start, DateTime end)
        {
            throw new NotImplementedException();
        }

        public Reservation_Booked GetReservation30BookReport(int hotelID)
        {
            throw new NotImplementedException();
        }

        public List<Reservation> GetReservationForReport(int hotelID, DateTime start, DateTime end, string searchBy)
        {
            throw new NotImplementedException();
        }

        public List<ReservationQue> GetReservationQue(int hotelID)
        {
            List<ReservationQue> list = new List<ReservationQue>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelID));
         
            try
            {
                list = DapperHelper.GetRecords<ReservationQue>("dbo.genSelReservationQue", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving reservation queue for hotel ID {hotelID}", hotelID);
            }
            return list;
        }

        public Specials_Booked GetSpecials30BookReport(int hotelID)
        {
            throw new NotImplementedException();
        }

        public void UpdateReservationQue(int ReservationID, string UserName, int hotelID)
        {
            throw new NotImplementedException();
        }
    }
}
