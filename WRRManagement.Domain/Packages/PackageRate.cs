using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Packages
{
    public class PackageRate
    {
        public int RateID { get; set; }
        [Required]
        public int PackageID { get; set; }
        [Required]
        public int RoomTypeID { get; set; }
        [Required(ErrorMessage ="Start Date is required")]
        [Display(Name ="Start Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode =true)]
        [DataType(DataType.DateTime)]
        public DateTime StartDate { get; set; }
        [Required(ErrorMessage ="End Date is required")]
        [Display(Name ="End Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        [DataType(DataType.DateTime)]
        [DateGreaterThan("StartDate", ErrorMessage = "End Date must be greater than Start Date")]
        public DateTime EndDate { get; set; }
        [Required(ErrorMessage = "Rate is required")]
        [Display(Name ="Rate")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        [DataType(DataType.Currency)]
        public decimal Price { get; set; }
        public bool Visible { get; set; }

        public PackageRate()
        {
        }

        public PackageRate(IDataReader reader)
            : this()
        {
            RateID = Convert.ToInt32(reader["RateID"]);
            PackageID = Convert.ToInt32(reader["PackageID"]);
            RoomTypeID = Convert.ToInt32(reader["RoomTypeID"]);
            StartDate = Convert.ToDateTime(reader["StartDate"]);
            EndDate = Convert.ToDateTime(reader["EndDate"]);
            Price = Convert.ToDecimal(reader["Price"]);
            Visible = Convert.ToBoolean(reader["Visible"]);
        }
    }
}
