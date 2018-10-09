using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private Data data = new Data();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        string query = "select* from loaihoa";
        DataTable dt = data.GetData(query);
        this.DataList1.DataSource = dt;
        this.DataList1.DataBind();
        this.DataList2.DataSource = dt;
        this.DataList2.DataBind();
        if (Request.Cookies["tendangnhap"] != null)
            this.Label1.Text = Request.Cookies["tendangnhap"].Value;
        else this.Label1.Text = "chưa đăng nhập!";

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["tendangnhap"] != null)
        {
            
            HttpCookie myCookie = new HttpCookie("tendangnhap");
            myCookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(myCookie);
            Session.Clear();
            Server.Transfer("Default.aspx");
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string maloai = ((LinkButton)sender).CommandArgument.ToString();
        Context.Items["ml"] = maloai;
        Server.Transfer("danhmuchoa.aspx");
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        DataTable dt = new DataTable();
        string ten = this.Login1.UserName;
        string password = this.Login1.Password;
        string query = "select* from khachhang where tendangnhap='" + ten + "' and matkhau='" + password + "'";
        try
        {
            dt = data.GetData(query);
        }
        catch (SqlException er) { Response.Write(er.Message); }
        if (dt.Rows.Count != 0)
        {
            Response.Cookies["tendangnhap"].Value = ten;
            Server.Transfer("Danhmuchoa.aspx");
            this.Label1.Text = Request.Cookies["tendangnhap"].Value;
        }
        else
        {
            this.Login1.FailureText = "Tên Đăng Nhập hoặc Mật Khẩu không đúng";
        }
        
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string maloai = ((ImageButton)sender).CommandArgument;
        Context.Items["ml"] = maloai;
        Server.Transfer("danhmuchoa.aspx");
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        string maloai = ((LinkButton)sender).CommandArgument;
        Context.Items["ml"] = maloai;
        Server.Transfer("danhmuchoa.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Server.Transfer("DangKi.aspx");
    }

    
}