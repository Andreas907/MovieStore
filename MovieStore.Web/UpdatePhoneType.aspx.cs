using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class UpdatePhoneType : System.Web.UI.Page
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
                MovieStore.Business.PhoneType phoneType = new MovieStore.Business.PhoneType
                {
                    Id = Convert.ToInt32(Session["phoneTypeId"].ToString().Trim())
                };

                phoneType = await phoneType.getRecord();

                if (phoneType != null)
                {
                    this.tboxPhoneType.Text = phoneType.Name;
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(SaveData));
        }

        private async Task SaveData()
        {
            if (this.Page.IsValid)
            {
                MovieStore.Business.PhoneType phoneType = new MovieStore.Business.PhoneType
                {
                    Id = Convert.ToInt32(Session["phoneTypeId"].ToString().Trim()),
                    Name = this.tboxPhoneType.Text.Trim()
                };

                await phoneType.updateRecord();

                Response.Redirect("PhoneTypes.aspx", false);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("PhoneTypes.aspx");
        }
    }
}