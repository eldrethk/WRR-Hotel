using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Amenities
{
    public interface IExtraAmenity
    {
        int Add(ExtraAmenity amenity);
        void Update(ExtraAmenity amenity);
        List<ExtraAmenity> GetAllForHotel(int hotelId);
        List<ExtraAmenity> GetRackRateAmenities(int hotelId);
        ExtraAmenity GetAmenity(int id);
        List<ExtraAmenity> GetPackageAmenities(int packageId);
        void remove(int id);
    }
}
