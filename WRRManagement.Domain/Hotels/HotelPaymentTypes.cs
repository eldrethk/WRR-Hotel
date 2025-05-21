using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Hotels
{
    public class HotelPaymentTypes
    {
        public int HotelPaymentID { get; set; }
        [Required]
        public int PaymentTypeID { get; set; }        
        [Required]
        public int HotelID { get; set; }

        public HotelPaymentTypes() { }

        public HotelPaymentTypes(IDataReader rd): this()
        {
            PaymentTypeID = Convert.ToInt32(rd["PaymentTypeID"]);
            HotelID = Convert.ToInt32(rd["HotelID"]);
        }
    }

   
}
