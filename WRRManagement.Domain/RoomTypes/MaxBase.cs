using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.RoomTypes
{
    public class MaxBase
    {
        public int ID { get; set; }
       
        public int RoomTypeID { get; set; }
        
        [Display(Name = " Max Room Total")]
        public int MaxBaseCount { get; set; }
       
        [Display(Name = "Base Count")]
        public int BaseCount { get; set; }

        public MaxBase() { }

        public MaxBase(IDataReader reader) : this()
        {
            ID = Convert.ToInt32(reader["ID"]);
            RoomTypeID = Convert.ToInt32(reader["RoomTypeID"]);
            try
            {
                MaxBaseCount = Convert.ToInt32(reader["MaxBaseCount"]);
            }
            catch {
                MaxBaseCount = 6;
            }
            BaseCount = Convert.ToInt32(reader["BaseCount"]);
        }
    }
}
