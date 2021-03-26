using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieStore.Business
{
    public class Actor : Person
    {
        public override async Task addPerson()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                MovieStore.Data.Actor actor = new MovieStore.Data.Actor();

                actor.FIRST_NAME = this.FirstName;
                actor.MIDDLE_NAME = this.MiddleName;
                actor.LAST_NAME = this.LastName;
                actor.DATE_CREATED = DateTime.Now;

                db.Actors.Add(actor);
                await db.SaveChangesAsync();


            }
        }

        public async Task<List<Actor>> getActors()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                return await db.Actors.Select(s => new Actor 
                {
                    Id = s.ID,
                    FirstName = s.FIRST_NAME,
                    LastName = s.LAST_NAME,
                    MiddleName = s.MIDDLE_NAME

                }).ToListAsync();
            }
        }


        public async Task<List<Actor>> searchActors()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var actors = db.Actors.Select(s => s);

                if (!string.IsNullOrEmpty(this.FirstName))
                {
                    actors = actors.Where(w => w.FIRST_NAME.StartsWith(this.FirstName));
                }

                if (!string.IsNullOrEmpty(this.MiddleName))
                {
                    actors = actors.Where(w => w.MIDDLE_NAME.StartsWith(this.MiddleName));
                }

                if (!string.IsNullOrEmpty(this.LastName))
                {
                    actors = actors.Where(w => w.LAST_NAME.StartsWith(this.LastName));
                }

                return await actors.Select(s => new Actor 
                {
                    Id = s.ID,
                    FirstName = s.FIRST_NAME,
                    LastName = s.LAST_NAME,
                    MiddleName = s.MIDDLE_NAME

                }).ToListAsync();
            }

        }
        public async Task<Actor> getActor()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                return await db.Actors.Where(w => w.ID == this.Id).Select(s => new Actor 
                {

                    Id = s.ID, 
                    FirstName = s.FIRST_NAME,
                    LastName = s.LAST_NAME,
                    MiddleName = s.MIDDLE_NAME

                }).FirstOrDefaultAsync();
            }
        }

        public override async Task updatePerson()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var actor = await db.Actors.Where(w => w.ID == this.Id).Select(s => s).FirstOrDefaultAsync();

                actor.FIRST_NAME = this.FirstName;
                actor.MIDDLE_NAME = this.MiddleName;
                actor.LAST_NAME = this.LastName;
                actor.DATE_UPDATED = DateTime.Now;

                await db.SaveChangesAsync();

            }
        }
    }
}
