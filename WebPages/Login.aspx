<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BillionBank.WebPages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1558px;
        }
        .auto-style11 {
            width: 389px;
            height: 38px;
        }
        .auto-style12 {
            width: 388px;
            height: 38px;
        }
        .auto-style13 {
            text-align: left;
            width: 389px;
            height: 38px;
        }
        .auto-style15 {
            text-align: left;
            width: 389px;
        }
        .auto-style16 {
            text-align: right;
        }
        .auto-style19 {
            text-align: right;
            width: 393px;
        }
        .auto-style20 {
            width: 388px;
        }
        .auto-style21 {
            width: 389px;
        }
        .auto-style24 {
            height: 38px;
        }
        .auto-style25 {
            width: 393px;
            height: 38px;
        }
        .auto-style26 {
            text-align: right;
            width: 393px;
            height: 38px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlLogin" runat="server" Height="926px" HorizontalAlign="Center" BorderStyle="None" Font-Bold="False" Font-Names="Segoe UI" Font-Size="Medium" BackColor="White" Width="1491px">
            <table id="tblLogin" align="center" aria-orientation="horizontal" cellpadding="6" cellspacing="4" class="auto-style1">
                <tr>
                    <td class="auto-style12">
                        &nbsp;</td>
                    <td class="auto-style24" colspan="2">
                        <asp:Label ID="lblHeader" runat="server" BorderStyle="None" Font-Bold="True" Font-Italic="False" Font-Names="Segoe UI" Font-Size="XX-Large" Text="WELCOME TO BILLION BANK!" Width="805px"></asp:Label>
                    </td>
                    <td class="auto-style11">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style25">&nbsp;</td>
                    <td class="auto-style13">&nbsp;</td>
                    <td class="auto-style11">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style24" colspan="2">&nbsp;</td>
                    <td class="auto-style11">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style12">&nbsp;</td>
                    <td class="auto-style24" colspan="2">
                        <asp:Label ID="lblLoginHere" runat="server" Font-Bold="True" Font-Names="Segoe UI" Font-Size="X-Large" Text="Login"></asp:Label>
                    </td>
                    <td class="auto-style11">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style12"></td>
                    <td class="auto-style26">
                        <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label>
                    </td>
                    <td class="auto-style13">
                        <asp:TextBox ID="txtboxUserName" runat="server" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style11"></td>
                </tr>
                <tr>
                    <td class="auto-style20">
                        &nbsp;</td>
                    <td class="auto-style19">
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td class="auto-style15">
                        <asp:TextBox ID="txtboxPassword" runat="server" TextMode="Password" Width="210px"></asp:TextBox>
                    </td>
                    <td class="auto-style21">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style20">
                        &nbsp;</td>
                    <td colspan="2">
                        <asp:Button ID="btnLogin" runat="server" BackColor="#6699FF" ForeColor="White" OnClick="btnLogin_Click" Text="LOGIN" />
                    </td>
                    <td class="auto-style21">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style16" colspan="2">
                        <asp:HyperLink ID="hplRegister" runat="server" NavigateUrl="Register.aspx">Register</asp:HyperLink>
                    </td>
                    <td class="auto-style15">
                        <asp:HyperLink ID="hplForgotPassword" runat="server" NavigateUrl="ForgotPassword.aspx">Forgot Password</asp:HyperLink>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style20">
                        &nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="lblMessage" runat="server" Text="Message"></asp:Label>
                    </td>
                    <td class="auto-style21">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                    <td class="auto-style21">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

