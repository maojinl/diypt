<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberLogin.ascx.cs" Inherits="UserControls_MemberLogin" %>
<style type="text/css">
    .auto-style1 {
        height: 34px;
    }
</style>
<table width="100%">
    <tr>
        <td>
            Username:
        </td>
        <td>
            <asp:TextBox ID="username" runat="server" Width="300px" Height="20px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td >
            Password:
        </td>
        <td>
            <asp:TextBox ID="password" runat="server" Width="300px" Height="20px" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="auto-style1">
            <asp:ImageButton ID="login" runat="server" OnClick="login_Click" ImageUrl="\images\userlogin.jpg" Height="30px" Width="123px" />
        </td>
    </tr>

</table>
    <div class="error">
        <asp:Label ID="errorLabel" runat="server"></asp:Label>
    </div>