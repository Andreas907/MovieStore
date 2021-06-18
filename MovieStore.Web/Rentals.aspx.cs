using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class Rentals : System.Web.UI.Page
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
    }
}