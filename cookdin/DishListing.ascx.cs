using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.IO;
using System.Text;

public partial class DishListing : System.Web.UI.UserControl
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    EncryptionDecryption en = new EncryptionDecryption();

    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    public void Bind_Dish_List(SqlParameter[] p,bool is_chef)
    {
        if (is_chef == false)
        {
            Repeaterdish.DataSource = con1.Select("SP_ConsumerFiltered_DishList", p);
            Repeaterdish.DataBind();
        }
        else
        {
            Repeaterdish.DataSource = con1.Select("SP_ChefDishList_View", p);
            Repeaterdish.DataBind();
        }
        foreach (RepeaterItem item in Repeaterdish.Items)
        {
            Label lblOfferPrice = (Label)item.FindControl("lblOfferPrice");
            Label lblPrice = (Label)item.FindControl("lblPrice");
            Label lblOfferStartDate = (Label)item.FindControl("lblOfferStartDate");
            Label lblOfferEndDate = (Label)item.FindControl("lblOfferEndDate");
            Label lblChefID = (Label)item.FindControl("lblChefID");
            Label lblDishID = (Label)item.FindControl("lblDishID");


 Label lblISVeg = (Label)item.FindControl("lblISVeg");
            Image ImgIsVeg = (Image)item.FindControl("ImgIsVeg");
            if (lblISVeg.Text == "Vegetarian")
            {
                ImgIsVeg.ImageUrl = "~/templete/image/sveg.png";
            }
            else
            {
                ImgIsVeg.ImageUrl = "~/templete/image/snveg.png";
            }
            AjaxControlToolkit.Rating ChefRating = (AjaxControlToolkit.Rating)item.FindControl("ChefRating");
            AjaxControlToolkit.Rating DishRating = (AjaxControlToolkit.Rating)item.FindControl("DishRating");
            string today = DateTime.Now.ToString();
            string start = lblOfferStartDate.Text;
            string end = lblOfferEndDate.Text;
            Image dishimg = (Image)item.FindControl("imgdish");

            if (dishimg.ImageUrl == "")
            {
                dishimg.ImageUrl = "~/templete/image/ico/default-dish.jpg";
            }


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