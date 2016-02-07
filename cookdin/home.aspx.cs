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

public partial class home : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    Myconnection con = new Myconnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ReadCookie();
            Bind_Dish_List();
            Bind_PopUp_detail();


            Bind_Dish_Type();
            Bind_dates();

            if (Request.QueryString.Get("id") != null)
            {
                DishType_QueryString();
            }
            else
            {
                Bind_Dish_List();
            }
        }
    }
    private void Bind_dates()
    {
        btnfirst.Text = DateTime.Now.DayOfWeek.ToString().Substring(0, 3) + "&nbsp;-&nbsp;" + DateTime.Now.ToString("dd MMM");
        lblfirstdate.Text = DateTime.Now.ToString("dd/MM/yyyy");

        btnsecond.Text = DateTime.Now.AddDays(1).DayOfWeek.ToString().Substring(0, 3) + "&nbsp;-&nbsp;" + DateTime.Now.AddDays(1).ToString("dd MMM");
        lblseconddate.Text = DateTime.Now.AddDays(1).ToString("dd/MM/yyyy");

        btnthird.Text = DateTime.Now.AddDays(2).DayOfWeek.ToString().Substring(0, 3) + "&nbsp;-&nbsp;" + DateTime.Now.AddDays(2).ToString("dd MMM");
        lblthirddate.Text = DateTime.Now.AddDays(2).ToString("dd/MM/yyyy");

        btnforth.Text = DateTime.Now.AddDays(3).DayOfWeek.ToString().Substring(0, 3) + "&nbsp;-&nbsp;" + DateTime.Now.AddDays(3).ToString("dd MMM");
        lblforthdate.Text = DateTime.Now.AddDays(3).ToString("dd/MM/yyyy");

        btnfifth.Text = DateTime.Now.AddDays(4).DayOfWeek.ToString().Substring(0, 3) + "&nbsp;-&nbsp;" + DateTime.Now.AddDays(4).ToString("dd MMM");
        lblfifthdate.Text = DateTime.Now.AddDays(4).ToString("dd/MM/yyyy");

        btnsix.Text = DateTime.Now.AddDays(5).DayOfWeek.ToString().Substring(0, 3) + "&nbsp;-&nbsp;" + DateTime.Now.AddDays(5).ToString("dd MMM");
        lblsixdate.Text = DateTime.Now.AddDays(5).ToString("dd/MM/yyyy");

        btnseven.Text = DateTime.Now.AddDays(6).DayOfWeek.ToString().Substring(0, 3) + "&nbsp;-&nbsp;" + DateTime.Now.AddDays(6).ToString("dd MMM");
        lblsevendate.Text = DateTime.Now.AddDays(6).ToString("dd/MM/yyyy");

    }
    private void Bind_Dish_Type()
    {
        //Repeaterdishtype.DataSource = con1.Select("SP_DishTypeMaster_View");
        Repeaterdishtype.DataSource = con1.Select("SP_DishTypeMaster_View");
        Repeaterdishtype.DataBind();
    }
    private void Bind_Dish_List()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Mode", 1);
        UserInformation.Bind_Dish_List(p,false);
    }
    private void Bind_PopUp_detail()
    {
      SqlParameter[] sqlPara = new SqlParameter[1];
        sqlPara[0] = new SqlParameter("@IsAreaServiced", true);
        ddlarea.DataSource = con1.Select("SP_Area_View",sqlPara);
        ddlarea.DataTextField = "Area_Name";
        ddlarea.DataValueField = "Area_ID";
        ddlarea.DataBind();
        ddlarea.Items.Insert(0, "Area");
    }
    public void Bind_Paramiterwise_DishList(string date, string dishtype)
    {
        DateTime selecteddate = DateTime.ParseExact(date, "dd/MM/yyyy", null);

        SqlParameter[] p = new SqlParameter[3];

        if (selecteddate == DateTime.Now.Date && dishtype == "")
        {
            p[0] = new SqlParameter("@Mode", "1");
        }
        else if (selecteddate == DateTime.Now.Date && dishtype != "")
        {
            p[0] = new SqlParameter("@Mode", "2");
        }
        else if (selecteddate != DateTime.Now.Date && dishtype == "")
        {
            p[0] = new SqlParameter("@Mode", "3");
        }
        else if (selecteddate != DateTime.Now.Date && dishtype != "")
        {
            p[0] = new SqlParameter("@Mode", "4");
        }
        p[1] = new SqlParameter("@date", selecteddate.Date);
        p[2] = new SqlParameter("@DishType", dishtype);

        UserInformation.Bind_Dish_List(p,false);
    }

    protected void btnfirst_Click(object sender, EventArgs e)
    {
        lblselecteddate.Text = btnfirst.Text;
        lblselect.Text = lblfirstdate.Text;
        Bind_Paramiterwise_DishList(lblfirstdate.Text, lbldishtypeid.Text);
    }
    protected void btnsecond_Click(object sender, EventArgs e)
    {
        lblselecteddate.Text = btnsecond.Text;
        lblselect.Text = lblseconddate.Text;
        Bind_Paramiterwise_DishList(lblseconddate.Text, lbldishtypeid.Text);
    }
    protected void btnthird_Click(object sender, EventArgs e)
    {
        lblselecteddate.Text = btnthird.Text;
        lblselect.Text = lblthirddate.Text;
        Bind_Paramiterwise_DishList(lblthirddate.Text, lbldishtypeid.Text);
    }
    protected void btnforth_Click(object sender, EventArgs e)
    {
        lblselecteddate.Text = btnforth.Text;
        lblselect.Text = lblforthdate.Text;
        Bind_Paramiterwise_DishList(lblforthdate.Text, lbldishtypeid.Text);
    }
    protected void btnfifth_Click(object sender, EventArgs e)
    {
        lblselecteddate.Text = btnfifth.Text;
        lblselect.Text = lblfifthdate.Text;
        Bind_Paramiterwise_DishList(lblfifthdate.Text, lbldishtypeid.Text);
    }
    protected void btnsix_Click(object sender, EventArgs e)
    {
        lblselecteddate.Text = btnsix.Text;
        lblselect.Text = lblsixdate.Text;
        Bind_Paramiterwise_DishList(lblsixdate.Text, lbldishtypeid.Text);
    }
    protected void btnseven_Click(object sender, EventArgs e)
    {
        lblselecteddate.Text = btnseven.Text;
        lblselect.Text = lblsevendate.Text;
        Bind_Paramiterwise_DishList(lblsevendate.Text, lbldishtypeid.Text);
    }

    public void DishType_QueryString()
    {
        lbldishtypeid.Text = Request.QueryString.Get("id");
        lbldishname.Text = con.singlecell("select Dish_Type from DishType where Dish_Type_ID='" + lbldishtypeid.Text + "'");

        if (Request.QueryString.Get("date") != null && Request.QueryString.Get("date") != "")
        {
            Bind_Paramiterwise_DishList(Request.QueryString.Get("date"), Request.QueryString.Get("id"));
        }
        else
        {
            Bind_Paramiterwise_DishList(DateTime.Now.ToString(), Request.QueryString.Get("id"));
        }
    }
    protected void ddlarea_SelectedIndexChanged(object sender, EventArgs e)
    {
        string cookiesvalue;
        if (ddlarea.SelectedIndex != 0)
        {
            btnlocation.Text = ddlarea.SelectedItem.ToString();
            Session["loction"] = ddlarea.SelectedItem.ToString();
            cookiesvalue = ddlarea.SelectedItem.ToString();
        }
        else
        {
            btnlocation.Text = "Pick Your Location";
            cookiesvalue = "Pick Your Location";
        }

        WriteClicked(cookiesvalue);
    }
    protected void btnlocation_Click(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
    }

    public void WriteClicked(string value)
    {
        //Create a new cookie, passing the name into the constructor
        HttpCookie cookie = new HttpCookie("CLocation");

        //Set the cookies value
        cookie.Value = value;

        //Set the cookie to expire in 1 minute
        DateTime dtNow = DateTime.Now;
        TimeSpan tsMinute = new TimeSpan(0, 0, 1, 0);
        // cookie.Expires = dtNow + tsMinute;

        cookie.Expires = DateTime.Now.AddDays(30);

        //Add the cookie
        Response.Cookies.Add(cookie);

        // Response.Write("Cookie written. <br><hr>");
    }

    protected void ReadCookie()
    {
        //Get the cookie name the user entered
        String strCookieName = "CLocation";

        //Grab the cookie
        HttpCookie cookie = Request.Cookies[strCookieName];

        //Check to make sure the cookie exists
        if (cookie == null)
        {
            ModalPopupExtender1.Show();
        }
        else
        {
            String strCookieValue = cookie.Value.ToString();

            if (strCookieValue == "Pick Your Location")
            {
                ModalPopupExtender1.Show();
            }
            else
            {
                ModalPopupExtender1.Hide();
            }

            btnlocation.Text = strCookieValue;
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