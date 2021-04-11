using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieStore.Business
{
    public class PaymentInfo
    {
        public string RefId { get; set; }

        public string PaymentStatus { get; set; }

        public bool? IsVoid { get; set; }

        public int? CheckNumber { get; set; }

        public CreditCardType CreditCartTypeInformation { get; set; }



    }
}
