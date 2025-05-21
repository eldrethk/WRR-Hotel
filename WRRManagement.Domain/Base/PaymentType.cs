using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.Base
{
    public enum PaymentType
    {
        [Display(Name = "Visa")]
        visa = 1,
        [Display(Name = "American Express")]
        amex = 2,
        [Display(Name = "MasterCard")]
        mastercard = 3,
        [Display(Name = "Discover")]
        discover = 4,
        [Display(Name = "Diners Club")]
        dinersclub = 5
    }

    public class PaymentTypeModel 
    {
        public bool None { get; set; }
        public bool Visa { get; set; }
        public bool Amex { get; set; }
        public bool MasterCard { get; set; }
        public bool Discover { get; set; }
        public bool DinersClub { get; set; }
    }

}
