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
    public class HotelSystemRepository : GenericRepository<HotelSystem>, IHotelSystem
    {
        protected new WRRContext context;
        private readonly ILogger<HotelSystemRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public HotelSystemRepository(WRRContext context, ILogger<HotelSystemRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int GetPriorDayBooking(int hotelId)
        {
            int days = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));
          
            try
            {
                days = DapperHelper.ExecuteQueryInt("dbo.genSelPriorDays", parameters, context, "@Days");
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting prior days for hotel ID {hotelId}", hotelId);
            }
            return days;
        }

        public HotelSystem GetSystem(int hotelId)
        {
            HotelSystem hSystem = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));
          
            try
            {
                hSystem = DapperHelper.GetRecord<HotelSystem>("dbo.genSelHotelSystem", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting hotel system for hotel ID {hotelId}", hotelId);
            }
            return hSystem;
        }

        public void Update(HotelSystem sys)
        {
           List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", sys.HotelID));
            parameters.Add(P("AdultFee", sys.ExtraAdultFee));
            parameters.Add(P("ChildFee", sys.ExtraChildFee));
            parameters.Add(P("BaseFee", sys.ExtraBaseFee));
            parameters.Add(P("WeekendFee", sys.WeekendFee));
            parameters.Add(P("ResortFee", sys.ResortFee));
            parameters.Add(P("TaxRate", sys.TaxRate));
            parameters.Add(P("AddTaxDeposit", sys.AddTaxToDeposit));
            parameters.Add(P("DisplayRoomRate", sys.DisplayRoomRatesAs));
            parameters.Add(P("DisplayPackageRate", sys.DisplayPackageRatesAs));
            parameters.Add(P("LowAllocationLimit", sys.LowAllocationLimit));
            parameters.Add(P("PriorBook", sys.PriorBook));
            parameters.Add(P("DepositRoomCal", sys.DepositRoomCalAs));
            parameters.Add(P("DepositPackageCal", sys.DepositPackageCalAs));
            parameters.Add(P("DepositRoomPercentage", sys.DepositRoomPercentage ?? 0));
            parameters.Add(P("DepositPackagePercentage", sys.DepositPackagePercentage ?? 0));
            parameters.Add(P("AddTaxWeekend", sys.AddTaxToWeekendFee));
            parameters.Add(P("AddTaxExtraPerson", sys.AddTaxToExtraPerson));
            parameters.Add(P("ResortFeeCal", sys.ResortFeeCalAs));
            parameters.Add(P("AddTaxToResortFee", sys.AddTaxToResortFee));
            parameters.Add(P("RoomBreakDown", sys.DisplayRoomBreakDownAs));
            parameters.Add(P("PackageBreakDown", sys.DisplayPackageBreakDownAs));

            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdHotelSystem", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating hotel system for hotel ID {hotelId}", sys.HotelID);
            }

        }
    }
}
