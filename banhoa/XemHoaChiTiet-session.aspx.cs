using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        string mahoa = Context.Items["mh"].ToString();
        string query = "select* from hoa where mahoa='" + mahoa + "'";
        try
        {
            Data data = new Data();
            DataTable table = new DataTable();
            table = data.GetData(query);
            this.DataList2.DataSource = table;
            this.DataList2.DataBind();
        }
        catch (SqlException er) { Response.Write(er.Message); }
    }

    private void TaoGio()
    {
        dt = new DataTable();
        dt.Columns.Add("tenhoa");
        dt.Columns.Add("mahoa");
        dt.Columns.Add("dongia");
        dt.Columns.Add("soluong");
        dt.Columns.Add("thanhtien");
        Session["giohang"] = dt;
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Server.Transfer("GioHangXoaSua-session.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        bool kt = true;
        bool test=true;
        IsNumber n = new IsNumber();
        Button mua = ((Button)sender);
        string mahoa = mua.CommandArgument.ToString();
        DataListItem item = (DataListItem)mua.Parent;
        string soluong = ((TextBox)item.FindControl("TextBox1")).Text;
        test=n.Isnumber(soluong);
        if (test == false)
        {
            kt = false;
        }
        else { if (Convert.ToDouble(soluong) < 1) kt = false; }
        string dongia = ((Label)item.FindControl("Label3")).Text;
        string tenhoa = ((Label)item.FindControl("Label1")).Text;
        bool tim = false;
        dt = (DataTable)Session["giohang"];
        if (dt == null) TaoGio();

        foreach (DataRow dataRow in dt.Rows)
        {
            if (dataRow["mahoa"].ToString() == mahoa)
            {
                dataRow["soluong"] = Convert.ToInt32(dataRow["soluong"]) + Convert.ToInt32(soluong);
                tim = true;
                break;
            }
        }

        if (!tim && kt==true)
        {
            DataRow dataRow = dt.NewRow();
            dataRow["mahoa"] = mahoa;
            dataRow["tenhoa"] = tenhoa;
            dataRow["soluong"] = soluong;
            dataRow["dongia"] = dongia;
            dt.Rows.Add(dataRow);
        }
        Session["giohang"] = dt;
    }
}