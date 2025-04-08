using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.Packages;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.PackageRepository
{
    public class PackageTierLevelRepository : GenericRepository<PackageTierLevel>, IPackageTierLevel
    {
        protected new WRRContext context;
        private readonly ILogger<PackageTierLevelRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public PackageTierLevelRepository(WRRContext context, ILogger<PackageTierLevelRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(int packageId, DateTime date, char tier)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageId));
            parameters.Add(P("Date", date));
            parameters.Add(P("Tier", tier));
      
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsPackageTierLevel", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding package tier level: {@packageTierLevel}", new { packageId, date, tier });
            }
            return id;
        }

        public void AddDateRange(int packageId, DateTime start, DateTime end, char tier) {
            if (start > DateTime.MinValue && end>DateTime.MinValue && packageId > 0) 
            {
                DateTime temp = start;
                while(temp <= end)
                {
                    int id = Add(packageId, temp, tier);
                    temp = temp.AddDays(1);
                }
            }
        }

        public List<Package> GetPackagesWithTier(int hotelId)
        {
            List<Package> list = new List<Package>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("HotelID", hotelId));  
         
            try
            {
                list = DapperHelper.GetRecords<Package>("dbo.genSelPackagesWithTierLevel", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting packages with tier level for hotel ID {hotelId}", hotelId);
            }
            return list;
        }

        public List<PackageTierLevel> GetPackageTierLevels(int packageId)
        {
            List<PackageTierLevel> list = new List<PackageTierLevel>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageId));
           
            try
            {
                list = DapperHelper.GetRecords<PackageTierLevel>("dbo.genSelPackageTierLevelByPackageID", parameters, context);
            }
            catch(Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting tier levels for package ID {packageId}", packageId);
            }
            return list;
        }

        public char GetTierForDate(int packageId, DateTime date)
        {
            string tier = "A";
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageID", packageId));
            parameters.Add(P("Date", date));
         
            try
            {
               tier = DapperHelper.ExecuteQueryString("dbo.genSelPackageTierLevelByDate", parameters, context, "@Tier");
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while getting tier level for package ID {packageId} on date {date}", packageId, date);
            }
            return Convert.ToChar(tier.ToLower());
        }

        public PackageTierLevel GetTierLevel(int tierLevelId)
        {
            PackageTierLevel level = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("TierLevelID", tierLevelId));
          
            try
            {
                level = DapperHelper.GetRecord<PackageTierLevel>("dbo.genSelPackageTierLevelByID", parameters, context);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error occurred while getting tier level with ID {tierLevelId}", tierLevelId);
            }
            return level;
        }

        public void Update(char tier, int tierLevelId)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PackageTierLevelID", tierLevelId));
            parameters.Add(P("Tier", tier));
           
            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdPackageTierLevel", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating package tier level ID {tierLevelId} to {tier}", tierLevelId, tier);
            }

        }
    }
}
