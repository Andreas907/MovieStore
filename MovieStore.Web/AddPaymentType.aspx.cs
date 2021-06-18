using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class AddPaymentType : System.Web.UI.Page
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
            Response.Redirect("PaymentTypes.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(SaveData));
        }

        private async Task SaveData()
        {
            if (this.Page.IsValid)
            {
                MovieStore.Business.PaymentType paymentType = new MovieStore.Business.PaymentType
                {
                    Name = this.tboxPaymentType.Text.Trim()
                };

                await paymentType.addRecord();

                Response.Redirect("PaymentTypes.aspx", false);
            }
        }
    }
}