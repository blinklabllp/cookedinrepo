using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

/// <summary>
/// Summary description for Myconnection
/// </summary>
public class Myconnection
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);

     //SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=cookedin;Integrated Security=True");
	public Myconnection()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void insert_data(string str)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
    }
    public DataSet select_data(string str)
    {
        SqlDataAdapter ad = new SqlDataAdapter(str, con);
        DataSet ds = new DataSet();
        ad.Fill(ds);

        return ds;
    }

    public bool check_data(string str)
    {
        DataSet ds = select_data(str);
        if (ds.Tables[0].Rows.Count == 0)
        {
            return false;
        }
        else
        {
            return true;
        }


    }
    public void delete_data(string str)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
    }
    public void update_data(string str)
    {

        con.Open();
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        con.Close();
    }
    public DataRow singlerow(string str)
    {
        DataSet ds = select_data(str);
        return ds.Tables[0].Rows[0];

    }
    public string singlecell(string str)
    {
        DataSet ds = select_data(str);
        return ds.Tables[0].Rows[0][0].ToString();
    }
    
}