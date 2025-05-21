using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Hotels
{
    public class TierLevel
    {
        public int TierLevelID { get; set; }
        [Required]
        public DateTime TierDate { get; set; }
        [Required]
        public char Tier { get; set; } = 'A';
 
        [Required]
        public int HotelID { get; set; }

      

        public TierLevel()
        {
        }

   
    }

 
     
}
