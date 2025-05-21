using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Reservation
{
    public class ReservationQue
    {
        public int QueID { get; set; }
        public int ReservationID { get; set; }
        [DisplayFormat(DataFormatString = "{0:ddd, MMM dd yyyy hh:mm tt}", ApplyFormatInEditMode = true)]
        [DataType(DataType.DateTime)]
        public DateTime BookedDate { get; set; }
        public required string CustomerName { get; set; }
        public int ReservationType { get; set; }
        public bool Viewed { get; set; }
        public int HotelID { get; set; }
        public required string UserName { get; set; }

        public ReservationQue()
        {

        }

      
    }
    public class Reservation_Booked
    {
        public int ReservationCount { get; set; }
        public int Nights { get; set; }
        [DisplayFormat(DataFormatString = "{0:C}", ApplyFormatInEditMode = true)]
        public decimal Total { get; set; }

        public Reservation_Booked() { }
        public Reservation_Booked(IDataReader rd) : this()
        {
            ReservationCount = Convert.ToInt32(rd["TotalCount"]);
            try { Nights = Convert.ToInt32(rd["TotalNight"]); }
            catch { Nights = 0; }
            try { Total = Convert.ToDecimal(rd["TotalRate"]); }
            catch { Total = 0; }
        }
    }

    public class Specials_Booked
    {
        public int ReservationCount { get; set; }

        public int Nights { get; set; }
        public decimal Total { get; set; }

        public Specials_Booked() { }
        public Specials_Booked(IDataReader rd) : this()
        {
            ReservationCount = Convert.ToInt32(rd["TotalCount"]);
            try { Nights = Convert.ToInt32(rd["TotalNight"]); }
            catch { Nights = 0; }
            try { Total = Convert.ToDecimal(rd["TotalRate"]); }
            catch { Total = 0; }
        }
    }

    public class MiniVac_Booked
    {
        public int ReservationCount { get; set; }

        public int Nights { get; set; }
        public decimal Total { get; set; }

        public MiniVac_Booked() { }
        public MiniVac_Booked(IDataReader rd) : this()
        {
            ReservationCount = Convert.ToInt32(rd["TotalCount"]);

            try { Nights = Convert.ToInt32(rd["TotalNight"]); }
            catch { Nights = 0; }
            try { Total = Convert.ToDecimal(rd["TotalRate"]); }
            catch { Total = 0; }
        }
    }

    public class Amenitity_Booked
    {
        public int ReservationCount { get; set; }

        public decimal Total { get; set; }
        public Amenitity_Booked() { }
        public Amenitity_Booked(IDataReader rd) : this()
        {
            ReservationCount = Convert.ToInt32(rd["TotalCount"]);
            try { Total = Convert.ToDecimal(rd["TotalRate"]); }
            catch { Total = 0; }
        }
    }

    public class Report_Decimal
    {
        [DisplayFormat(DataFormatString = "{0:C2}")]
        [DataType(DataType.Currency)]
        public decimal TotalDecimal { get; set; }

        public Report_Decimal() { }

        public Report_Decimal(IDataReader rd) : this()
        {
            try
            {
                TotalDecimal = Convert.ToDecimal(rd["TotalCharge"]);
            }
            catch
            {
                TotalDecimal = 0;
            }
        }
    }

    public class Report_int
    {
        [Range(0, int.MaxValue, ErrorMessage = "Please enter a valid integer number")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter valid Number")]
        public int TotalInt { get; set; }

        public Report_int() { }

        public Report_int(IDataReader rd) : this()
        {
            try
            {
                TotalInt = Convert.ToInt32(rd["TotalNumber"]);
            }
            catch
            {
                TotalInt = 0;
            }
        }

    }



}
