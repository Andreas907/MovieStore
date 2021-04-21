using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class AddCreditCardType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkPermission();
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreditCardTypes.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                this.Page.RegisterAsyncTask(new PageAsyncTask(SaveData));
            }
        }

        private async Task SaveData()
        {
            MovieStore.Business.CreditCardType creditCardType = new MovieStore.Business.CreditCardType
            {
                Name = this.tboxCreditCardType.Text.Trim()
            };

            await creditCardType.addRecord();

            Response.Redirect("CreditCardTypes.aspx", false);
        }
    }
}