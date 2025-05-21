using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.System
{
    public interface IOptInEmails
    {
        int Add(string email, int hotelId, string firstname, string lastname, string state);
        List<OptInEmails> GetAll(int hotelId, DateTime start, DateTime end);
    }
}
