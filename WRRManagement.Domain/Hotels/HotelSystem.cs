using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Hotels
{
    public class HotelSystem
    {
        public int SystemID { get; set; }
        [Required]
        public int HotelID { get; set; }
        [Display(Name = "Display Room Rates on Main Page As")]
        [Required]
        public required string DisplayRoomRatesAs { get; set; } = "Avg Per Day";
        [Display(Name = "Display Package Rates on Main Page As")]
        [Required]
        public required string DisplayPackageRatesAs { get; set; } = "Avg Per Day";
        [Display(Name = "Breakdown Room Rates As")]
        [Required]
        public required string DisplayRoomBreakDownAs { get; set; } = "Daily Rates";
        [Display(Name ="Breakdown Package Rates As")]
        [Required]
        public required string DisplayPackageBreakDownAs { get; set; } = "Daily Rates";
        [Display(Name = "Low Allocation Warning")]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter a valid integer number")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter valid Number")]
        public int LowAllocationLimit { get; set; } = 10;
        [Display(Name ="Prior Booking Days")]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter a valid integer number")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter valid Number")]
        public int PriorBook { get; set; }
        [Display(Name = "Room Deposit")]
        [Required]
        public required string DepositRoomCalAs { get; set; } = "First Night Room Stay";
        [Display(Name ="Package Deposit")]
        [Required]
        public required string DepositPackageCalAs { get; set; } = "First Night Room Stay";
        [Display(Name ="Add Tax to Deposit")]
        public bool AddTaxToDeposit { get; set; }
        [Display(Name ="Deposit - Percentage of Total Reservation for Rooms")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter valid Number")]
        [Range(0, 100, ErrorMessage = "Percentage has to be between 0 to 100%")]
        [DisplayFormat(DataFormatString = "{0:0}", ApplyFormatInEditMode = true)]
        //DepositRoomPercentage
        public decimal? DepositRoomPercentage { get; set; }
        [Display(Name = "Deposit- Percentage of Total Reservation For Packages")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter valid Number")]
        [Range(0, 100, ErrorMessage = "Percentage has to be between 0 to 100%")]
        [DisplayFormat(DataFormatString = "{0:0}", ApplyFormatInEditMode = true)]
        //DepositPackagePercentage
        public decimal? DepositPackagePercentage { get; set; }
        [Required(ErrorMessage = "Extra Adult Fee is required")]
        [Display(Name = "Extra Adult Fee")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        [DataType(DataType.Currency)]
        public decimal ExtraAdultFee { get; set; }
        [Required(ErrorMessage = "Extra Child Fee is required")]
        [Display(Name = "Extra Child Fee")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        [DataType(DataType.Currency)]
        public decimal ExtraChildFee { get; set; }
        [Required(ErrorMessage = "Extra Base Fee is required")]
        [Display(Name = "Extra Base Person Fee")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        [DataType(DataType.Currency)]
        public decimal ExtraBaseFee { get; set; }
        [Display(Name = "Add Tax to Extra Person Fees")]
        public bool AddTaxToExtraPerson { get; set; }
        [Required(ErrorMessage = "Weekend Fee is required")]
        [Display(Name = "Weekend Fee")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        [DataType(DataType.Currency)]
        public decimal WeekendFee { get; set; }
        [Display(Name = "Add Tax to Weekend Fee")]
        public bool AddTaxToWeekendFee { get; set; }
        [Display(Name = "Resort Fee As")]
        public required string ResortFeeCalAs { get; set; } = "Flat Fee Per Day";
        [Required(ErrorMessage = "Resort Fee is required")]
        [Display(Name = "Resort Fee")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        [DataType(DataType.Currency)]
        public decimal ResortFee { get; set; }
        [Display(Name = "Add Tax to Resort Fee")]
        public bool AddTaxToResortFee { get; set; }
        [Required(ErrorMessage = "Tax Rate is required")]
        [Display(Name = "Tax Rate")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter valid Number")]
        [Range(0, 100, ErrorMessage = "Percentage has to be between 0 to 100%")]
        [DisplayFormat(DataFormatString = "{0:0}", ApplyFormatInEditMode = true)]
        public decimal TaxRate { get; set; }

        public HotelSystem() { }

      
    }

    
}
