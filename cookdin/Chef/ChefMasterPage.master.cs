using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chef_ChefMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Chef_ID"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                lblusername.Text = Session["Chef_UserName"].ToString();
            }
           // Check_USerID_Exist();
        }

         //Session["Chef_ID"] = "1";
         //Session["Chef_UserName"] = "keyusKitchen";

        
    }
    private void Check_USerID_Exist()
    {
        if (Session["Chef_ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}
