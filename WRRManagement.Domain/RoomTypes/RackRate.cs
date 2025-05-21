using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WRRManagement.Domain;

namespace WRRManagement.Domain.RoomTypes
{
    public class RackRate
    {
        public int RackRateID { get; set; }
        [Required]
        public int RoomTypeID { get; set; }
        [Required(ErrorMessage = "Start Date is required")]
        [Display(Name = "Start Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode =true)]
        public DateTime StartDate { get; set; }
        [Required(ErrorMessage = "End Date is required")]
        [Display(Name = "End Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode =true)]
        [DateGreaterThan("StartDate", ErrorMessage = "End Date must be greater than Start Date")]
        public DateTime EndDate { get; set; }
        [Required(ErrorMessage = "Rack Rate is required")]
        [Display(Name = "Tier A Rate")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal TierARate { get; set; }
        [Display(Name = "Tier B Rate")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal TierBRate { get; set; }
        [Display(Name = "Tier C Rate")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal TierCRate { get; set; }
        [Display(Name = "Tier D Rate")]
        [DisplayFormat(DataFormatString = "{0:N}")]
        public decimal TierDRate { get; set; }
        public decimal Monthly { get; set; }
        public bool Visible { get; set; }

        public RackRate() { }

        public RackRate(IDataReader reader) : this()
        {
            RackRateID = Convert.ToInt32(reader["RackRateID"]);
            RoomTypeID = Convert.ToInt32(reader["RoomTypeID"]);
            StartDate = Convert.ToDateTime(reader["StartDate"]);
            EndDate = Convert.ToDateTime(reader["EndDate"]);
            try
            {
                TierARate = Convert.ToDecimal(reader["TierARate"]);
            }
            catch
            {
                TierARate = 0;
            }
            try
            {
                TierBRate = Convert.ToDecimal(reader["TierBRate"]);
            }
            catch
            {
                TierBRate = 0;
            }
            try
            {
                TierCRate = Convert.ToDecimal(reader["TierCRate"]);
            }
            catch
            {

                TierCRate = 0;
            }
            try
            {
                TierDRate = Convert.ToDecimal(reader["TierDRate"]);
            }
            catch
            {
                TierDRate = 0;
            }
            if (reader["TierDRate"] == null)
                TierDRate = 0;
            try
            {
                Monthly = Convert.ToDecimal(reader["MonthlyRate"]);
            }
            catch
            {
                Monthly = 0;
            }
            Visible = Convert.ToBoolean(reader["Visible"]);
        }
    }
}
