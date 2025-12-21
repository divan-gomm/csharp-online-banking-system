<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="BillionBank.WebPages.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlLogout" runat="server" BorderStyle="None" Font-Names="Segoe UI" Font-Size="Large" Height="926px" HorizontalAlign="Center" Width="1491px">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="lblLogoutMessage" runat="server" Text="You have been logged out successfully!"></asp:Label>
                <br />
                <br />
                <br />
                <asp:HyperLink ID="hplLogin" runat="server" NavigateUrl="Login.aspx">Return to Login</asp:HyperLink>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

