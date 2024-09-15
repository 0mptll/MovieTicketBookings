<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSchedule.aspx.cs" Inherits="MovieTicketBooking.AddSchedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Correcting the path to the stylesheet -->
<link rel="stylesheet" type="text/css" href="<%= ResolveUrl("~/Styles/AddSchedule.css") %>" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblHeading" runat="server" Text="Add Schedule"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblMovie" runat="server" Text="Movie"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlMovies" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="lblScreen" runat="server" Text="Screen"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlScreens" runat="server">
            </asp:DropDownList>
            <br />
            <br />  
            <asp:Label ID="lblTime" runat="server" Text="Start Time"></asp:Label>
&nbsp;<asp:TextBox ID="tbTime" runat="server"></asp:TextBox>
            <br />
&nbsp;<asp:Button ID="btnAdd" runat="server" OnClick="btn_clk_add" Text="Add" />
            <br />
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
