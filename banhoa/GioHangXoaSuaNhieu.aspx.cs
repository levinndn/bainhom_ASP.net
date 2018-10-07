using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class Default2 : System.Web.UI.Page
{
    Data data = new Data();
    DataTable dt ;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        if (Request.Cookies["tendangnhap"] == null) { Server.Transfer("GioHangXoaSua-session.aspx"); return; }
        else this.docDL();
    }

    private void docDL()
    {
        string ten = Request.Cookies["tendangnhap"].Value;
        string q = "select hoadon.mahoa,tenhoa,mota,dongia,soluong,"
            + "soluong*dongia as thanhtien from hoadon,hoa where tendangnhap='" + ten + "' and hoa.mahoa=hoadon.mahoa";
            dt = new DataTable();
            dt = data.GetData(q);
            this.GridView1.DataSource = dt;
            this.GridView1.DataBind();
            double tong = 0;
            foreach(DataRow row in dt.Rows)
            {
                double thanhtien = Convert.ToDouble(row["thanhtien"]);
                tong += thanhtien;
        }
        tong.ToString("0,0", CultureInfo.InvariantCulture);
        string sum = String.Format(CultureInfo.InvariantCulture,
                             "{0:0,0}", tong);
        this.Label1.Text = "Tổng thành tiền: " + sum + " đồng";
        
    }
    

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(Request.Cookies["tendangnhap"]==null) Server.Transfer("GioHangXoaSua-session.aspx");
        string ten = Request.Cookies["tendangnhap"].Value;
        foreach(GridViewRow row in this.GridView1.Rows)
        {
            if (((CheckBox)row.FindControl("CheckBox1")).Checked)
            {
                string mahoa = ((HiddenField)row.FindControl("HiddenField1")).Value;
                string sql = "delete from hoadon where mahoa='"+mahoa+"' and tendangnhap='"+ten+"'";
                data.Update(sql);
            }
        }
        this.docDL();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["tendangnhap"] == null) Server.Transfer("GioHangXoaSua-session.aspx");
        string ten = Request.Cookies["tendangnhap"].Value;
        foreach (GridViewRow row in this.GridView1.Rows)
        {
            if (((CheckBox)row.FindControl("CheckBox1")).Checked)
            {
                string mahoa = ((HiddenField)row.FindControl("HiddenField1")).Value;
                string soluong = ((TextBox)row.FindControl("TextBox1")).Text;
                string sql = "update hoadon set soluong = "+soluong+" where mahoa='" + mahoa + "' and tendangnhap='" + ten + "'";
                data.Update(sql);
            }
        }
        this.docDL();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Server.Transfer("HoaDon.aspx");
    }
}