using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.RoomTypes
{
    public class AdultBase
    {
        public int ID { get; set; }
       
        public int RoomTypeID { get; set; }
       
        [Display(Name = "Adult Base")]
        public int AdultBaseCount { get; set; }
      
        [Display(Name = " Adult Max")]
        public int MaxAdult { get; set; }
       
        [Display(Name = "Child Base")]
        public int ChildBaseCount { get; set; }
      
        [Display(Name = "Child Max")]
        public int MaxChild { get; set; }
        
        [Display(Name = "Max Room Total")]
        public int MaxRoomTotal { get; set; }

        public AdultBase() { }

        public AdultBase(IDataReader reader) : this()
        {
            ID = Convert.ToInt32(reader["ID"]);
            RoomTypeID = Convert.ToInt32(reader["RoomTypeID"]);
            AdultBaseCount = Convert.ToInt32(reader["AdultBaseCount"]);
            MaxAdult = Convert.ToInt32(reader["MaxAdult"]);
            ChildBaseCount = Convert.ToInt32(reader["ChildBaseCount"]);
            MaxChild = Convert.ToInt32(reader["MaxChild"]);
            try
            {
                MaxRoomTotal = Convert.ToInt32(reader["MaxRoomTotal"]);
            }
            catch
            {
                MaxRoomTotal = 6; MaxChild = 0;
            }
        }
    }
}
