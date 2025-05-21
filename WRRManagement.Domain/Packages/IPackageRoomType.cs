using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.RoomTypes;

namespace WRRManagement.Domain.Packages
{
    public  interface IPackageRoomType
    {
        void AddRoomToPackage(int packageid, List<int> rooms);
        List<RoomType> GetAllValidRoomBasedOnGuestCount(int packageid, int adult, int child);
        List<RoomType> GetRoomTypes(int packageid);

        
    }
}
