<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieSchedule.aspx.cs" Inherits="MovieTicketBooking.Schedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="~/Styles/MovieSchedule.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:GridView ID="gdvMovieSchedule" runat="server" 
                BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" 
                OnRowCommand="btnClick" AutoGenerateColumns="False" DataKeyNames="MovieScheduleId,HouseFull">
                <Columns>
                    <asp:BoundField DataField="MovieScheduleId" HeaderText="Id" SortExpression="MovieScheduleId" />
                    <asp:BoundField DataField="ScreenId" HeaderText="Screen Id" SortExpression="ScreenId" />
                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="StartTime" />
                    <asp:ButtonField AccessibleHeaderText="checkBtn" ButtonType="Button" Text="Check Availability" CommandName="checkAvailability" />
                </Columns>
               <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
                
            </asp:GridView>
            <br />
        </div>
        <asp:Panel ID="PnlBook" runat="server" Visible="False">
            <asp:Label ID="lblAvailability" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnBook" runat="server" OnClick="Btb_Book" Text="Book" />
        </asp:Panel>
    </form>
</body>
</html>
