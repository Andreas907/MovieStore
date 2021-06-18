using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class UpdatePhoneInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkPermission();

            if (!this.Page.IsPostBack)
            {
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
            MovieStore.Business.PhoneType phoneType = new MovieStore.Business.PhoneType();

            this.ddlPhoneTypes.DataSource = await phoneType.getRecords();
            this.ddlPhoneTypes.DataBind();

            this.ddlPhoneTypes.Items.Insert(0, new ListItem("", ""));

            MovieStore.Business.Member member = new MovieStore.Business.Member
            {
                Id = Convert.ToInt32(Session["memberId"].ToString().Trim())
            };

            this.lvPhones.DataSource = await member.getPhones();
            this.lvPhones.DataBind();
        }

        protected void lvPhones_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Trim().Equals("editphone"))
            {
                this.pnlAddEditPhone.Visible = true;

                this.ddlPhoneTypes.Focus();

                Session.Add("phoneId", e.CommandArgument.ToString().Trim());

                Session.Add("action", "edit");

                this.Page.RegisterAsyncTask(new PageAsyncTask(LoadPhone));
            }
            else if (e.CommandName.ToLower().Trim().Equals("deletephone"))
            {
                Session.Add("phoneId", e.CommandArgument.ToString().Trim());

                ScriptManager.RegisterStartupScript(this.upnlDeleteModal, this.upnlDeleteModal.GetType(), "show",
                    "$(function () { $('#" + this.pnlDeleteModal.ClientID + "').modal('show'); });", true);

                this.upnlDeleteModal.Update();
            }
        }

        private async Task LoadPhone()
        {
            MovieStore.Business.Member member = new MovieStore.Business.Member
            {
                Phone = new Business.Phone
                {
                    Id = Convert.ToInt32(Session["phoneId"].ToString().Trim())
                }
            };

            Business.Phone phone = await member.getPhone();

            if (phone != null)
            {
                this.tboxPhoneNumber.Text = phone.PhoneNumber;
                this.ddlPhoneTypes.SelectedValue = phone.PhoneTypeId.ToString();
            }
        }

        protected void lbtnAddPhone_Click(object sender, EventArgs e)
        {
            this.pnlAddEditPhone.Visible = true;

            this.ddlPhoneTypes.Focus();

            Session.Add("action", "add");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            this.pnlAddEditPhone.Visible = false;
        }

        private void ClearData()
        {
            this.tboxPhoneNumber.Text = "";
            this.ddlPhoneTypes.ClearSelection();
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
                        Phone = new Business.Phone
                        {
                            PhoneNumber = this.tboxPhoneNumber.Text.Trim(),
                            PhoneTypeId = Convert.ToInt32(this.ddlPhoneTypes.SelectedValue.Trim())
                        }
                    };

                    if (action.Equals("add", StringComparison.OrdinalIgnoreCase))
                    {
                        await member.addPhone();

                        this.pnlAddEditPhone.Visible = false;

                        ClearData();
                    }
                    else if (action.Equals("edit", StringComparison.OrdinalIgnoreCase))
                    {
                        member.Phone.Id = Convert.ToInt32(Session["phoneId"].ToString().Trim());

                        await member.updatePhone();

                        this.pnlAddEditPhone.Visible = false;

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
                Phone = new Business.Phone
                {
                    Id = Convert.ToInt32(Session["phoneId"].ToString().Trim())
                }
            };

            await member.deletePhone();
            await LoadData();

            ScriptManager.RegisterStartupScript(this.upnlDeleteModal, this.upnlDeleteModal.GetType(), "hide",
              "$(function () { $('#" + this.pnlDeleteModal.ClientID + "').modal('hide'); });", true);

            this.upnlDeleteModal.Update();
        }
    }
}