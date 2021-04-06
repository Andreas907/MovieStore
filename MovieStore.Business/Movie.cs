using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieStore.Business
{
   public class Movie
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public int ReleaseYear { get; set; }

        public string Rating { get; set; }

        public int NumberOfCopies { get; set; }

        public byte[] Cover { get; set; }

        public List<Actor> Actors { get; set; }

        public async Task addMovie()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                MovieStore.Data.Movie movie = new MovieStore.Data.Movie();

                movie.COVER = this.Cover;
                movie.DATE_CREATED = DateTime.Now;
                movie.DESCRIPTION = this.Description;
                movie.TITLE = this.Title;
                movie.NUMBER_OF_COPIES = this.NumberOfCopies;
                movie.RATING = this.Rating;
                movie.RELEASE_YEAR = this.ReleaseYear;

                db.Movies.Add(movie);
                await db.SaveChangesAsync();
            }


        }


        public async Task updateMovieCover()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var movie = await db.Movies.Where(w => w.ID == this.Id).FirstOrDefaultAsync();

                if (movie != null)
                {
                    movie.COVER = this.Cover;
                    movie.DATE_UPDATED = DateTime.Now;

                    await db.SaveChangesAsync();

                }
            }
        }

        public async Task updateNumberOfCopies()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var movie = await db.Movies.Where(w => w.ID == this.Id).FirstOrDefaultAsync();

                if (movie != null)
                {
                    movie.NUMBER_OF_COPIES = this.NumberOfCopies;
                    movie.DATE_UPDATED = DateTime.Now;

                    await db.SaveChangesAsync();

                }
            }
        }


        public async Task updateMovie()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var movie = await db.Movies.Where(w => w.ID == this.Id).FirstOrDefaultAsync();

                if (movie != null)
                {
                    movie.TITLE = this.Title;
                    movie.DESCRIPTION = this.Description;
                    movie.RATING = this.Rating;
                    movie.RELEASE_YEAR = this.ReleaseYear;
                    movie.DATE_UPDATED = DateTime.Now;

                    await db.SaveChangesAsync();

                }

            }

        }

        public async Task addActors()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                if (this.Actors != null && this.Actors.Count > 0)
                {
                    using (var transaction = db.Database.BeginTransaction())
                    {
                        try
                        {
                            foreach (var item in this.Actors)
                            {
                                MovieStore.Data.MovieActor movieActor = new MovieStore.Data.MovieActor();

                                movieActor.ACTOR_ID = item.Id;
                                movieActor.MOVIE_ID = this.Id;
                                movieActor.DATE_CREATED = DateTime.Now;

                                await db.SaveChangesAsync();


                            }

                            transaction.Commit();


                        }
                        catch (Exception ex)
                        {
                            transaction.Rollback();
                            throw ex;
                        }
                    }

                }
            }
        }

        public async Task removeMovie()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var movie = await db.Movies.Where(w => w.ID == this.Id).FirstOrDefaultAsync();

                if (movie != null)
                {
                    movie.IS_REMOVED = true;
                    movie.DATE_UPDATED = DateTime.Now;

                }

            }
        }

        public async Task readdMovie()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var movie = await db.Movies.Where(w => w.ID == this.Id).FirstOrDefaultAsync();

                if (movie != null)
                {
                    movie.IS_REMOVED = false;
                    movie.DATE_UPDATED = DateTime.Now;

                }

            }
        }

        public async Task<Movie> getMovie()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                return await db.Movies.Where(w => w.ID == this.Id).Select(s => new Movie
                {
                     Cover = s.COVER,
                      Description = s.DESCRIPTION,
                       Id = s.ID,
                        NumberOfCopies = s.NUMBER_OF_COPIES,
                         Rating = s.RATING,
                          ReleaseYear = s.RELEASE_YEAR,
                           Title = s.TITLE,
                            Actors = s.MovieActors.Where(w => w.MOVIE_ID == this.Id).Select(x => new Actor 
                            {
                                Id = x.ACTOR_ID, 
                                FirstName = x.Actor.FIRST_NAME,
                                MiddleName = x.Actor.MIDDLE_NAME,
                                LastName = x.Actor.LAST_NAME
                            }).ToList()
                }).FirstOrDefaultAsync();
            }
        }

        public async Task<List<Movie>> getMovies()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                return await db.Movies.Select(s => new Movie
                {
                    Cover = s.COVER,
                    Description = s.DESCRIPTION,
                    Id = s.ID,
                    NumberOfCopies = s.NUMBER_OF_COPIES,
                    Rating = s.RATING,
                    ReleaseYear = s.RELEASE_YEAR,
                    Title = s.TITLE,
                    Actors = s.MovieActors.Where(w => w.MOVIE_ID == s.ID).Select(x => new Actor
                    {
                        Id = x.ACTOR_ID,
                        FirstName = x.Actor.FIRST_NAME,
                        MiddleName = x.Actor.MIDDLE_NAME,
                        LastName = x.Actor.LAST_NAME
                    }).ToList()
                }).ToListAsync();
            }
        }

        public async Task<List<Movie>> searchMovies()
        {
            using (MovieStore.Data.MovieStoreEntities db = new MovieStore.Data.MovieStoreEntities())
            {
                var movies = db.Movies.Select(s => s);

                if (!string.IsNullOrEmpty(this.Title))
                {
                    movies = movies.Where(w => w.TITLE.Contains(this.Title));
                }

                if (!string.IsNullOrEmpty(this.Rating))
                {
                    movies = movies.Where(w => w.RATING.Equals(this.Rating));
                }

                if (this.ReleaseYear >= 1888)
                {
                    movies = movies.Where(w => w.RELEASE_YEAR == this.ReleaseYear);
                }

                if (this.Actors != null && this.Actors.Count > 0)
                {
                    foreach (var item in this.Actors)
                    {
                        movies = movies.Where(w => w.MovieActors.Any(x => x.ACTOR_ID == item.Id));
                    }
                }

                return await movies.Select(s => new Movie 
                {
                    Cover = s.COVER,
                    Description = s.DESCRIPTION,
                    Id = s.ID,
                    NumberOfCopies = s.NUMBER_OF_COPIES,
                    Rating = s.RATING,
                    ReleaseYear = s.RELEASE_YEAR,
                    Title = s.TITLE,
                    Actors = s.MovieActors.Where(w => w.MOVIE_ID == s.ID).Select(x => new Actor
                    {
                        Id = x.ACTOR_ID,
                        FirstName = x.Actor.FIRST_NAME,
                        MiddleName = x.Actor.MIDDLE_NAME,
                        LastName = x.Actor.LAST_NAME
                    }).ToList()
                }).ToListAsync();
            }
        }

    }
}
