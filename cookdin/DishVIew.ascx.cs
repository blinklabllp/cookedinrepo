using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml.Linq;
using System.Data.SqlClient;
using AjaxControlToolkit;
using System.Net;

public partial class DishVIew : System.Web.UI.UserControl
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    commonfunctions cf = new commonfunctions();
    EncryptionDecryption en = new EncryptionDecryption();
    int price;


    string Dish_Id;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            // Response.Write(con1.getipaddress());
            Bind_QueryString();
        }
    }

    private void Bind_QueryString()
    {

        Dish_Id = Request.QueryString.Get("did").ToString();
        Dish_Id = Dish_Id.Replace(" ", "+");
        Dish_Id = en.DecryptString(Dish_Id.Trim());

        if (Dish_Id == "" || Dish_Id == null)
        {
            Response.Redirect("DishList.aspx");
        }
        else
        {

            BindDishDetail(Dish_Id);
        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        //chenge Cheftablename to Consumer Table Name
        // Dish_Id = Request.QueryString.Get("DishID");

        if (con.check_data("select * from ConsumerSignUp where Consumer_UserName='" + txtusername.Text + "' and Password='" + txtPassword.Text + "'"))
        {
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@Consumer_UserName", txtusername.Text);
            p[1] = new SqlParameter("@Consumer_Password", txtPassword.Text);
            DataSet ds = con1.Select("SP_ConsumerLoginMaster_View", p);
            DataRow dr = ds.Tables[0].Rows[0];
            Session["Consumer_ID"] = dr["Consumer_ID"].ToString();
            Session["Consumer_UserName"] = dr["Consumer_UserName"].ToString();

            Response.Redirect("~/Consumer/ViewDish.aspx?did=" + Dish_Id + "");




            //  Response.Redirect("~/Consumer/MyProfile.aspx");
        }
        else
        {
            Response.Write("<script>alert('Username or Password incorrect');</script>");
        }
    }
    public void Bind_TimeSlot()
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@DishType", lbldishtype.Text);

        if (DateTime.Parse(textboxDate.Text) != DateTime.Now.Date && lbldishtype.Text != "Lunch" && lbldishtype.Text != "Break fast" && lbldishtype.Text != "Dinner")
        {
            p[1] = new SqlParameter("@Mode", 3);
        }
        else if (DateTime.Parse(textboxDate.Text) != DateTime.Now.Date && (lbldishtype.Text == "Lunch" || lbldishtype.Text == "Break fast" || lbldishtype.Text == "Dinner"))
        {
            p[1] = new SqlParameter("@Mode", 2);
        }
        else if (DateTime.Parse(textboxDate.Text) == DateTime.Now.Date && (lbldishtype.Text != "Lunch" && lbldishtype.Text != "Break fast" && lbldishtype.Text != "Dinner"))
        {
            p[1] = new SqlParameter("@Mode", 4);
        }
        else
        {
            p[1] = new SqlParameter("@Mode", 1);
        }

        ddlTime.DataSource = con1.Select("SP_TimeSlotMaster_View", p);
        ddlTime.DataTextField = "Slot";
        ddlTime.DataValueField = "Slot_ID";
        ddlTime.DataBind();
    }
    protected void textboxDate_TextChanged(object sender, EventArgs e)
    {
        if (DateTime.Parse(textboxDate.Text) < DateTime.Now.Date)
        {
            ddlTime.Items.Clear();
        }
        else
        {
            Bind_TimeSlot();
        }
    }
    private void BindDishDetail(string Dish_Id)
    {
        DataRow dr = con.singlerow("select * from ChefDishMaster where Dish_ID='" + Dish_Id + "'");

        lbldishname.Text = dr["Dish_Name"].ToString();
        lblchefid.Text = dr["Chef_ID"].ToString();
        lblOfferPrice.Text = dr["SpecialOfferPrice"].ToString();
        lblprice.Text = dr["Price"].ToString();
        string today = DateTime.Now.ToString();
        string start = dr["OfferStartDate"].ToString();
        string end = dr["OfferEndDate"].ToString();
        price = int.Parse(dr["Price"].ToString());
        if (start != "" && end != "")
        {
            if (!(DateTime.Parse(today) > DateTime.Parse(start) && DateTime.Parse(today) < DateTime.Parse(end)))
            {
                lblprice.Visible = false;
                lblOfferPrice.Text = lblprice.Text;
            }
            else
            {
                lblprice.Font.Strikeout = true;
            }

        }
        else
        {
            lblOfferPrice.Visible = false;
        }

        //lblprice.Text = price.ToString();

        lbldiettype.Text = con.singlecell("select Diet_Type from DietTypeMaster where Diet_Type_ID='" + dr["Diet_Type_ID"].ToString() + "'");
        lbldescription.Text = dr["Description"].ToString();
        lbldishtype.Text = con.singlecell("select Dish_Type from DishType where Dish_Type_ID='" + dr["Dish_Type_ID"] + "'");
        lblcuisine.Text = con.singlecell("select Place_Name from dbo.RegionalCuisine where Regional_Cuisine_ID='" + dr["Regional_Cuisine_ID"].ToString() + "' ");
        lblmealinclude.Text = con.singlecell("select Meal_Includes from MealIncludesMaster where Meal_Include_Id='" + dr["Meal_Include_ID"] + "'");

        Repeater1.DataSource = con.select_data("select Dish_Image from ChefDishGallery where Dish_ID='" + Dish_Id + "'");
        Repeater1.DataBind();

        //Repeaterdishtype.DataSource = con.select_data("select Dish_Type from DishType where Dish_Type_ID in(select Dish_Type_ID from ChefDishDishType where Dish_Id='" + Dish_Id + "')");
        //Repeaterdishtype.DataBind();

        DataListingridiant.DataSource = con.select_data("select Ingridiant_Name from IngridiantMaster where Ingridiant_ID in(select Ingridiant_ID from DishIngridiant where Dish_Id='" + Dish_Id + "')");
        DataListingridiant.DataBind();


        repeterReview.DataSource = con.select_data("select RateReviewMaster.*,ConsumerPersonalDetail.* from RateReviewMaster INNER JOIN ConsumerPersonalDetail ON RateReviewMaster.Consumer_ID=ConsumerPersonalDetail.Consumer_ID where RateReviewMaster.Dish_ID='" + Dish_Id + "' ");
        repeterReview.DataBind();

        string ChefID = dr["Chef_ID"].ToString();

        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Chef_ID", ChefID);

        string chefrate = con1.SingleCell("SP_ChefRate_View", p);
        if (chefrate != null && chefrate != "")
        {
            ChefRating.CurrentRating = int.Parse(chefrate);
        }

        else
        {
            ChefRating.CurrentRating = 0;
        }


        lblsourcezipcode.Text = con.singlecell("select Pincode from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
        string fname = con.singlecell("select Chef_Fname from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
        string mname = con.singlecell("select Chef_Mname from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
        string lname = con.singlecell("select Chef_Lname from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
        lblchefname.Text = "Chef" + " " + fname + " " + lname;
        lblarea.Text = con.singlecell("select area from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
        ////lblaboutme.Text = con.singlecell("select Detail from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
        string chfimageurl = con.singlecell("select Photo from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
        if (chfimageurl == "")
        {
            imgchefimage.ImageUrl = "~/templete/image/DChef.png";
        }
        else
        {

            imgchefimage.ImageUrl = "~/Profile_Photo/" + chfimageurl + "";
        }



    }
    protected void btncalculatedeliverycharge_Click(object sender, EventArgs e)
    {

        if (con.check_data("select PinCode from AreaMaster where PinCode='" + txtdestinationzipcode.Text + "'") == true)
        {
            var results1 = cf.GetGeocodingSearchResults(lblsourcezipcode.Text);
            var results2 = cf.GetGeocodingSearchResults(txtdestinationzipcode.Text);

            string distance = ShowResults(results1, lblsourcezipcode.Text, results2, txtdestinationzipcode.Text);

            decimal distancedesimal = decimal.Parse(distance);

            int consumerdistance = (int)Math.Round(distancedesimal);

            // txtdestinationzipcode.Text = consumerdistance.ToString();

            int discountdistance = 4, shippingcharge;

            if (consumerdistance <= discountdistance)
            {
                shippingcharge = 40;
            }
            else
            {
                consumerdistance = consumerdistance - discountdistance;
                shippingcharge = (consumerdistance * 8) + 40;
            }

            //txtdestinationzipcode.Text = shippingcharge.ToString();
            lblshippingcharge.Text = shippingcharge.ToString();
        }
        else
        {
            lblshippingcharge.Text = "Sorry , For this Area we are not Serviceing..";
        }
    }
    public string ShowResults(XElement result1, string zip1, XElement result2, string zip2)
    {
        string loadData = String.Empty;
        var address1 = result1.Element("result").Element("formatted_address").Value;
        var address2 = result2.Element("result").Element("formatted_address").Value;
        double lat1, lat2, lng1, lng2, calcdistance;

        // Get the lat/long info about the address
        var results1 = cf.GetGeocodingSearchResults(address1);
        var results2 = cf.GetGeocodingSearchResults(address2);

        // Set the latitude and longtitude parameters based on the address being searched on
        var lats1 = results1.Element("result").Element("geometry").Element("location").Element("lat").Value;
        var lngs1 = results1.Element("result").Element("geometry").Element("location").Element("lng").Value;
        lat1 = Convert.ToDouble(lats1);
        lng1 = Convert.ToDouble(lngs1);

        var lats2 = results2.Element("result").Element("geometry").Element("location").Element("lat").Value;
        var lngs2 = results2.Element("result").Element("geometry").Element("location").Element("lng").Value;
        lat2 = Convert.ToDouble(lats2);
        lng2 = Convert.ToDouble(lngs2);

        calcdistance = cf.distance(lat1, lng1, lat2, lng2, 'K');
        return calcdistance.ToString();

    }
    protected void btnPlus_Click(object sender, EventArgs e)
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Chef_ID", lblchefid.Text);
        string chefqty = con1.SingleCell("SP_ChefQty_View", p);
        string date = textboxDate.Text;
        if (date == "")
        {
            date = DateTime.Now.ToString();
        }
        SqlParameter[] p1 = new SqlParameter[2];
        p1[0] = new SqlParameter("@Chef_ID", lblchefid.Text);
        p1[1] = new SqlParameter("@OrderDate", DateTime.Parse(date));

        string cartqty = con1.SingleCell("SP_ConsumerDishCartQty_View", p1);
        int chef_qty = int.Parse(chefqty);
        int Cart_qty;
        if (cartqty == "" || cartqty == null)
        {
            Cart_qty = 0;

        }
        else
            Cart_qty = int.Parse(cartqty);
        if (chef_qty > Cart_qty && (chef_qty - Cart_qty) > int.Parse(lblqty.Text))
        {
            int count = int.Parse(lblqty.Text);
            count = count + 1;

            lblqty.Text = count.ToString();
        }
        // lblprice.Text = (int.Parse(lblprice.Text) + int.Parse(lblprice.Text)).ToString();
    }
    protected void btnMinus_Click(object sender, EventArgs e)
    {

        int count = int.Parse(lblqty.Text);
        if (count > 0)
        {
            count = count - 1;
            lblqty.Text = count.ToString();
            // lblprice.Text = (int.Parse(lblqty.Text) * price).ToString();
        }


    }
    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        Dish_Id = en.DecryptString(Request.QueryString.Get("did").ToString());
        BindDishDetail(Dish_Id);
        Response.Redirect("consumer_login.aspx?DishID=" + Dish_Id + "");


    }
    //protected void add_to_cart_master()
    //{
    //    string Cart_ID;
    //    // string Dish_ID = Request.QueryString.Get("did");




    //    if (con.check_data("select * from CartMaster where Consumer_ID='" + Session["Consumer_ID"].ToString() + "' and Dish_Type_ID='" + Dish_Type_ID + "' and Chef_ID='" + ChefID + "'"))
    //    {
    //        Cart_ID = con.singlecell("select MAX(Cart_ID) from CartMaster where Consumer_ID='" + Session["Consumer_ID"].ToString() + "' and Dish_Type_ID='" + Dish_Type_ID + "' and Chef_ID='" + ChefID + "'");
    //    }
    //    else
    //    {
    //        Add_CartMAster(Dish_Id, ChefID, Dish_Type_ID);
    //        Cart_ID = con.singlecell("select MAX(Cart_ID) from CartMaster where Consumer_ID='" + Session["Consumer_ID"].ToString() + "' and Dish_Type_ID='" + Dish_Type_ID + "' and Chef_ID='" + ChefID + "'");
    //    }
    //    if (con.check_data("select * from ConsumerDishCart where Dish_ID='" + Dish_Id + "' and Cart_ID='" + Cart_ID + "'"))
    //    {
    //    }
    //    else
    //    {

    //        SqlParameter[] p = new SqlParameter[3];
    //        p[0] = new SqlParameter("@CartID", Cart_ID);
    //        p[1] = new SqlParameter("@DishID", int.Parse(Dish_Id));
    //        p[2] = new SqlParameter("@Qty", lblqty.Text);
    //        // p[3] = new SqlParameter("@DeliveryCharge",lblshippingcharge.Text);
    //        con1.Ins_Upd_Del("SP_ConsumerDishCart_Insert", p);
    //    }


    //}
    //private void Add_CartMAster(string Dish_ID, string Chef_ID, string Dish_Type_Id)
    //{
    //    SqlParameter[] p = new SqlParameter[5];
    //    p[0] = new SqlParameter("@ConsumerID", Session["Consumer_ID"].ToString());

    //    p[1] = new SqlParameter("@ChefID", int.Parse(Chef_ID));
    //    p[2] = new SqlParameter("@DishTypeID", int.Parse(Dish_Type_Id));
    //    p[3] = new SqlParameter("@OrderDate", DateTime.Parse(textboxDate.Text));
    //    p[4] = new SqlParameter("@Slot", ddlTime.SelectedItem.ToString());
    //    con1.Ins_Upd_Del("SP_ConsumerCartMaster_Insert", p);
    //}
    protected void btnAddToCart_Click1(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }
}