using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class CreditCardTypes : System.Web.UI.Page
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
                await LoadCreditCardTypes();
            }
        }

        private async Task LoadCreditCardTypes()
        {
            MovieStore.Business.CreditCardType creditCardType = new MovieStore.Business.CreditCardType();

            this.lvCreditCardTypes.DataSource = await creditCardType.getRecords();
            this.lvCreditCardTypes.DataBind();
        }

        protected void lvCreditCardTypes_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Trim().Equals("editcreditcardtype"))
            {
                Session.Add("creditCardTypeId", e.CommandArgument.ToString().Trim());

                Response.Redirect("UpdateCreditCardType.aspx");
            }
        }

        protected void lbtnAddCreditCardType_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCreditCardType.aspx");
        }
    }
}