using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using System.Security.Cryptography;
using System.IO;
using System.Text;

public partial class Chef_MyProfile : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Check_USerID_Exist();
          //  Bind_Order(DateTime.Now.ToString("dd/MM/yyyy"));
            Bind_Order(DateTime.Now.Date);
            Bind_Personal_Detail();
            Bind_DishList();
        }
    }

    private void Bind_DishList()
    {
       // SqlParameter[] p = new SqlParameter[1];
        //p[0] = new SqlParameter("@ChefID", Session["Chef_ID"].ToString());
        //UserInformation.Bind_Dish_List(p,true);

        SqlParameter[] p1 = new SqlParameter[1];
        p1[0] = new SqlParameter("@ChefID", Session["Chef_ID"].ToString());
        Repeaterdish.DataSource = con1.Select("SP_ChefDishList_View", p1);
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
            SqlParameter[] p3 = new SqlParameter[1];
            p3[0] = new SqlParameter("@Chef_ID", ChefID);

            string chefrate = con1.SingleCell("SP_ChefRate_View", p3);
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

    private void Bind_Personal_Detail()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Chef_ID", Session["Chef_ID"]);

        DataRow dr = con1.SingleRow("SP_PerticularChef_View", p);
        string fname = dr["Chef_Fname"].ToString();
        string mname = dr["Chef_Mname"].ToString();
        string lname = dr["Chef_Lname"].ToString();

        lblname.Text =  fname + " " + lname;

        lblUserName.Text = Session["Chef_UserName"].ToString();
        lblDescription.Text = dr["Detail"].ToString();
        lblNoOfDishes.Text = con.singlecell("select count(*) from ChefDishMaster where Chef_ID='"+Session["Chef_ID"]+"'");
        lblNoOfReviews.Text = con.singlecell("select count(*) from RateReviewMaster where Dish_ID in (select Dish_ID from ChefDishMaster where Chef_ID='" + Session["Chef_ID"] + "')");

        if (dr["Photo"].ToString() == "")
        {
            ProfilePhoto.ImageUrl = "~/templete/image/DChef.png";
        }
        else
        {
            ProfilePhoto.ImageUrl = "~/Profile_Photo/" + dr["Photo"].ToString();
        }
    }

    private void Check_USerID_Exist()
    {
        if (Session["Chef_ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void btnEditProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Chef/EditPro.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Chef/ListDish.aspx");
    }
    //public void Bind_Order(string deliverydate)
         public void Bind_Order(DateTime deliverydate)
    {

        SqlParameter[] p1 = new SqlParameter[2];
      //  p1[0] = new SqlParameter("@Order_Delivery_Date", DateTime.Parse(deliverydate));
        p1[0] = new SqlParameter("@Order_Delivery_Date", deliverydate);
        p1[1] = new SqlParameter("@Chef_ID", Session["Chef_ID"]);
        DataList1.DataSource = con1.Select("SP_ChefOrder_View", p1);
        DataList1.DataBind();

        // DataList1.DataSource = con.select_data("SELECT OrderMaster.Order_Date, guest.OrderDish.Slot, guest.OrderDish.Qty, guest.OrderDish.Order_Delivery_Date, dbo.ChefDishMaster.Dish_Name, dbo.ChefDishMaster.Chef_UserName, dbo.ChefDishGallery.Dish_Image,  dbo.ChefDishMaster.Price,(guest.OrderDish.Qty*dbo.ChefDishMaster.Price) as totPrice FROM guest.OrderDish INNER JOIN dbo.OrderMaster ON guest.OrderDish.Order_ID = dbo.OrderMaster.Order_ID INNER JOIN dbo.ChefDishMaster ON guest.OrderDish.Dish_ID = dbo.ChefDishMaster.Dish_ID INNER JOIN dbo.ChefDishGallery ON dbo.ChefDishMaster.Dish_ID = dbo.ChefDishGallery.Dish_ID where  ChefDishGallery.Is_Defualt='true'  AND guest.OrderDish.Chef_ID='"+Session["Chef_ID"].ToString()+"'");
        //  DataList1.DataBind();
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Label id = (Label)e.Item.FindControl("lblid");

        if (e.CommandName == "cooked")
        {
            //mode 1 for Cooked

            SqlParameter[] p1 = new SqlParameter[2];
            p1[0] = new SqlParameter("@InvoiceDish_ID", int.Parse(id.Text));
            p1[1] = new SqlParameter("@Mode", 1);
            con1.Ins_Upd_Del("SP_DishCookingStatus_Edit", p1);
        }
        else
        { 
        //Mode 2 ready for Pickup

            SqlParameter[] p1 = new SqlParameter[2];
            p1[0] = new SqlParameter("@InvoiceDish_ID", int.Parse(id.Text));
            p1[1] = new SqlParameter("@Mode", 2);
            con1.Ins_Upd_Del("SP_DishCookingStatus_Edit", p1);
        }

       // Bind_Order(DateTime.Now.ToString("dd/MM/yyyy"));

        Bind_Order(DateTime.Now.Date);


        
       
    }

    private const string initVector = "pemgail9uzpgzl88";
    // This constant is used to determine the keysize of the encryption algorithm.
    private const int keysize = 256;
    //Encrypt
    public string EncryptString(string plainText)
    {
        string passPhrase = "c00ked!n";
        byte[] initVectorBytes = Encoding.UTF8.GetBytes(initVector);
        byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
        PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
        byte[] keyBytes = password.GetBytes(keysize / 8);
        RijndaelManaged symmetricKey = new RijndaelManaged();
        symmetricKey.Mode = CipherMode.CBC;
        ICryptoTransform encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);
        MemoryStream memoryStream = new MemoryStream();
        CryptoStream cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write);
        cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
        cryptoStream.FlushFinalBlock();
        byte[] cipherTextBytes = memoryStream.ToArray();
        memoryStream.Close();
        cryptoStream.Close();
        return Convert.ToBase64String(cipherTextBytes);
    }

}