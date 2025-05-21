using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Reservation
{
    public interface IReservationQue
    {
        int AddReservationQue(ReservationQue reservationQue);
        List<ReservationQue> GetReservationQue(int hotelID);
        void UpdateReservationQue(int ReservationID, string UserName, int hotelID);
        Reservation_Booked GetReservation30BookReport(int hotelID);
        Specials_Booked GetSpecials30BookReport(int hotelID);
        Amenitity_Booked GetAmenitity30BookReport(int hotelID);
        List<Reservation> GetReservationForReport(int hotelID, DateTime start, DateTime end, string searchBy);
        List<BookedAmenity> GetBookedAmenities(int hotelID, DateTime start, DateTime end);
        List<BookedAmenity> GetPackageBookedAmenities(int hotelID, DateTime start, DateTime end);

    }
}
