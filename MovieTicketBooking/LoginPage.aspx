<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="MovieTicketBooking.LoginPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="~/Styles/LoginPage.css" />
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblHeading" runat="server" Text="Login Page"></asp:Label>
            <br />
            <br />

            <!-- Validation Summary to display all error messages -->
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                HeaderText="Please fix the following errors:" 
                DisplayMode="BulletList" 
                ForeColor="Red" />

            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            &nbsp;<asp:TextBox ID="tbEmail" runat="server" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                ControlToValidate="tbEmail" ErrorMessage="Please enter your email."></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                ControlToValidate="tbEmail" 
                ErrorMessage="Please enter a valid email address." 
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"></asp:RegularExpressionValidator>
            <br />

            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            &nbsp;<asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="tbPassword" ErrorMessage="Please enter your password."></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revPassword" runat="server" 
                ControlToValidate="tbPassword" 
                ErrorMessage="Password must be at least 6 characters long." 
                ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator>
            <br />

            <asp:Button ID="btnSignup" runat="server" Text="Login" OnClick="btn_clk_sbm" />
            <br />
            <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="SignUpPage.aspx">New User? Register here</asp:HyperLink>
            <br />
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
