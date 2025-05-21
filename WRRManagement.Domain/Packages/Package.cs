using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace WRRManagement.Domain.Packages
{
    //[AtLeastOneSelected("ArrMon", "ArrWed", "ArrThurs", "ArrFri", "ArrSat", "ArrSun", ErrorMessage = "At Least One Arrival Day is required")]
    public class Package : IValidatableObject
    {
        public int PackageID { get; set; }
        [Required(ErrorMessage = "Package Name is required")]
        public required string Name { get; set; }      
      
        //[AllowHtml]
        public required string Description { get; set; }
        [Required]
        [Display(Name="Short Description")]
        [StringLength(500)]
        public required string ShortDescription { get; set; }
        [Required]
        public int HotelID { get; set; }
        [Display(Name ="Amenities")]
        public bool Amenity { get; set; }
        [Display(Name = "Monday")]
        public bool ArrMon { get; set; }
        [Display(Name ="Tuesday")]
        public bool ArrTues { get; set; }
        [Display(Name = "Wednesday")]
        public bool ArrWed { get; set; }
        [Display(Name = "Thursday")]
        public bool ArrThurs { get; set; }
        [Display(Name = "Friday")]
        public bool ArrFri { get; set; }
        [Display(Name = "Saturday")]
        public bool ArrSat { get; set; }
        [Display(Name = "Sunday")]
        public bool ArrSun { get; set; }
        [Required(ErrorMessage ="Min Day is required")]
        [Display(Name= "Min Days")]
        [Range(0,int.MaxValue, ErrorMessage = "Please enter a valid integer number")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter a valid Number")]
        public int MinDays { get; set; }
        [Required(ErrorMessage ="Max Day is required")]
        [Display(Name = "Max Days")]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter a valid integer number")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter a valid Number")]
        [NumGreaterThanOrEqual("MinDays", ErrorMessage = "Max Days has to be greater or equal to Min Days")]
        public int MaxDays { get; set; }
        [Display(Name="Apply Weekend Surcharge")]
        public bool WeekendSurcharge { get; set; }
        [Display(Name="Apply Resort Fees")]
        public bool ResortFees { get; set; }
        [Display(Name = "Valid From")]
        [Required(ErrorMessage ="Valid From Date is required")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        [DataType(DataType.Date)]
        //[DateGreaterThan("ValidtTo")]
        public DateTime ValidFrom { get; set; }
        [Display(Name = "Valid To")]
        [Required(ErrorMessage ="Valid To Date is required")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode =true)]
        [DataType(DataType.Date)]
        [DateGreaterThan("ValidFrom", ErrorMessage ="Valid To must be greater than Valid From")]       
        public DateTime ValidTo { get; set; }
        [Required(ErrorMessage ="Do no Display after Date is required")]
        [Display(Name = "End Display Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode =true)]
        [DataType(DataType.Date)]
        public DateTime EndDisplayDate { get; set; }
        [Display(Name ="Visible")]
        public bool Visible { get; set; }
        public bool NightsFree { get; set; }
        [Display(Name="Number of Nights Free")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter valid Number")]
        public float? NumberOfNights { get; set; }
        public bool PercentOff { get; set; }
        [Display(Name = "Percentage Off")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter valid Number")]
        [Range(0,100, ErrorMessage = "Percentage has to be between 0 to 100%")] 
        [DisplayFormat(DataFormatString ="{0:0}", ApplyFormatInEditMode =true)]
        public decimal? PercentageOff { get; set; }
        [Display(Name = "Rates")]
        public bool PricePoint { get; set; }
        public decimal Deposit { get; set; }
        [Display(Name="Apply Extra Person Fees")]
        public bool ExtraPersonFee { get; set; }
        public bool RoomTypeExtra { get; set; }
        [Display(Name = "Package Allocation")]
        public bool PackageAllocation { get; set; }
        public bool DeletedPackage { get; set; }
        public string? SessionID { get; set; }
        [Display(Name= "Package Image")]
       
        public string? SmImage { get; set; }
        public int Order { get; set; }

        [Display(Name="Display Only On Special Page")]
        public bool SpecialPage { get; set; }

        public enum PackageTypes
        {
            [Display(Name = "Nights Free")]
            Nights,
            [Display(Name = "Percentage off")]
            Percentage,
            [Display(Name = "Rack Rates")]
            Rate

        }

        public Package()
        {

        }

        public Package(IDataReader reader)
          : this()
        {
            PackageID = Convert.ToInt32(reader["PackageID"]);
            Name = reader["Name"].ToString() ?? string.Empty;
            Description = reader["Description"].ToString() ?? string.Empty;
            try
            {
                ShortDescription = reader["ShortDescription"].ToString() ?? string.Empty;
            }
            catch
            {
                ShortDescription = string.Empty;
            }
            HotelID = Convert.ToInt32(reader["HotelID"]);
            Amenity = Convert.ToBoolean(reader["Amenities"]);
            ArrMon = Convert.ToBoolean(reader["ArrMon"]);
            ArrTues = Convert.ToBoolean(reader["ArrTues"]);
            ArrWed = Convert.ToBoolean(reader["ArrWed"]);
            ArrThurs = Convert.ToBoolean(reader["ArrThur"]);
            ArrFri = Convert.ToBoolean(reader["ArrFri"]);
            ArrSat = Convert.ToBoolean(reader["ArrSat"]);
            ArrSun = Convert.ToBoolean(reader["ArrSun"]);
            MinDays = Convert.ToInt32(reader["MinDays"]);
            MaxDays = Convert.ToInt32(reader["MaxDays"]);
            WeekendSurcharge = Convert.ToBoolean(reader["WeekendSurcharge"]);
            ResortFees = Convert.ToBoolean(reader["ResortFees"]);
            ValidFrom = Convert.ToDateTime(reader["ValidFrom"]);
            ValidTo = Convert.ToDateTime(reader["ValidTo"]);
            EndDisplayDate = Convert.ToDateTime(reader["EndDisplayDate"]);
            Visible = Convert.ToBoolean(reader["Visible"]);
            NightsFree = Convert.ToBoolean(reader["NightsFree"]);
            NumberOfNights = Convert.ToSingle(reader["NumberOfNights"]);
            PercentOff = Convert.ToBoolean(reader["PercentOff"]);
            PercentageOff = Convert.ToDecimal(reader["PercentageOff"]);
            PricePoint = Convert.ToBoolean(reader["PricePoint"]);
            Deposit = Convert.ToDecimal(reader["Deposit"]);
            ExtraPersonFee = Convert.ToBoolean(reader["ExtraPersonFee"]);
            //RoomTypeExtra = Convert.ToBoolean(reader["RoomTypeExtra"]);
            PackageAllocation = Convert.ToBoolean(reader["PackageAllocation"]);
            DeletedPackage = Convert.ToBoolean(reader["DeletedPackage"]);
            SmImage = reader["SmImage"].ToString();
            
            try
            {
                Order = Convert.ToInt32(reader["SortOrder"].ToString());
            }
            catch
            {
                Order = 0;
            }
            try
            {
                SpecialPage = Convert.ToBoolean(reader["SpecialPage"].ToString());

            }
            catch
            {
                SpecialPage = false;
            }
        }

        public IEnumerable<ValidationResult> Validate(ValidationContext validationContext)
        {
            if (ArrMon == false && ArrTues == false && ArrWed == false && ArrThurs == false && ArrFri == false && ArrSat == false && ArrSun == false)
                yield return new ValidationResult("At least one arrival day is required");

            if(PercentOff == true)
            {
                if (PercentageOff == null )
                    yield return new ValidationResult("Percentage Off is required.");
            }
            else if(NightsFree == true)
            {
                if (NumberOfNights == null || NumberOfNights <= 0)
                    yield return new ValidationResult("Nights free is required");

            }
        }
        
    }
}
