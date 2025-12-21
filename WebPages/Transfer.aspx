<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transfer.aspx.cs" Inherits="BillionBank.WebPages.Transfer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1105px;
            height: 230px;
        }
        .auto-style14 {
            height: 38px;
        }
        .auto-style15 {
            height: 39px;
        }
        .auto-style17 {
            height: 38px;
            text-align: left;
            width: 398px;
        }
        .auto-style24 {
            width: 232px;
            height: 38px;
        }
        .auto-style25 {
            width: 424px;
            height: 38px;
            text-align: right;
        }
        .auto-style26 {
            width: 398px;
            height: 38px;
        }
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
            <br />
            <asp:Panel ID="pnlTransfer" runat="server" BorderStyle="None" Font-Names="Segoe UI" Font-Size="Medium" Height="926px" HorizontalAlign="Center" Width="1491px">
                <br />
                <br />
                <br />
                <asp:Label ID="lblHeadingTransfer" runat="server" BorderStyle="None" Font-Bold="True" Font-Names="Segoe UI" Font-Size="X-Large" Text="Transfer Money"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <table align="center" cellpadding="6" cellspacing="4" class="auto-style1">
                    <tr>
                        <td class="auto-style25">
                            <asp:Label ID="lblSourceAccount" runat="server" Text="Source Account"></asp:Label>
                        </td>
                        <td class="auto-style24">
                            <asp:DropDownList ID="ddlFromAccount" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style26"></td>
                    </tr>
                    <tr>
                        <td class="auto-style25">
                            <asp:Label ID="lblDestinationAccount" runat="server" Text="Destination Account"></asp:Label>
                        </td>
                        <td class="auto-style24">
                            <asp:DropDownList ID="ddlToAccount" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style26">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style25">
                            <asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label>
                        </td>
                        <td class="auto-style24">
                            <asp:TextBox ID="tbAmount" runat="server" Width="210px"></asp:TextBox>
                        </td>
                        <td class="auto-style17">
                            <asp:RequiredFieldValidator ID="rfvAmount" runat="server" ControlToValidate="tbAmount" ErrorMessage="Please enter an amount!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style14" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style14" colspan="3">
                            <asp:Button ID="btnTransfer" runat="server" BackColor="#6699FF" ForeColor="White" Text="TRANSFER" OnClick="btnTransfer_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style15" colspan="3">
                            <asp:Label ID="lblMessage" runat="server" Text="Message"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style15" colspan="3">
                            <asp:HyperLink ID="hplBackToAccounts" runat="server" NavigateUrl="Accounts.aspx">Back to Accounts</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>