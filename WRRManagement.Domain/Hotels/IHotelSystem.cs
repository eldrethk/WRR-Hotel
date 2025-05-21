using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Hotels
{
    public interface IHotelSystem
    {
        void Update(HotelSystem hotelSystem);
        HotelSystem GetSystem(int hotelId);
        int GetPriorDayBooking(int hotelId);

    }
}
