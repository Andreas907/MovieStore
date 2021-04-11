using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieStore.Business
{
    public class Payment
    {

        public decimal AmountDue { get; set; }

        public bool IsPaid { get; set; }

        public PaymentType PaymentTypeInformation { get; set; }

        public PaymentInfo PaymentInformation { get; set; }


    }
}
