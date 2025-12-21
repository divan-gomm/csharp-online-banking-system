<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="BillionBank.WebPages.Accounts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            width: 100%;
        }
        .auto-style31 {
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlMenu" runat="server" Font-Names="Segoe UI" Font-Size="Large" Height="97px" HorizontalAlign="Center">
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
            </asp:Panel>
        </asp:Panel>
        <asp:Panel ID="pnlAccounts" runat="server" Font-Names="Segoe UI" Font-Size="Medium" Height="926px" HorizontalAlign="Center" Width="1491px">
            <br />
            <asp:Label ID="lblHeaderAccounts" runat="server" Font-Bold="True" Font-Names="Segoe UI" Font-Size="X-Large" Text="Your Accounts"></asp:Label>
            <br />
            <br />
            <table align="center" class="auto-style30">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:GridView ID="gvAccounts" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" CellPadding="6" CellSpacing="4" Height="160px" HorizontalAlign="Center">
                            <AlternatingRowStyle BackColor="#F2F2F2" />
                            <Columns>
                                <asp:BoundField AccessibleHeaderText="Account" DataField="AccountNumber" HeaderText="Account Number" />
                                <asp:BoundField AccessibleHeaderText="Balance" DataField="CurrentBalance" HeaderText="Current Balance" />
                            </Columns>
                            <HeaderStyle BackColor="#007ACC" ForeColor="White" />
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style31"></td>
                    <td class="auto-style31">
                        <asp:Label ID="lblMessage" runat="server" Text="Message"></asp:Label>
                    </td>
                    <td class="auto-style31"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </asp:Panel>
    </form>
</body>
</html>
