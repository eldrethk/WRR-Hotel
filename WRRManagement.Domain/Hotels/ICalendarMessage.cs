using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Hotels
{
    public interface ICalendarMessage
    {
        CalendarMessage GetMessage(int id);
        List<CalendarMessage> GetMessages(int hotelId);
        List<CalendarMessage> GetMessagesByDate(DateTime date, int hotelId);
        void Delete(int id);
        int Add(CalendarMessage message);
        void Update(CalendarMessage message);
    }
}
