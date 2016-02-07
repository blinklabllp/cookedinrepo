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


public partial class DishList : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    //EncryptionDecryption en = new EncryptionDecryption();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            string dishtypeid = Request.QueryString.Get("did");

            if (dishtypeid == null)
            {
                Bind_DishList();
            }
            else
            {
                Bind_DishList_parameterwise();
            }

        }
    }
  

    private void Bind_DishList()
    {
        string dishtypeid = Request.QueryString.Get("did");

        Repeaterdish.DataSource = con1.Select("SP_ConsumerDishList_View");
        Repeaterdish.DataBind();

       
        foreach (RepeaterItem item in Repeaterdish.Items)
        {
        
        
            Label lblOfferPrice = (Label)item.FindControl("lblOfferPrice");
            Label lblPrice = (Label)item.FindControl("lblPrice");
            Label lblOfferStartDate = (Label)item.FindControl("lblOfferStartDate");
            Label lblOfferEndDate = (Label)item.FindControl("lblOfferEndDate");
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

           
        }
    }

    private void Bind_DishList_parameterwise()
    {

        SqlParameter[] p = new SqlParameter[1];

        p[0] = new SqlParameter("@DishTypeID", Request.QueryString.Get("did"));
        Repeaterdish.DataSource = con1.Select("SP_Consumer_DishList_view_ParameterWise", p);
        Repeaterdish.DataBind();

        foreach (RepeaterItem item in Repeaterdish.Items)
        {
            Label lblOfferPrice = (Label)item.FindControl("lblOfferPrice");
            Label lblPrice = (Label)item.FindControl("lblPrice");
            Label lblOfferStartDate = (Label)item.FindControl("lblOfferStartDate");
            Label lblOfferEndDate = (Label)item.FindControl("lblOfferEndDate");
            string today = DateTime.Now.ToString();
            string start = lblOfferStartDate.Text;
            string end = lblOfferEndDate.Text;

            if (!(DateTime.Parse(today) > DateTime.Parse(start) && DateTime.Parse(today) < DateTime.Parse(end)))
            {
                lblPrice.Visible = false;
                lblOfferPrice.Text = lblPrice.Text;
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