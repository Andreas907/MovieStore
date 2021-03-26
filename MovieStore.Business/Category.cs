using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace MovieStore.Business
{
   public class Category
    {
        #region Properties
        public int Id { get; set; }

        public string Name { get; set; }

        public DateTime DateCreated { get; set; }

        public DateTime? DateUpdated { get; set; }
        #endregion



        #region Constructors

        public Category()
        {
            
        }

        public Category (string name)
        {
            this.Name = name;
        }
        #endregion

        #region Methods
        public async Task<List<Category>> getCategories()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                return await db.Categories.Select(s => new Category { Id = s.ID, Name = s.NAME }).ToListAsync();
            }
        }

        public async Task addCategory()
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

        public async Task updateCategory()
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
