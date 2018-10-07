<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="XemHoaChiTiet-session.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        
        .auto-style7 {
            width: 20%;
            height: 42px;
            text-align: center;
        }

        .auto-style8 {
            width: 40%;
            height: 42px;
            text-align: center;
        }

        .auto-style9 {
            text-align: center;
        }

        .auto-style11 {
            height: 23px;
            text-align: center;
        }
        .auto-style12 {
            font-size: small;
        }
        .auto-style13 {
            font-size: small;
            color: #660033;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <span>
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" ForeColor="#ff0066">Giỏ Hàng</asp:LinkButton></span>
    <asp:DataList ID="DataList2" runat="server" CellSpacing="10">
        <ItemTemplate>
            <table class="auto-style1" border="2px">
                <tr>
                    <td rowspan="4" style="width: 30%;">
                        <asp:Image ID="Image3" runat="server" ImageUrl='<%# "~/img/"+Eval("hinh") %>' Height="500px" Width="500px" />
                    </td>
                    <td class="auto-style7" style="width: 40%;">Tên Hoa:</td>
                    <td class="auto-style8" style="width: 40%;">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("tenhoa") %>'></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">Mô Tả:</td>
                    <td class="auto-style11" style="padding: 10px;">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("mota") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Đơn Giá:</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("dongia") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">Số Lượng:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <br />
                        <strong>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="auto-style12" ErrorMessage="Nhập Số lượng để mua" ForeColor="Maroon"></asp:RequiredFieldValidator><br />
                            <asp:RangeValidator ID="RangeValidator1" ControlToValidate="TextBox1" Type="Integer" MinimumValue="1" MaximumValue="100" runat="server" ErrorMessage="Nhập sai định dạng số cho phép!" CssClass="auto-style13"></asp:RangeValidator>
                        </strong>
                        <br />
                        <asp:Button ID="Button1" runat="server" Text="Mua" OnClick="Button1_Click" CommandArgument='<%# Eval("mahoa") %>' />
                    <script lang ="javascript">
                        var a = document.getElementById("TextBox1").textContent
                    </script>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
&nbsp;
</asp:Content>