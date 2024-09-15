<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="MovieTicketBooking.Schedule1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Schedule</title>
    <link rel="stylesheet" type="text/css" href="~/Styles/Schedule.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblSchedule" runat="server" Text="Schedule:"></asp:Label>
            <br />
            <asp:GridView ID="gdvSchedule" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" OnRowDeleting="gdvSchedule_RowDeleting" OnRowEditing="gdvSchedule_RowEditing"  OnRowCancelingEdit="gdvSchedule_RowCancelingEdit" OnRowUpdating="gdvSchedule_RowUpdating" AutoGenerateColumns="false" DataKeyNames="MovieScheduleId,ScreenId">
                <Columns>
                    <asp:TemplateField HeaderText="Actions" Visible="false">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" />
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="MovieScheduleID" HeaderText="Schedule ID" ReadOnly="True" Visible="false"/>
                    <asp:BoundField DataField="Title" HeaderText="Movie Title" ReadOnly="True" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" ReadOnly="True" />
                    <asp:BoundField DataField="ScreenId" HeaderText="Screen Id" ReadOnly="true" Visible="false" />
                    <asp:BoundField DataField="ScreenName" HeaderText="Screen Name" ReadOnly="True" />
                    <asp:BoundField DataField="Capacity" HeaderText="Capacity" ReadOnly="True" />
                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                    <asp:BoundField DataField="BookedSeats" HeaderText="Booked Seats" ReadOnly="True" />
                    <asp:CheckBoxField DataField="HouseFull" HeaderText="House Full" ReadOnly="True"/>
                </Columns>    

                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
            <br />
            <asp:HyperLink ID="hlAddSchedule" runat="server" NavigateUrl="AddSchedule.aspx" Visible="False">Add Schedule</asp:HyperLink>
            <br />
            <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>
