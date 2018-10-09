using System;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt=null;
        string q = "select tendangnhap from khachhang";
        Data data = new Data();
        dt = data.GetData(q);
        string ten = this.TextBox3.Text;
        foreach (DataRow row in dt.Rows)
        {
            if (row["tendangnhap"].ToString() == ten)
            {
                this.Label2.Text = "Tên đăng nhập đã tồn tại!";
                this.TextBox3.Text=null;
                return;
            }
            else
            {
                string matkhau = this.TextBox4.Text;
                string query = "insert into khachhang(tendangnhap,matkhau) values('" + ten + "','" + matkhau + "')";
                Data da = new Data();
                data.Update(query);
                this.Label2.Text = "Đăng Kí Thành Công!";return;
                //Response.Cookies["tendangnhap"].Value = ten;
                //Server.Transfer("Default.aspx");
            }
        }

    }
}