using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.RoomTypes;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.RoomTypeRespository
{
    public class AdultBaseRepository : GenericRepository<AdultBase>, IAdultBase
    {
        protected WRRContext context;
        private readonly ILogger<AdultBaseRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public AdultBaseRepository(WRRContext context, ILogger<AdultBaseRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(AdultBase adultBaseFee)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", adultBaseFee.RoomTypeID));
            parameters.Add(P("AdultBase", adultBaseFee.AdultBaseCount));
            parameters.Add(P("ChildBase", adultBaseFee.ChildBaseCount));
            parameters.Add(P("AdultMax", adultBaseFee.MaxAdult));
            parameters.Add(P("ChildMax", adultBaseFee.MaxChild));
            parameters.Add(P("Total", adultBaseFee.MaxRoomTotal));
        
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsAdultBase", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding adult base: {@adultBaseFee}", adultBaseFee);
            }
            return id;
        }

        public AdultBase GetByRoomID(int roomID)
        {
            AdultBase? adultBaseFee = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomID));
           
            try
            {
                adultBaseFee = DapperHelper.GetRecord<AdultBase>("dbo.genSelAdultBaseByID", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting adult base by room ID: {@roomID}", roomID);
            }
            return adultBaseFee;
        }
    }
}
