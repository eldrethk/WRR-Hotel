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
    public class RoomFeatureRepository : GenericRepository<RoomFeatures>, IRoomFeatures
    {
        protected new WRRContext context;
        private readonly ILogger<RoomFeatureRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public RoomFeatureRepository(WRRContext context, ILogger<RoomFeatureRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(RoomFeatures roomFeatures)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomFeatures.RoomTypeID));
            parameters.Add(P("Icon", roomFeatures.Icon));
            parameters.Add(P("Feature", roomFeatures.Features));
            
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsRoomFeature", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding room feature: {@roomFeatures}", roomFeatures);
            }
            return id;
        }

        public void Delete(int id)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("ID", id));
      
            try
            {
                DapperHelper.ExecuteQuery("dbo.genDelRoomFeature", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while deleting room feature with ID: {@id}", id);
            } 

        }

        public List<RoomFeatures> GetRoomFeatures(int roomId)
        {
            List<RoomFeatures> features = new List<RoomFeatures>(); 
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomTypeID", roomId));
           
            try
            
            {
                features = DapperHelper.GetRecords<RoomFeatures>("dbo.genSelRoomFeature", parameters, context);
            }
            catch( Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting room features for room ID {roomId}", roomId);
            }    
            return features;
        }

        public void Update(RoomFeatures roomFeatures)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("ID", roomFeatures.ID));
            parameters.Add(P("Icon", roomFeatures.Icon));
            parameters.Add(P("Feature", roomFeatures.Features));
          
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdRoomFeature", parameters, context);

            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating room feature: {@roomFeatures}", roomFeatures);
            }

        }
    }
}
