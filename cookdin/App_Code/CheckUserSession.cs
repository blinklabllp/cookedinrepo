using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for CheckUserSession
/// </summary>
public class CheckUserSession
{
    SP_MyConnection con1 = new SP_MyConnection();
	public CheckUserSession()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public bool Check_Chef_User(string sessionvalue)
    {

        if (sessionvalue == "")
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    // User ID = 0 (Null), False, Flase, Address Null
    // User ID = 1 , false, True, Null
    // User ID = 40, True, True, null
    public  string get_User_Address(string UserID,bool is_Chef,bool is_loggedin,string Address=null)
    {
        string address = null, pincode, area, city;
        SqlParameter[] p = new SqlParameter[3];
        

        if (is_loggedin)
        {
            p[0] = new SqlParameter("@UserID", UserID);
            p[1] = new SqlParameter("@AddressID", Address);
            p[2] = new SqlParameter("@Is_Chef", is_Chef);
                DataRow dr = con1.SingleRow("get_UserAddress_For_DeliveryCharge", p);
                pincode = dr["Pincode"].ToString();
                area = dr["Area"].ToString();
                city = dr["City"].ToString();
                address = area + ' ' + city + ' ' + pincode;
                return address;
        }
        else
        {
            p[0] = new SqlParameter("@UserID", UserID);
            p[1] = new SqlParameter("@AddressID", Address);
            p[2] = new SqlParameter("@Is_Chef", is_Chef);
            DataRow dr = con1.SingleRow("get_UserAddress_For_DeliveryCharge", p);
            pincode = dr["Pincode"].ToString();
            area = dr["Area"].ToString();
            city = dr["City"].ToString();
            address = area + ' ' + city + ' ' + pincode;
            return address;
        }
    }
}