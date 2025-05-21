using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.RoomTypes;

namespace WRRManagement.Domain.APIModels
{
    public class ViewRoomModel
    {
        public required RoomType roomType { get; set; }
        public string? mainImage { get; set; } 
        public List<RoomImage>? roomImages { get; set; }
        public List<RoomFeatures>? roomFeatures { get; set; }
        public int MaxGuests { get; set; }
    }
}
