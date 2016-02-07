using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Web.Configuration;
using System.Security.Cryptography.X509Certificates;
using System.Configuration;
using System.Net.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // send_mail_test("kadiamadhuri89@gmail.com");
       // Send_User_Confirmation_Mail();
      //  SendEmail1();
        //send_mail();
        hemalsir_sendmnail();
    }

    public void send_mail()
    {
        MailMessage message = new MailMessage();
        SmtpClient smtpClient = new SmtpClient();
        string msg = string.Empty;
        try
        {
            MailAddress fromAddress = new MailAddress(ConfigurationManager.AppSettings["NLemailfrom"].ToString());
            message.From = fromAddress;
            message.To.Add("kadiamadhuri89@gmail.com");
            message.Subject = "hello";
            message.IsBodyHtml = true;
            message.Body = "ddd";
            smtpClient.Host = "relay-hosting.secureserver.net";   //-- Donot change.
            smtpClient.Port = 25; //--- Donot change
            smtpClient.EnableSsl = false;//--- Donot change
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["NLemailfrom"].ToString(), ConfigurationManager.AppSettings["NLemailpassword"].ToString());

            smtpClient.Send(message);

            // lblConfirmationMessage.Text = "Your email successfully sent.";
        }
        catch (Exception ex)
        {
            msg = ex.Message;
        }
    }

    private void SendEmail1()
    {
        SmtpClient ss = new SmtpClient();
        ss.Host = "relay-hosting.secureserver.net";
        ss.Port = 25;
     
        ss.DeliveryMethod = SmtpDeliveryMethod.Network;
        ss.UseDefaultCredentials = false;
        ss.Credentials = new NetworkCredential("hd@cookedin.in", "sf5500bb");
        ss.EnableSsl = false;

        MailMessage mailMsg = new MailMessage("hd@cookedin.in", "kadiamadhuri89@gmail.com", "subject here", "my body");
        mailMsg.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            ss.Send(mailMsg);

        Response.Write("Mail Sent");
    }




    public void Send_User_Confirmation_Mail()
    {

        MailMessage mail = new MailMessage();
        mail.To.Add("kadiamadhuri89@gmail.com");
        mail.From = new MailAddress("hd@cookedin.in");
        mail.Subject = "Account Created.";
        string Body = "hhhhh";
        mail.Body = Body;
        mail.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "relay-hosting.secureserver.net";
        smtp.EnableSsl = false;
        smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["NLemailfrom"].ToString(), ConfigurationManager.AppSettings["NLemailpassword"].ToString());
        ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
        smtp.Port = 25;
        smtp.Send(mail);


    }

    public void sendmailgooglerelay()
    {

    }

     public void send_mail_test(string tomail)
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


     public void sending_Mailabc(string user)
     {
         try
         {
             string smtpAddress = "smtp.gmail.com";
             int portNumber = 587;
             bool enableSSL = true;

             string emailFrom = "";
             string password = "";
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



     public void hemalsir_sendmnail()
     {
         using (MailMessage mm = new MailMessage("hd@cookedin.in", "kadiamadhuri89@gmail.com"))
         {
             mm.Subject = "hfgjfdhg";
             mm.Body = "hfg";
             
             mm.IsBodyHtml = false;
             SmtpClient smtp = new SmtpClient();
             smtp.Host = "smtp.gmail.com";
             smtp.EnableSsl = true;
             NetworkCredential NetworkCred = new NetworkCredential("hd@cookedin.in", "sf5500bb");
             smtp.UseDefaultCredentials = true;
             smtp.Credentials = NetworkCred;
             smtp.Port = 587;
             smtp.Send(mm);
             ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
         }
     }


}