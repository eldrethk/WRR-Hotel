using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Reservation
{
    public interface IReservation
    {
        int AddReservation(Reservation reservation);

        void AddReservationDailyRate(AvailableRackRoom rackRoom, int ReservationID);
    }
}
