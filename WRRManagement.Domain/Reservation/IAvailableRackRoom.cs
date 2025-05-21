using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WRRManagement.Domain.RoomTypes;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Reservation
{
    public interface IAvailableRackRoom
    {
        List<AvailableRackRoom> GetAvailableRackRooms(int hotelId, DateTime startDate, DateTime endDate, int adults, int children);
    }
}
