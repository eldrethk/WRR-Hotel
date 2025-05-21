namespace WRR_Reserv.Models
{
    public class SelectedAmenityModel
    {
        public int ExtraAmenityID { get; set; }
        public string AmenityName { get; set; }
        public decimal Fee { get; set; }
        public string? Date { get; set; }
        public int? NumOfPeople { get; set; }
        public decimal Tax { get; set; }
        public bool Mandatory { get; set; }
    }
}
