using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class Members : System.Web.UI.Page
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
                MovieStore.Business.Role role = new MovieStore.Business.Role();

                this.ddlRoles.DataSource = await role.getRecords();
                this.ddlRoles.DataBind();

                await LoadMembers();
            }
        }

        private async Task LoadMembers()
        {
            this.lvMembers.DataSource = await new MovieStore.Business.Member().getMembers();
            this.lvMembers.DataBind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            this.tboxCity.Text = "";
            this.tboxFirstName.Text = "";
            this.tboxLastName.Text = "";
            this.tboxMiddleName.Text = "";
            this.tboxZipCode.Text = "";
            this.ddlStates.ClearSelection();
            this.ddlRoles.ClearSelection();
            this.rbtnlActive.SelectedValue = "Yes";

            this.Page.RegisterAsyncTask(new PageAsyncTask(LoadMembers));
        }

        private async Task SearchMembers()
        {
            MovieStore.Business.Member member = new MovieStore.Business.Member
            {
                FirstName = this.tboxFirstName.Text.Trim(),
                MiddleName = this.tboxMiddleName.Text.Trim(),
                LastName = this.tboxLastName.Text.Trim(),
                IsActive = this.rbtnlActive.SelectedValue.ToLower().Trim().Equals("yes") ? true : false,
                RoleId = Convert.ToInt32(this.ddlRoles.SelectedValue.Trim()),
                Address = new Business.Address
                {
                    City = this.tboxCity.Text.Trim(),
                    State = this.ddlStates.SelectedValue.Trim(),
                    ZipCode = this.tboxZipCode.Text.Trim()
                }
            };

            this.lvMembers.DataSource = await member.searchMembers();
            this.lvMembers.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(SearchMembers));
        }

        protected void lbtnAddMember_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddMember.aspx");
        }

        protected void lvMembers_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Trim().Equals("updateinfo"))
            {
                Session.Add("memberId", e.CommandArgument.ToString().Trim());

                Response.Redirect("UpdateMember.aspx");
            }
            else if (e.CommandName.ToLower().Trim().Equals("updatephoneinfo"))
            {
                Session.Add("memberId", e.CommandArgument.ToString().Trim());

                Response.Redirect("UpdatePhoneInfo.aspx");
            }
            else if (e.CommandName.ToLower().Trim().Equals("updatesecurityinfo"))
            {
                Session.Add("memberId", e.CommandArgument.ToString().Trim());

                Response.Redirect("UpdateSecurityInfo.aspx");
            }
            else if (e.CommandName.ToLower().Trim().Equals("updateaddressinfo"))
            {
                Session.Add("memberId", e.CommandArgument.ToString().Trim());

                Response.Redirect("UpdateAddressInfo.aspx");
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainMenu.aspx");
        }
    }
}