<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMovieForm.aspx.cs" Inherits="MovieTicketBooking.AddMovie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Movie</title>
    <link rel="stylesheet" type="text/css" href="~/Styles/AddMovieForm.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Validation Summary to display all validation errors -->
            <asp:ValidationSummary ID="vsAddMovieErrors" runat="server" ShowMessageBox="false" ShowSummary="true" HeaderText="Please fix the following errors:" ForeColor="Red" />

            <!-- Movie Heading -->
            <asp:Label ID="lblHeading" runat="server" Text="Add Movie"></asp:Label>
            <br />
            
            <!-- Movie Title -->
            <asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label>
            &nbsp;
            <asp:TextBox ID="tbTitle" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="tbTitle" ErrorMessage="Title is required" Display="Dynamic" ForeColor="Red" />
            <br />
            
            <!-- Genre -->
            <asp:Label ID="lblGenre" runat="server" Text="Genre"></asp:Label>
            &nbsp;
            <asp:TextBox ID="tbGenre" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvGenre" runat="server" ControlToValidate="tbGenre" ErrorMessage="Genre is required" Display="Dynamic" ForeColor="Red" />
            <br />
            
            <!-- Duration -->
            <asp:Label ID="lblDuration" runat="server" Text="Duration (in minutes)"></asp:Label>
            &nbsp;
            <asp:TextBox ID="tbDuration" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDuration" runat="server" ControlToValidate="tbDuration" ErrorMessage="Duration is required" Display="Dynamic" ForeColor="Red" />
            <asp:RangeValidator ID="rvDuration" runat="server" ControlToValidate="tbDuration" MinimumValue="1" MaximumValue="600" Type="Integer" ErrorMessage="Duration must be between 1 and 600 minutes" Display="Dynamic" ForeColor="Red" />
            <br />
            
            <!-- Release Date -->
            <asp:Label ID="lblDate" runat="server" Text="Release Date"></asp:Label>
            &nbsp;
            <asp:TextBox ID="tbDate" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="tbDate" ErrorMessage="Release Date is required" Display="Dynamic" ForeColor="Red" />
            <asp:RegularExpressionValidator ID="revDate" runat="server" ControlToValidate="tbDate" ValidationExpression="\d{4}-\d{2}-\d{2}" ErrorMessage="Date must be in YYYY-MM-DD format" Display="Dynamic" ForeColor="Red" />
            <br />
            
            <!-- Poster Upload -->
            <asp:Label ID="lblPoster" runat="server" Text="Poster"></asp:Label>
            <asp:FileUpload ID="FileUpload" runat="server" />
            <asp:RequiredFieldValidator ID="rfvFileUpload" runat="server" ControlToValidate="FileUpload" InitialValue="" ErrorMessage="Please upload a poster image" Display="Dynamic" ForeColor="Red" />
            <br />
            
            <!-- Add Movie Button -->
            <asp:Button ID="btnAdd" runat="server" Text="Add Movie" OnClick="btn_sbt_add" />
            <br />
            
            <!-- Message Label for Success/Failure -->
            <asp:Label ID="lblMessage" runat="server" Text="" Visible="False" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
