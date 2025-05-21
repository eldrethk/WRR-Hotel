using WRRManagement.Domain.Amenities;

namespace WRR_Reserv.Models
{
    public class AmenityModel
    {
        public ExtraAmenity Amenity { get; set; }
        public bool Selected { get; set; }

        public BookingModel BookingModel { get; set; }

        public List<SelectedAmenityModel> CartAmenities { get; set; }

    }
}
