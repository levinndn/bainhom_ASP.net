<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DangKi.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style14 {
            text-align: center;
            color: #FF0000;
            height: 23px;
        }
        .auto-style15 {
            width: 82px;
            color: #800000;
        }
        .auto-style16 {
            width: 307px;
        }
        .auto-style17 {
            width: 82px;
            height: 23px;
            color: #800000;
        }
        .auto-style18 {
            width: 307px;
            height: 23px;
        }
        .auto-style19 {
            width: 82px;
            height: 26px;
            color: #800000;
        }
        .auto-style20 {
            width: 307px;
            height: 26px;
        }
        .auto-style21 {
            width: 71%;
        }
        .auto-style22 {
            color: #FF9900;
        }
        .auto-style23 {
            color: #660066;
            font-size: small;
        }
        .auto-style24 {
            width: 82px;
            color: #800000;
            height: 30px;
        }
        .auto-style25 {
            width: 307px;
            height: 30px;
        }
        .auto-style26 {
            font-size: small;
            color: #660033;
        }
        .auto-style27 {
            font-size: small;
            color: #000066;
        }
        .auto-style28 {
            color: #CCCC00;
        }
        .auto-style29 {
            font-size: x-large;
            color: #FF9900;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="auto-style21" style="max-width:300px">
        <tr>
            <td class="auto-style14" colspan="2">
                <h1><strong>Form Đăng Kí</strong></h1>
            </td>
        </tr>
        <tr >
            <td class="auto-style15" style="width:10%">Họ và Tên:</td>
            <td class="auto-style16" style="width:20%">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style22" placeholder="Jindo Jensi"></asp:TextBox> *
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" runat="server" CssClass="auto-style23" ErrorMessage="Không được để trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style17">Giới Tính:</td>
            <td class="auto-style18">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="155px" CssClass="auto-style28">
                    <asp:ListItem Selected="True">Nam</asp:ListItem>
                    <asp:ListItem>Nữ</asp:ListItem>
                </asp:RadioButtonList>
                </td>
        </tr>
        <tr>
            <td class="auto-style24">Ngày sinh:</td>
            <td class="auto-style25">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style22" placeholder="dd/mm/yyyy"></asp:TextBox> *
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" CssClass="auto-style23" ErrorMessage="Không được để trống"></asp:RequiredFieldValidator><br />
                <strong>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TextBox2" ValidationExpression="^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$" runat="server" ErrorMessage="Sai định dạng ngày tháng" CssClass="auto-style27"></asp:RegularExpressionValidator>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style19">Username:</td>
            <td class="auto-style20">
                <asp:TextBox ID="TextBox3" runat="server" ControlToValidate="TextBox3" CssClass="auto-style22" placeholder="levinn" value=""></asp:TextBox> *
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox3" runat="server" CssClass="auto-style23" ErrorMessage="Không được để trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">Password:</td>
            <td class="auto-style16">
                <asp:TextBox ID="TextBox4" runat="server" ControlToValidate="TextBox4" CssClass="auto-style22" placeholder="admin" type="password"></asp:TextBox> *
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox4" runat="server" CssClass="auto-style23" ErrorMessage="Không được để trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">Repass:</td>
            <td class="auto-style16">
                <asp:TextBox ID="TextBox5" runat="server" CssClass="auto-style22" placeholder="admin" type="password"></asp:TextBox> *
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" CssClass="auto-style23" ErrorMessage="Không được để trống"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox5" ControlToValidate="TextBox4" Operator="Equal" ErrorMessage="Mật Khẩu nhập lại không khớp"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">Email:</td>
            <td class="auto-style16">
                <asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style22" placeholder="levinn@gmail.com"></asp:TextBox> *
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="TextBox6" runat="server" CssClass="auto-style23" ErrorMessage="Không được để trống"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;&nbsp; <br />
                <strong>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox6" ValidationExpression="^[A-Za-z0-9]+([_\.\-]?[A-Za-z0-9])*@[A-Za-z0-9]+([\.\-]?[A-Za-z0-9]+)*(\.[A-Za-z]+)+$" runat="server" CssClass="auto-style26" ErrorMessage="Sai Định dạng email"></asp:RegularExpressionValidator>
                </strong>
            </td>
        </tr>
    </table>
    
    <br />
&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Text="Đăng kí" OnClick="Button1_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
        
<strong><em>
    <asp:Label ID="Label2" runat="server" CssClass="auto-style29"></asp:Label>
    </em></strong>
        
</asp:Content>