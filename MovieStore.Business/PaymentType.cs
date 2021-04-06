using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieStore.Business
{
    public class PaymentType : Base<PaymentType>
    {
        public override async Task addRecord()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                MovieStore.Data.PaymentType paymentType = new MovieStore.Data.PaymentType();

                paymentType.NAME = this.Name;

                db.PaymentTypes.Add(paymentType);
                await db.SaveChangesAsync();

            }
        }

        public override async Task<List<PaymentType>> getRecords()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                return await db.PaymentTypes.Select(s => new PaymentType { Id = s.ID, Name = s.NAME }).ToListAsync();
            }
        }

        public override async Task updateRecord()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var paymentType = await db.PaymentTypes.Where(w => w.ID == this.Id).Select(s => s).FirstOrDefaultAsync();

                paymentType.NAME = this.Name;

                await db.SaveChangesAsync();
            }
        }
    }
}
