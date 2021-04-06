using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace MovieStore.Business
{
   public class Category : Base<Category>
    {


        #region Methods
        public override async Task<List<Category>> getRecords()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                return await db.Categories.Select(s => new Category { Id = s.ID, Name = s.NAME }).ToListAsync();
            }
        }

        public override async Task addRecord()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                MovieStore.Data.Category category = new MovieStore.Data.Category();

                category.NAME = this.Name;
                category.DATE_CREATED = DateTime.Now;

                db.Categories.Add(category);
                await db.SaveChangesAsync();

            }

        }

        public override async Task updateRecord()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var category = await db.Categories.Where(w => w.ID == this.Id).Select(s => s).FirstOrDefaultAsync();

                category.NAME = this.Name;
                category.DATE_UPDATED = DateTime.Now;

                await db.SaveChangesAsync();
            }
        }
        #endregion

    }
}
