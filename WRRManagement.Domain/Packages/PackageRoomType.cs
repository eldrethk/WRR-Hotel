using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Packages
{
    public class PackageRoomType
    {
        public int PackageRoomTypeID { get; set; }

        [Required]
        public int PackageID { get; set; }
        [Required]
        public int RoomTypeID { get; set; }
    }
}
