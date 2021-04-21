using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieStore.Business
{
    public class CreditCardType : Base<CreditCardType>

    {
        public override async Task addRecord()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                MovieStore.Data.CreditCardType creditCardType = new MovieStore.Data.CreditCardType();

                creditCardType.NAME = this.Name;

                db.CreditCardTypes.Add(creditCardType);
                await db.SaveChangesAsync();

            }
        }

        public override async Task<CreditCardType> getRecord()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                return await db.CreditCardTypes.Where(w => w.ID == this.Id).Select(s => new CreditCardType { Name = s.NAME }).FirstOrDefaultAsync();
            }
        }

        public override async Task<List<CreditCardType>> getRecords()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                return await db.CreditCardTypes.Select(s => new CreditCardType { Id = s.ID, Name = s.NAME }).ToListAsync();
            }
        }

        public override async Task updateRecord()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var creditCardType = await db.CreditCardTypes.Where(w => w.ID == this.Id).Select(s => s).FirstOrDefaultAsync();

                creditCardType.NAME = this.Name;

                await db.SaveChangesAsync();
            }
        }
    }
}
