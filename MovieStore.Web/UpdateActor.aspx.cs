using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class UpdateActor : System.Web.UI.Page
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
                if (Session["roleName"].ToString().Trim().Equals("user", StringComparison.CurrentCultureIgnoreCase))
                {
                    Response.Redirect("MainMenu.aspx", false);
                }
            }
        }

        private async Task LoadData()
        {
            if (!this.Page.IsPostBack)
            {
                MovieStore.Business.Actor actor = new MovieStore.Business.Actor()
                {
                    Id = Convert.ToInt32(Session["actorId"].ToString().Trim())
                };

                actor = await actor.getActor();

                if (actor != null)
                {
                    this.tboxFirstName.Text = actor.FirstName;
                    this.tboxMiddleName.Text = actor.MiddleName;
                    this.tboxLastName.Text = actor.LastName;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Actors.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(SaveData));
        }

        private async Task SaveData()
        {
            if (this.Page.IsValid)
            {
                MovieStore.Business.Actor actor = new MovieStore.Business.Actor()
                {
                    Id = Convert.ToInt32(Session["actorId"].ToString().Trim()),
                    FirstName = this.tboxFirstName.Text.Trim(),
                    MiddleName = this.tboxMiddleName.Text.Trim(),
                    LastName = this.tboxLastName.Text.Trim()
                };

                await actor.updatePerson();

                Response.Redirect("Actors.aspx", false);
            }
        }
    }
}