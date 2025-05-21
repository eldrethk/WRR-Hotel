using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Infrastructure;

namespace WRRManagement.Domain.RoomTypes
{
    public interface IRoomFeatures :IGenericRepository<RoomFeatures>
    {
        List<RoomFeatures> GetRoomFeatures(int roomId);
        void Update(RoomFeatures roomFeatures);
        int Add(RoomFeatures roomFeatures);
 
        void Delete(int id);

    }
}
