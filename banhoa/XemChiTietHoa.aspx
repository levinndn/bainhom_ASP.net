<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="XemChiTietHoa.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style9 {
            width: 46px;
            height: 81px;
            text-align: center;
            color: #006600;
        }
        .auto-style10 {
            width: 80%;
            height: 81px;
            text-align: center;
        }
        .auto-style12 {
            width: 53px;
            text-align: center;
            height: 36px;
        }
        .auto-style13 {
            width: 53px;
            text-align: center;
        }
        .auto-style14 {
            width: 46px;
            text-align: center;
            color: #003300;
        }
        .auto-style15 {
            width: 46px;
            text-align: center;
            color: #003300;
            height: 36px;
        }
        .auto-style16 {
            width: 53px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <span>
    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" ForeColor="#ff0066">Giỏ Hàng 1</asp:LinkButton>
    <br />
    <asp:DataList ID="DataList3" runat="server" GridLines="Both" Width="100%" BorderColor="#990000" BorderWidth="2px" CellPadding="10" CellSpacing="-1">
        <ItemTemplate>
            <table class="auto-style1" border="1">
                <tr>
                    <td rowspan="4" style="width:10%;">
                        <asp:Image ID="Image3" runat="server" ImageUrl='<%# "~/img/"+Eval("hinh") %>' Width="300px" Height="300px" BorderStyle="None" />
                    </td>
                    <td class="auto-style9" style="width:20%;">Tên Hoa:</td>
                    <td class="auto-style10" style="width:70%;">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("tenhoa") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">Mô Tả:</td>
                    <td class="auto-style12">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("mota") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">Đơn Giá:</td>
                    <td class="auto-style16">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("dongia") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">Số Lượng:</td>
                    <td class="auto-style13">
                        <asp:TextBox ID="TextBox1" runat="server" Width="70%"></asp:TextBox>
                        <br />
                        <strong>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="auto-style12" ErrorMessage="Nhập Số lượng để mua" ForeColor="Maroon"></asp:RequiredFieldValidator><br />
                            <asp:RangeValidator ID="RangeValidator1" ControlToValidate="TextBox1" Type="Integer" MinimumValue="1" MaximumValue="100" runat="server" ErrorMessage="Nhập sai định dạng số cho phép!" CssClass="auto-style13"></asp:RangeValidator>
                        </strong>
                        <br />
                        <br />
                        <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("mahoa") %>' OnClick="Button1_Click1" Text="Mua" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <br />
    </span>
    </asp:Content>