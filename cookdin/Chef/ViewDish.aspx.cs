using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;
using System.Security.Cryptography;
using System.IO;
using System.Text;

public partial class Chef_ViewDish : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    commonfunctions cf = new commonfunctions();
    EncryptionDecryption en = new EncryptionDecryption();
    int price;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Check_USerID_Exist();
          
            string querystrng = Request.QueryString.Get("did").ToString();

            querystrng = querystrng.Replace(" ", "+");

            string Dish_Id = en.DecryptString(querystrng.Trim());

          //  string Dish_Id = Request.QueryString.Get("did").ToString();

            if (Dish_Id == "" || Dish_Id == null)
            {
                Response.Redirect("MyProfile.aspx");
            }
            else
            {
                BindDishDetail(Dish_Id);
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
    private void BindDishDetail(string Dish_Id)
    {
        DataRow dr = con.singlerow("select * from ChefDishMaster where Dish_ID='" + Dish_Id + "'");

        lbldishname.Text = dr["Dish_Name"].ToString();
        lblprice.Text = dr["price"].ToString();
        lblOfferPrice.Text = dr["SpecialOfferPrice"].ToString();
        string today = DateTime.Now.ToString();
        string start = dr["OfferStartDate"].ToString();
        string end = dr["OfferEndDate"].ToString();
        lblmealinclude.Text = con.singlecell("select Meal_Includes from MealIncludesMaster where Meal_Include_Id='" + dr["Meal_Include_ID"] + "'");
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
        lbldiettype.Text = con.singlecell("select Diet_Type from DietTypeMaster where Diet_Type_ID='" + dr["Diet_Type_ID"].ToString() + "'");
        lbldescription.Text = dr["Description"].ToString();

        Repeater1.DataSource = con.select_data("select Dish_Image from ChefDishGallery where Dish_ID='" + Dish_Id + "'");
        Repeater1.DataBind();

        Repeaterdishtype.DataSource = con.select_data("select Dish_Type from DishType where Dish_Type_ID in(select Dish_Type_ID from ChefDishDishType where Dish_Id='" + Dish_Id + "')");
        Repeaterdishtype.DataBind();

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

        lblchefid.Text = ChefID;
        //lblsourcezipcode.Text = con.singlecell("select Pincode from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
        string fname = con.singlecell("select Chef_Fname from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
        string mname = con.singlecell("select Chef_Mname from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
        string lname = con.singlecell("select Chef_Lname from ChefPersonalDetail where Chef_ID='" + ChefID + "'");
        lblchefname.Text ="Chef"+"  "+ fname + " " + lname;
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
     //   imgchefimage.ImageUrl = "~/Profile_Photo/" + chfimageurl + "";
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