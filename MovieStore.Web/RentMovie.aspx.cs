using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class RentMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(LoadData));
        }

        private async Task LoadData()
        {
            if (!this.Page.IsPostBack)
            {
                MovieStore.Business.Movie movie = new MovieStore.Business.Movie
                {
                    Id = Convert.ToInt32(Session["movieId"].ToString().Trim())
                };

                movie = await movie.getMovie();

                if (movie != null)
                {
                    this.lblReleaseYear.Text = movie.ReleaseYear.ToString();
                    this.lblTitle.Text = movie.Title;
                    this.lblRating.Text = movie.Rating;
                    this.imgCover.AlternateText = movie.Title;
                    if (movie.Cover != null)
                    {
                        this.imgCover.ImageUrl = "data:image;base64," + Convert.ToBase64String(movie.Cover);
                    }
                }
            }
        }

        protected void btnRent_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("BrowseMovies.aspx");
        }
    }
}