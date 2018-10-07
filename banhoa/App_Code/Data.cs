using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Data
/// </summary>
public class Data : System.Web.UI.Page
{
    private SqlConnection cn;

    public Data()
    {
        string strcn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='" + Server.MapPath("App_Data/Database.mdf") + "';Integrated Security=True";
        cn = new SqlConnection(strcn);
    }

    public DataTable GetData(string query)
    {
        DataTable dl = new DataTable();
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(query, cn);
            da.Fill(dl);
        }
        catch (SqlException er) { Response.Write(er.Message); }
        return dl;
    }

    public void Update(string query)
    {
        try
        {
            SqlCommand command = new SqlCommand(query, cn);
            cn.Open();
            command.ExecuteNonQuery();
            cn.Close();
        }
        catch (SqlException er) { Response.Write(er.Message); }
    }
}