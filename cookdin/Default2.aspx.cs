using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            sending_Mail("kadiamadhuri89@gmail.com");
        }
    }



    public void sending_Mail(string user)
    {
        try
        {
            string emailTo = user;

            string smtpAddress = ConfigurationManager.AppSettings["NLsmtpaddress"].ToString();
            int portNumber = int.Parse(ConfigurationManager.AppSettings["NLemailport"].ToString());
            bool enableSSL = bool.Parse(ConfigurationManager.AppSettings["NLenablessl"].ToString());
            string emailFrom = ConfigurationManager.AppSettings["NLemailfrom"].ToString();
            string password = ConfigurationManager.AppSettings["NLemailpassword"].ToString();
            string subject = ConfigurationManager.AppSettings["NLemailsubject"].ToString();
            string body = ConfigurationManager.AppSettings["NLemailbody"].ToString();
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFrom);
                mail.To.Add(emailTo);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
        
                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new NetworkCredential(emailFrom, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.UseDefaultCredentials = false;
                    smtp.Send(mail);
                }
            }
        }
        catch (Exception ex)
        {
        }
    }
   
}