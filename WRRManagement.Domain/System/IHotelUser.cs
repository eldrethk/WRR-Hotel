using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Hotels;
using WRRManagement.Infrastructure;


namespace WRRManagement.Domain.System
{
    public  interface IHotelUser 
    {
       List<Hotel> GetHotelsForUser(string userId);
    
        int AddUserToHotel(string userId, int hotelId);

        List<HotelUser> GetUserForHotel(int hotelId);
     
    }
}
