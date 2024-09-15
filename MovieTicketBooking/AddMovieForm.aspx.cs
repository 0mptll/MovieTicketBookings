using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieTicketBooking
{
    public partial class AddMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btn_sbt_add(object sender, EventArgs e)
        {
            if (Page.IsValid) // Ensure the page passed all validations
            {
                if (FileUpload.HasFile && IsImage(FileUpload.PostedFile))
                {
                    string title = tbTitle.Text.Trim();
                    string genre = tbGenre.Text.Trim();
                    string duration = tbDuration.Text.Trim();
                    string date = tbDate.Text.Trim();

                    if (MovieExists(title, genre, date))
                    {
                        lblMessage.Text = "A movie with this title, genre, and release date already exists.";
                        lblMessage.ForeColor = System.Drawing.Color.Red; // Set text color to red
                        return;
                    }

                    try
                    {
                        // Save the file
                        string uploadFolder = Server.MapPath("~/UploadedPhotos/");
                        if (!Directory.Exists(uploadFolder))
                        {
                            Directory.CreateDirectory(uploadFolder);
                        }

                        string fileName = Path.GetFileName(FileUpload.FileName);
                        string filePath = Path.Combine(uploadFolder, fileName);
                        FileUpload.SaveAs(filePath);

                        // Insert new movie record
                        string connectionString = WebConfigurationManager.ConnectionStrings["MovieDbContext"].ConnectionString;
                        string query = "INSERT INTO Movies (Title, Genre, Duration, ReleaseDate, Poster) VALUES (@title, @genre, @duration, @date, @Poster)";

                        using (SqlConnection con = new SqlConnection(connectionString))
                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@title", title);
                            cmd.Parameters.AddWithValue("@genre", genre);
                            cmd.Parameters.AddWithValue("@duration", duration);
                            cmd.Parameters.AddWithValue("@date", date);
                            cmd.Parameters.AddWithValue("@Poster", fileName);

                            con.Open();
                            int res = cmd.ExecuteNonQuery();
                            if (res > 0)
                            {
                                lblMessage.Text = "Movie Added Successfully!";
                                lblMessage.ForeColor = System.Drawing.Color.Green; // Set text color to green
                                ClearFormFields(); // Clear form fields

                                // Redirect to homepage after successful addition
                                Response.Redirect("Homepage.aspx");
                            }
                            else
                            {
                                lblMessage.Text = "Error While Adding Movie.";
                                lblMessage.ForeColor = System.Drawing.Color.Red; // Set text color to red
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red; // Set text color to red
                    }
                }
                else
                {
                    lblMessage.Text = "Please upload a valid image file.";
                    lblMessage.ForeColor = System.Drawing.Color.Red; // Set text color to red
                }
            }
        }

        private bool IsImage(HttpPostedFile postedFile)
        {
            string[] validFileTypes = { "image/jpeg", "image/png", "image/gif", "image/jpg", "image/webp" };
            return Array.Exists(validFileTypes, fileType => fileType == postedFile.ContentType);
        }

        private bool MovieExists(string title, string genre, string releaseDate)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["MovieDbContext"].ConnectionString;
            string query = "SELECT COUNT(*) FROM Movies WHERE Title = @title AND Genre = @genre AND ReleaseDate = @date";

            using (SqlConnection con = new SqlConnection(connectionString))
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@genre", genre);
                cmd.Parameters.AddWithValue("@date", releaseDate);

                con.Open();
                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        private void ClearFormFields()
        {
            tbTitle.Text = "";
            tbGenre.Text = "";
            tbDuration.Text = "";
            tbDate.Text = "";
            FileUpload.Attributes.Clear(); // Clear file upload control
        }
    }
}
