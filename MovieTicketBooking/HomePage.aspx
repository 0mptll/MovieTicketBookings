<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="MovieTicketBooking.HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link rel="stylesheet" type="text/css" href="~/Styles/HomePage.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- For typing effect -->
</head>
<body>
    <form id="form1" runat="server">
        <div id="page-container">
          <nav class="navbar">
            <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="HomePage.aspx" CssClass="navbar-title">MovieTicketBooking</asp:HyperLink>
            <ul class="nav-list">
                <li><asp:HyperLink ID="hlSchedule" runat="server" NavigateUrl="Schedule.aspx" CssClass="nav-link">View Schedule</asp:HyperLink></li>
                <li><asp:HyperLink ID="hlBookings" runat="server" NavigateUrl="Bookings.aspx" CssClass="nav-link">Booking Records</asp:HyperLink></li>

                <!-- Admin panel for adding/updating movies, visible only for admins -->
                <asp:Panel ID="pnlAdmin" runat="server" Visible="False">
                    <li><asp:HyperLink ID="hlAddMovie" runat="server" NavigateUrl="AddMovieForm.aspx" CssClass="nav-link">Add Movie</asp:HyperLink></li>
                    <li><asp:HyperLink ID="hlUpdateMovie" runat="server" NavigateUrl="UpdateMovieForm.aspx" CssClass="nav-link">Update Movie</asp:HyperLink></li>
                </asp:Panel>

                <!-- Logout Button -->
                <li><asp:Button ID="btnLogOut" runat="server" CausesValidation="False" OnClick="btn_clk_LogOut" Text="Logout" CssClass="nav-button" /></li>
            </ul>
        </nav>



            <!-- Validation Summary for displaying errors -->
            <asp:ValidationSummary ID="vsMovieSelectionSummary" runat="server" ShowMessageBox="false" ShowSummary="true" HeaderText="Please fix the following errors:" ForeColor="Red" CssClass="validation-summary" />

            <!-- Welcome message with typing effect -->
            <div class="welcome-container">
                <asp:Label ID="lblWelcome" runat="server" Text="Welcome, " CssClass="welcome-label"></asp:Label>
                <span id="typing-name" class="typing-container"></span>
            </div>
            <br />

            <!-- Movies Section -->

            <div class="heading-container">
                <span id="lblHeading" class="section-heading">Movies</span>
            </div>

            <!-- Movie list rendered dynamically from server-side -->
            <div class="movie-list">
                <asp:Literal ID="ltlMovieList" runat="server"></asp:Literal>
            </div>

            <!-- Explore button -->
            <div class="explore-container">
                <asp:Button ID="btnView" runat="server" OnClick="btnView_Click" Text="Explore" CssClass="button explore-button" />
            </div>
        </div>

       <script type="text/javascript">
           $(document).ready(function () {
               var name = '<%= Session["UserName"] %>'; // Fetch username from the server
        var typingSpeed = 100; // Speed of typing effect
        var deletingSpeed = 50; // Speed of deleting effect
        var delayBetweenLoops = 2000; // Delay between typing loops
        var index = 0; // Current index of the name
        var isDeleting = false; // Flag to check if we are deleting

        function type() {
            if (index < name.length && !isDeleting) {
                $('#typing-name').append(name.charAt(index));
                index++;
                setTimeout(type, typingSpeed);
            } else if (index === name.length && !isDeleting) {
                isDeleting = true;
                setTimeout(type, delayBetweenLoops); // Delay before deleting
            } else if (index > 0 && isDeleting) {
                $('#typing-name').text(name.substring(0, index - 1));
                index--;
                setTimeout(type, deletingSpeed);
            } else if (index === 0 && isDeleting) {
                isDeleting = false;
                setTimeout(type, typingSpeed); // Start typing again
            }
        }

        type();
    });
       </script>

    </form>
</body>
</html>
