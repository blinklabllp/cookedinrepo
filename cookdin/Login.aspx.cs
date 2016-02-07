using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    EncryptionDecryption en = new EncryptionDecryption();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Chef_UserName", txtusername.Text);
        p[1] = new SqlParameter("@Chef_Password", en.EncryptString(txtPassword.Text));
      //  p[1] = new SqlParameter("@Chef_Password", txtPassword.Text);

        if (con1.CheckData("SP_LoginMaster_View", p))
        {
            DataSet ds=con1.Select("SP_LoginMaster_View", p);
            DataRow dr = ds.Tables[0].Rows[0];
            if (dr["IsApprove"].ToString() == "Approved")
            {
                pnlwarning.Visible = false;
                Session["Chef_ID"] = dr["Chef_ID"].ToString();
                Session["Chef_UserName"] = dr["Chef_UserName"].ToString();
                Response.Redirect("~/Chef/MyProfile.aspx");
            }
            else
            {
                pnlwarning.Visible = true;
                lblwarningmessage.Text = "You Are Not Activated.";
            }

            
        }
        else
        {
            pnlwarning.Visible = true;
            lblwarningmessage.Text = "Username or Password incorrect";
            //Response.Write("<script>alert('Username or Password incorrect');</script>");
        }
    }
    protected void btnconsumerlogin_Click(object sender, EventArgs e)
    {
        //chenge Cheftablename to Consumer Table Name
        //  if (con.check_data("select * from ConsumerSignUp where Consumer_UserName='" + txtusername.Text + "' and Password='" + en.EncryptString(txtPassword.Text) + "'"))
        if (con.check_data("select * from ConsumerSignUp where Consumer_UserName='" + txtconsumerusername.Text + "' and Password='" + en.EncryptString(txtconsumerpassword.Text) + "'"))
        {
            SqlParameter[] p = new SqlParameter[2];
             p[0] = new SqlParameter("@Consumer_UserName", txtconsumerusername.Text);
             p[1] = new SqlParameter("@Consumer_Password", en.EncryptString(txtconsumerpassword.Text));
          
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
            pnlwarning.Visible = true;
            lblwarningmessage.Text = "Username or Password incorrect";
        }
    }
   
}