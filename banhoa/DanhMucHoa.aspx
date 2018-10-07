<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DanhMucHoa.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style4 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="auto-style6" style="color: chartreuse; font-style: italic;">Danh Mục Các Loại Hoa</h1>
    <br />
    <asp:DataList ID="DataList2" runat="server" CellSpacing="10" RepeatColumns="3">
        <ItemTemplate>
            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("mahoa") %>' ImageUrl='<%# "~/img/"+Eval("hinh") %>' OnClick="ImageButton1_Click" Height="200px" Width="200px" />
            <br />
            <br />
            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("mahoa") %>' Text='<%# Eval("tenhoa") %>' OnClick="LinkButton2_Click" ForeColor="#990000"></asp:LinkButton>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>