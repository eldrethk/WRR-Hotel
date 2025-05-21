using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace WRRManagement.Domain.Hotels
{

    //need to change model name to CustomMessage
    public class CalendarMessage
    {
        public int MessageID { get; set; }

        [DataType(DataType.MultilineText)]
        //[AllowHtml]
        public string Message { get; set; } = string.Empty;
        [Required(ErrorMessage = "Display From Date is required")]
        [Display(Name = "Display From")]
        [DataType(DataType.DateTime)]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public DateTime DisplayFrom { get; set; }
        [Required(ErrorMessage = "Display To Date is required")]
        [Display(Name = "Display to")]
        [DataType(DataType.DateTime)]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        [DateGreaterThan("DisplayFrom", ErrorMessage ="Display From must be greater than Display to Date")]
        public DateTime DisplayTo { get; set; }
        [Required]
        public int HotelID { get; set; }

        public CalendarMessage() { }

        public CalendarMessage(IDataReader rd) : this()
        {
            MessageID = Convert.ToInt32(rd["MessageID"]);
            Message = rd["Message"].ToString() ?? string.Empty;
            DisplayFrom = Convert.ToDateTime(rd["DisplayFrom"]);
            DisplayTo = Convert.ToDateTime(rd["DisplayTo"]);
            HotelID = Convert.ToInt32(rd["HotelID"]);
        }
    }
}
