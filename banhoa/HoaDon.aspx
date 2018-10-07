<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HoaDon.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style7 {
            text-decoration: underline;
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="tenhoa" HeaderText="Tên Hoa" />
            <asp:BoundField DataField="soluong" HeaderText="Số Lượng" />
            <asp:BoundField DataField="thanhtien" HeaderText="Thành Tiền" />
        </Columns>
    </asp:GridView>
    <h1><strong><em>
        <asp:Label ID="Label1" runat="server" CssClass="auto-style7"></asp:Label>
        </em></strong></h1>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Quay lại giỏ hàng" />
</asp:Content>