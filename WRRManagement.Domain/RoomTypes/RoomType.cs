 using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace WRRManagement.Domain.RoomTypes
{
    public class RoomType 
    {
        public int RoomTypeID { get; set; }
        [Required]
        public int HotelID { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }
        [Display(Name = "Based on Adult and Children")]
        public bool AdultBase { get; set; }
        [Display(Name = "Based on Max number of people")]
        public bool MaxBase { get; set; }
        [Display(Name = "Bed Type")]
        [Required]
        public string? BedType { get; set; }

        public RoomType() { }

    }

    

}
