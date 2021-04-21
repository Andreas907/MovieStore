using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class UpdateCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                checkPermission();
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
            MovieStore.Business.Category category = new MovieStore.Business.Category
            {
                Id = Convert.ToInt32(Session["categoryId"].ToString().Trim())
            };

            category = await category.getRecord();

            if (category != null)
            {
                this.tboxCategoryName.Text = category.Name;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categories.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                this.Page.RegisterAsyncTask(new PageAsyncTask(SaveData));
            }
        }

        private async Task SaveData()
        {
            MovieStore.Business.Category category = new MovieStore.Business.Category
            {
                Id = Convert.ToInt32(Session["categoryId"].ToString().Trim()),
                Name = this.tboxCategoryName.Text.Trim()
            };

            await category.updateRecord();

            Response.Redirect("Categories.aspx", false);
        }
    }
}