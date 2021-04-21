using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieStore.Business
{
    public class Role : Base<Role>
    {
        public override async Task addRecord()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                MovieStore.Data.Role roles = new MovieStore.Data.Role();

                roles.NAME = this.Name;

                db.Roles.Add(roles);
                await db.SaveChangesAsync();

            }
        }

        public override Task<Role> getRecord()
        {
            throw new NotImplementedException();
        }

        public override async Task<List<Role>> getRecords()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                return await db.Roles.Select(s => new Role { Id = s.ID, Name = s.NAME }).ToListAsync();
            }
        }

        public override async Task updateRecord()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var role = await db.Roles.Where(w => w.ID == this.Id).Select(s => s).FirstOrDefaultAsync();

                role.NAME = this.Name;

                await db.SaveChangesAsync();
            }
        }
    }
}
