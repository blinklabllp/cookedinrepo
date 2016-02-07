using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net;

public partial class newsletter : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    Myconnection con = new Myconnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_Location();
        }
    }

    public void insert_newsletter()
    {
        if (con.check_data("select * from NewLetterSubscriber where emailid='"+txtemail.Text+"'") == true)
        {
            pnlsuccess.Visible = false;
            pnlwarning.Visible = true;
        }
        else
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@subscriber", txtname.Text);
            p[1] = new SqlParameter("@emailid", txtemail.Text);
            p[2] = new SqlParameter("@StateId", ddlstate.SelectedValue);
            p[3] = new SqlParameter("@CityId", ddlcity.SelectedValue);
          
            con1.Ins_Upd_Del("SP_NewLetterSubscriber", p);
            pnlsuccess.Visible = true;
            pnlwarning.Visible = false;
          //  sending_Mail(txtemail.Text);
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        insert_newsletter();
      
      //  send_mail(txtemail.Text);
        txtemail.Text = "";
        txtname.Text = "";
        Bind_Location();
    }

     public void sending_Mail(string user)
    {
        try
        {
            string smtpAddress = "smtp.gmail.com";
            int portNumber = 587;
            bool enableSSL = true;

            string emailFrom = "hd@cookedin.in";
            string password = "sf5500bb";
            string emailTo = user;
            string subject = "Confirmation of NewsLetter Subscribe..";
            string body = "Thank You for Subscribing Cookedin NewsLetter ";
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFrom);
                mail.To.Add(emailTo);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                // Can set to false, if you are sending pure text.

                //mail.Attachments.Add(new Attachment("C:\\SomeFile.txt"));
                //mail.Attachments.Add(new Attachment("C:\\SomeZip.zip"));

                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new NetworkCredential(emailFrom, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);
                }
            }
        }
        catch (Exception ex)
        {   
        }
    }


     public void send_mail(string tomail)
     {
         try
         {
             MailMessage mail = new MailMessage();
             SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
             mail.From = new MailAddress("hd@cookedin.in");
             mail.To.Add(tomail);
             mail.IsBodyHtml = true;
             mail.Subject = "Confirmation of NewsLetter Subscribe..";
             mail.Body = "Thank You for Subscribing Cookedin NewsLetter ";
             SmtpServer.Port = 587;
             SmtpServer.Credentials = new System.Net.NetworkCredential("hd@cookedin.in", "sf5500bb");
             SmtpServer.EnableSsl = true;
             SmtpServer.Send(mail);
         }
         catch (Exception ex) { }
     }

     public void Bind_Location()
     {
         ddlstate.DataSource = con1.Select("SP_State_View");
         ddlstate.DataTextField = "State_Name";
         ddlstate.DataValueField = "State_ID";
         ddlstate.DataBind();
         ddlstate.Items.Insert(0,"--Select State--");

         ddlcity.DataSource = con1.Select("SP_City_View");
         ddlcity.DataTextField = "City_Name";
         ddlcity.DataValueField = "City_ID";
         ddlcity.DataBind();
         ddlcity.Items.Insert(0,"--Select City--");
     }
}