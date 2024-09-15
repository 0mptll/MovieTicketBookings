using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace MovieTicketBooking
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_clk_sbm(object sender, EventArgs e)
        {
            // Perform validation check on the server side
            if (Page.IsValid)
            {
                string Email = tbEmail.Text;
                string Name = tbName.Text;
                String Password = tbPassword.Text;
                String Role;

                // Determine the role
                if (rbAdmin.Checked)
                {
                    Role = "admin";
                }
                else
                {
                    Role = "user";
                }

                // Connection to the database
                string connectionString = WebConfigurationManager.ConnectionStrings["MovieDBContext"].ConnectionString;
                SqlConnection connection = new SqlConnection(connectionString);
                SqlCommand command = new SqlCommand();
                command.Connection = connection;

                // Check if the email already exists in the database
                string SelectQuery = @"SELECT * FROM USERS WHERE Email=@Email";
                command.CommandText = SelectQuery;
                command.Parameters.AddWithValue("@Email", Email);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                // If the email is not found, insert the new user
                if (!reader.Read())
                {
                    connection.Close();
                    string insertQuery = @"INSERT INTO USERS (Name,Email,Password,Role) VALUES (@Name,@Email,@Password,@Role)";
                    command.CommandText = insertQuery;
                    command.Parameters.AddWithValue("@Name", Name);
                    command.Parameters.AddWithValue("@Password", Password);
                    command.Parameters.AddWithValue("@Role", Role);
                    connection.Open();
                    int res = command.ExecuteNonQuery();
                    if (res == 0)
                    {
                        lblMessage.Text = "Unable to create new user.";
                    }
                    else
                    {
                        lblMessage.Text = "New user created successfully.";
                    }
                    connection.Close();
                }
                else
                {
                    lblMessage.Text = "A user with the same email already exists.";
                }
            }
        }
    }
}
