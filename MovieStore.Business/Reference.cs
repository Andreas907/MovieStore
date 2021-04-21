using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieStore.Business
{
    public abstract class Base<T>
    {

        public int Id { get; set; }

        public string Name { get; set; }

        public DateTime DateCreated { get; set; }

        public DateTime? DateUpdated { get; set; }

        public abstract Task addRecord();

        public abstract Task updateRecord();

        public abstract Task<List<T>> getRecords();

        public abstract Task<T> getRecord();
    }
}
