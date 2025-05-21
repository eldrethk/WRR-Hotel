using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace WRRManagement.Domain.Hotels
{
    public class Disclaimer
    {
        public int DisclaimerID { get; set; }

        [Display(Name ="Reservation Disclaimer")]
        [DataType(DataType.MultilineText)]
        [Required(ErrorMessage ="A Disclaimer is required for the reservation system")]        
        public string DisclaimerText { get; set; }
        [Required]
        public int HotelID { get; set; }
        [Required]
        [Display(Name ="Email Disclaimer")]
        [DataType(DataType.MultilineText)]      
        public string EmailDisclaimerText { get; set; }


       
        public Disclaimer()
        {
        }

    }
}
