using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class _Default : System.Web.UI.Page
{
    Data da = new Data();
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        if (Request.Cookies["tendangnhap"] == null)
        {
            this.Label1.Text = "Vui lòng đăng nhập để thanh toán";
            this.Button1.Text = "Đăng Kí";
            return;
        }
        else
        {
            this.Button1.Text = "Xác Nhận Thanh Toán";
            string ten = Request.Cookies["tendangnhap"].Value;
            dt = new DataTable();
            string query = "select tenhoa,soluong,soluong*dongia as thanhtien from hoa,hoadon where tendangnhap='"+ten+"' and hoa.mahoa=hoadon.mahoa";
            dt=da.GetData(query);
            this.GridView1.DataSource = dt;
            this.GridView1.DataBind();
            Double tong = 0;
            foreach (DataRow row in dt.Rows)
            {
                double thanhtien = Convert.ToDouble(row["thanhtien"]);
                tong += thanhtien;
            }
            tong.ToString("0,0", CultureInfo.InvariantCulture);
            string sum=String.Format(CultureInfo.InvariantCulture,
                                 "{0:0,0}", tong);
            this.Label1.Text = "Tổng thành tiền: " + sum + " đồng";
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["tendangnhap"] == null) { Server.Transfer("DangKi.aspx"); }
        else
            Server.Transfer("End.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer("GioHangXoaSuaNhieu.aspx");
    }
}