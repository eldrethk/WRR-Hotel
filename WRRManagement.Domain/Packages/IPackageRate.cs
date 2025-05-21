using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Packages
{
    public interface IPackageRate
    {
        List<PackageRate> GetRackRates(int roomId, int packageId);
        int Add(PackageRate packageRate);
        PackageRate Get(int rateId);
        PackageRate GetRateForReservation(int roomId, DateTime temp, int packageId);
        void Update(PackageRate packageRate);
        bool CheckDates(int roomId, DateTime start, DateTime end, int packageId);
        void Invisible(int rateId);
        void Visible(int rateId);
    }
}
