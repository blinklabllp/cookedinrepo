using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class adminlogin : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    EncryptionDecryption en = new EncryptionDecryption();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Admin_UserName", txtusername.Text);
        p[1] = new SqlParameter("@Admin_Password", en.EncryptString(txtpassword.Text));

        if (con1.CheckData("SP_AdminLoginMaster_View", p))
        {
           // DataSet ds = con1.Select("SP_LoginMaster_View", p);
            //DataRow dr = ds.Tables[0].Rows[0];
            Session["AdminID"] = "1";
           

            Response.Redirect("~/Admin/DashBoard.aspx");
        }
        else
        {
            Response.Write("<script>alert('Username or Password incorrect');</script>");
        }
    }
}