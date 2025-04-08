using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Amenities;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.Packages;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.PackageRepository
{
    public class PackageAmenityRepository : GenericRepository<PackageAmenity>, IPackageAmenity
    {
        protected new WRRContext context;
        private readonly ILogger<PackageAmenityRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };

        public PackageAmenityRepository(WRRContext context, ILogger<PackageAmenityRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(PackageAmenity packageAmenity)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageAmenity.PackageID)); 
            parameters.Add(P("AmenityID", packageAmenity.ExtraAmenityID));
            parameters.Add(P("ViewRate", packageAmenity.ViewRate));
            parameters.Add(P("Mandatory", packageAmenity.Mandatory));
            parameters.Add(P("Qty", packageAmenity.MandatoryQuantity ?? 0));
            parameters.Add(P("AdditionalPurchases", packageAmenity.AdditionalPurchases));
            
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsPackageAmenity", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding package amenity: {@packageAmenity}", packageAmenity);
            }
            return id;
        }

        public PackageAmenity Get(int packageId, int extraAmenityId)
        {
            PackageAmenity amenity = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageId));
            parameters.Add(P("ExtraAmenityID", extraAmenityId));

            try
            {
                amenity = DapperHelper.GetRecord<PackageAmenity>("dbo.genSelPackageAmenityByID", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting package amenity for package ID {packageId} and amenity ID {extraAmenityId}", packageId, extraAmenityId);
            }
            return amenity;
        }

        public List<PackageAmenity> GetAll(int packageId)
        {
            List<PackageAmenity> amenities =new List<PackageAmenity>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageId));
          
            try
            {
                amenities = DapperHelper.GetRecords<PackageAmenity>("dbo.genSelPackageAmenities", parameters, context);
            }
            catch(Exception e) 
            {
                _logger.LogError(e, "Error occurred while retrieving all package amenities for package ID {packageId}", packageId);
            }
            return amenities;   
        }

        public List<ExtraAmenity> GetMandatoryAmenities(int packageId)
        {
            List<ExtraAmenity> list = new List<ExtraAmenity>();
            List<ParameterInfo> parameters=new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageId));
          
            try
            {
                list = DapperHelper.GetRecords<ExtraAmenity>("dbo.genSelMandatoryAmenitiesForPackage", parameters, context);
            }
            catch(Exception e) 
            {
                _logger.LogError(e, "Error occurred while retrieving mandatory amenities for package ID {packageId}", packageId);
            }
            return list;
        }

        public List<Package> GetPackagesAssociatedWithAmenity(int extraAmenityId)
        {
            List<Package> list = new List<Package>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("amenityid", extraAmenityId));
           
            try
            {
                list = DapperHelper.GetRecords<Package>("dbo.genSelPackageAssociatedWithAmenity", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving packages associated with amenity ID {extraAmenityId}", extraAmenityId);
            }
            return list;
        }

        public void Remove(int extraAmenityID, int packageId)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("ExtraAmenityID", extraAmenityID));
            parameters.Add(P("PackageID", packageId));
            try
            {
                DapperHelper.ExecuteQuery("dbo.genDelPackageAmenity", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while removing package amenity with ExtraAmenityID {extraAmenityID} and PackageID {packageId}", extraAmenityID, packageId);
            } 
        }

        public void Update(PackageAmenity packageAmenity)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageAmenityID", packageAmenity.PackageAmenityID));
            parameters.Add(P("ViewRate", packageAmenity.ViewRate));
            parameters.Add(P("Mandatory", packageAmenity.Mandatory));
            parameters.Add(P("Qty", packageAmenity.MandatoryQuantity ?? 0));
            parameters.Add(P("AdditionalPurchases", packageAmenity.AdditionalPurchases));
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdPackageAmenity", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating package amenity with ID {packageAmenityID}: {@packageAmenity}", packageAmenity.PackageAmenityID, packageAmenity);
            }
        }
    }
}
