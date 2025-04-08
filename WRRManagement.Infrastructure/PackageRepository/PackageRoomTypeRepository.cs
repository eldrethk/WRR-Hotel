using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.Packages;
using WRRManagement.Domain.RoomTypes;
using WRRManagement.Infrastructure.Data;
using WRRManagement.Infrastructure.RoomTypeRespository;

namespace WRRManagement.Infrastructure.PackageRepository
{
    public class PackageRoomTypeRepository:GenericRepository<PackageRoomType>, IPackageRoomType
    {
        protected new WRRContext context;
        protected IAdultBase adultRepository;
        protected IMaxBase maxRepository;
        private readonly ILogger<PackageRoomTypeRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        
        public PackageRoomTypeRepository(WRRContext context, IAdultBase adultBase, IMaxBase maxBase, ILogger<PackageRoomTypeRepository> logger) : base(context)
        {
            this.context = context;
            this.adultRepository = adultBase;
            this.maxRepository = maxBase;
            this._logger = logger;
        }

        public void AddRoomToPackage(int packageId, List<int> roomIds)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageId));
        
            try
            {
                DapperHelper.ExecuteQuery("dbo.genDropRoomsFromPackage", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while dropping existing rooms from package: {@packageId}", packageId);
            }

            foreach (int x in roomIds)
            {
                parameters = new List<ParameterInfo>();
                parameters.Add(P("PackageID", packageId));
                parameters.Add(P("RoomID", x));
            
                try
                {
                    DapperHelper.ExecuteQuery("dbo.genInsPackageRoom", parameters, context);
                }
                catch (Exception ex) 
                {
                    _logger.LogError(ex, "Error occurred while adding room to package: {@packageId}, {@roomId}", packageId, x);
                }

            }
        }

        public List<RoomType> GetAllValidRoomBasedOnGuestCount(int packageid, int adult, int child)
        {
            List<RoomType> roomsInPackage = GetRoomTypes(packageid);
            List<RoomType> validRooms = new List<RoomType>();
            int maxTotal = adult + child;

            foreach(RoomType room in roomsInPackage)
            {
                bool valid = false;
                if(room.AdultBase == true)
                {
                    AdultBase baseCount = adultRepository.GetByRoomID(room.RoomTypeID);
                    if (adult > baseCount.MaxAdult)
                        valid = false;
                    if (child > baseCount.MaxChild)
                        valid = false;
                    if (maxTotal > baseCount.MaxRoomTotal)
                        valid = false;
                }
                else
                {
                    MaxBase baseCount = maxRepository.GetByRoomID(room.RoomTypeID);
                    if (maxTotal > baseCount.MaxBaseCount)
                        valid = false;
                }
                if (valid)
                    validRooms.Add(room);
            }
            return validRooms;
        }

        public List<RoomType> GetRoomTypes(int packageid)
        {
            List<RoomType> rooms = new List<RoomType>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageid));
       
            try
            {
                rooms = DapperHelper.GetRecords<RoomType>("dbo.genSelPackageRooms", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving room types for package ID {packageId}", packageid);
            }    
            return rooms;
        }
    }
}
