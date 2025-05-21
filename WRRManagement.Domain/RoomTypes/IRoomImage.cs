using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Infrastructure;

namespace WRRManagement.Domain.RoomTypes
{
    public interface IRoomImage
    {
        RoomImage Get(int id);
        List<RoomImage> GetRoomImages(int roomid);
        int Add(RoomImage roomImage);
        void Invisible(int id);

        void SetMainImage(int id, int roomid);
    }
}
