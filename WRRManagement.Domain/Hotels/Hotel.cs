using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;

namespace WRRManagement.Domain.Hotels
{
    public class Hotel
    {
        public int HotelID { get; set; }
        [Required]
        public required string Name { get; set; }
        [Required]
        [DataType(DataType.EmailAddress)]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        [RegularExpression("^[a-z0-9_\\+-]+(\\.[a-z0-9_\\+-]+)*@[a-z0-9-]+(\\.[a-z0-9]+)*\\.([a-z]{2,4})$", ErrorMessage = "Invalid email format.")]
        public required string Email { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        [EmailAddress(ErrorMessage  ="Invalid Email Address")]
        [Display(Name="Admin Email")]
        public required string AdminEmail { get; set; }
        [Required]
        [Display(Name ="Address")]
        public required string Address1 { get; set; }
        [Display(Name = "Address")]
        public string Address2 { get; set; } = string.Empty;
        [Required]
        public required string City { get; set; }
        [Required]
        public required string State { get; set; }
        [Required(ErrorMessage ="Zip Code is required")]
        [Display(Name="Zip Code")]
        [DataType(DataType.PostalCode)]        
        public required string ZipCode { get; set; }
        [Display(Name = "Toll Free Phone Number")]
        [DataType(DataType.PhoneNumber)]
        [Phone(ErrorMessage = "Invalid Phone number")]
        public string TollFreePhone { get; set; } = string.Empty;
        [Display(Name="Local Phone Number")]
        [DataType(DataType.PhoneNumber)]
        public string LocalPhone { get; set; } = string.Empty;
        public string Website { get; set; } = string.Empty;
        [DataType(DataType.MultilineText)]
        public string Description { get; set; } = string.Empty;
        [Required(ErrorMessage ="Hotel Tax Rate is required")]
        public decimal TaxRate { get; set; }
        [Display(Name = "Check In")]
        public string CheckIn { get; set; } = string.Empty;
        [Display(Name = "Check Out")]
        public string CheckOut { get; set; } = string.Empty;



        public Hotel()
        {

        }

    }
}