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
    public partial class UpdateMember : System.Web.UI.Page
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
                Business.Member member = new Business.Member
                {
                    Id = Convert.ToInt32(Session["memberId"].ToString().Trim())
                };

                member = await member.getMember();

                if (member != null)
                {
                    this.tboxFirstName.Text = member.FirstName;
                    this.tboxMiddleName.Text = member.MiddleName;
                    this.tboxLastName.Text = member.LastName;
                    this.imgProfilePicture.AlternateText = member.FirstName + (string.IsNullOrEmpty(member.MiddleName) ? " " : " " + member.MiddleName + " ") + member.LastName;
                    if (member.ProfilePicture != null)
                    {
                        this.imgProfilePicture.ImageUrl = "data:image;base64," + Convert.ToBase64String(member.ProfilePicture);
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

        private async Task SaveData()
        {
            if (this.Page.IsValid)
            {
                Business.Member member = new Business.Member
                {
                    Id = Convert.ToInt32(Session["memberId"].ToString().Trim()),
                    FirstName = this.tboxFirstName.Text.Trim(),
                    MiddleName = this.tboxMiddleName.Text.Trim(),
                    LastName = this.tboxLastName.Text.Trim(),
                    ProfilePicture = this.fupProfilePicture.HasFile ? convertStremToByteArray(this.fupProfilePicture.PostedFile.InputStream) : null
                };

                await member.updatePerson();

                Response.Redirect("Members.aspx", false);
            }
        }

        private byte[] convertStremToByteArray(Stream inputStream)
        {
            using (MemoryStream memoryStream = new MemoryStream())
            {
                inputStream.CopyTo(memoryStream);
                return memoryStream.ToArray();
            }
        }

        protected void cvProfilePicture_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (this.fupProfilePicture.HasFile)
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
        }
    }
}