using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using WRRManagement.Domain.Amenities;
using WRRManagement.Domain.Base;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.AmenityRepository
{
    public class AmenityRepository : GenericRepository<ExtraAmenity>, IExtraAmenity
    {
        protected new WRRContext context;
        private readonly ILogger<AmenityRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public AmenityRepository(WRRContext context, ILogger<AmenityRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(ExtraAmenity amenity)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("Name", amenity.Name ?? string.Empty));
            parameters.Add(P("Description", amenity.Description ?? string.Empty));
            parameters.Add(P("Tax", amenity.Tax));
            parameters.Add(P("AmenityRate", amenity.AmenityRate));
            parameters.Add(P("PerDay", amenity.PerDay));
            parameters.Add(P("PerDayPerPerson", amenity.PerDayPerPerson));
            parameters.Add(P("OneTimeFee", amenity.OneTimeFee));
            parameters.Add(P("OneTimeFeePerPerson", amenity.OneTimeFeePerson));
            parameters.Add(P("PerNightStay", amenity.PerNightStay));
            parameters.Add(P("ViewRate", amenity.ViewRate));
            parameters.Add(P("Mandatory", amenity.Mandatory));
            parameters.Add(P("Visible", 1));
            parameters.Add(P("HotelID", amenity.HotelID));
            parameters.Add(P("Discount", amenity.Discount));
            parameters.Add(P("PictureUrl", amenity.PictureUrl ?? string.Empty));
            parameters.Add(P("ViewOnRR", amenity.ViewOnRackRate));
            parameters.Add(P("DiscountRegRate", amenity.DiscountRegularRate ?? 0));
            parameters.Add(P("ShortDesc", amenity.ShortDescription ?? string.Empty));

            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsExtraAmenity", parameters, context);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while adding amenity: {@amenity}", amenity);
            }
            return id;
        }

        public List<ExtraAmenity> GetAllForHotel(int hotelId)
        {
            List<ExtraAmenity> amenities = new List<ExtraAmenity>();
            List<ParameterInfo> parameters = new List<ParameterInfo>(); 
            parameters.Add(P("HotelID", hotelId));
           
            try
            {
                amenities = DapperHelper.GetRecords<ExtraAmenity>("dbo.genSelExtraAmenity", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error retrieving all amenities assoicated with Hotel ID {hotelId}", hotelId);
            }
            return amenities;
        }

        public ExtraAmenity GetAmenity(int id)
        {
            ExtraAmenity? amenity = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("AmenityID", id));

            try
            {
                amenity = DapperHelper.GetRecord<ExtraAmenity>("dbo.genSelExtraAmenityByID", parameters, context);
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error retrieving amenity with ID {id}", id);
            }
            return amenity ?? new ExtraAmenity { ShortDescription = string.Empty, Description = string.Empty };
        }

        public List<ExtraAmenity> GetPackageAmenities(int packageId)
        {
            List<ExtraAmenity> amenities = new List<ExtraAmenity>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageId));
         
            try
            {
                amenities = DapperHelper.GetRecords<ExtraAmenity>("dbo.genSelExtraAmenitiesByPackageID", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error retrieving amenities for Package ID {packageId}", packageId);
            }
            return amenities;
        }

        public List<ExtraAmenity> GetRackRateAmenities(int hotelId)
        {
            List<ExtraAmenity> amenities = new List<ExtraAmenity>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));
           
            try
            {
                amenities = DapperHelper.GetRecords<ExtraAmenity>("dbo.genSelRackRateAmenities", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error retrieving amenities assoicated with rooms for Hotel ID {hotelId}", hotelId);
            }
            return amenities;
        }

        public void remove(int id)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("AmenityID", id));
            try
            {
                DapperHelper.ExecuteQuery("dbo.genInvisbleExtraAmenity", parameters, context);
                DapperHelper.ExecuteQuery("dbo.genDropAmenitiesFromPackage", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error removing amenity with ID {id}", id);
            }
        }

        public void Update(ExtraAmenity amenity)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("Name", amenity.Name ?? string.Empty));
            parameters.Add(P("Description", amenity.Description));
            parameters.Add(P("Tax", amenity.Tax));
            parameters.Add(P("AmenityRate", amenity.AmenityRate));
            parameters.Add(P("PerDay", amenity.PerDay));
            parameters.Add(P("PerDayPerPerson", amenity.PerDayPerPerson));
            parameters.Add(P("OneTimeFee", amenity.OneTimeFee));
            parameters.Add(P("OneTimeFeePerPerson", amenity.OneTimeFeePerson));
            parameters.Add(P("PerNightStay", amenity.PerNightStay));
            parameters.Add(P("ViewRate", amenity.ViewRate));
            parameters.Add(P("Mandatory", amenity.Mandatory));
            parameters.Add(P("Amenity", amenity.AmenityID));
            parameters.Add(P("Discount", amenity.Discount));
            parameters.Add(P("PictureUrl", amenity.PictureUrl ?? string.Empty));
            parameters.Add(P("ViewOnRR", amenity.ViewOnRackRate));
            parameters.Add(P("DiscountRegRate", amenity.DiscountRegularRate ?? 0));
            parameters.Add(P("ShortDesc", amenity.ShortDescription));
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdExtraAmenity", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error updating amenity with ID {id}", amenity.AmenityID);
            }
        }
    }
}
