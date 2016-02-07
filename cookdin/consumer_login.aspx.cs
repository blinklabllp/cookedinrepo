using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class consumer_login : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
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
        //chenge Cheftablename to Consumer Table Name
      //  if (con.check_data("select * from ConsumerSignUp where Consumer_UserName='" + txtusername.Text + "' and Password='" + en.EncryptString(txtPassword.Text) + "'"))
            if (con.check_data("select * from ConsumerSignUp where Consumer_UserName='" + txtusername.Text + "' and Password='" + txtPassword.Text+ "'"))
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@Consumer_UserName", txtusername.Text);
           // p[1] = new SqlParameter("@Consumer_Password", en.EncryptString(txtPassword.Text));
            p[1] = new SqlParameter("@Consumer_Password",txtPassword.Text);
            DataSet ds = con1.Select("SP_ConsumerLoginMaster_View", p);
            DataRow dr = ds.Tables[0].Rows[0];
            Session["Consumer_ID"] = dr["Consumer_ID"].ToString();
            Session["Consumer_UserName"] = dr["Consumer_UserName"].ToString();
            Session["Temp_Consumer_ID"] = con1.getipaddress();
            con.update_data("update CartMaster set Consumer_ID='" + Session["Consumer_ID"] + "' where Consumer_ID='" + Session["Temp_Consumer_ID"].ToString() + "'");

            if (Request.QueryString.Get("flag") != null)
            {
                Response.Redirect("~/Consumer/MyCart.aspx");
            }

              Response.Redirect("~/Consumer/MyProfile.aspx");
        }
        else
        {
            Response.Write("<script>alert('Username or Password incorrect');</script>");
        }
    }
}