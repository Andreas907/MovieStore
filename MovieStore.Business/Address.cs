using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieStore.Business
{
    public class Address
    {
        public int Id { get; set; }
        public string AddressLine1 { get; set; }

        public string AddressLine2 { get; set; }

        public string City { get; set; }

        public string ZipCode { get; set; }

        public string State { get; set; }

        public bool IsPrimary { get; set; }
    }
}
