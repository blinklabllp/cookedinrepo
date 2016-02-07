using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Xml.Linq;

public partial class Chef_dishlist : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Chef_ID"] = "1";

        if (!IsPostBack)
        {
            Check_USerID_Exist();
            Bind_DishList();
        }
    }

    private void Bind_DishList()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@ChefID", Session["Chef_ID"].ToString());
        Repeaterdish.DataSource = con1.Select("SP_ChefDishList_View", p);
        Repeaterdish.DataBind();


        foreach (RepeaterItem item in Repeaterdish.Items)
        {

            Label lblOfferPrice = (Label)item.FindControl("lblOfferPrice");
            Label lblPrice = (Label)item.FindControl("lblPrice");
            Label lblOfferStartDate = (Label)item.FindControl("lblOfferStartDate");
            Label lblOfferEndDate = (Label)item.FindControl("lblOfferEndDate");
            Label lblChefID = (Label)item.FindControl("lblChefID");
            Label lblDishID = (Label)item.FindControl("lblDishID");
            AjaxControlToolkit.Rating ChefRating = (AjaxControlToolkit.Rating)item.FindControl("ChefRating");
            AjaxControlToolkit.Rating DishRating = (AjaxControlToolkit.Rating)item.FindControl("DishRating");
            string today = DateTime.Now.ToString();
            string start = lblOfferStartDate.Text;
            string end = lblOfferEndDate.Text;

            if (start != "" && end != "")
            {
                if (!(DateTime.Parse(today) > DateTime.Parse(start) && DateTime.Parse(today) < DateTime.Parse(end)))
                {
                    lblPrice.Visible = false;
                    lblOfferPrice.Text = lblPrice.Text;
                }
                else
                {
                    lblPrice.Font.Strikeout = true;
                }

            }
            else
            {
                lblOfferPrice.Visible = false;
            }

            string ChefID = lblChefID.Text;
            SqlParameter[] p1 = new SqlParameter[1];
            p1[0] = new SqlParameter("@Chef_ID", ChefID);

            string chefrate = con1.SingleCell("SP_ChefRate_View", p1);
            if (chefrate != null && chefrate != "")
            {
                ChefRating.CurrentRating = int.Parse(chefrate);
            }

            else
            {
                ChefRating.CurrentRating = 0;
            }
            string DishID = lblDishID.Text;
            SqlParameter[] p2 = new SqlParameter[1];
            p2[0] = new SqlParameter("@Dish_ID", DishID);

            string dishrate = con1.SingleCell("SP_DishRate_View", p2);
            if (dishrate != null && dishrate != "")
            {
                DishRating.CurrentRating = int.Parse(dishrate);
            }

            else
            {
                DishRating.CurrentRating = 0;
            }


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