using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieStore.Web
{
    public partial class AddMember : System.Web.UI.Page
    {
        protected override void OnPreRender(EventArgs e)
        {
            this.tboxPassword.Attributes.Add("value", this.tboxPassword.Text);
            base.OnPreRender(e);
        }

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

                this.ddlRoles.Items.Insert(0, new ListItem("", ""));

                MovieStore.Business.PhoneType phoneType = new MovieStore.Business.PhoneType();

                this.ddlPhoneTypes.DataSource = await phoneType.getRecords();
                this.ddlPhoneTypes.DataBind();

                this.ddlPhoneTypes.Items.Insert(0, new ListItem("", ""));
            }
        }

        protected void cvProfilePicture_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int imageMinimumLength = 512;
            int imageMaximumLength = 2000000;

            if (!this.fupProfilePicture.PostedFile.InputStream.CanRead)
            {
                args.IsValid = false;
            }
            else
            {
                if (this.fupProfilePicture.PostedFile.ContentLength < imageMinimumLength)
                {
                    args.IsValid = false;
                    this.cvProfilePicture.ErrorMessage = "Image is too small.";
                }
                else
                {
                    if (this.fupProfilePicture.PostedFile.ContentLength > imageMaximumLength)
                    {
                        args.IsValid = false;
                        this.cvProfilePicture.ErrorMessage = "Image is too big.";
                    }
                    else
                    {
                        if (!string.Equals(this.fupProfilePicture.PostedFile.ContentType, "image/jpg",
                                            StringComparison.OrdinalIgnoreCase) &&
                                    !string.Equals(this.fupProfilePicture.PostedFile.ContentType, "image/jpeg",
                                    StringComparison.OrdinalIgnoreCase) &&
                                    !string.Equals(this.fupProfilePicture.PostedFile.ContentType, "image/pjpeg",
                                            StringComparison.OrdinalIgnoreCase) &&
                                            !string.Equals(this.fupProfilePicture.PostedFile.ContentType, "image/gif",
                                            StringComparison.OrdinalIgnoreCase) &&
                                            !string.Equals(this.fupProfilePicture.PostedFile.ContentType, "image/x-png",
                                            StringComparison.OrdinalIgnoreCase) &&
                                            !string.Equals(this.fupProfilePicture.PostedFile.ContentType, "image/png",
                                            StringComparison.OrdinalIgnoreCase))
                        {
                            args.IsValid = false;
                            this.cvProfilePicture.ErrorMessage = "Invalid image type.";
                        }
                        else
                        {
                            string fileExtension = Path.GetExtension(this.fupProfilePicture.PostedFile.FileName);

                            if (!string.Equals(fileExtension, ".jpg", StringComparison.OrdinalIgnoreCase) &&
                                !string.Equals(fileExtension, ".png", StringComparison.OrdinalIgnoreCase) &&
                                !string.Equals(fileExtension, ".gif", StringComparison.OrdinalIgnoreCase) &&
                                !string.Equals(fileExtension, ".jpeg", StringComparison.OrdinalIgnoreCase))
                            {
                                args.IsValid = false;
                                this.cvProfilePicture.ErrorMessage = "Invalid image type.";
                            }
                        }
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Members.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.Page.RegisterAsyncTask(new PageAsyncTask(SaveData));
        }

        private byte[] convertStremToByteArray(Stream inputStream)
        {
            using (MemoryStream memoryStream = new MemoryStream())
            {
                inputStream.CopyTo(memoryStream);
                return memoryStream.ToArray();
            }
        }

        private async Task SaveData()
        {
            if (this.Page.IsValid)
            {
                MovieStore.Business.Member member = new MovieStore.Business.Member
                {
                    FirstName = this.tboxFirstName.Text.Trim(),
                    MiddleName = this.tboxMiddleName.Text.Trim(),
                    LastName = this.tboxLastName.Text.Trim(),
                    UserName = this.tboxUsername.Text.Trim(),
                    Password = this.tboxPassword.Text,
                    IsActive = true,
                    RoleId = Convert.ToInt32(this.ddlRoles.SelectedValue.Trim()),
                    ProfilePicture = convertStremToByteArray(this.fupProfilePicture.PostedFile.InputStream),
                    Address = new Business.Address
                    {
                        AddressLine1 = this.tboxAddress1.Text.Trim(),
                        AddressLine2 = this.tboxAddress2.Text.Trim(),
                        City = this.tboxCity.Text.Trim(),
                        IsPrimary = true,
                        ZipCode = this.tboxZipCode.Text.Trim(),
                        State = this.ddlStates.SelectedValue.Trim()
                    },
                    Phones = new List<Business.Phone>
                    {
                        new Business.Phone
                        {
                             PhoneNumber = this.tboxPhoneNumber.Text.Trim(),
                             PhoneTypeId = Convert.ToInt32(this.ddlPhoneTypes.SelectedValue.Trim())
                        }
                    }
                };

                await member.addPerson();

                Response.Redirect("Members.aspx", false);
            }
        }
    }
} 