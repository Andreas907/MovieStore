using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class Actors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkPermission();
            this.Page.RegisterAsyncTask(new PageAsyncTask(LoadData));
        }

        private async Task LoadData()
        {
            if (!this.Page.IsPostBack)
            {
                MovieStore.Business.Actor actor = new MovieStore.Business.Actor();

                this.lvActors.DataSource = await actor.getActors();
                this.lvActors.DataBind();
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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(ClearData));
        }

        private async Task ClearData()
        {
            MovieStore.Business.Actor actor = new MovieStore.Business.Actor();

            this.lvActors.DataSource = await actor.getActors();
            this.lvActors.DataBind();

            this.tboxFirstName.Text = "";
            this.tboxMiddleName.Text = "";
            this.tboxLastName.Text = "";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(SearchData));
        }

        private async Task SearchData()
        {
            MovieStore.Business.Actor actor = new MovieStore.Business.Actor()
            {
                FirstName = tboxFirstName.Text.Trim(),
                MiddleName = tboxMiddleName.Text.Trim(),
                LastName = tboxLastName.Text.Trim()
            };

            this.lvActors.DataSource = await actor.searchActors();
            this.lvActors.DataBind();
        }

        protected void lvActors_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Trim().Equals("editactor"))
            {
                Session.Add("actorId", e.CommandArgument.ToString().Trim());

                Response.Redirect("UpdateActor.aspx");
            }
        }

        protected void lbtnAddActor_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddActor.aspx");
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainMenu.aspx");
        }
    }
}