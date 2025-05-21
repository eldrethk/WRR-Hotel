using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Reservation
{
    public class Reservation
    {
        private string _cardHolderName = string.Empty;
        private string _cardExpireDate = string.Empty;
        private string _cardNumber = string.Empty;
        private string _cardSecureCode = string.Empty;
        private string _cusFirstName = string.Empty;
        private string _cusLastName = string.Empty;
        private string _cusEmail = string.Empty;
        private string _cusPhoneNum = string.Empty;
        private string _userInitals = string.Empty;

        public int ReservationID { get; set; }
        [Required]
        public int HotelID { get; set; }
        [Required]
        public int RoomTypeID { get; set; }
        public int PaymentTypeID { get; set; }
        [Required]
        [Display(Name = "Arrival Date")]
        [DisplayFormat(DataFormatString = "{0:ddd, MMM dd yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.DateTime)]
        public DateTime ArrivalDate { get; set; }
        [Required]
        [Display(Name = "Departure Date")]
        [DisplayFormat(DataFormatString = "{0:ddd, MMM dd yyyy}", ApplyFormatInEditMode = true)]
        [DataType(DataType.DateTime)]
        public DateTime DepartureDate { get; set; }
        public int User { get; set; }
        [Display(Name = "Total Nights")]
        public int TotalNights { get; set; }
        public int Rooms { get; set; }
        [Required]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter valid Number")]
        public int Adults { get; set; }
        [Required]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter valid Number")]
        public int Children { get; set; }
        public decimal AvgDailyRate { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "{0:C2}")]
        [DataType(DataType.Currency)]
        public decimal SubTotal { get; set; }
        public char TierLever { get; set; }
        [Required]
        [Display(Name = "Extra Adult Charge")]
        [DisplayFormat(DataFormatString = "{0:C2}")]
        [DataType(DataType.Currency)]
        public decimal ExtraAdultCharge { get; set; }
        [Required]
        [Display(Name = "Extra Child Charge")]
        [DisplayFormat(DataFormatString = "{0:C2}")]
        [DataType(DataType.Currency)]
        public decimal ExtarChildCharge { get; set; }
        [Display(Name = "Extra Base Charge")]
        public decimal ExtraBaseCharge { get; set; }
        [Required]
        [Display(Name = "Weekend Fees")]
        [DisplayFormat(DataFormatString = "{0:C2}")]
        [DataType(DataType.Currency)]
        public decimal WeekendFees { get; set; }
        [Required]
        [Display(Name = "Resort Fees")]
        [DisplayFormat(DataFormatString = "{0:C2}")]
        [DataType(DataType.Currency)]
        public decimal ResortFees { get; set; }
        [Required]
        [Display(Name = "Total Fees")]
        [DisplayFormat(DataFormatString = "{0:C2}")]
        [DataType(DataType.Currency)]
        public decimal TotalFees { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "{0:C2}")]
        [DataType(DataType.Currency)]
        public decimal Taxes { get; set; }
        [Required]
        [Display(Name = "Total Charge")]
        [DisplayFormat(DataFormatString = "{0:C2}")]
        [DataType(DataType.Currency)]
        public decimal TotalCharge { get; set; }
        public string? Comments { get; set; }
        
        [Required(ErrorMessage = "Name on Card is required")]
        [Display(Name = "Name on Card")]
        public string CardHolderName 
        { 
            get => _cardHolderName;
            set => _cardHolderName = string.IsNullOrEmpty(value)
                ? throw new ArgumentException("Card Holder Name cannot be empty") : value; 
        } 

        [Required(ErrorMessage = "Expiration date is required")]
        [Display(Name = "Expiration")]
        [ValidCCExpiration(ErrorMessage = "Expiration date is invalid")]
        public string CardExpirationDate 
        { 
            get => _cardExpireDate; 
            set => _cardExpireDate = string.IsNullOrEmpty(value)
                ? throw new ArgumentException("Expiration Date cannot be empty"): value; 
        }

        [Required(ErrorMessage = "Credit Card Number is required")]
        [Display(Name = "Card Number")]
        [DataType(DataType.CreditCard)]
        public string CardNumber 
        { 
            get => _cardNumber;
            set => _cardNumber = string.IsNullOrEmpty(value)
                ? throw new ArgumentException("Credit card number cannot be empty") : value;
        }

        [Required(ErrorMessage = "CVC is required")]
        [Display(Name = "Secure Code")]
        [MinLength(3, ErrorMessage = "CVC requires at least 3 digits")]
        public string CardSecureCode 
        { 
            get => _cardSecureCode; 
            set => _cardSecureCode = string.IsNullOrEmpty(value)
                ? throw new ArgumentException("CVC cannot be empty") : value;
        }

        public string? SessionID { get; set; }
        [Display(Name = "Reservation Created")]
        [DisplayFormat(DataFormatString = "{0:ddd, MMM dd yyyy hh:mm:ss tt}", ApplyFormatInEditMode = true)]
        [DataType(DataType.DateTime)]
        public DateTime ReservationCreated { get; set; }
        [Required]
        [DisplayFormat(DataFormatString = "{0:C2}")]
        [DataType(DataType.Currency)]
        public decimal Deposit { get; set; }
        [DisplayFormat(DataFormatString = "{0:C2}")]
        [DataType(DataType.Currency)]
        public decimal ExtraFees { get; set; }
        public string? Initals { get; set; } = string.Empty;
        
        [Required(ErrorMessage = "First Name is required")]
        [Display(Name = "First Name")]
        public string CusFirstName 
        { 
            get => _cusFirstName; 
            set => _cusFirstName = string.IsNullOrEmpty(value)
                ? throw new ArgumentException("First Name cannot be empty") : value;
        }

        [Required(ErrorMessage = "Last Name is required")]
        [Display(Name = "Last Name")]
        public string CusLastName 
        { 
            get => _cusLastName; 
            set => _cusLastName = string.IsNullOrEmpty(value)
                ? throw new ArgumentException("Last Name cannot be empty") : value;
        }


        [Required(ErrorMessage = "Address is required")]
        [Display(Name = "Address")]
        public string CusAddress1 { get; set; } = string.Empty;
        [Display(Name = "Apt, Suite, etc...")]
        public string? CusAddress2 { get; set; }
        [Required(ErrorMessage = "City is required")]
        [Display(Name = "City")]
        public string CusCity { get; set; } = string.Empty;
        [Required(ErrorMessage = "State is required")]
        [Display(Name = "State / Province")]
        public string CusState { get; set; } = string.Empty;
        [Display(Name = "Zip Code")]
        [DataType(DataType.PostalCode)]
        public string CusZip { get; set; } = string.Empty;

        [Required(ErrorMessage = "Phone Number is required")]
        [Display(Name = "Phone Number")]
        [DataType(DataType.PhoneNumber)]
        public string CusDayPhone 
        { 
            get => _cusPhoneNum; 
            set => _cusPhoneNum = string.IsNullOrEmpty(value)
                ? throw new ArgumentException("Phone Number cannot be empty") : value;
        }

        public string? CusEveningPhone { get; set; }
   
        [Required(ErrorMessage = "Email address is required")]
        [Display(Name = "Email")]
        [DataType(DataType.EmailAddress)]
        public string CusEmail 
        { 
            get => _cusEmail;
            set => _cusEmail = string.IsNullOrEmpty(value)
                ? throw new ArgumentException("Email cannot be empty") : value;
        }
        
        public bool BookedAmentity { get; set; }
        public int CustomerId { get; set; }

        [Required(ErrorMessage = "Your initials are required")]
        [Display(Name = "Accepted Terms & Conditions")]
        [MaxLength(3, ErrorMessage = "Max length is 3 characters")]
        [RegularExpression(@"^[a-zA-Z]+$", ErrorMessage = "Use letters only please")]
        public string UserInitals 
        { 
            get => _userInitals; 
            set => _userInitals = string.IsNullOrEmpty(value)
                ? throw new ArgumentException("Initials cannot be empty") : value;
        }


        public Reservation()
        {
         
        }

        public Reservation(IDataReader reader) : this()
        {
            ReservationID = Convert.ToInt32(reader["ReservationID"]);
            HotelID = Convert.ToInt32(reader["HotelID"]);
            RoomTypeID = Convert.ToInt32(reader["RoomTypeID"]);
            try
            {
                PaymentTypeID = Convert.ToInt32(reader["PaymentTypeID"]);
            }
            catch
            {
                PaymentTypeID = 0;
            }
            ArrivalDate = Convert.ToDateTime(reader["BookedArrivalDate"]);
            DepartureDate = Convert.ToDateTime(reader["BookedDepartureDate"]);
            try
            {
                User = Convert.ToInt32(reader["UserID"]);
            }
            catch
            {
                User = 0;
            }
            TotalNights = Convert.ToInt32(reader["TotalNights"]);
            try
            {
                Rooms = Convert.ToInt32(reader["Rooms"]);
            }
            catch
            {
                Rooms = 1;
            }
            Adults = Convert.ToInt32(reader["Adults"]);
            Children = Convert.ToInt32(reader["Children"]);
            AvgDailyRate = Convert.ToDecimal(reader["AverageDailyRate"]);
            SubTotal = Convert.ToDecimal(reader["SubTotal"]);

            try
            {
                TierLever = Convert.ToChar(reader["TierLevel"]);
            }
            catch
            {
                TierLever = 'A';
            }
            try
            {
                ExtraAdultCharge = Convert.ToDecimal(reader["ExtraAdultCharge"]);
            }
            catch
            {
                ExtraAdultCharge = 0;
            }
            try
            {
                ExtarChildCharge = Convert.ToDecimal(reader["ExtraChildCharge"]);
            }
            catch
            {
                ExtarChildCharge = 0;
            }
            //ExtraBaseCharge = Convert.ToDecimal(reader["ExtraBaseCharge"]);
            try
            {
                WeekendFees = Convert.ToDecimal(reader["WeekendFee"]);
            }
            catch
            {
                WeekendFees = 0;
            }
            try
            {
                ResortFees = Convert.ToDecimal(reader["ResortFee"]);
            }
            catch
            {
                ResortFees = 0;
            }
            TotalFees = Convert.ToDecimal(reader["TotalFees"]);
            Taxes = Convert.ToDecimal(reader["Taxes"]);
            TotalCharge = Convert.ToDecimal(reader["TotalCharge"]);
            try
            {
                Comments = reader["Comments"].ToString();
            }
            catch
            {
                Comments = string.Empty;
            }
            CardHolderName = reader["CardHolderName"]?.ToString() ?? string.Empty;
            CardExpirationDate = reader["CardExpirationDate"]?.ToString() ?? string.Empty;
            CardNumber = reader["CardNumber"]?.ToString() ?? string.Empty;
            CardSecureCode = reader["CardSecureCode"]?.ToString() ?? string.Empty;
            try
            {
                SessionID = reader["SessionID"].ToString();
            }
            catch
            {
                SessionID = string.Empty;
            }
            try
            {
                ReservationCreated = Convert.ToDateTime(reader["ReservationCreated"]);
            }
            catch
            {
                ReservationCreated = DateTime.MinValue;
            }
            try
            {
                Deposit = Convert.ToDecimal(reader["Deposit"]);
            }
            catch
            {
                Deposit = 0;
            }
            try
            {
                ExtraFees = Convert.ToDecimal(reader["ExtraFees"]);
            }
            catch
            {
                ExtraFees = 0;
            }
            try
            {
                Initals = reader["Initials"].ToString();
            }
            catch
            {
                Initals = string.Empty;
            }
            try
            {
                CustomerId = Convert.ToInt32(reader["CustomerID"].ToString());

            }
            catch
            {
                CustomerId = 0;
            }
            try
            {
                CusFirstName = reader["CusFirstName"].ToString() ?? string.Empty;
            }
            catch
            {
                CusFirstName = string.Empty;
            }
            try
            {
                CusLastName = reader["CusLastName"].ToString() ?? string.Empty;
            }
            catch
            {
                CusLastName = string.Empty;
            }
            try
            {
                CusAddress1 = reader["CusAddress1"].ToString() ?? string.Empty;
            }
            catch
            {
                CusAddress1 = string.Empty;
            }
            try
            {
                CusAddress2 = reader["CusAddress2"].ToString();
            }
            catch
            {
                CusAddress2 = string.Empty;
            }
            try
            {
                CusCity = reader["CusCity"].ToString() ?? string.Empty;
            }
            catch
            {
                CusCity = string.Empty;
            }
            try
            {
                CusState = reader["CusState"].ToString() ?? string.Empty;
            }
            catch
            {
                CusState = string.Empty;
            }
            try
            {
                CusZip = reader["CusZip"].ToString() ?? string.Empty;
            }
            catch
            {
                CusZip = string.Empty;
            }
            try
            {
                CusDayPhone = reader["CusDayPhone"].ToString() ?? string.Empty;
            }
            catch
            {
                CusDayPhone = string.Empty;
            }
            try
            {
                CusEveningPhone = reader["CusEvenPhone"].ToString() ?? string.Empty;
            }
            catch
            {
                CusEveningPhone = string.Empty;
            }
            try
            {

                CusEmail = reader["CusEmail"].ToString() ?? string.Empty;
            }
            catch
            {
                CusEmail = string.Empty;
            }         
            try
            {
                BookedAmentity = Convert.ToBoolean(reader["BookedAmenity"]);
            }
            catch
            {
                BookedAmentity = false;
            }
            try
            {
                UserInitals = reader["UserInitals"].ToString() ?? string.Empty;
            }
            catch
            {
                UserInitals = string.Empty;
            }
        }
    }
}
