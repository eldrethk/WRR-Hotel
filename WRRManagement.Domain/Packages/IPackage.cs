using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.RoomTypes;

namespace WRRManagement.Domain.Packages
{
    public interface IPackage
    {
        List<Package> GetPackages(int hotelId);
        int Add(Package package);
        int AddRoomToPackage(int packageId, List<int> roomIds);
        void Update(Package package);
        void Delete(int packageId);
        Package GetPackage(int packageId);
        List<Package> GetPackagesByRoom(int roomId, DateTime start, DateTime end);
        List<Package> GetPackagesWithRackRate(int hotelId);
        List<Package> GetPackagesForSpecialPage(int hotelId);
        void UpdateImageToPackage(int packageId, string imagePath);
        List<RoomType> GetRoomTypes(int packageId);



    }
}
