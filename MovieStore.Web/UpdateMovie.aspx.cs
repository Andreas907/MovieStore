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
    public partial class UpdateMovie : System.Web.UI.Page
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
                MovieStore.Business.Actor actor = new MovieStore.Business.Actor();

                this.cboxlActors.DataSource = await actor.getActors();
                this.cboxlActors.DataBind();

                MovieStore.Business.Movie movie = new MovieStore.Business.Movie
                {
                    Id = Convert.ToInt32(Session["movieId"].ToString().Trim())
                };

                movie = await movie.getMovie();

                if (movie != null)
                {
                    this.tboxDescription.Text = movie.Description;
                    this.tboxNumberOfCopies.Text = movie.NumberOfCopies.ToString();
                    this.tboxReleaseYear.Text = movie.ReleaseYear.ToString();
                    this.tboxTitle.Text = movie.Title;
                    this.ddlRating.SelectedValue = movie.Rating;
                    this.imgCover.AlternateText = movie.Title;
                    if (movie.Cover != null)
                    {
                        this.imgCover.ImageUrl = "data:image;base64," + Convert.ToBase64String(movie.Cover);
                    }

                    if (movie.Actors != null && movie.Actors.Count > 0)
                    {
                        foreach (ListItem item in this.cboxlActors.Items)
                        {
                            if (item != null)
                            {
                                foreach (var subItem in movie.Actors)
                                {
                                    if (Convert.ToInt32(item.Value.Trim()) == subItem.Id)
                                    {
                                        item.Selected = true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
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
                MovieStore.Business.Movie movie = new MovieStore.Business.Movie()
                {
                    Cover = this.fupCover.HasFile ? convertStremToByteArray(this.fupCover.PostedFile.InputStream) : null,
                    Title = this.tboxTitle.Text.Trim(),
                    Description = this.tboxDescription.Text.Trim(),
                    NumberOfCopies = Convert.ToInt32(this.tboxNumberOfCopies.Text.Trim()),
                    ReleaseYear = Convert.ToInt32(this.tboxReleaseYear.Text.Trim()),
                    Rating = this.ddlRating.SelectedValue.Trim(),
                    Actors = new List<Business.Actor>()
                };

                foreach (ListItem item in this.cboxlActors.Items)
                {
                    if (item != null)
                    {
                        if (item.Selected == true)
                        {
                            Business.Actor actor = new Business.Actor { Id = Convert.ToInt32(item.Value.Trim()) };
                            movie.Actors.Add(actor);
                        }
                    }
                }

                await movie.updateMovie();

                Response.Redirect("Movies.aspx", false);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movies.aspx");
        }

        protected void cvCover_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (this.fupCover.HasFile)
            {
                int imageMinimumLength = 512;
                int imageMaximumLength = 2000000;

                if (!this.fupCover.PostedFile.InputStream.CanRead)
                {
                    args.IsValid = false;
                }
                else
                {
                    if (this.fupCover.PostedFile.ContentLength < imageMinimumLength)
                    {
                        args.IsValid = false;
                        this.cvCover.ErrorMessage = "Image is too small.";
                    }
                    else
                    {
                        if (this.fupCover.PostedFile.ContentLength > imageMaximumLength)
                        {
                            args.IsValid = false;
                            this.cvCover.ErrorMessage = "Image is too big.";
                        }
                        else
                        {
                            if (!string.Equals(this.fupCover.PostedFile.ContentType, "image/jpg",
                                                StringComparison.OrdinalIgnoreCase) &&
                                        !string.Equals(this.fupCover.PostedFile.ContentType, "image/jpeg",
                                        StringComparison.OrdinalIgnoreCase) &&
                                        !string.Equals(this.fupCover.PostedFile.ContentType, "image/pjpeg",
                                                StringComparison.OrdinalIgnoreCase) &&
                                                !string.Equals(this.fupCover.PostedFile.ContentType, "image/gif",
                                                StringComparison.OrdinalIgnoreCase) &&
                                                !string.Equals(this.fupCover.PostedFile.ContentType, "image/x-png",
                                                StringComparison.OrdinalIgnoreCase) &&
                                                !string.Equals(this.fupCover.PostedFile.ContentType, "image/png",
                                                StringComparison.OrdinalIgnoreCase))
                            {
                                args.IsValid = false;
                                this.cvCover.ErrorMessage = "Invalid image type.";
                            }
                            else
                            {
                                string fileExtension = Path.GetExtension(this.fupCover.PostedFile.FileName);

                                if (!string.Equals(fileExtension, ".jpg", StringComparison.OrdinalIgnoreCase) &&
                                    !string.Equals(fileExtension, ".png", StringComparison.OrdinalIgnoreCase) &&
                                    !string.Equals(fileExtension, ".gif", StringComparison.OrdinalIgnoreCase) &&
                                    !string.Equals(fileExtension, ".jpeg", StringComparison.OrdinalIgnoreCase))
                                {
                                    args.IsValid = false;
                                    this.cvCover.ErrorMessage = "Invalid image type.";
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void cvActors_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;

            foreach (ListItem item in this.cboxlActors.Items)
            {
                if (item != null)
                {
                    if (item.Selected == true)
                    {
                        args.IsValid = true;
                        break;
                    }
                }
            }
        }
    }
}