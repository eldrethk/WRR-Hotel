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
    public class MaxBaseRepository : GenericRepository<MaxBase>, IMaxBase
    {
        protected WRRContext context;
        private readonly ILogger<MaxBaseRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };

        public MaxBaseRepository(WRRContext context, ILogger<MaxBaseRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(MaxBase entity)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", entity.RoomTypeID));
            parameters.Add(P("BaseCount", entity.BaseCount));
            parameters.Add(P("MaxCount", entity.MaxBaseCount));
           
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsMaxBase", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding max base: {@entity}", entity);
            }
            return id;
        }

        public MaxBase GetByRoomID(int roomid)
        {
            MaxBase? entity = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomid));
            try
            {
                entity = DapperHelper.GetRecord<MaxBase>("dbo.genSelMaxBaseByID", parameters, context);

            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting max base by room ID: {@roomid}", roomid);
            }
            return entity ?? new MaxBase();
        }
    }
}
