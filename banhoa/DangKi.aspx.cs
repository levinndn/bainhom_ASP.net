using System;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string ten = this.TextBox3.Text;
        string matkhau = this.TextBox4.Text;
        string query = "insert into khachhang(tendangnhap,matkhau) values('"+ten+"','"+matkhau+"')";
        Data data = new Data();
        data.Update(query);
        Request.Cookies["tendangnhap"].Value = ten;
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default.aspx");
    }
}