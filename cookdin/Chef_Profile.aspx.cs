using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Chef_Profile : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string Chef_Id = Request.QueryString.Get("Chef_ID");


            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@Chef_ID", Chef_Id);

            DataRow dr = con1.SingleRow("SP_PerticularChef_View", p);
            string fname = dr["Chef_Fname"].ToString();
            string mname = dr["Chef_Mname"].ToString();
            string lname = dr["Chef_Lname"].ToString();
            lblname.Text = fname + " " + mname + " " + lname;
          //  lblusername.Text = dr["Chef_UserName"].ToString();
         //   lblUserName.Text = Session["Chef_UserName"].ToString();
            lblDescription.Text = dr["Detail"].ToString();
            lblNoOfDishes.Text = con.singlecell("select count(*) from ChefDishMaster where Chef_ID='" + Chef_Id + "'");
            lblNoOfReviews.Text = con.singlecell("select count(*) from RateReviewMaster where Dish_ID in (select Dish_ID from ChefDishMaster where Chef_ID='" + Chef_Id + "')");

            if (dr["Photo"].ToString() == "")
            {
                ProfilePhoto.ImageUrl = "~/templete/image/DChef.png";
            }
            else
            {
                ProfilePhoto.ImageUrl = "~/Profile_Photo/" + dr["Photo"].ToString();
            }
            //ProfilePhoto.ImageUrl = "~/Profile_Photo/" + dr["Photo"].ToString();



           
        }
    }
    //protected void btnEditProfile_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/Chef/EditProfile.aspx");
    //}
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/Chef/ListDish.aspx");
    //}
}