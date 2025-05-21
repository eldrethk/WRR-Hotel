using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;

namespace WRRManagement.Domain.System
{
     public class HotelUser
    {
        public int ID { get; set; }
        public int HotelID { get; set; }
        public string UserID { get; private set; } = default!;
    }

    public class Users
    {
        public required string UserID { get; set; }
        public required string UserName { get; set; }
        [Display(Name = "Last Login")]
        public DateTime LastLogin { get; set; }
        public EnumUserStatus Status { get; set; }

        public Users() { }
   
    }

}
