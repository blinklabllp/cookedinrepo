using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sucess : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    EncryptionDecryption en = new EncryptionDecryption();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //?varification=tmKVl+NtVv31Brg4erEN4g==
            string user = Request.QueryString.Get("varification");
            string id = Request.QueryString.Get("i");
            if (user != null && user != "")
            {
                user = en.DecryptString(user).ToString();
                con.update_data("update ChefPersonalDetail set IsVarify=1 where Chef_ID=" + user + "");
                Panel1.Visible = true;
            }
            else
            {
                Panel2.Visible = false;
            }
        }
    }
}