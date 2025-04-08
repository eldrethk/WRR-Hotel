using Microsoft.Extensions.Logging;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.Packages;
using WRRManagement.Domain.RoomTypes;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.PackageRepository
{
    public class PackageRepository : GenericRepository<Package>, IPackage
    {
        protected new WRRContext context;
        private readonly ILogger<PackageRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public PackageRepository(WRRContext context, ILogger<PackageRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(Package package)

        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("Name", package.Name));
            parameters.Add(P("Description", package.Description));
            parameters.Add(P("HotelID", package.HotelID));
            parameters.Add(P("Amenities", false));
            parameters.Add(P("ArrMon", package.ArrMon));
            parameters.Add(P("ArrTues", package.ArrTues));
            parameters.Add(P("ArrWed", package.ArrWed));
            parameters.Add(P("ArrThur", package.ArrThurs));
            parameters.Add(P("ArrFri", package.ArrFri));
            parameters.Add(P("ArrSat", package.ArrSat));
            parameters.Add(P("ArrSun", package.ArrSun));
            parameters.Add(P("MinDays", package.MinDays));
            parameters.Add(P("MaxDays", package.MaxDays));
            parameters.Add(P("WeekendSurcharge", package.WeekendSurcharge));
            parameters.Add(P("ResortFees", package.ResortFees));
            parameters.Add(P("ValidFrom", package.ValidFrom));
            parameters.Add(P("ValidTo", package.ValidTo));
            parameters.Add(P("EndDisplayDate", package.EndDisplayDate));
            parameters.Add(P("Visible", package.Visible));
            parameters.Add(P("SpecialPage", package.SpecialPage));
            parameters.Add(P("NightsFree", package.NightsFree));
            parameters.Add(P("NumberOfNights", package.NumberOfNights ?? 0));
            parameters.Add(P("PercentOff", package.PercentOff));
            parameters.Add(P("PercentageOff", package.PercentageOff ?? 0));
            parameters.Add(P("PricePoint", package.PricePoint));
            parameters.Add(P("Deposit", package.Deposit));
            parameters.Add(P("ExtraPersonFee", package.ExtraPersonFee));
            parameters.Add(P("PackageAllocation", package.PackageAllocation));
            parameters.Add(P("SmImage", package.SmImage ?? string.Empty));
            parameters.Add(P("ShortDesc", package.ShortDescription));
                                   
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsPackage", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding package: {@package}", package);
            }
            return id;


        }

        public int AddRoomToPackage(int packageId, List<int> roomIds)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageId));
            
            try
            {
                DapperHelper.ExecuteQuery("dbo.genDropRoomsFromPackage", parameters, context);
                foreach (int roomId in roomIds)
                {
                    parameters = new List<ParameterInfo>();
                    parameters.Add(new ParameterInfo() { ParameterName = "PackageID", ParameterValue = packageId });
                    parameters.Add(new ParameterInfo() { ParameterName = "RoomTypeID", ParameterValue = roomId });
                    id = DapperHelper.ExecuteQuery("dbo.genInsPackageRoom", parameters, context);
                }
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding room to package: {@packageId} with room IDs: {@roomIds}", packageId, roomIds);
            }
            return id;
        }

        public void Delete(int packageId)
        {

            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageId));
          
            try
            {
                DapperHelper.ExecuteQuery("dbo.genInvisiblePackage", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while making package with ID {packageId} invisible", packageId);
            }
        }

        public Package GetPackage(int packageId)
        {
            Package package = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageId));
           
            try
            {
                package = DapperHelper.GetRecord<Package>("dbo.genSelPackageByID", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving package with ID {packageId}", packageId);
            }
            return package;
        }

        public List<Package> GetPackages(int hotelId)
        {
            List<Package> packages = new List<Package>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));
          
            try
            {
                packages = DapperHelper.GetRecords<Package>("dbo.genSelPackagesByHotelID", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving packages for Hotel ID {hotelId}", hotelId);
            }
            return packages;
        }

        public List<Package> GetPackagesByRoom(int roomId, DateTime start, DateTime end)
        {
            List<Package> packages = new List<Package>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomTypeID", roomId));
            parameters.Add(P("Start", start));
            parameters.Add(P("End", end));
       
            try
            {
                packages = DapperHelper.GetRecords<Package>("dbo.genSelPackagesAssociatedWithRoom", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving packages associated with Room Type ID {roomId} for dates {start} to {end}", roomId, start, end);
            }
            return packages;
        }

        public List<Package> GetPackagesForSpecialPage(int hotelId)
        {
            List<Package> packages = new List<Package>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));
        
            try
            {
                packages = DapperHelper.GetRecords<Package>("dbo.genSelPackageForSpecialPage", parameters, context);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while retrieving packages for special page for Hotel ID {hotelId}", hotelId);
            }
            return packages;
        }

        public List<RoomType> GetRoomTypes(int packageid)
        {
            List<RoomType> roomTypes = new List<RoomType>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageid));
         
            try
            {
                roomTypes = DapperHelper.GetRecords<RoomType>("dbo.genSelPackageRooms", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving room types for Package ID {packageid}", packageid);
            }
            return roomTypes;

        }

        public List<Package> GetPackagesWithRackRate(int hotelId)
        {
            List<Package> packages = new List<Package>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));
       
            try
            {
                packages = DapperHelper.GetRecords<Package>("dbo.genSelPackagesWithRates", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving packages with rack rates for Hotel ID {hotelId}", hotelId);
            }
            return packages;
        }

        public void Update(Package package)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("Name", package.Name));
            parameters.Add(P("Description", package.Description));
            parameters.Add(P("PackageID", package.PackageID));
            parameters.Add(P("Amenities", false));
            parameters.Add(P("ArrMon", package.ArrMon));
            parameters.Add(P("ArrTues", package.ArrTues));
            parameters.Add(P("ArrWed", package.ArrWed));
            parameters.Add(P("ArrThur", package.ArrThurs));
            parameters.Add(P("ArrFri", package.ArrFri));
            parameters.Add(P("ArrSat", package.ArrSat));
            parameters.Add(P("ArrSun", package.ArrSun));
            parameters.Add(P("MinDays", package.MinDays));
            parameters.Add(P("MaxDays", package.MaxDays));
            parameters.Add(P("WeekendSurcharge", package.WeekendSurcharge));
            parameters.Add(P("ResortFees", package.ResortFees));
            parameters.Add(P("ValidFrom", package.ValidFrom));
            parameters.Add(P("ValidTo", package.ValidTo));
            parameters.Add(P("EndDisplayDate", package.EndDisplayDate));
            parameters.Add(P("Visible", package.Visible));
            parameters.Add(P("SpecialPage", package.SpecialPage));
            parameters.Add(P("NightsFree", package.NightsFree));
            parameters.Add(P("NumberOfNights", package.NumberOfNights ?? 0));
            parameters.Add(P("PercentOff", package.PercentOff));
            parameters.Add(P("PercentageOff", package.PercentageOff ?? 0));
            parameters.Add(P("PricePoint", package.PricePoint));
            parameters.Add(P("Deposit", package.Deposit));
            parameters.Add(P("ExtraPersonFee", package.ExtraPersonFee));
            parameters.Add(P("PackageAllocation", package.PackageAllocation));
            parameters.Add(P("SmImage", package.SmImage ?? string.Empty));
            parameters.Add(P("ShortDesc", package.ShortDescription));

            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdPackage", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating package: {@package}", package);
            }

        }        

        public void UpdateImageToPackage(int packageId, string image)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageId));
            parameters.Add(P("SmImage", image));
          
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdPackageImage", parameters, context);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while updating image for package with ID {packageId}: {@image}", packageId, image);
            }
        }
    }
}
