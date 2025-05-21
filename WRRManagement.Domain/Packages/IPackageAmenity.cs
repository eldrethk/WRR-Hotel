using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain.Amenities;


namespace WRRManagement.Domain.Packages
{
    public interface IPackageAmenity
    {
        int Add(PackageAmenity packageAmenity);
        void Update(PackageAmenity packageAmenity);
        void Remove(int extraAmenityID, int packageId);
        List<PackageAmenity> GetAll(int packageId);
        PackageAmenity Get(int packageId, int extraAmenityId);
        List<ExtraAmenity> GetMandatoryAmenities(int packageId);
        List<Package> GetPackagesAssociatedWithAmenity(int extraAmenityId);

    }
}
