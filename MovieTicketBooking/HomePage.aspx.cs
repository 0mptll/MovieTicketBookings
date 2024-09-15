using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieTicketBooking
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblWelcome.Text = "Welcome, ";
                LoadMovies();
                CheckAdminRole();
            }
        }

        private void LoadMovies()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["MovieDbContext"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Movies WHERE IsActive = 1", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                StringBuilder movieList = new StringBuilder();

                while (reader.Read())
                {
                    string movieId = reader["MovieId"].ToString();
                    string title = reader["Title"].ToString();
                    string poster = reader["Poster"].ToString();
                    string posterUrl = ResolveUrl("~/UploadedPhotos/" + poster);

                    movieList.Append("<div class='movie-item'>");
                    movieList.Append($"<img src='{posterUrl}' alt='{title}' style='width: 100%; height: 200px; object-fit: cover; border-radius: 8px;' />");
                    movieList.Append("<div style='display: flex; flex-direction: column; justify-content: flex-end; height: 100%; padding: 10px;'>");
                    movieList.Append($"<input type='radio' id='movie_{movieId}' name='rblMovies' value='{movieId}' style='margin-bottom: 10px; accent-color: #3498db;' />");
                    movieList.Append($"<input type='hidden' id='title_{movieId}' name='title_{movieId}' value='{title}' />");
                    movieList.Append($"<span style='display: block; font-size: 25px; font-weight: 600; color: #34495e; text-align: center;'>{title}</span>");
                    movieList.Append("</div>");
                    movieList.Append("</div>");

                }

                ltlMovieList.Text = movieList.ToString();
            }
        }

        private void CheckAdminRole()
        {
            string role = Session["Role"] as string;
            pnlAdmin.Visible = (role?.Trim() == "admin");
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            string selectedMovieId = Request.Form["rblMovies"];
            if (!string.IsNullOrEmpty(selectedMovieId))
            {
                string selectedMovieTitle = Request.Form[$"title_{selectedMovieId}"];
                Session["MovieId"] = selectedMovieId;
                Session["MovieName"] = selectedMovieTitle;
                Response.Redirect("MovieSchedule.aspx");
            }
            else
            {
                // Consider adding a label to display this message
                // lblMessage.Text = "Please select a movie.";
            }
        }

        protected void btn_clk_LogOut(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("LoginPage.aspx");
        }

    }
}