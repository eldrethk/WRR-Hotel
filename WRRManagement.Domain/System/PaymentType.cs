using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WRRManagement.Domain.System
{
     public class PaymentTypeData
    {
        public int PaymentTypeID { get; set; }      
        public string? TypeName { get; set; }
        public string? CreditCardName { get; set; }

        //public PaymentType() { }

        /*public PaymentType(IDataReader rd): this()
        {
            PaymentTypeID = Convert.ToInt32(rd["PaymentTypeID"]);
            TypeName = rd["TypeName"].ToString();
            CreditCardName = rd["CreditCardName"].ToString();
        }*/

     
    }

    public enum PaymentType
    {
        [Display(Name = "Visa")]
        visa = 1,
        [Display(Name ="American Express")]
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
        public bool Visa { get; set; }
        public bool Amex { get; set; }
        public bool MasterCard { get; set; }
        public bool Discover { get; set; }
        public bool DinersClub { get; set; }
    }


}
