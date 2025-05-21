using WRR_Reserv.Models;
using WRRManagement.Domain.Amenities;

namespace WRR_Reserv.Services
{
    public class AddonService
    {
        private readonly IExtraAmenity _amenityRepository;
        private readonly IHttpClientFactory _httpClientFactory;

        private HttpClient CreateClient() => _httpClientFactory.CreateClient("WRRApiClient");
        public AddonService(IExtraAmenity extraAmenity, IHttpClientFactory httpClientFactory) 
        {
            _amenityRepository = extraAmenity;
            _httpClientFactory = httpClientFactory;
        }

        public bool HotelHasAmenities(int id)
        {
            try
            {
                List<ExtraAmenity> amenities = _amenityRepository.GetAllForHotel(id);
                if (amenities.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch
            {
                return false;
            }
        }

        public async Task<List<AmenityModel>> GetAllOptionalAmenities(int hotelId)
        {
            try
            {
                var client = CreateClient();
                var response = await client.GetAsync($"api/amenity/RackRateAmenity/{hotelId}");
                response.EnsureSuccessStatusCode();

                var list = await response.Content.ReadFromJsonAsync<List<ExtraAmenity>>() ?? new List<ExtraAmenity>();
                return list.Select(x => new AmenityModel { Amenity = x, Selected = false }).ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Error fetching amenities", ex);
            }
        }
    }
}
