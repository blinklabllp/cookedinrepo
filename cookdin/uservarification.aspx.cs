using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userverification : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    EncryptionDecryption en = new EncryptionDecryption();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
 if (Request.QueryString.Get("Varification") != null)
          {
              Verify_User();
          }
          else
          {
              Response.Redirect("~/Login.aspx");
          }
        }
    }

    public void Verify_User()
    {
        string querystrng = Request.QueryString.Get("varification").ToString();
        querystrng = querystrng.Replace(" ", "+");
       string username = en.DecryptString(querystrng.Trim());

        int flag = int.Parse(Request.QueryString.Get("flag"));
        if (flag == 0)
        {
            con.update_data("update chefpersonaldetail set IsVarify='True' where Chef_ID='"+username+"'");
            Response.Redirect("~/login.aspx");
        }
        else
        {
            //con.update_data("update consumersignup set IsVarify='True' where Consumer_UserName='" + en.DecryptString(username) + "'");
            //Response.Redirect("~/login.aspx");
        }
    }
}