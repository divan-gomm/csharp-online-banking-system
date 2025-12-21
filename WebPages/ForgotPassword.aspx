<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="BillionBank.WebPages.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1105px;
            height: 233px;
        }
        .auto-style17 {
            height: 46px;
        }
        .auto-style19 {
            width: 500px;
            height: 45px;
            text-align: left;
        }
        .auto-style28 {
            width: 220px;
            height: 45px;
        }
        .auto-style29 {
            width: 220px;
            height: 45px;
            text-align: left;
        }
        .auto-style30 {
            width: 220px;
            height: 46px;
            text-align: left;
        }
        .auto-style34 {
            width: 144px;
            height: 45px;
            text-align: left;
        }
        .auto-style38 {
            height: 46px;
            width: 500px;
        }
        .auto-style39 {
            width: 500px;
            height: 45px;
        }
        .auto-style40 {
            width: 500px;
            height: 46px;
            text-align: left;
        }
        .auto-style41 {
            width: 144px;
            height: 45px;
        }
        .auto-style42 {
            width: 144px;
            height: 46px;
            text-align: left;
        }
        .auto-style43 {
            height: 45px;
            width: 478px;
            text-align: right;
        }
        .auto-style44 {
            height: 46px;
            width: 478px;
            text-align: right;
        }
        .auto-style49 {
            height: 45px;
            width: 530px;
            text-align: right;
        }
        .auto-style50 {
            height: 46px;
            width: 530px;
            text-align: right;
        }
        .auto-style51 {
            height: 46px;
            width: 530px;
        }
        .auto-style52 {
            height: 48px;
            width: 530px;
            text-align: right;
        }
        .auto-style53 {
            height: 48px;
            width: 478px;
            text-align: right;
        }
        .auto-style54 {
            width: 220px;
            height: 48px;
        }
        .auto-style55 {
            width: 144px;
            height: 48px;
        }
        .auto-style56 {
            width: 500px;
            height: 48px;
        }
        .auto-style57 {
            width: 144px;
            height: 46px;
            text-align: center;
        }
        .auto-style58 {
            width: 220px;
            height: 46px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlForgetPassword" runat="server" BackColor="White" BorderStyle="None" Font-Names="Segoe UI" Font-Size="Medium" Height="926px" HorizontalAlign="Center" Width="1491px">
            <table align="center" cellpadding="6" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style49">&nbsp;</td>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style28">&nbsp;</td>
                    <td class="auto-style41">&nbsp;</td>
                    <td class="auto-style39">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style49">&nbsp;</td>
                    <td class="auto-style43">&nbsp;</td>
                    <td class="auto-style28">
                        <asp:Label ID="lblHeaderForgotPassword" runat="server" Font-Bold="True" Font-Names="Segoe UI" Font-Size="X-Large" Text="Forgot Password"></asp:Label>
                    </td>
                    <td class="auto-style41">&nbsp;</td>
                    <td class="auto-style39">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style52"></td>
                    <td class="auto-style53"></td>
                    <td class="auto-style54"></td>
                    <td class="auto-style55"></td>
                    <td class="auto-style56"></td>
                </tr>
                <tr>
                    <td class="auto-style49">
                        &nbsp;</td>
                    <td class="auto-style43">
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td class="auto-style29">
                        <asp:TextBox ID="tbEmail" runat="server" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style34">
                        <asp:RegularExpressionValidator ID="regexEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Invalid email!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style19">
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Please enter an email address!" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style50">
                        &nbsp;</td>
                    <td class="auto-style44">
                        <asp:Label ID="lblSecurityQuestion" runat="server" Text="Security Question"></asp:Label>
                    </td>
                    <td class="auto-style30">
                        <asp:Label ID="lblQuestion" runat="server" Text="Security question"></asp:Label>
                    </td>
                    <td class="auto-style42">
                        <asp:Button ID="btnFindQuestion" runat="server" BackColor="#6699FF" ForeColor="White" OnClick="btnFindQuestion_Click" Text="Find Question" ValidationGroup="Question" />
                    </td>
                    <td class="auto-style40">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style50">
                        &nbsp;</td>
                    <td class="auto-style44">
                        <asp:Label ID="lblSecurityAnswer" runat="server" Text="Answer"></asp:Label>
                    </td>
                    <td class="auto-style30">
                        <asp:TextBox ID="tbAnswer" runat="server" Width="210px" ValidationGroup="Answer"></asp:TextBox>
                    </td>
                    <td class="auto-style57">
                        <asp:Button ID="btnVerifyQuestion" runat="server" BackColor="#6699FF" ForeColor="White" OnClick="btnVerifyQuestion_Click" Text="Verify" ValidationGroup="Answer" />
                    </td>
                    <td class="auto-style40">
                        <asp:RequiredFieldValidator ID="rfvAnswer" runat="server" ControlToValidate="tbAnswer" ErrorMessage="Please enter an answer!" ForeColor="Red" ValidationGroup="Answer"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style50">&nbsp;</td>
                    <td class="auto-style44">&nbsp;</td>
                    <td class="auto-style30">&nbsp;</td>
                    <td class="auto-style42">&nbsp;</td>
                    <td class="auto-style40">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style50">&nbsp;</td>
                    <td class="auto-style44">
                        <asp:Label ID="lblNewPassword" runat="server" Text="Enter New Password"></asp:Label>
                    </td>
                    <td class="auto-style30">
                        <asp:TextBox ID="tbNewPassword" runat="server" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style42">&nbsp;</td>
                    <td class="auto-style40">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style50">&nbsp;</td>
                    <td aria-checked="undefined" class="auto-style44">
                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm New Password"></asp:Label>
                    </td>
                    <td class="auto-style30">
                        <asp:TextBox ID="tbConfirmPassword" runat="server" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style42">&nbsp;</td>
                    <td class="auto-style40">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style50">&nbsp;</td>
                    <td class="auto-style44">&nbsp;</td>
                    <td class="auto-style58">
                        <asp:Button ID="btnResetPassword" runat="server" BackColor="#6699FF" ForeColor="White" OnClick="btnResetPassword_Click" Text="RESET PASSWORD" />
                    </td>
                    <td class="auto-style42">&nbsp;</td>
                    <td class="auto-style40">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style51">
                        &nbsp;</td>
                    <td class="auto-style17" colspan="3">
                        <asp:Label ID="lblMessage" runat="server" Text="Message"></asp:Label>
                    </td>
                    <td class="auto-style38"></td>
                </tr>
                <tr>
                    <td class="auto-style51">
                    </td>
                    <td class="auto-style17" colspan="3">&nbsp;</td>
                    <td class="auto-style38"></td>
                </tr>
                <tr>
                    <td class="auto-style51">
                        &nbsp;</td>
                    <td class="auto-style17" colspan="3">
                        <asp:HyperLink ID="hplReturnToLogin" runat="server" NavigateUrl="Login.aspx">Return to Login Page</asp:HyperLink>
                    </td>
                    <td class="auto-style38">&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>