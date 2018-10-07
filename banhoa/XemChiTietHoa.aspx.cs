using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class _Default : System.Web.UI.Page
{
    Data data = new Data();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        if (Request.Cookies["tendangnhap"] == null)
        {
            Server.Transfer("XemHoaChiTiet-session.aspx");
            return;
        }
        string mahoa = Context.Items["mh"].ToString();
        string query = "select* from hoa where mahoa='"+mahoa+"'";
        dt=data.GetData(query);
        this.DataList3.DataSource = dt;
        this.DataList3.DataBind();
    }

    

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Server.Transfer("GioHangXoaSuaNhieu.aspx");
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Button mua = (Button)sender;
        string mahoa = mua.CommandArgument.ToString();
        DataListItem item = (DataListItem)mua.Parent;
        string soluong = ((TextBox)item.FindControl("TextBox1")).Text;
        if (Request.Cookies["tendangnhap"] == null) Server.Transfer("XemHoaChiTiet-session.aspx");
        string ten = Request.Cookies["tendangnhap"].Value;
        string q = "select* from hoadon where tendangnhap='" + ten + "'and mahoa='"+mahoa+"'";
        dt = data.GetData(q);
        if (dt.Rows.Count != 0)
        {
            q = "update hoadon set soluong=soluong+'" + soluong + "' where tendangnhap='"+ten+"' and mahoa='"+mahoa+"' ";
        }
        else
        {
            q = "insert into hoadon(tendangnhap,mahoa,soluong) values('" + ten + "','" + mahoa + "','" + soluong + "')";
        }
        data.Update(q);
    }
}