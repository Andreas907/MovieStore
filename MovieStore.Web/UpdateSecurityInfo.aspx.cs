using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class UpdateSecurityInfo : System.Web.UI.Page
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
                Business.Member member = new Business.Member
                {
                    Id = Convert.ToInt32(Session["memberId"].ToString().Trim())
                };

                member = await member.getMember();

                if (member != null)
                {
                    this.tboxUsername.Text = member.UserName;
                    this.tboxPassword.Text = member.Password;
                }
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(SaveData));
        }

        private async Task SaveData()
        {
            if (this.Page.IsValid)
            {
                Business.Member member = new Business.Member
                {
                    Id = Convert.ToInt32(Session["memberId"].ToString().Trim()),
                    UserName = this.tboxUsername.Text.Trim(),
                    Password = this.tboxPassword.Text
                };

                await member.updateSecurityInfo();

                Response.Redirect("Members.aspx", false);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Members.aspx");
        }
    }
}