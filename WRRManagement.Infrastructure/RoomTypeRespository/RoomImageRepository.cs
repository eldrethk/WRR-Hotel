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
    public class RoomImageRepository : GenericRepository<RoomImage>, IRoomImage
    {
        protected new WRRContext context;
        private readonly ILogger<RoomImageRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public RoomImageRepository(WRRContext context, ILogger<RoomImageRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(RoomImage img)
        {
           int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomTypeID", img.RoomTypeID));
            parameters.Add(P("Visible", img.Visible));
            parameters.Add(P("ContentLength", img.ContentLength));
            parameters.Add(P("ContentType", img.ContentType));
            parameters.Add(P("FileName", img.FileName));

            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsRoomImage", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding room image: {@img}", img);
            }
            return id;

        }

        public RoomImage Get(int id)
        {
            RoomImage img = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("ImageID", id));
    
            try
            {
                img = DapperHelper.GetRecord<RoomImage>("dbo.genSelRoomImageByID", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting room image by ID: {@id}", id);
            }
            return img;
        }


        public List<RoomImage> GetRoomImages(int roomid)
        {
            List<RoomImage> images = new List<RoomImage>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomid));
          
            try
            {
                images = DapperHelper.GetRecords<RoomImage>("dbo.genSelRoomImagesByRoomID", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting room images for room ID {roomid}", roomid);
            }
            return images;
        }

        public void Invisible(int id)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("ImageID", id));
          
            try
            {
                DapperHelper.ExecuteQuery("dbo.genInvisibleRoomImage", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while making room image invisible: {@id}", id);
            }
        }

        public void SetMainImage(int id, int roomid)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("ImageID", id));
            parameters.Add(P("RoomTypeID", roomid));
   
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdRoomMainImage", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while setting main image for room ID {roomid} and image ID {id}", roomid, id);
            }  

        }

        
    }
}
