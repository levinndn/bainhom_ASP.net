<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GioHangXoaSua-session.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        
        .auto-style5 {
            text-align: right;
        }
        .auto-style7 {
            margin-left: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="tenhoa" HeaderText="Tên Hoa" />
                <asp:BoundField DataField="dongia" HeaderText="Đơn Giá" />
                <asp:TemplateField HeaderText="Số Lượng">
                    <ItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("soluong") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p class="auto-style7">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Xóa" />
        &nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Sửa" />
    &nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Delete All" />
    </p>
    <p class="auto-style5">
        <asp:Button ID="Button3" runat="server" Height="50px" OnClick="Button3_Click" Text="Thanh Toán" Width="147px" />
    </p>
</asp:Content>