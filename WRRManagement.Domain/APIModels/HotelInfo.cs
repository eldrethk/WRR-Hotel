using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.APIModels
{
    public class HotelInfo
    {
        private string _disclaimer = string.Empty;
        private string _emailDisclaimer = string.Empty;
        private string _hotelPhone = string.Empty;
        [Required]
        public string Disclaimer 
        {
            get => _disclaimer;
            set =>_disclaimer = string.IsNullOrEmpty(value)
                ? throw new ArgumentException("Disclaimer cannot be null or empty") : value;
        }
        [Required]
        public string EmailDisclaimer 
        { 
            get => _emailDisclaimer;
            set => _emailDisclaimer = string.IsNullOrEmpty(value)
                ? throw new ArgumentException("Email Disclaimer cannot be null or empty") : value;
        }

        [Required]
        public string HotelPhone 
        { 
            get => _hotelPhone;
            set => _hotelPhone = string.IsNullOrEmpty(value)
                ? throw new ArgumentException("Hotel Phone cannot be null or empty") : value;
        }

    }
}
