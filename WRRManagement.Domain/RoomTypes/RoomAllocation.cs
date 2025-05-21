using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.RoomTypes
{
    public class RoomAllocation
    {
        public int AllocationID { get; set; }
        [Required]
        public int RoomTypeID { get; set; }
        public string? RoomName { get; set; }
        [Required]
        public DateTime AllocateDate { get; set; }
        [Required]
        public int Quantity { get; set; }

        public RoomAllocation() { }

        public RoomAllocation(IDataReader reader):this()
        {
            AllocationID = Convert.ToInt32(reader["AllocationID"]);
            RoomTypeID = Convert.ToInt32(reader["RoomTypeID"]);
            AllocateDate = Convert.ToDateTime(reader["AllocateDate"]);
            Quantity = Convert.ToInt32(reader["Quantity"]);
        }
    }

    public class EventViewModel
    {
        public int eventID{ get; set; }
        public string title { get; set; }
        public DateTime start { get; set; }

        public DateTime end { get; set; }
        public bool allDay { get; set; }

        public string color { get; set; }

        public EventViewModel() { }

        public EventViewModel(IDataReader rd) : this()
        {
            int Quantity = Convert.ToInt32(rd["Quantity"]);
            eventID = Convert.ToInt32(rd["AllocationID"]);
            title = Quantity.ToString();
            start = Convert.ToDateTime(rd["AllocateDate"]);
            end = Convert.ToDateTime(rd["AllocateDate"]);
            allDay = true;
            if (Quantity >= 20)
                color = "#43ac6a";
            else if (Quantity <= 19 && Quantity >= 10)
                color = "#E99002";
            else
                color = "#F04124";
        }
    }

   

}
