<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketBooking.aspx.cs" Inherits="MovieTicketBooking.MovieTicketBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Booking</title>
    <link rel="stylesheet" type="text/css" href="~/Styles/TicketBooking.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Validation Summary to display all validation errors -->
            <asp:ValidationSummary ID="vsBookingErrors" runat="server" ShowMessageBox="false" ShowSummary="true" HeaderText="Please fix the following errors:" ForeColor="Red" />

            <!-- Ticket Booking Heading -->
            <asp:Label ID="lblHeading" runat="server" Text="Ticket Booking Form"></asp:Label>
            <br />
            
            <!-- Seats Input -->
            <asp:Label ID="lbSeats" runat="server" Text="No of Seats"></asp:Label>
            &nbsp;
            <asp:TextBox ID="tbSeats" runat="server"></asp:TextBox>
            
            <!-- RequiredFieldValidator to ensure seats input is provided -->
            <asp:RequiredFieldValidator ID="rfvSeats" runat="server" ControlToValidate="tbSeats" ErrorMessage="Please enter the number of seats" Display="Dynamic" ForeColor="Red" />

            <!-- RangeValidator to ensure seats are within the available range -->
            <asp:RangeValidator ID="rvSeats" runat="server" ControlToValidate="tbSeats" MinimumValue="1" MaximumValue="100" Type="Integer" ErrorMessage="Seats must be between 1 and the available number" Display="Dynamic" ForeColor="Red" />
            <br />
            
            <!-- Book Button -->
            <asp:Button ID="btnBook" runat="server" Text="Book" OnClick="btn_sbm_book" />
            <br />
            
            <!-- Message Label for Success/Failure -->
            <asp:Label ID="lblMessage" runat="server" Text="" Visible="False" ForeColor="Green"></asp:Label>
            
        </div>
    </form>
</body>
</html>
