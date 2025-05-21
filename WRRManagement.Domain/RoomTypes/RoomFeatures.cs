using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.RoomTypes
{
    public class RoomFeatures
    {
        public int ID { get; set; }
        [Required]
        public int RoomTypeID { get; set; }
        [Required]
        public string Icon { get; set; }
        [Required]
        public string Features { get; set; }

        public RoomFeatures() { }

      
    }
}
