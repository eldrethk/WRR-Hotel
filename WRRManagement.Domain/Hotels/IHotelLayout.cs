using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Hotels
{
    public  interface IHotelLayout
    {
        HotelLayout Get(int hotelId);

        void UpdateHeader(HotelLayout hotelLayout);
        void UpdateFooter(HotelLayout hotelLayout);
        void UpdateEmailLayout(HotelLayout hotelLayout);
        void UpdateCSS(HotelLayout hotelLayout);    

    }
}
