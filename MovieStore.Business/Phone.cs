using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieStore.Business
{
    public class Phone
    {
        public int Id { get; set; }

        public string PhoneNumber { get; set; }

        public int PhoneTypeId { get; set; }

        public string PhoneType { get; set; }
    }
}
