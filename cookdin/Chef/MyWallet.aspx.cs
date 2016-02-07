using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Chef_MyWallet : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    Myconnection con = new Myconnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // SqlParameter[] p = new SqlParameter[1];

           // p[0] = new SqlParameter("@ChefID", Session["Chef_ID"].ToString());
          //  Repeater1.DataSource = con1.Select("SP_Chef_Wallet",p); 
            Check_USerID_Exist();
            Repeater1.DataSource = con.select_data("SELECT OrderMaster.Order_Date, OrderDish.Qty, dbo.ChefDishMaster.Dish_Name,  dbo.ChefDishGallery.Dish_Image, dbo.ChefDishMaster.Price AS dishprice,(OrderDish.Qty*dbo.ChefDishMaster.Price) as TotalPrice,dbo.OrderMaster.Delivery_Charges,((dbo.ChefDishMaster.Price*20))/100 as AdminCharge FROM  OrderDish INNER JOIN dbo.OrderMaster ON OrderDish.Order_ID = dbo.OrderMaster.Order_ID INNER JOIN dbo.ChefDishMaster ON OrderDish.Dish_ID = dbo.ChefDishMaster.Dish_ID INNER JOIN dbo.ChefDishGallery ON dbo.ChefDishMaster.Dish_ID = dbo.ChefDishGallery.Dish_ID where  ChefDishGallery.Is_Defualt='true' AND OrderDish.Chef_ID='" + Session["Chef_ID"] + "'");
            Repeater1.DataBind();
        }
    }

    private void Check_USerID_Exist()
    {
        if (Session["Chef_ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}