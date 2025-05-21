using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.System
{
    public class OptInEmails
    {
        public int ID { get; set; }
        public required string EmailAddress { get; set; }
        public int HotelID { get; set; }
        public DateTime OptInDate { get; set; }
        public required string FirstName { get; set; }
        public required string LastName { get; set; }
        public string? State { get; set; }

        public OptInEmails() { }

        public OptInEmails(IDataReader rd) : this()
        {
            ID = Convert.ToInt32(rd["ID"]);
            EmailAddress = rd["EmailAddress"].ToString() ?? string.Empty;
            OptInDate = Convert.ToDateTime(rd["OptInDate"]);
            FirstName = rd["FirstName"].ToString() ?? string.Empty;
            LastName = rd["LastName"].ToString() ?? string.Empty;
            State = rd["State"].ToString();
            HotelID = Convert.ToInt32(rd["HotelID"]);

        }

    }
}
