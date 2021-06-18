using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                FormsAuthentication.RedirectFromLoginPage(this.tboxUsername.Text.Trim(), false);
            }
        }

        protected void cvLogin_ServerValidate(object source, ServerValidateEventArgs args)
        {
            MovieStore.Business.Member member = new MovieStore.Business.Member
            {
                UserName = this.tboxUsername.Text.Trim(),
                Password = this.tboxPassword.Text
            };

            member = member.authenticate();

            if (member == null || member.Id <= 0)
            {
                args.IsValid = false;
            }
            else
            {
                Session.Add("memberId", member.Id);
                Session.Add("roleName", member.RoleName);
            }
        }
    }
}