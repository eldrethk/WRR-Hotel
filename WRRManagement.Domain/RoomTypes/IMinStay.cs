using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Infrastructure;

namespace WRRManagement.Domain.RoomTypes
{
    public interface IMinStay 
    {
        int Add(int RoomTypeID, DateTime StayDate, int Qty);

        void AddDateRange(int RoomTypeID, DateTime start, DateTime end, int Qty);

        MinStay GetById(int id);

        List<MinStay> GetAllForRoom(int roomId);

        int GetQuantityForDate(int roomId, DateTime date);

        void Update(int Quantity, int minStayId);

      
        



    }
}
