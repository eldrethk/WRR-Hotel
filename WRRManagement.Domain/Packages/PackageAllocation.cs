using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Packages
{
    public class PackageAllocation
    {
        public int AllocationID { get; set; }
        [Required]
        public int PackageID { get; set; }
        [Required]
        public int RoomTypeID { get; set; }
        [Required]
        public DateTime AllocateDate { get; set; }
        [Required]
        public int Quantity { get; set; }

        public PackageAllocation()
        {

        }

        public PackageAllocation(IDataReader reader)
            : this()
        {
            AllocationID = Convert.ToInt32(reader["AllocationID"]);
            PackageID = Convert.ToInt32(reader["PackageID"]);
            RoomTypeID = Convert.ToInt32(reader["RoomTypeID"]);
            AllocateDate = Convert.ToDateTime(reader["AllocateDate"]);
            Quantity = Convert.ToInt32(reader["Quantity"]);
        }

    }

 
}
