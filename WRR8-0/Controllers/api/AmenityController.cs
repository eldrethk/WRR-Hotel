using Microsoft.AspNetCore.Mvc;
using WRRManagement.Domain.Amenities;

namespace WRR8_0.Controllers.api
{
    [Route("api/[controller]")]
    [ApiController]
    public class AmenityController : Controller
    {
        private readonly IExtraAmenity _amenityRepository;
        public AmenityController(IExtraAmenity extraAmenity)
        {
            _amenityRepository = extraAmenity;
        }

        [HttpGet("RackRateAmenity/{hotelId}")]
        public IActionResult RackRateAmenity(int hotelid)
        {
            List<ExtraAmenity> amenities = _amenityRepository.GetRackRateAmenities(hotelid);

            if ((amenities.Count > 0))
            {
                return Ok(amenities);
            }
            else
            {
                return NotFound("No amenities found");
            }
        }
    }
}
