using WRR_Reserv.Models;
using WRRManagement.Domain.Amenities;

namespace WRR_Reserv.Services
{
    public class AmenityCartService
    {
        public List<SelectedAmenityModel> Items { get; set; } = new List<SelectedAmenityModel>();
        public void AddItem(SelectedAmenityModel item)
        {
           Items.Add(item);
        }
        public void RemoveItem(SelectedAmenityModel item)
        {
            Items.Remove(item);
        }
        public void ClearCart()
        {
            Items.Clear();
        }
        public decimal GetTotal()
        {
            return Items.Sum(x => x.Fee) + Items.Sum(x => x.Tax);
        }
        public decimal GetTotalTax()
        {
            return Items.Sum(x => x.Tax);
        }
        public decimal GetSubTotal()
        {
            return Items.Sum(x => x.Fee);
        }

        public decimal CalculateTax(ExtraAmenity amenity)
        {
            return amenity.Tax > 0 ? amenity.AmenityRate * (amenity.Tax / 100) : 0;
        }
    }
}
