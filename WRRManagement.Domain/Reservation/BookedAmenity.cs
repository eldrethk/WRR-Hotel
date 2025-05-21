using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Amenities;

namespace WRRManagement.Domain.Reservation
{
    public class BookedAmenity
    {
        public required ReservationAmenity bookedAmenity { get; set; }
        public required ExtraAmenity extraAmenity { get; set; }
    }
}
