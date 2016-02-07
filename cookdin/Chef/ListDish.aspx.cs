using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.IO;
using System.Text;



public partial class Chef_ListDish : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    Myconnection con = new Myconnection();
    EncryptionDecryption en = new EncryptionDecryption();

    string eid, did,vid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Check_USerID_Exist();
           // Session["Chef_ID"] = "1";

            //SqlParameter[] p = new SqlParameter[1];

            //p[0] = new SqlParameter("@ChefID", Session["Chef_ID"].ToString());
            //Repeater1.DataSource = con1.Select("SP_ChefDishMaster_View", p);
            //Repeater1.DataBind();
            Repeater1.DataSource = con.select_data("select ChefDishMaster.*,ChefDishGallery.* from ChefDishMaster Inner Join ChefDishGallery ON ChefDishGallery.Dish_ID=ChefDishMaster.Dish_ID where ChefDishGallery.Is_Defualt='True' and ChefDishMaster.Chef_ID='"+Session["Chef_ID"].ToString()+"'");
            Repeater1.DataBind();


            eid =Request.QueryString.Get("eid");
            did = Request.QueryString.Get("did");
            if (did != null)
            {
                diable_Dish(en.DecryptString(did));
            }
            else if (eid != null)
            {
               ///////// edit_Area(eid);
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
    private void diable_Dish(string id)
    {
        //SqlParameter[] p = new SqlParameter[2];
        //p[0] = new SqlParameter("@AreaId", id);
        //p[1] = new SqlParameter("@Mode", 1);
        //con1.Ins_Upd_Del("SP_Area_Edit", p);
        if (con.check_data("Select * from ChefDishMaster where Dish_ID='" + id + "' and Enable='Enable'"))
        {
            con.update_data("update ChefDishMaster set Enable='Disable' where Dish_ID='" + id + "'");
        }
        else
        {
            con.update_data("update ChefDishMaster set Enable='Enable' where Dish_ID='" + id + "'");
        }
        Redirect();

    }
    private void Redirect()
    {
        Response.Redirect("~/Chef/ListDish.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Chef/add_New_Dish.aspx");
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