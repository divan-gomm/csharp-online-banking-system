<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccountDetails.aspx.cs" Inherits="BillionBank.Pages.AccountDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Details</title>
    <style type="text/css">

        .auto-style27 {
            width: 1307px;
            height: 51px;
        }
        .auto-style28 {
            height: 29px;
            width: 183px;
        }
        .auto-style29 {
            height: 29px;
            width: 184px;
        }
        .auto-style30 {
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <asp:Panel ID="pnlMenu0" runat="server" Font-Names="Segoe UI" Font-Size="Large" Height="53px" HorizontalAlign="Center">
                <table class="auto-style27">
                    <tr>
                        <td class="auto-style28">
                            <asp:HyperLink ID="hplAccounts0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="Accounts.aspx">Accounts</asp:HyperLink>
                        </td>
                        <td class="auto-style29">
                            <asp:HyperLink ID="hplAccountDetails0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="AccountDetails.aspx">Account Details</asp:HyperLink>
                        </td>
                        <td class="auto-style29">
                            <asp:HyperLink ID="hplTransfer0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="Transfer.aspx">Transfer Money</asp:HyperLink>
                        </td>
                        <td class="auto-style29">
                            <asp:HyperLink ID="hplAdditionalAccounts0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="AdditionalAccounts.aspx">Additional Accounts</asp:HyperLink>
                        </td>
                        <td class="auto-style29">
                            <asp:HyperLink ID="hplEditProfile0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="EditProfile.aspx">Edit Profile</asp:HyperLink>
                        </td>
                        <td class="auto-style29">
                            <asp:HyperLink ID="hplLogout0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="Logout.aspx">Logout</asp:HyperLink>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                .</asp:Panel>
        <asp:Panel ID="pnlAccountDetails" runat="server" Font-Names="Segoe UI" Font-Size="Medium" Width="1491px" HorizontalAlign="Center" Padding="20px" CssClass="auto-style30" Height="926px">
            
            <br />
            
            <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Welcome" Font-Names="Segoe UI"></asp:Label>
            <br />
            <br />
            <br />
            <br />

            <asp:Label ID="lblMessagetoView" runat="server" Font-Bold="True" Text="Your Accounts" Font-Size="X-Large"></asp:Label>
            <br /><br />

            <asp:GridView ID="gvAccounts" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" CellPadding="6" CellSpacing="4" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="#F2F2F2" />
                <Columns>
                    <asp:BoundField DataField="AccountNumber" HeaderText="Account Number" />
                    <asp:BoundField DataField="CurrentBalance" DataFormatString="{0:C}" HeaderText="Balance" HtmlEncode="False" />
                </Columns>
                <HeaderStyle BackColor="#007ACC" ForeColor="White" />
            </asp:GridView>
            <br />
            <br />
            <br />

            <asp:Label ID="lblTransactions" runat="server" Font-Bold="True" Text="Recent Transactions" Font-Size="X-Large"></asp:Label>
            <br /><br />

            <asp:GridView ID="gvTransactions" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" CellPadding="6" CellSpacing="4" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="TransactionID" HeaderText="ID" />
                    <asp:BoundField DataField="SourceAccountID" HeaderText="From Account" />
                    <asp:BoundField DataField="DestinationAccountID" HeaderText="To Account" />
                    <asp:BoundField DataField="Amount" DataFormatString="{0:C}" HeaderText="Amount" />
                    <asp:BoundField DataField="DateCreated" DataFormatString="{0:G}" HeaderText="Date" />
                </Columns>
                <HeaderStyle BackColor="#007ACC" ForeColor="White" />
            </asp:GridView>
            <br />
            <asp:Label ID="lblTransactionMessage" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <br />

            <asp:HyperLink ID="hplBackToAccounts" runat="server" NavigateUrl="Accounts.aspx">Back to Accounts</asp:HyperLink>

        </asp:Panel>
    </form>
</body>
</html>
