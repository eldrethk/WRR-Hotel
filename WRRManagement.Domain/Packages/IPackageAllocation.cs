using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Packages
{
    public  interface IPackageAllocation
    {
        List<Package> GetPackageWithAllocations(int hotelId);
        void Update(int Qty, int AllocationID);
        PackageAllocation GetPackageAllocation(int AllocationID);
        int Add(int roomid, int packageid, DateTime date, int qty);

        void AddDateRange(int roomid, int packageid, DateTime start, DateTime end, int qty);
        bool AllocationIsValid(int roomid, int packageid, DateTime start, DateTime dateTime);
        void RollBackAllocation(int roomid, int packageid, DateTime date);
        int LowestAllocation(int roomid, int packageid, DateTime start, DateTime end);

        List<PackageAllocation> GetPackageAllocations(int packageid, int roomtypeid);

    }
}
