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


public partial class Consumer_homepage : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    Myconnection con = new Myconnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Order HomeCooked Meals from Real Homes - Cook'dIn";
        if (!IsPostBack)
        {

            //Update Page Title 

            // ModalPopupExtender1.Show();
            Check_USerID_Exist();
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


    private void Check_USerID_Exist()
    {
        if (Session["Consumer_ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        else
        {
            lblusername.Text = Session["Consumer_UserName"].ToString();
            lblcartcount.Text = con.singlecell("SELECT count(ConsumerDishCart.ConsumerDishCart_ID) FROM  dbo.CartMaster INNER JOIN ConsumerDishCart ON dbo.CartMaster.Cart_ID = ConsumerDishCart.Cart_ID and CartMaster.Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");
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
        Repeaterdishtype.DataSource = con1.Select("SP_DishTypeMaster_View");
        Repeaterdishtype.DataBind();
    }
    private void Bind_Dish_List()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@Mode", 1);
        Repeaterdish.DataSource = con1.Select("SP_ConsumerFiltered_DishList", p);
        Repeaterdish.DataBind();

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
                ImgIsVeg.ImageUrl = "../templete/image/sveg.png";
            }
            else
            {
                ImgIsVeg.ImageUrl = "../templete/image/snveg.png";
            }

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
    private void Bind_PopUp_detail()
    {
        ddlarea.DataSource = con1.Select("SP_Area_View");
        ddlarea.DataTextField = "Area_Name";
        ddlarea.DataValueField = "Area_ID";
        ddlarea.DataBind();
        ddlarea.Items.Insert(0, "Area");
    }
    public void Bind_Paramiterwise_DishList(string date, string dishtype)
    {
        DateTime selecteddate = DateTime.ParseExact(date, "dd/MM/yyyy", null);

        SqlParameter[] p = new SqlParameter[3];

        //if (DateTime.Parse(date) == DateTime.Now.Date && dishtype == "")
        //{
        //    p[0] = new SqlParameter("@Mode", "1");
        //}
        //else if (DateTime.Parse(date) == DateTime.Now.Date && dishtype != "")
        //{
        //    p[0] = new SqlParameter("@Mode","2");
        //}
        //else if (DateTime.Parse(date) != DateTime.Now.Date && dishtype == "")
        //{
        //    p[0] = new SqlParameter("@Mode", "3");
        //}
        //else if (DateTime.Parse(date) != DateTime.Now.Date && dishtype != "")
        //{
        //    p[0] = new SqlParameter("@Mode", "4");
        //}
        //p[1] = new SqlParameter("@date", DateTime.Parse(date).Date);
        //p[2] = new SqlParameter("@DishType",dishtype);


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


        Repeaterdish.DataSource = con1.Select("SP_ConsumerFiltered_DishList", p);
        Repeaterdish.DataBind();
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