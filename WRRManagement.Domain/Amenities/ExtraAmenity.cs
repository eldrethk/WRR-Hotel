using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace WRRManagement.Domain.Amenities
{
    public class ExtraAmenity : IValidatableObject
    {
        public int AmenityID { get; set; }
        [Required]
        public int HotelID { get; set; }
        [Required(ErrorMessage = "Amenity Name is required")]
        public string? Name { get; set; } 
        [Required]
        [Display(Name="Short Description")]
        [StringLength(500)]
        public required string ShortDescription { get; set; }
       
        //[AllowHtml]
        [DataType(DataType.Html)]
        public required string Description { get; set; }
        [Required(ErrorMessage ="Amenity's Rate is required")]
        [Display(Name ="Amenity Rate")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        [DataType(DataType.Currency)]
        public decimal AmenityRate { get; set; }
        [Required(ErrorMessage = "Tax Rate is required")]
        [Display(Name="Tax Rate")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter a valid number")]
        [DisplayFormat(DataFormatString = "{0:0}", ApplyFormatInEditMode =true)]
        [Range(0, 100, ErrorMessage = "Tax Rate has to be between 0 to 100%")]
        public decimal Tax { get; set; }
        [Display(Name="Show rates on booking")]
        public bool ViewRate { get; set; }
        public bool Mandatory { get; set; }
        public bool Visible { get; set; }
        [Display(Name = "Per Day Per Person")]
        public bool PerDayPerPerson { get; set; }
        [Display(Name = "Per Day")]
        public bool PerDay { get; set; }
        [Display(Name="Per Night Stay")]
        public bool PerNightStay { get; set; }
        [Display(Name = "One Time Fee")]
        public bool OneTimeFee { get; set; }
        [Display(Name = "One Time Fee Per Person")]
        public bool OneTimeFeePerson { get; set; }
        public bool Discount { get; set; }
        [Display(Name = "Original Rate")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        [DataType(DataType.Currency)]
        public decimal? DiscountRegularRate { get; set; }
        [Display(Name = "Amenity's Image")]
        public string? PictureUrl { get; set; }
        public bool ViewOnRackRate { get; set; }
        public int? MandatoryQty { get; set; }
        public bool AdditionalPurchases { get; set; }

        #region Constructor
        public ExtraAmenity()
        {       
        }

      
        #endregion

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (Discount == true && !DiscountRegularRate.HasValue)
                yield return new ValidationResult("Original Rate is required for Discount");
        }
    }


}
