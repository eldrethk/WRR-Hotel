using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.RoomTypes
{
    public class MinStay
    {
        public int MinStayID { get; set; }
        [Required]
        public int RoomTypeID { get; set; }
        [Required(ErrorMessage = "Date is required")]
        [Display(Name ="Stay Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public DateTime StayDate { get; set; }
        [Required(ErrorMessage = "Min Night Stay is required")]
        [Display(Name = "Min Night Stay")]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter a valid integer number")]
        [RegularExpression("([0-9]+)", ErrorMessage = "Please enter valid Number")]
        public int MinNightStay { get; set; }

        public MinStay() { }

        public MinStay(IDataReader reader) : this(){
            MinStayID = Convert.ToInt32(reader["MinStayID"]);
            RoomTypeID = Convert.ToInt32(reader["RoomTypeID"]);
            StayDate = Convert.ToDateTime(reader["StayDate"]);
            MinNightStay = Convert.ToInt32(reader["MinStay"]);
        }      

    }

    public class MinStayEventViewModel
    {
        public int eventID { get; set; }
        public string title { get; set; }
        public DateTime start { get; set; }

        public DateTime end { get; set; }
        public bool allDay { get; set; }

        public string color { get; set; }

        public MinStayEventViewModel() { }

        public MinStayEventViewModel(IDataReader rd) : this()
        {
            int Quantity = Convert.ToInt32(rd["MinStay"]);
            eventID = Convert.ToInt32(rd["MinStayID"]);
            title = Quantity.ToString();
            start = Convert.ToDateTime(rd["StayDate"]);
            end = Convert.ToDateTime(rd["StayDate"]);
            allDay = true;
            if (Quantity >= 10)
                color = "#F04123";
            else if (Quantity <= 9 && Quantity > 3)
                color = "#E99002";
            else
                color = "#43ac6a";
        }
    }
}
