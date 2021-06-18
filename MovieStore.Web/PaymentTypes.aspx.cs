using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class PaymentTypes : System.Web.UI.Page
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
                MovieStore.Business.PaymentType paymentType = new MovieStore.Business.PaymentType();

                this.lvPaymentTypes.DataSource = await paymentType.getRecords();
                this.lvPaymentTypes.DataBind();
            }
        }

        protected void lvPaymentTypes_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Trim().Equals("editpaymenttype"))
            {
                Session.Add("paymentTypeId", e.CommandArgument.ToString().Trim());

                Response.Redirect("UpdatePaymentType.aspx");
            }
        }

        protected void lbtnAddPaymentType_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddPaymentType.aspx");
        }
    }
}