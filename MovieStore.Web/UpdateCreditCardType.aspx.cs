using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class UpdateCreditCardType : System.Web.UI.Page
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
            MovieStore.Business.CreditCardType creditCardType = new MovieStore.Business.CreditCardType
            {
                Id = Convert.ToInt32(Session["creditCardTypeId"].ToString().Trim())
            };

            creditCardType = await creditCardType.getRecord();

            if (creditCardType != null)
            {
                this.tboxCreditCardType.Text = creditCardType.Name;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreditCardTypes.aspx");
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
            MovieStore.Business.CreditCardType creditCardType = new MovieStore.Business.CreditCardType
            {
                Id = Convert.ToInt32(Session["creditCardTypeId"].ToString().Trim()),
                Name = this.tboxCreditCardType.Text.Trim()
            };

            await creditCardType.updateRecord();

            Response.Redirect("CreditCardTypes.aspx", false);
        }
    }
}