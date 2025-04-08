using Microsoft.Extensions.Logging;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Base;
using WRRManagement.Domain.Packages;
using WRRManagement.Infrastructure.Data;

namespace WRRManagement.Infrastructure.PackageRepository
{
    public class PackageRateRepository : GenericRepository<PackageRate>, IPackageRate
    {
        protected new WRRContext context;
        private readonly ILogger<PackageRateRepository> _logger;
        private ParameterInfo P(string name, object value) => new ParameterInfo() { ParameterName = name, ParameterValue = value };
        public PackageRateRepository(WRRContext context, ILogger<PackageRateRepository> logger) : base(context)
        {
            this.context = context;
            this._logger = logger;
        }

        public int Add(PackageRate packageRate)
        {
            int id = 0;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("Start", packageRate.StartDate));
            parameters.Add(P("End", packageRate.EndDate));
            parameters.Add(P("RoomID", packageRate.RoomTypeID));
            parameters.Add(P("Price", packageRate.Price));
            parameters.Add(P("PackageID", packageRate.PackageID));
           
            try
            {
                id = DapperHelper.ExecuteQuery("dbo.genInsPackageRate", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while adding package rate: {@packageRate}", packageRate);
            }
            return id;

            
        }

        public bool CheckDates(int roomId, DateTime start, DateTime end, int packageId)
        {
            bool valid = false;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("StartDate", start));
            parameters.Add(P("EndDate", end));
            parameters.Add(P("RoomID", roomId));
            parameters.Add(P("PackageID", packageId));
                        
            try
            {
                valid = DapperHelper.ExecuteQueryBool("dbo.genVerifyPackageRates", parameters, context, "@Valid");
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while checking package rate dates: {@packageRate}", new { roomId, start, end, packageId });
            }
            return valid;
        }

        public PackageRate Get(int rateId)
        {
            PackageRate packageRate = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("PKRateID", rateId));
          
            try
            {
                packageRate = DapperHelper.GetRecord<PackageRate>("dbo.genSelPackageRateByID", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving package room rates with RateID {rateId}", rateId);
            }
            return packageRate;
        }

        public List<PackageRate> GetRackRates(int roomId, int packageId)
        {
            List<PackageRate> list = new List<PackageRate>();
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomId));
            parameters.Add(P("PackageID", packageId));
          
            try
            {
                list = DapperHelper.GetRecords<PackageRate>("dbo.genSelPackageRates", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving package rates for room ID {roomId} and package ID {packageId}", roomId, packageId);
            }
            return list;
        }

        public PackageRate GetRateForReservation(int roomId, DateTime temp, int packageId)
        {
            PackageRate packageRate = null;
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RoomID", roomId));
            parameters.Add(P("PackageID", packageId));
            parameters.Add(P("Temp", temp));
                       
            try
            {
                packageRate = DapperHelper.GetRecord<PackageRate>("dbo.genSelPackageRateByDate", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while retrieving package rate for room ID {roomId} and date {temp}", roomId, temp);
            }
            return packageRate;
        }

        public void Invisible(int rateId)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RateID", rateId));
  
            try
            {
                DapperHelper.ExecuteQuery("dbo.genInvisiblePackageRate", parameters, context);
            }
            catch(Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while making package rate with RateID {rateId} invisible", rateId);
            }
        }

        public void Update(PackageRate packageRate)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("Start", packageRate.StartDate));
            parameters.Add(P("End", packageRate.EndDate));
            parameters.Add(P("Price", packageRate.Price));
            parameters.Add(P("RateID", packageRate.RateID));

            try
            {
                DapperHelper.ExecuteQuery("dbo.genUpdPackageRate", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while updating package rate: {@packageRate}", packageRate);
            }

        }

        public void Visible(int rateId)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(P("RateID", rateId));
           
            try
            {
                DapperHelper.ExecuteQuery("dbo.genVisiblePackageRate", parameters, context);
            }
            catch (Exception ex) 
            {
                _logger.LogError(ex, "Error occurred while making package rate with RateID {rateId} visible", rateId);
            }
        }
    }
}
