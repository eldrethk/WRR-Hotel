using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Infrastructure;

namespace WRRManagement.Domain.RoomTypes
{
    public interface IRoomType 
    {
        List<RoomType> GetAllForHotel(int hotelId);
        void Invisible(int roomId);

        List<RoomType> GetAllValidRoomsForGuestCount(int hotelId, int adults, int child);
        RoomType GetById(int id);

        int Add(RoomType roomType);

        void Update(RoomType roomType);
    }
}
