<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdditionalAccounts.aspx.cs" Inherits="BillionBank.Pages.AdditionalAccounts" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1272px;
            height: 385px;
        }
        .auto-style25 {
            width: 634px;
            text-align: left;
            height: 42px;
        }
        .auto-style28 {
            width: 634px;
            text-align: left;
            height: 43px;
        }
        .auto-style29 {
            height: 43px;
        }
        .auto-style30 {
            width: 1281px;
            text-align: left;
            height: 63px;
        }
        .auto-style31 {
            height: 43px;
            width: 213px;
            text-align: center;
        }
        .auto-style35 {
            height: 43px;
            width: 214px;
            text-align: center;
        }
        .auto-style40 {
            width: 309px;
            text-align: center;
            height: 42px;
        }
        .auto-style41 {
            width: 309px;
            text-align: center;
            height: 43px;
        }
        .auto-style42 {
            width: 623px;
            text-align: right;
            height: 42px;
        }
        .auto-style43 {
            width: 623px;
            text-align: right;
            height: 43px;
        }
        .auto-style44 {
            margin-top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlMenu0" runat="server" Font-Names="Segoe UI" Font-Size="Large" Height="61px" HorizontalAlign="Center">
                <table class="auto-style30">
                    <tr>
                        <td class="auto-style31">
                            <asp:HyperLink ID="hplAccounts0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="Accounts.aspx">Accounts</asp:HyperLink>
                        </td>
                        <td class="auto-style31">
                            <asp:HyperLink ID="hplAccountDetails0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="AccountDetails.aspx">Account Details</asp:HyperLink>
                        </td>
                        <td class="auto-style31">
                            <asp:HyperLink ID="hplTransfer0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="Transfer.aspx">Transfer Money</asp:HyperLink>
                        </td>
                        <td class="auto-style31">
                            <asp:HyperLink ID="hplAdditionalAccounts0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="AdditionalAccounts.aspx">Additional Accounts</asp:HyperLink>
                        </td>
                        <td class="auto-style31">
                            <asp:HyperLink ID="hplEditProfile0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="EditProfile.aspx">Edit Profile</asp:HyperLink>
                        </td>
                        <td class="auto-style35">
                            <asp:HyperLink ID="hplLogout0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="Logout.aspx">Logout</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <asp:Panel ID="pnlAdditionalAcc" runat="server" BorderStyle="None" Font-Names="Segoe UI" Font-Size="Medium" Height="869px" HorizontalAlign="Center" CssClass="auto-style44" Width="1491px">
                <table align="center" cellpadding="6" cellspacing="4" class="auto-style1">
                    <tr>
                        <td class="auto-style42">&nbsp;</td>
                        <td class="auto-style40">&nbsp;</td>
                        <td class="auto-style25">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style42">&nbsp;</td>
                        <td class="auto-style40">
                            <asp:Label ID="lblCreateAcc" runat="server" Font-Bold="True" Text="Create Account" Font-Names="Segoe UI" Font-Size="X-Large"></asp:Label>
                        </td>
                        <td class="auto-style25">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style43">
                            <asp:Label ID="lblInitialDeposit" runat="server" Text="Initial Deposit"></asp:Label>
                        </td>
                        <td class="auto-style41">&nbsp; 
                            <asp:TextBox ID="tbDeposit" runat="server" ValidationGroup="CreateAccount" Width="210px"></asp:TextBox>
                        </td>
                        <td class="auto-style28">
                            <asp:RequiredFieldValidator ID="rfvDeposit" runat="server" ControlToValidate="tbDeposit" ErrorMessage="Please enter an amount!" ForeColor="Red" ValidationGroup="CreateAccount"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style29" colspan="3">
                            <asp:Button ID="btnApply" runat="server" BackColor="#6699FF" ForeColor="White" OnClick="btnApply_Click" Text="CREATE ACCOUNT" ValidationGroup="CreateAccount" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style29" colspan="3">
                            <asp:Label ID="lblMessage" runat="server" Text="Message"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style29" colspan="3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style29" colspan="3">&nbsp;<asp:Label ID="lblDeleteAccount" runat="server" Font-Bold="True" Text="Delete Account" Font-Names="Segoe UI" Font-Size="X-Large"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style29" colspan="3">
                            <asp:DropDownList ID="ddlDeleteAccount" runat="server" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlDeleteAccount_SelectedIndexChanged" ValidationGroup="DeleteAccount">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style29" colspan="3">
                            <asp:Button ID="btnConfirmDelete" runat="server" BackColor="#6699FF" ForeColor="White" Text=" CONFIRM DELETE" ValidationGroup="DeleteAccount" OnClick="btnConfirmDelete_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style29" colspan="3">
                            <asp:Label ID="lblMessageDeleteAcc" runat="server" Text="Message"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style29" colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style29" colspan="3">
                            <asp:HyperLink ID="hplBackToAcc" runat="server" NavigateUrl="Accounts.aspx">Back to Accounts</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

