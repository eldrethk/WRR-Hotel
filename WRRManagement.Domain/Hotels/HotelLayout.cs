using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Hotels
{
    public class HotelLayout
    {
        public int ID { get; set; }
        public int HotelID { get; set; }
        public string? HeaderFileName { get; set; }
        public string? FooterFileName { get; set; }
        [Display(Name ="Hotel StyleSheet Filename")]
        public string? HotelCSS { get; set; }
        public string? EmailHeaderImage { get; set; }
        public string? EmailHotelLogo { get; set; }
        public string? StatusMessage { get; set; }
        public bool HeaderHtml { get; set; }
        public bool FooterHtml { get; set; }


        public HotelLayout(){}

        public HotelLayout(IDataReader rd) : this()
        {
            HotelID = Convert.ToInt32(rd["HotelID"]);
            HeaderFileName = rd["HeaderFileName"].ToString();
            FooterFileName = rd["FooterFileName"].ToString();
            HotelCSS = rd["NavStyleUrl"].ToString();
            EmailHeaderImage = rd["EmailHeaderImage"].ToString();
            EmailHotelLogo = rd["EmailHotelLogo"].ToString();
                
        }

        
    }

    
}
