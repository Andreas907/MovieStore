using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class UpdatePaymentType : System.Web.UI.Page
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
                MovieStore.Business.PaymentType paymentType = new MovieStore.Business.PaymentType
                {
                    Id = Convert.ToInt32(Session["paymentTypeId"].ToString().Trim())
                };

                paymentType = await paymentType.getRecord();

                if (paymentType != null)
                {
                    this.tboxPaymentType.Text = paymentType.Name;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentTypes.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(SaveData));
        }

        private async Task SaveData()
        {
            if (this.Page.IsValid)
            {
                MovieStore.Business.PaymentType paymentType = new MovieStore.Business.PaymentType
                {
                    Id = Convert.ToInt32(Session["paymentTypeId"].ToString().Trim()),
                    Name = this.tboxPaymentType.Text.Trim()
                };

                await paymentType.updateRecord();

                Response.Redirect("PaymentTypes.aspx", false);
            }
        }
    }
}