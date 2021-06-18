using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class Movies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkPermission();

            if (!this.Page.IsPostBack)
            {
                this.Page.RegisterAsyncTask(new PageAsyncTask(LoadData));
            }
        }

        private void checkPermission()
        {
            if (Session["roleName"] != null && !string.IsNullOrEmpty(Session["roleName"].ToString().Trim()))
            {
                if (Session["roleName"].ToString().Trim().Equals("user", StringComparison.CurrentCultureIgnoreCase))
                {
                    Response.Redirect("MainMenu.aspx", false);
                }
            }
        }

        private async Task LoadData()
        {
            MovieStore.Business.Movie movie = new MovieStore.Business.Movie();

            this.lvMovies.DataSource = await movie.getMovies();
            this.lvMovies.DataBind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(ClearData));
        }

        private async Task ClearData()
        {
            MovieStore.Business.Movie movie = new MovieStore.Business.Movie();

            this.lvMovies.DataSource = await movie.getMovies();
            this.lvMovies.DataBind();

            this.tboxReleaseYear.Text = "";
            this.tboxTitle.Text = "";
            this.ddlRating.ClearSelection();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(SearchData));
        }

        private async Task SearchData()
        {
            MovieStore.Business.Movie movie = new MovieStore.Business.Movie()
            {
                Title = this.tboxTitle.Text.Trim(),
                ReleaseYear = !string.IsNullOrEmpty(this.tboxReleaseYear.Text.Trim()) ? Convert.ToInt32(this.tboxReleaseYear.Text.Trim()) : 0,
                Rating = this.ddlRating.SelectedValue.Trim()
            };

            this.lvMovies.DataSource = await movie.searchMovies();
            this.lvMovies.DataBind();
        }

        protected void lvMovies_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Trim().Equals("editmovie"))
            {
                Session.Add("movieId", e.CommandArgument.ToString().Trim());

                Response.Redirect("UpdateMovie.aspx");
            }
            else if (e.CommandName.ToLower().Trim().Equals("removemovie"))
            {
                MovieStore.Business.Movie movie = new Business.Movie
                {
                    Id = Convert.ToInt32(e.CommandArgument.ToString().Trim())
                };

                movie.removeMovie();

                this.Page.RegisterAsyncTask(new PageAsyncTask(LoadData));
            }
            else if (e.CommandName.ToLower().Trim().Equals("addmovie"))
            {
                MovieStore.Business.Movie movie = new Business.Movie
                {
                    Id = Convert.ToInt32(e.CommandArgument.ToString().Trim())
                };

                movie.readdMovie();

                this.Page.RegisterAsyncTask(new PageAsyncTask(LoadData));
            }
        }

        protected void lbtnAddMovie_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddMovie.aspx");
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainMenu.aspx");
        }

        protected void lvMovies_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label lblIsRemoved = (Label)e.Item.FindControl("lblIsRemoved");
                LinkButton lbtnRemoveAdd = (LinkButton)e.Item.FindControl("lbtnRemoveAdd");

                if (lblIsRemoved.Text.Trim().Equals("yes", StringComparison.CurrentCultureIgnoreCase))
                {
                    lbtnRemoveAdd.Text = "Readd";
                    lbtnRemoveAdd.ToolTip = "Readd";
                    lbtnRemoveAdd.CommandName = "AddMovie";
                }
                else
                {
                    lbtnRemoveAdd.Text = "Remove";
                    lbtnRemoveAdd.ToolTip = "Remove";
                    lbtnRemoveAdd.CommandName = "RemoveMovie";
                }
            }
        }
    }
}