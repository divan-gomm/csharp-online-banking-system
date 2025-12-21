<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="BillionBank.WebPages.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1280px;
            height: 522px;
        }
        .auto-style2 {
            height: 28px;
        }
        .auto-style5 {
            width: 638px;
        }
        .auto-style6 {
            width: 638px;
            text-align: left;
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
        .auto-style30 {
            width: 228px;
        }
        .auto-style33 {
            width: 648px;
        }
        .auto-style34 {
            width: 648px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlMenu" runat="server" Font-Names="Segoe UI" Font-Size="Large" Height="53px" HorizontalAlign="Center">
                <asp:Panel ID="pnlMenu1" runat="server" Font-Names="Segoe UI" Font-Size="Large" Height="53px" HorizontalAlign="Center">
                    <table class="auto-style27">
                        <tr>
                            <td class="auto-style28">
                                <asp:HyperLink ID="hplAccounts0" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="Accounts.aspx">Accounts</asp:HyperLink>
                            </td>
                            <td class="auto-style29">
                                <asp:HyperLink ID="hplAccountDetails1" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="AccountDetails.aspx">Account Details</asp:HyperLink>
                            </td>
                            <td class="auto-style29">
                                <asp:HyperLink ID="hplTransfer1" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="Transfer.aspx">Transfer Money</asp:HyperLink>
                            </td>
                            <td class="auto-style29">
                                <asp:HyperLink ID="hplAdditionalAccounts1" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="AdditionalAccounts.aspx">Additional Accounts</asp:HyperLink>
                            </td>
                            <td class="auto-style29">
                                <asp:HyperLink ID="hplEditProfile1" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="EditProfile.aspx">Edit Profile</asp:HyperLink>
                            </td>
                            <td class="auto-style29">
                                <asp:HyperLink ID="hplLogout1" runat="server" Font-Bold="True" Font-Overline="False" Font-Underline="False" ForeColor="Black" NavigateUrl="Logout.aspx">Logout</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </asp:Panel>
            <br />
            <br />
            <asp:Panel ID="pnlEditProfile" runat="server" BorderStyle="None" Font-Names="Segoe UI" Height="821px" HorizontalAlign="Center" Width="1491px">
                <table align="center" cellpadding="6" cellspacing="4" class="auto-style1">
                    <tr>
                        <td class="auto-style33">&nbsp;</td>
                        <td class="auto-style30">
                            <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Edit Profile" Font-Names="Segoe UI"></asp:Label>
                        </td>
                        <td class="auto-style5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style33">&nbsp;</td>
                        <td class="auto-style30">&nbsp;</td>
                        <td class="auto-style5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style34">
                            <asp:Label ID="lblFullName" runat="server" Text="Full Name"></asp:Label>
                        </td>
                        <td class="auto-style30">
                            <asp:TextBox ID="tbName" runat="server" Width="210px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="tbName" ErrorMessage="Please enter a name!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style34">
                            <asp:Label ID="lblID" runat="server" Text="ID Number"></asp:Label>
                        </td>
                        <td class="auto-style30">
                            <asp:TextBox ID="tbID" runat="server" Width="210px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">
                            <asp:RequiredFieldValidator ID="rfvID" runat="server" ControlToValidate="tbID" ErrorMessage="Please enter a ID number!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style34">
                            <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                        </td>
                        <td class="auto-style30">
                            <asp:TextBox ID="tbAddress" runat="server" Width="210px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="tbAddress" ErrorMessage="Please enter an Address!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style34">
                            <asp:Label ID="lblContact" runat="server" Text="Contact Number"></asp:Label>
                        </td>
                        <td class="auto-style30">
                            <asp:TextBox ID="tbContact" runat="server" Width="210px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbContact" ErrorMessage="Please enter a contact number!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style34">
                            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td class="auto-style30">
                            <asp:TextBox ID="tbEmail" runat="server" Width="210px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbEmail" ErrorMessage="Please enter an email!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style34">
                            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                        </td>
                        <td class="auto-style30">
                            <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Width="210px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbPassword" ErrorMessage="Please enter a password!" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style34">
                            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                        </td>
                        <td class="auto-style30">
                            <asp:TextBox ID="tbConfirmPassword" runat="server" TextMode="Password" Width="210px"></asp:TextBox>
                        </td>
                        <td class="auto-style6">
                            <asp:CompareValidator ID="comparevalidatePassword" runat="server" ControlToCompare="tbPassword" ControlToValidate="tbConfirmPassword" ErrorMessage="Passwords do not match!" ForeColor="Red"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Button ID="btnConfirm" runat="server" BackColor="#6699FF" ForeColor="White" Text="CONFIRM" OnClick="btnConfirm_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="3">
                            <asp:Label ID="lblMessage" runat="server" Text="Message"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:HyperLink ID="hplBackToAccounts" runat="server" NavigateUrl="Accounts.aspx">Back to Accounts</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

