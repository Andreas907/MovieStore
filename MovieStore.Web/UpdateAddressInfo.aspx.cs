using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class UpdateAddressInfo : System.Web.UI.Page
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
            MovieStore.Business.Member member = new MovieStore.Business.Member
            {
                Id = Convert.ToInt32(Session["memberId"].ToString().Trim())
            };

            this.lvAddresses.DataSource = await member.getAddresses();
            this.lvAddresses.DataBind();
        }

        protected void lbtnAddAddress_Click(object sender, EventArgs e)
        {
            this.pnlAddEditAddress.Visible = true;

            this.tboxAddress1.Focus();

            Session.Add("action", "add");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            this.pnlAddEditAddress.Visible = false;
        }

        private void ClearData()
        {
            this.tboxAddress1.Text = "";
            this.tboxAddress2.Text = "";
            this.tboxCity.Text = "";
            this.tboxZipCode.Text = "";
            this.ddlStates.ClearSelection();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(SaveData));

            this.Page.RegisterAsyncTask(new PageAsyncTask(LoadData));
        }

        private async Task SaveData()
        {
            if (this.Page.IsValid)
            {
                if (Session["action"] != null && !string.IsNullOrEmpty(Session["action"].ToString().Trim()))
                {
                    string action = Session["action"].ToString().Trim();

                    MovieStore.Business.Member member = new MovieStore.Business.Member
                    {
                        Id = Convert.ToInt32(Session["memberId"].ToString().Trim()),
                        Address = new Business.Address
                        {
                            AddressLine1 = this.tboxAddress1.Text.Trim(),
                            AddressLine2 = this.tboxAddress2.Text.Trim(),
                            City = this.tboxCity.Text.Trim(),
                            State = this.ddlStates.SelectedValue.Trim(),
                            ZipCode = this.tboxZipCode.Text.Trim()
                        }
                    };

                    if (action.Equals("add", StringComparison.OrdinalIgnoreCase))
                    {
                        await member.addAddress();

                        this.pnlAddEditAddress.Visible = false;

                        ClearData();
                    }
                    else if (action.Equals("edit", StringComparison.OrdinalIgnoreCase))
                    {
                        member.Address.Id = Convert.ToInt32(Session["addressId"].ToString().Trim());

                        await member.updateAddress();

                        this.pnlAddEditAddress.Visible = false;

                        ClearData();
                    }
                }
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Members.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(DeleteData));
        }

        private async Task DeleteData()
        {
            MovieStore.Business.Member member = new MovieStore.Business.Member
            {
                Id = Convert.ToInt32(Session["memberId"].ToString().Trim()),
                Address = new Business.Address
                {
                    Id = Convert.ToInt32(Session["addressId"].ToString().Trim())
                }
            };

            await member.deleteAddress();
            await LoadData();

            ScriptManager.RegisterStartupScript(this.upnlDeleteModal, this.upnlDeleteModal.GetType(), "hide",
                "$(function () { $('#" + this.pnlDeleteModal.ClientID + "').modal('hide'); });", true);

            this.upnlDeleteModal.Update();
        }

        protected void lvAddresses_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Trim().Equals("editaddress"))
            {
                this.pnlAddEditAddress.Visible = true;

                this.tboxAddress1.Focus();

                Session.Add("addressId", e.CommandArgument.ToString().Trim());

                Session.Add("action", "edit");

                this.Page.RegisterAsyncTask(new PageAsyncTask(LoadAddress));
            }
            else if (e.CommandName.ToLower().Trim().Equals("deleteaddress"))
            {
                Session.Add("addressId", e.CommandArgument.ToString().Trim());
                ScriptManager.RegisterStartupScript(this.upnlDeleteModal, this.upnlDeleteModal.GetType(), "show",
                    "$(function () { $('#" + this.pnlDeleteModal.ClientID + "').modal('show'); });", true);

                this.upnlDeleteModal.Update();
            }
            else if (e.CommandName.ToLower().Trim().Equals("setasprimaryaddress"))
            {
                Session.Add("addressId", e.CommandArgument.ToString().Trim());

                this.Page.RegisterAsyncTask(new PageAsyncTask(SetAddressAsPrimary));

                this.Page.RegisterAsyncTask(new PageAsyncTask(LoadData));
            }
        }

        private async Task LoadAddress()
        {
            MovieStore.Business.Member member = new MovieStore.Business.Member
            {
                Address = new Business.Address
                {
                    Id = Convert.ToInt32(Session["addressId"].ToString().Trim())
                }
            };

            Business.Address address = await member.getAddress();

            if (address != null)
            {
                this.tboxAddress1.Text = address.AddressLine1;
                this.tboxAddress2.Text = address.AddressLine2;
                this.tboxCity.Text = address.City;
                this.tboxZipCode.Text = address.ZipCode;
                this.ddlStates.SelectedValue = address.State;
            }
        }

        private async Task SetAddressAsPrimary()
        {
            MovieStore.Business.Member member = new MovieStore.Business.Member
            {
                Id = Convert.ToInt32(Session["memberId"].ToString().Trim()),
                Address = new Business.Address
                {
                    Id = Convert.ToInt32(Session["addressId"].ToString().Trim())
                }
            };

            await member.setAddressAsPrimary();
        }
    }
}