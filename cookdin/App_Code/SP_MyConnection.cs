using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net;

/// <summary>
/// Summary description for SP_MyConnection
/// </summary>
public class SP_MyConnection
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);

  //  SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=cookedin;Integrated Security=True");

	public SP_MyConnection()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public DataSet Select(string spname)
    {
        //Declare Variables 
        DataSet ds = new DataSet();
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand(spname, con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            

            ad.Fill(ds);

            cmd.Dispose();
            con.Close();

            return ds;
        }
        catch (Exception ex)
        {
            //ToDo: Redirect to error page with Errors. 
            //returning null
            return null;
            
        }
    }

    public DataSet Select(string spname, SqlParameter[] p)
    {

        try
        {

            con.Open();

            SqlCommand cmd = new SqlCommand(spname, con);
            cmd.CommandType = CommandType.StoredProcedure;

            for (int i = 0; i <= p.Length - 1; i++)
            {
                cmd.Parameters.AddWithValue(p[i].ParameterName, p[i].Value);
            }

            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            ad.Fill(ds);

            cmd.Dispose();
            con.Close();

            return ds;
        }
        catch (Exception ex)
        {
            //ToDo: Redirect to error page with Errors. 
            //returning null
            return null;
        }
    }

    public void Ins_Upd_Del(string spname, SqlParameter[] p)
    {
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand(spname, con);
            cmd.CommandType = CommandType.StoredProcedure;

            /*
            for (int i = 0; i <= p.Length - 1; i++)
            {
                //cmd.Parameters.AddWithValue(p[i].ParameterName, p[i].Value);

                //cmd.Parameters.Add(p[i]);
            }
            */

            cmd.Parameters.AddRange(p);
            cmd.ExecuteNonQuery();

            cmd.Dispose();
            con.Close();
        }
        catch (Exception ex)
        {
            //ToDo: Redirect to error page with Errors. 
         
        }
    }

    public bool CheckData(string spname, SqlParameter[] p)
    {
        try
        {

            DataSet ds = Select(spname, p);

            if (ds.Tables[0].Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        catch (Exception ex)
        {
            //ToDo: Redirect to error page with Errors. 
            //returning null
            return false;
        }
    }

    public DataRow SingleRow(string spname, SqlParameter[] p)
    {
        try
        {

            DataSet ds = Select(spname, p);

            return ds.Tables[0].Rows[0];
        }
        catch (Exception ex)
        {
            //ToDo: Redirect to error page with Errors. 
            //returning null
            return null;
        }
    }


    public string SingleCell(string spname, SqlParameter[] p)
    {
        try
        {
            DataSet ds = Select(spname, p);

            return ds.Tables[0].Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            //ToDo: Redirect to error page with Errors. 
            //returning null
            return null;
        }
    }

    public string getipaddress()
    {
        try
        {

            string hostName = Dns.GetHostName(); // Retrive the Name of HOST
            Console.WriteLine(hostName);
            string myIP = Dns.GetHostByName(hostName).AddressList[0].ToString();

            string[] iparray = myIP.Split('.');

            string returnip = null;
            foreach (string a in iparray)
            {
                returnip += a;
            }
            // return myIP;
            return returnip;
        }
        catch (Exception ex)
        {
            //ToDo: Redirect to error page with Errors. 
            //returning null
            return null;
        }
    }
}