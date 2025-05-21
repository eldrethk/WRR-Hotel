using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Infrastructure;

namespace WRRManagement.Domain.RoomTypes
{
    public  interface IRoomAllocation : IGenericRepository<RoomAllocation>
    {
        int GetQuantityForDay(int roomId, DateTime date);
        List<RoomAllocation> GetAllForRoom(int roomId);

        RoomAllocation GetByID(int allocationId);

        void UpdateQuantity(int qty, int allocationId);

        void AddDateRange(int RoomTypeID, DateTime start, DateTime end, int Qty);

        int Add(int RoomTypeID, DateTime Allocation, int Qty);
        bool AllocationIsValid(int roomId, DateTime start, DateTime end);

        int LowestAllocation(int roomId, DateTime start, DateTime end);
        void AddAllocationBack(int roomtypeID, DateTime date);

    }
}
