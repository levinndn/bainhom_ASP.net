using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private string ten = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        DataTable dt = new DataTable();
        Data data = new Data();
        string query;
        if (Context.Items["ml"] == null) query = "select * from hoa";

        else
        {
            string maloai = Context.Items["ml"].ToString();
            query = "select* from hoa where maloai='" + maloai + "'";
        }
        
        
            dt = data.GetData(query);
            this.DataList2.DataSource = dt;
            this.DataList2.DataBind();
        
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string mahoa = ((ImageButton)sender).CommandArgument;
        Context.Items["mh"] = mahoa;
        if (Request.Cookies["tendangnhap"] == null)
        {
            Server.Transfer("XemHoaChiTiet-session.aspx");
        }
        else
        {
            Server.Transfer("XemChiTietHoa.aspx");
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        string mahoa = ((LinkButton)sender).CommandArgument;
        Context.Items["mh"] = mahoa;
        if (Request.Cookies["tendangnhap"] == null)
        {
            Server.Transfer("XemHoaChiTiet-session.aspx");
        }
        else
        {
            Server.Transfer("XemChiTietHoa.aspx");
        }
    }
}