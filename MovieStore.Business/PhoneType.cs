using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieStore.Business
{
    public class PhoneType : Base<PhoneType>
    {
        public override async Task addRecord()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                MovieStore.Data.PhoneType phoneType = new MovieStore.Data.PhoneType();

                phoneType.NAME = this.Name;

                db.PhoneTypes.Add(phoneType);
                await db.SaveChangesAsync();

            }
        }

        public override async Task<List<PhoneType>> getRecords()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                return await db.PhoneTypes.Select(s => new PhoneType { Id = s.ID, Name = s.NAME }).ToListAsync();
            }
        }

        public override async Task updateRecord()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var phoneType = await db.PhoneTypes.Where(w => w.ID == this.Id).Select(s => s).FirstOrDefaultAsync();

                phoneType.NAME = this.Name;

                await db.SaveChangesAsync();
            }
        }
    }
}
