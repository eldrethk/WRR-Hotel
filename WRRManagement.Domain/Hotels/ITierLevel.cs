using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Hotels
{
    public  interface ITierLevel
    {
        List<TierLevel> GetTierLevelsForHotel(int hotelId);
        int Add(int hotelID, DateTime date, char tier);

        void AddDateRange(int hotelID, DateTime start, DateTime end, char tier);
        void Update(Char tier, int tierLevelId);
        Char GetTierForDate(int hotelId,  DateTime date);
    }
}
