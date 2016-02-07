using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chef_ChefMasterPage : System.Web.UI.MasterPage
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            Check_USerID_Exist();
            
        }

    }
    private void Check_USerID_Exist()
    {
        if (Session["Consumer_ID"] == null)
        {
            Response.Redirect("~/consumer_Login.aspx");
        }
        else
        {
            lblusername.Text = Session["Consumer_UserName"].ToString();
            lblcartcount.Text = con.singlecell("SELECT count(ConsumerDishCart.ConsumerDishCart_ID) FROM  dbo.CartMaster INNER JOIN ConsumerDishCart ON dbo.CartMaster.Cart_ID = ConsumerDishCart.Cart_ID and CartMaster.Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");  
        }
    }
}
