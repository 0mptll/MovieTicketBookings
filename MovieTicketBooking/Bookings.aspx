<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bookings.aspx.cs" Inherits="MovieTicketBooking.Bookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="~/Styles/Bookings.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblHeading" runat="server" Text="Bookings:"></asp:Label>
            <asp:GridView ID="gdvBookings" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="btn_clk" OnRowDataBound="gdvBookings_RowDataBound">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    
                    <asp:ButtonField AccessibleHeaderText="btn_modify" ButtonType="Button" CommandName="modify" Text="Modify" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Panel ID="panelModify" runat="server" Visible="False">
                <asp:Label ID="lblTxt" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="lblScreen" runat="server" Text="Screen"></asp:Label>
                &nbsp;<asp:DropDownList ID="ddlScreen" runat="server">
                </asp:DropDownList>
                <br />
                <asp:Label ID="lblTime" runat="server" Text="Start Time"></asp:Label>
                &nbsp;<asp:TextBox ID="tbTime" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblStaus" runat="server" Text="Status"></asp:Label>
                &nbsp;<asp:RadioButtonList ID="rblStatus" runat="server">
                    <asp:ListItem>Modified</asp:ListItem>
                    <asp:ListItem>Cancelled</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="rblStatus" ErrorMessage="Please Select Status"></asp:RequiredFieldValidator>
                <br />
                <asp:Button ID="btnUpdate" runat="server" OnClick="btn_clk_update" Text="Update" />
            </asp:Panel>
            <br />
        </div>
    </form>
</body>
</html>
