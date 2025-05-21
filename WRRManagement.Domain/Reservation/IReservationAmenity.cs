using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Reservation
{
    public interface IReservationAmenity
    {
        int AddBookedAmenity(ReservationAmenity reservationAmenity);
        int AddPackageBookedAmenity(ReservationAmenity reservationAmenity);
        List<ReservationAmenity> GetAmenitiesBookedForRackRate(int reservationId);
        List<ReservationAmenity> GetAmenitiesBookedForPackage(int reservationId);
    }
}
