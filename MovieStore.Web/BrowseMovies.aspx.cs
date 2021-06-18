using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class BrowseMovies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkPermission();
            this.Page.RegisterAsyncTask(new PageAsyncTask(LoadData));
        }

        private void checkPermission()
        {
            if (Session["roleName"] != null && !string.IsNullOrEmpty(Session["roleName"].ToString().Trim()))
            {
                if (Session["roleName"].ToString().Trim().Equals("admin", StringComparison.CurrentCultureIgnoreCase))
                {
                    Response.Redirect("MainMenu.aspx", false);
                }
            }
        }

        private async Task LoadData()
        {
            if (!this.Page.IsPostBack)
            {
                MovieStore.Business.Movie movie = new MovieStore.Business.Movie();

                this.lvMovies.DataSource = await movie.browseMovies();
                this.lvMovies.DataBind();
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainMenu.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(ClearData));
        }

        private async Task ClearData()
        {
            MovieStore.Business.Movie movie = new MovieStore.Business.Movie();

            this.lvMovies.DataSource = await movie.browseMovies();
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
                Rating = this.ddlRating.SelectedValue.Trim(),
                ActiveOnly = true
            };

            this.lvMovies.DataSource = await movie.searchMovies();
            this.lvMovies.DataBind();
        }

        protected void lvMovies_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Trim().Equals("rentmovie"))
            {
                Session.Add("movieId", e.CommandArgument.ToString().Trim());

                Response.Redirect("RentMovie.aspx");
            }
        }

        protected void lvMovies_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Label lblNumberOfCopies = (Label)e.Item.FindControl("lblNumberOfCopies");
                LinkButton lbtnRent = (LinkButton)e.Item.FindControl("lbtnRent");

                if (Convert.ToInt32(lblNumberOfCopies.Text.Trim()) <= 0)
                {
                    lbtnRent.Visible = false;
                }
            }
        }
    }
}