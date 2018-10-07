using System;
using System.Data;
using System.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        this.docDL();
        
    }

    private void docDL()
    {
        DataTable dt = (DataTable)Session["giohang"];
        if (dt == null) {this.GridView1.DataSource = dt;
            this.GridView1.DataBind();
            this.Label1.Text = null; 
            this.Button1.Enabled = false;
            this.Button2.Enabled = false;
            this.Button3.Enabled = false;
            this.Button4.Enabled = false;
            return;
        }
        //else this.Label1.Text = "success";
        else
        {
            this.GridView1.DataSource = dt;
            this.GridView1.DataBind();
        }
        
        double tong = 0;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            double thanhtien = Convert.ToDouble(dt.Rows[i]["soluong"]) * Convert.ToDouble(dt.Rows[i]["dongia"]);
            tong += thanhtien;
        }
        tong.ToString("0,0", CultureInfo.InvariantCulture);
        string sum = String.Format(CultureInfo.InvariantCulture,
                             "{0:0,0}", tong);
        this.Label1.Text = "Tổng thành tiền: " + sum + " đồng";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)Session["giohang"];
        foreach (GridViewRow row in this.GridView1.Rows)
        {
            if (((CheckBox)row.FindControl("CheckBox1")).Checked)
            {
                dt.Rows[row.DataItemIndex].Delete();
                Session["giohang"] = dt;
            }
            this.docDL();
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)Session["giohang"];
        foreach (GridViewRow row in this.GridView1.Rows)
        {
            if (((CheckBox)row.FindControl("CheckBox1")).Checked)
            {
                string soluong = ((TextBox)row.FindControl("TextBox1")).Text;
                dt.Rows[row.DataItemIndex]["soluong"]=soluong;
                Session["giohang"] = dt;
            }
            this.docDL();
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Server.Transfer("HoaDon.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Session["giohang"] = null;
        this.docDL();
    }
}