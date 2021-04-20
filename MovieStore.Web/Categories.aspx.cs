using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class Categories : System.Web.UI.Page
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
                await LoadCategories();
            }
        }

        private async Task LoadCategories()
        {
            MovieStore.Business.Category category = new MovieStore.Business.Category();

            this.lvCategories.DataSource = await category.getRecords();
            this.lvCategories.DataBind();
        }

        protected void lbtnAddCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCategory.aspx");
        }

        protected void lvCategories_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Trim().Equals("editcategory"))
            {
                Session.Add("categoryId", e.CommandArgument.ToString().Trim());

                Response.Redirect("UpdateCategory.aspx");
            }
        }
    }
}