using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.APIModels;
using WRRManagement.Domain.RoomTypes;

namespace WRRManagement.Domain.Reservation
{
    public class AvailableRackRoom
    {
        public ViewRoomModel? viewRoomType { get; set; }     
        public int maxGuests { get; set; }
        public List<DateTime>? ratesDate { get; set; }
        public List<decimal>? rates { get; set; }
        public decimal subTotal { get; set; }
        public decimal weekEndFee { get; set; }
        public decimal extraGuestFee { get; set; }
        public decimal tax { get; set; }
        public decimal resortFee { get; set; }
        public decimal allExtraFees { get; set; }

        public decimal avgDailyRate { get; set; }
        public decimal total { get; set; }
        public decimal deposit { get; set; }
        public int minStay { get; set; }

        public string ViewRoomRateAs { get; set; } = "Daily Rates";

        public int LowAllocation { get; set; }
    }
}
