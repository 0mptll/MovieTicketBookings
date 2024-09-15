<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpPage.aspx.cs" Inherits="MovieTicketBooking.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp Page</title>
    <link rel="stylesheet" type="text/css" href="~/Styles/LoginPage.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ValidationSummary ID="vsSignUpSummary" runat="server" ShowMessageBox="false" ShowSummary="true" HeaderText="Please fix the following errors:" ForeColor="Red" />

            <asp:Label ID="lblHeading" runat="server" Text="SignUp Page"></asp:Label>
            <br />

            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            &nbsp;<asp:TextBox ID="tbEmail" runat="server" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Please enter your email." Display="Dynamic" ForeColor="Red" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Please enter a valid email address." ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" Display="Dynamic" ForeColor="Red" />
            <br />

            <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
            &nbsp;<asp:TextBox ID="tbName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="tbName" ErrorMessage="Please enter your name." Display="Dynamic" ForeColor="Red" />
            <br />

            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            &nbsp;<asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="tbPassword" ErrorMessage="Please enter a password." Display="Dynamic" ForeColor="Red" />
            <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="tbPassword" ErrorMessage="Password must be at least 6 characters long." ValidationExpression=".{6,}" Display="Dynamic" ForeColor="Red" />
            <br />

            <asp:Label ID="lblRole" runat="server" Text="Role"></asp:Label>
            &nbsp;<asp:RadioButton ID="rbAdmin" runat="server" GroupName="Role" Text="Admin" />
            <asp:RadioButton ID="rbUser" runat="server" Checked="True" GroupName="Role" Text="User" />
            <br />

            <asp:Button ID="btnSignup" runat="server" Text="Register" OnClick="btn_clk_sbm" />
            <br />

            <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="LoginPage.aspx">Already registered? Want to login?</asp:HyperLink>
            <br />

            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
