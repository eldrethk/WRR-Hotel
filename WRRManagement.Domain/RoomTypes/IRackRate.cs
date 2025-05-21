using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Infrastructure;

namespace WRRManagement.Domain.RoomTypes
{
    public interface IRackRate : IGenericRepository<RackRate>
    {
        int Add(RackRate rackRate);
        void Update(RackRate rackRate);
        RackRate GetById(int id);
        List<RackRate> GetByRoomId(int roomId);
        bool CheckDates(int roomId, DateTime startDate, DateTime endDate);
        void Invisible(int rackRateId);
        void Visible(int rackRateId);
        RackRate GetRatesForReservation(int roomid, DateTime temp);


    }
}
