using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using WRRManagement.Infrastructure.Data;
using WRRManagement.Infrastructure;
using WRRManagement.Domain.Base;
using WRRManagement.Infrastructure.RoomTypeRespository;
using WRRManagement.Domain.RoomTypes;
using Microsoft.Extensions.Logging;

namespace WRRManagement.Infrastructure.RoomTypeRespository
{
    public class RoomTypeRepository : GenericRepository<RoomType>, IRoomType
    {
       
        protected new WRRContext context;
        protected IAdultBase adultRepository;
        protected IMaxBase maxRepository;
        private readonly ILogger<RoomTypeRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };

        public RoomTypeRepository(WRRContext context, IAdultBase adult, IMaxBase max, ILogger<RoomTypeRepository> logger) : base(context)
        {
            this.context = context;
            this.adultRepository = adult;
            this.maxRepository = max;
            this._logger = logger;
        }

        public RoomType GetById(int id)
        {
            RoomType? roomType = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", id));

            try
            {
                roomType = DapperHelper.GetRecord<RoomType>("dbo.genSelRoomTypeByID", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting room type by ID: {@id}", id);
            }
            return roomType ?? new RoomType();
        }
        
        public List<RoomType> GetAllForHotel(int hotelId)
        {
            List<RoomType> list = new List<RoomType>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));  
           
            try
            {
                list = DapperHelper.GetRecords<RoomType>("dbo.genSelRoomsByHotelID", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting all room types for hotel ID {hotelId}", hotelId);
            }
            return list;
        }


        public void Invisible(int roomId)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomId));
         
            try
            {
                DapperHelper.ExecuteQuery("dbo.genInvisibleRoomType", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while making room type invisible: {@roomId}", roomId);
            }
        }

        public int Add(RoomType roomType)
        {
            int id = 0;        
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", roomType.HotelID));
            parameters.Add(P("Name", roomType.Name));
            parameters.Add(P("Desc", roomType.Description));
            parameters.Add(P("Adult", roomType.AdultBase));
            parameters.Add(P("Max", roomType.MaxBase));
            parameters.Add(P("BedType", roomType.BedType ?? string.Empty));                     
                                 
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsRoomType", parameters, context);
              
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding room type: {@roomType}", roomType);
            }
            return id;
        }

        public void Update(RoomType roomType)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomType.RoomTypeID));
            parameters.Add(P("Name", roomType.Name));
            parameters.Add(P("Desc", roomType.Description));
            parameters.Add(P("Adult", roomType.AdultBase));
            parameters.Add(P("Max", roomType.MaxBase));
            parameters.Add(P("BedType", roomType.BedType ?? string.Empty));
            
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdRoomType", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating room type: {@roomType}", roomType);
            } 

        }

        public List<RoomType> GetAllValidRoomsForGuestCount(int hotelId, int adults, int child)
        {
            List<RoomType> allRooms = GetAllForHotel(hotelId);
            List<RoomType> validRooms = new List<RoomType>();
            int maxTotal = adults + child;
            foreach (RoomType room in allRooms)
            {
                bool valid = false;
                if (room.AdultBase == true)
                {

                    AdultBase abase = adultRepository.GetByRoomID(room.RoomTypeID);
                    if (adults > abase.MaxAdult)
                        valid = false;
                    if (child > abase.MaxChild)
                        valid = false;
                    if (maxTotal > abase.MaxRoomTotal) valid = false;
                }
                else
                {
                    MaxBase mbase = maxRepository.GetByRoomID(room.RoomTypeID);
                    if (maxTotal > mbase.MaxBaseCount) valid = false;
                }

                if (valid == true)
                    validRooms.Add(room);
            }

            return validRooms;
        }
    }
}
