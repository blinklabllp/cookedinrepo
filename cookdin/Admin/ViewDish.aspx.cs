using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Chef_ViewDish : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string Dish_Id = Request.QueryString.Get("did");
           DataRow dr = con.singlerow("select * from ChefDishMaster where Dish_ID='" + Dish_Id + "'");

            lbldishname.Text = dr["Dish_Name"].ToString();
            lblprice.Text = dr["Price"].ToString();
           // lbldishtype.Text = con.singlecell("select Dish_Type from DishType where Dish_Type_ID='" + dr["Dish_Type_ID"].ToString() + "'");
            lbldiettype.Text = con.singlecell("select Diet_Type from DietTypeMaster where Diet_Type_ID='" + dr["Diet_Type_ID"].ToString() + "'");
           // lblcuisine.Text = con.singlecell("select Place_Name from RegionalCuisine where Regional_Cuisine_ID='" + dr["Regional_Cuisine_ID"].ToString() + "'");
            lbldescription.Text = dr["Description"].ToString();
           // //string imageurl = con.singlecell("select top 1 Dish_Image from ChefDishGallery where Dish_ID='" + Dish_Id + "'");
           // //imgdishphoto.ImageUrl = "~/Chef/upload/" + imageurl + "";

            Repeater1.DataSource = con.select_data("select Dish_Image from ChefDishGallery where Dish_ID='" + Dish_Id + "'");
            Repeater1.DataBind();

            string ChefID = dr["Chef_ID"].ToString();

            string fname = con.singlecell("select Chef_Fname from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
            string mname = con.singlecell("select Chef_Mname from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
            string lname = con.singlecell("select Chef_Lname from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
            lblchefname.Text = fname + " " + lname;
            ////lblaboutme.Text = con.singlecell("select Detail from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
            string chfimageurl = con.singlecell("select Photo from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
            imgchefimage.ImageUrl = "~/Profile_Photo/" + chfimageurl + "";

            DataListingridiant.DataSource = con.select_data("select Ingridiant_Name from IngridiantMaster where Ingridiant_ID in(select Ingridiant_ID from DishIngridiant where Dish_Id='" + Dish_Id + "')");
            DataListingridiant.DataBind();

            Repeaterdishtype.DataSource = con.select_data("select Dish_Type from DishType where Dish_Type_ID in(select Dish_Type_ID from ChefDishDishType where Dish_Id='" + Dish_Id + "')");
            Repeaterdishtype.DataBind();

        }
    }
}