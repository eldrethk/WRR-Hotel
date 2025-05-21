using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Packages
{
    public class PackageAmenity
    {
        public int PackageAmenityID { get; set; }
        [Required]
        public int PackageID { get; set; }
        [Required]
        public int ExtraAmenityID { get; set; }

        public bool ViewRate { get; set; }
        public bool Mandatory { get; set; }
        [Display(Name ="Max Quantity included")]
        [Range(0, int.MaxValue, ErrorMessage ="Please enter a valid integer number")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter a valid number")]
        public int? MandatoryQuantity { get; set; }
        public bool NeedsQty { get; set; }
        public bool NeedsAdditionalPurchases { get; set; }
        public bool AdditionalPurchases { get; set; }

        public PackageAmenity()
        {
        }

        public PackageAmenity(IDataReader reader)
            : this()
        {
            PackageAmenityID = Convert.ToInt32(reader["AmenityID"]);
            PackageID = Convert.ToInt32(reader["PackageID"]);
            ExtraAmenityID = Convert.ToInt32(reader["ExtraAmenityID"]);
            try
            {
                ViewRate = Convert.ToBoolean(reader["ViewRate"]);
            }
            catch
            {
                ViewRate = false;
            }
            try
            {
                Mandatory = Convert.ToBoolean(reader["Mandatory"]);
            }
            catch
            {
                Mandatory = false;
            }
            try
            {
                MandatoryQuantity = Convert.ToInt32(reader["MandatoryQuantity"]);

            }
            catch
            {
                MandatoryQuantity = 0;
            }
            try
            {
                AdditionalPurchases = Convert.ToBoolean(reader["AdditionalPurchases"]);
            }
            catch
            {
                AdditionalPurchases = false;
            }
        }
    }
}
