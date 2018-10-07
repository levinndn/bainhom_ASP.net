<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GioHangXoaSuaNhieu.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style7 {
            text-align: right;
            color: #000099;
        }
        .auto-style8 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderText="Xóa">
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                    <br />
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("mahoa") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="tenhoa" HeaderText="Tên hàng" />
            <asp:BoundField DataField="mota" HeaderText="Mô tả" />
            <asp:BoundField DataField="dongia" HeaderText="Đơn giá" />
            <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#99FF33" Text='<%# Eval("soluong") %>' CssClass="auto-style7" Width="80%"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="thanhtien" HeaderText="Thành tiền" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Xóa" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Sửa" />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Thanh Toán" />
</asp:Content>

