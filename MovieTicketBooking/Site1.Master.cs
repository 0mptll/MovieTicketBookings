using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieTicketBooking
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_clk_LogOut(object sender, EventArgs e)
        {
            // Handle logout logic here
            // For example, clear the session and redirect to the login page
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}