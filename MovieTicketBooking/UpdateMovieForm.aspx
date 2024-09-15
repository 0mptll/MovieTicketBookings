﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateMovieForm.aspx.cs" Inherits="MovieTicketBooking.UpdateMovieForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="~/Styles/UpdateMovieForm.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblHeading" runat="server" Text="Update Movie"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblSelectMovie" runat="server" Text="Select Movie"></asp:Label>
            <br />
            &nbsp;
            <asp:DropDownList ID="ddlMovies" runat="server">
            </asp:DropDownList>
&nbsp;<asp:Button ID="btnFetch" runat="server" CausesValidation="False" OnClick="btn_clk_fetch" Text="Fetch Details" />
            <br />
            <br />
            <asp:Panel ID="panelDetails" runat="server" Visible="False">
                <asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label>
                &nbsp;<asp:TextBox ID="tbTitle" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblGenre" runat="server" Text="Genre"></asp:Label>
                &nbsp;<asp:TextBox ID="tbGenre" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblDuration" runat="server" Text="Duration"></asp:Label>
                &nbsp;<asp:TextBox ID="tbDuration" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblDate" runat="server" Text="Release Date"></asp:Label>
                &nbsp;<asp:TextBox ID="tbDate" runat="server" TextMode="Date"></asp:TextBox>
                <br />
                <asp:FileUpload ID="FileUpload" runat="server" />
                &nbsp;<asp:Button ID="btn_preview" runat="server" OnClick="btn_clk_preview" Text="Preview" />
                <br />
                <br />
                <asp:Image ID="imgPoster" runat="server" />
                <br />
                <asp:Label ID="lblActive" runat="server" Text="Is Active"></asp:Label>
&nbsp;&nbsp;<asp:RadioButtonList ID="rblActive" runat="server">
                    <asp:ListItem Value="True">Yes</asp:ListItem>
                    <asp:ListItem Value="False">No</asp:ListItem>
                </asp:RadioButtonList>
                &nbsp;<br />
                <asp:Button ID="btnUpdate" runat="server" OnClick="btn_sbm_update" Text="Update" />
            </asp:Panel>
            <br />
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>