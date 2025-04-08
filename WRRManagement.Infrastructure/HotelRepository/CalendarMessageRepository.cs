using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.Hotels;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.HotelRepository
{
    public class CalendarMessageRepository : GenericRepository<CalendarMessage>, ICalendarMessage
    {
        protected new WRRContext context;
        private readonly ILogger<CalendarMessageRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value};
        public CalendarMessageRepository(WRRContext context, ILogger<CalendarMessageRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;            
        }

        public int Add(CalendarMessage message)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("From", message.DisplayFrom));
            parameters.Add(P("To", message.DisplayTo));
            parameters.Add(P("Message", message.Message));
            parameters.Add(P("HotelID", message.HotelID));
           
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsCustomMessage", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding Calendar Message: {@message}", message);
            }
            return id;
        }

        public void Delete(int id)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("MessageID", id));
           
            try
            {
                DapperHelper.ExecuteQuery("dbo.genDelCustomMessage", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error removing calendar messge with ID {id}", id);
            }
        }

        public CalendarMessage GetMessage(int id)
        {
            CalendarMessage message = new CalendarMessage();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("MessageID", id));
            
            try
            {
                message = DapperHelper.GetRecord<CalendarMessage>("dbo.genSelCustomMessageByID", parameters, context);
            }
            catch( Exception ex) 
            {
                _logger.LogError(ex, "Error occurred retrieving calendar message with {ID}", id);
            }
            return message;            
        }

        public List<CalendarMessage> GetMessages(int hotelId)
        {
            List<CalendarMessage> messages = new List<CalendarMessage>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));

            try
            {
                messages = DapperHelper.GetRecords<CalendarMessage>("dbo.genSelCustomMessageByHotelID", parameters, context);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred retrieving all message for Hotel ID {hotelId}", hotelId);            
            }

            return messages;
        }

        public List<CalendarMessage> GetMessagesByDate(DateTime date, int hotelId)
        {
            List<CalendarMessage> message = new List<CalendarMessage>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("Date", date));
            parameters.Add(P("HotelID", hotelId));
            
            try
            {
                message = DapperHelper.GetRecords<CalendarMessage>("dbo.genSelCustomMessageByDate", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred retrieving all messages for Hotel ID {hotelId} on {date}", hotelId, date);
            }
            return message;
        }

        public void Update(CalendarMessage message)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("From", message.DisplayFrom));
            parameters.Add(P("To", message.DisplayTo));
            parameters.Add(P("Message", message.Message));
            parameters.Add(P("MessageID", message.MessageID));
           
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdCustomMessage", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating Calendar Message: {@message}", message);
            } 
        }
    }
}
