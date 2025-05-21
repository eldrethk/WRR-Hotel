using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Packages
{
    public interface IPackageTierLevel
    {
        List<Package> GetPackagesWithTier(int hotelId);
        List<PackageTierLevel> GetPackageTierLevels(int packageId);
        char GetTierForDate(int packageId, DateTime date);
        PackageTierLevel GetTierLevel(int tierLevelId);
        int Add(int packageId, DateTime date, char tier);
        void AddDateRange(int packageId, DateTime start, DateTime end, char tier);
        void Update(char tier, int tierLevelId);

    }
}
