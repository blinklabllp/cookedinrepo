using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class checkout : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    EncryptionDecryption en = new EncryptionDecryption();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnconsumerlogin_Click(object sender, EventArgs e)
    {
        //chenge Cheftablename to Consumer Table Name
        //  if (con.check_data("select * from ConsumerSignUp where Consumer_UserName='" + txtusername.Text + "' and Password='" + en.EncryptString(txtPassword.Text) + "'"))
        if (con.check_data("select * from ConsumerSignUp where Consumer_UserName='" + txtconsumerusername.Text + "' and Password='" + en.EncryptString(txtconsumerpassword.Text) + "'"))
        {
            check_login(txtconsumerusername.Text,txtconsumerpassword.Text);
            Response.Redirect("~/Consumer/Homepage.aspx");
        }
        else
        {
            pnlwarning.Visible = true;
            lblwarningmessage.Text = "Username or Password incorrect";
        }
    }

    private void check_login(string username,string password)
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Consumer_UserName", username);
        p[1] = new SqlParameter("@Consumer_Password", en.EncryptString(password));

        DataSet ds = con1.Select("SP_ConsumerLoginMaster_View", p);

        DataRow dr = ds.Tables[0].Rows[0];
        Session["Consumer_ID"] = dr["Consumer_ID"].ToString();
        Session["Consumer_UserName"] = dr["Consumer_UserName"].ToString();
        Session["Temp_Consumer_ID"] = con1.getipaddress();
        con.update_data("update CartMaster set Consumer_ID='" + Session["Consumer_ID"] + "' where Consumer_ID='" + Session["Temp_Consumer_ID"].ToString() + "'");
            Response.Redirect("~/Consumer/MyCart.aspx");
      
    }


    protected void btnregister_Click(object sender, EventArgs e)
    {
        //check username
        if (con.check_data("Select * from ConsumerSignUp where Consumer_UserName='" + txtusername.Text + "'"))
        {
            txtemailid.BorderColor = txtpassword.BorderColor;
            txtemailid.BorderStyle = txtpassword.BorderStyle;
            txtusername.BorderColor = System.Drawing.Color.Red;
            txtusername.BorderStyle = BorderStyle.Solid;
            lblerrormessage.Text = "UserName Already In Used";
            lblerrormessage.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            //check Email
            if (con.check_data("Select * from ConsumerSignUp where Consumer_EmailID='" + txtemailid.Text + "'"))
            {
                txtusername.BorderColor = txtpassword.BorderColor;
                txtusername.BorderStyle = txtpassword.BorderStyle;
                txtemailid.BorderColor = System.Drawing.Color.Red;
                txtemailid.BorderStyle = BorderStyle.Solid;
                lblerrormessage.Text = "EmailId Already In Used";
                lblerrormessage.ForeColor = System.Drawing.Color.Red;
            }
            else
            {

                txtusername.BorderStyle = txtpassword.BorderStyle;
                txtemailid.BorderStyle = txtpassword.BorderStyle;
                txtusername.BorderColor = txtpassword.BorderColor;
                txtemailid.BorderColor = txtpassword.BorderColor;

                lblerrormessage.Text = "";
                lblerrormessage.ForeColor = System.Drawing.Color.Black;

                SqlParameter[] p = new SqlParameter[3];

                p[0] = new SqlParameter("@Email", txtemailid.Text);
                p[1] = new SqlParameter("@User_Name", txtusername.Text);
                p[2] = new SqlParameter("@Password", en.EncryptString(txtpassword.Text));

                con1.Ins_Upd_Del("SP_ConsumerSignUp_Insert", p);

                /// Updating Send mail function to common function to be used every where from one location. 

                string subject = "Welcome to Cook'dIn - Please verify your account.";
                string body = "Dear " + txtusername.Text + ",<br/>" +
                                "Welcome to Cook'dIn<br/>" +
                                "Congratulations! You are one step closer to placing your first order. <br/>" +
                                "Verify your account by clicking on the link below:" +
                                 "<a href='http://cookedin.com/Sucess.aspx?userName=''" + txtusername.Text + "''><H1><Center>Verify Now</Center></H1></a><br/>" +
                                 "Your account details:<br/>" +
                                 "User Name : " + txtusername.Text + "<br/>" +
                                 "Password : ********* as specified during signup process.<br/>" +
                                 "Where to go from here? <br/>" +
                                 "After you verify your account you can sign in and place your first order with us. You will explore the awesome cuisines available from some of the best HomeChef's in your city. <br/>" +
                                 "At Cook'dIn we endavour to provide you with the best experience, if you have any questions or need help you can visit our contact us anytime at support@cookedin.com. <br/>" +
                                 "Enjoy! <br/>" +
                                 "The Cook'dIn Team";

                if (commonfunctions.sending_Mail(txtemailid.Text, subject, body))
                {
                    check_login(txtusername.Text,txtpassword.Text);
                   
                }
                else
                {
                    check_login(txtusername.Text, txtpassword.Text);
                   // lblerrormessage.Text = "There was some problem creating your account, please contact support.";
                    //lblerrormessage.ForeColor = System.Drawing.Color.Red;
                }

                Clear_all();
            }
        }
    }


    private void Clear_all()
    {
        txtusername.BorderStyle = txtpassword.BorderStyle;
        txtemailid.BorderStyle = txtpassword.BorderStyle;
        txtusername.BorderColor = txtpassword.BorderColor;
        txtemailid.BorderColor = txtpassword.BorderColor;
        txtconfirmpassword.Text = "";
        txtemailid.Text = "";
        txtpassword.Text = "";
        txtusername.Text = "";
    }
}