<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BillionBank.WebPages.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1280px;
        }
        .auto-style2 {
            height: 38px;
            text-align: left;
            width: 426px;
        }
        .auto-style4 {
            height: 38px;
            width: 211px;
            text-align: left;
        }
        .auto-style5 {
            height: 38px;
            width: 450px;
            text-align: right;
        }
        .auto-style7 {
            height: 37px;
            width: 450px;
            text-align: right;
        }
        .auto-style8 {
            height: 37px;
            width: 211px;
            text-align: left;
        }
        .auto-style9 {
            height: 37px;
            text-align: left;
            width: 426px;
        }
        .auto-style17 {
            text-align: left;
            width: 426px;
        }
        .auto-style18 {
            width: 450px;
            text-align: right;
            height: 54px;
        }
        .auto-style19 {
            width: 211px;
            text-align: left;
            height: 54px;
        }
        .auto-style20 {
            text-align: left;
            width: 426px;
            height: 54px;
        }
        .auto-style24 {
            width: 211px;
            text-align: left;
        }
        .auto-style25 {
            width: 450px;
            text-align: right;
        }
        .auto-style26 {
            height: 37px;
            width: 211px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlRegister" runat="server" BorderStyle="None" Height="926px" HorizontalAlign="Center" Font-Bold="False" Font-Names="Segoe UI" Font-Size="Medium" BackColor="White" Width="1491px">
            <table align="center" cellpadding="6" cellspacing="4" class="auto-style1" id="tblRegister">
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style26">
                        <asp:Label ID="lblHeaderRegister" runat="server" Font-Bold="True" Font-Names="Segoe UI" Font-Size="X-Large" Text="Register Here"></asp:Label>
                    </td>
                    <td class="auto-style9">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="lblFullName" runat="server" Text="Full Name"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="txbFullName" runat="server" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style9">
                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txbFullName" ErrorMessage="Name is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style18">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td class="auto-style19">
                        <asp:TextBox ID="txbEmail" runat="server" Width="210px" Height="22px"></asp:TextBox>
                    </td>
                    <td class="auto-style20">
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txbEmail" ErrorMessage="Email is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="regexEmail" runat="server" ControlToValidate="txbEmail" ErrorMessage="Invalid Email!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txbPassword" runat="server" TextMode="Password" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txbPassword" ErrorMessage="Password is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txbConfirmPassword" runat="server" TextMode="Password" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style17">
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txbConfirmPassword" ErrorMessage="Confirm password required!" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CompareValidator ID="cvConfirmPassword" runat="server" ControlToCompare="txbPassword" ControlToValidate="txbConfirmPassword" ErrorMessage="Passwords do not match!" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblID" runat="server" Text="ID Number"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txbID" runat="server" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="rfvIDNumber" runat="server" ControlToValidate="txbID" ErrorMessage="ID number is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txbAddress" runat="server" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style17">
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txbAddress" ErrorMessage="Address is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:Label ID="lblContactNum" runat="server" Text="Contact Number"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txbContactNumber" runat="server" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style17">
                        <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server" ControlToValidate="txbContactNumber" ErrorMessage="Contact number is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:Label ID="lblSecurityQuestion" runat="server" Text="Security Question"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txbSecurityQuestion" runat="server" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style17">
                        <asp:RequiredFieldValidator ID="rfvSecurityQuestion" runat="server" ControlToValidate="txbSecurityQuestion" ErrorMessage="Security question is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style25">
                        <asp:Label ID="lblSecurityAnswer" runat="server" Text="Security Answer"></asp:Label>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="txbSecurityAnswer" runat="server" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style17">
                        <asp:RequiredFieldValidator ID="rfvSecurityAnswer" runat="server" ControlToValidate="txbSecurityAnswer" ErrorMessage="Security answer is required!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="btnRegister" runat="server" Text="REGISTER" BackColor="#6699FF" ForeColor="White" OnClick="btnRegister_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="lblMessage" runat="server" Text="Message"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:HyperLink ID="hplAlreadyHaveAccount" runat="server" NavigateUrl="Login.aspx">Already have an account ? Log in here.</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

