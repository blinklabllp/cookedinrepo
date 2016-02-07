using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Net;

public partial class signup : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    EncryptionDecryption en = new EncryptionDecryption();
    public static string password;

    //TODO: Remove as its never used.
    string profile, UserName, Password;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
          //  Page.Title = "HomeChef Signup - Cook'dIn";
            MultiView1.ActiveViewIndex = 0;

            dateofbirth();
//  fillrecord();
//  ddlarea.DataSource = con1.Select("Sp_Area_View");
 ddlarea.DataSource = con1.Select("SPH_Area_View");
            ddlarea.DataTextField = "Area_Name";
            ddlarea.DataValueField = "Area_ID";
            
            ddlarea.DataBind();
            ddlarea.Items.Insert(0, "Area");
            

            ddlcity.DataSource = con1.Select("Sp_City_View");
            ddlcity.DataTextField = "City_Name";
            ddlcity.DataValueField = "City_ID";
            
            ddlcity.DataBind();
            ddlcity.Items.Insert(0, "City");
           // ddlarea.Items.Insert(0,"Area");
           // ddlcity.Items.Insert(0,"City");


          
        }
    }

    protected void Chkagree_CheckedChanged(object sender, EventArgs e)
    {
        if (Chkagree.Checked == true)
        {
            btniagreenext.Enabled = true;
        }
        else
        {
            btniagreenext.Enabled = false;
        }
    }
    public void dateofbirth()
    {
        for (int i = 1; i <= 31; i++)
        {
            ddldate.Items.Add(i.ToString());
        }
        for (int i = 1; i <= 12; i++)
        {
            ddlmonth.Items.Add(i.ToString());
        }
       
        int year = int.Parse(DateTime.Now.ToString("yyyy"));
        year = year - 18;
        for (int i = year; i >= 1950; i--)
        {
            ddlyear.Items.Add(i.ToString());
        }

    }
    public void fillrecord()
    {
        txtfname.Text = "Hemant Oberoi";
        txtmname.Text = "o";
        txtlname.Text = "Oberoi";
        txtemailid.Text = "hemantoberoi@gmail.com";
        txtUsername.Text = "hemantoberoi";
        txtPwd.Text = "12345";
        txtmobile.Text = "9999999999";
        txtphone.Text = "999999999";
       // txtdob.Text = "3/19/1964";
      //  txtgender.Text = "Male";
        txtapartment.Text = "Apart 5";
        txtblockno.Text = "Block A";
        txtPinCode.Text = "382406";
        txtsociatyname.Text = "New PC Sociaty";
        txtlandmark.Text = "Near School";
        txtaboutme.Text = "Executive Chef Hemant Oberoi is a legend at the Taj. He is the quintessential culinary personality and has been the personal chef to Prime Ministers and Presidents. In his 30 years experience he has pioneered numerous culinary concepts and a seat in his Chef's Studio is a coveted gastronomic coup";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
     //   pnlwarning.Visible = true;

        //if (ddlarea.SelectedIndex == 0)
        //{
        //    ddlarea.BorderColor = System.Drawing.Color.Red;
        //}
        //if (ddlcity.SelectedIndex == 0)
        //{
        //    ddlcity.BorderColor = System.Drawing.Color.Red;
        //}

        if (con.check_data("select * from ChefPersonalDetail where Chef_UserName='" + txtUsername.Text + "'"))
        {
                txtUsername.BorderColor = System.Drawing.Color.Red;
                txtemailid.BorderColor = txtfname.BorderColor;
                pnlwarning.Visible = true;
                lblwarningmessage.Text = "UserName Already In Used.";
        }
        else if (con.check_data("select * from ChefPersonalDetail where  Email_ID='" + txtemailid.Text + "'"))
        {
            pnlwarning.Visible = true;
            txtUsername.BorderColor = txtfname.BorderColor;
            txtemailid.BorderColor = System.Drawing.Color.Red;
            lblwarningmessage.Text = "EmailId Already In Used.";
        }



        else
        {
            try
            {
                Session["Password"] = txtPwd.Text;
                Session["img"] = Addphoto(FileUpload1);
                string p = Session["Password"].ToString();
                string i = Session["img"].ToString();
                txtUsername.BorderColor = txtfname.BackColor;
                MultiView1.ActiveViewIndex = 1;

            }
            catch (Exception ex)
            {

                txtUsername.BorderColor = txtfname.BorderColor;
                MultiView1.ActiveViewIndex = 1;
            }
        }

        
      //  string id = con.singlecell("select max(Chef_ID) from ChefPersonalDetail");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["hfnational"]=Request.Form[hfnational.UniqueID];
        Session["hfdishtype"]=Request.Form[hfdishtype.UniqueID];
        MultiView1.ActiveViewIndex = 3;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Session["oil"] = Request.Form[hfcookingoil.UniqueID];
        Session["hfdietType"] = Request.Form[hfdiettype.UniqueID];
        MultiView1.ActiveViewIndex = 4;
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 6;
    }
    protected void btntimeofmealprevious_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void btnprefrredprevious_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
    protected void btncookingoilprevious_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
    }
    protected void btnfinancilaprevious_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
    }
    protected void btnaboutmeprevious_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 4;
    }
    protected void btniagreepre_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btniagreenext_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
    private void add_Personal()
    {
        string img="";
       string Pwd=Session["Password"].ToString();
    
        if (Session["img"] != null)
       {
           img = Session["img"].ToString();
       }
        SqlParameter[] p = new SqlParameter[20];

        string dateofbirth = ddldate.SelectedValue + "/" + ddlmonth.SelectedValue + "/" + ddlyear.SelectedValue; 
     
        p[0] = new SqlParameter("@Photo",img );
        p[1] = new SqlParameter("@Chef_Fname", txtfname.Text);
        p[2] = new SqlParameter("@Chef_Mname", txtmname.Text);
        p[3] = new SqlParameter("@Chef_Lname", txtlname.Text);
        //p[4] = new SqlParameter("@DOB", txtdob.Text);
        p[4] = new SqlParameter("@DOB", dateofbirth);
        //p[5] = new SqlParameter("@Gender", txtgender.Text);
        p[5] = new SqlParameter("@Gender", rdogender.SelectedValue);
        p[6] = new SqlParameter("@House", txtapartment.Text);
        p[7] = new SqlParameter("@Block", txtblockno.Text);
        p[8] = new SqlParameter("@Society", txtsociatyname.Text);
        p[9] = new SqlParameter("@Area", ddlarea.SelectedItem.ToString());
        p[10] = new SqlParameter("@City", ddlcity.SelectedItem.ToString());
        p[11] = new SqlParameter("@LandMark", txtlandmark.Text);
        p[12] = new SqlParameter("@Email", txtemailid.Text);
        p[13] = new SqlParameter("@Mobile", txtmobile.Text);
        p[14] = new SqlParameter("@Contact", txtphone.Text);
        p[15] = new SqlParameter("@User_Name", txtUsername.Text);
        p[16] = new SqlParameter("@Password",en.EncryptString(Pwd));
        p[17] = new SqlParameter("@Description", txtaboutme.Text);
        p[18] = new SqlParameter("@MealQuantity",txtqty.Text);
        p[19] = new SqlParameter("@Pincode", txtPinCode.Text);
        con1.Ins_Upd_Del("SP_Chef_Insert", p);
    }
    private void add_CommunicationHours()
    {
        
             foreach (ListItem item in chkpreferred.Items)
        {
            if (item.Selected)
            {
                SqlParameter[] p = new SqlParameter[2];

                p[0] = new SqlParameter("@ChefUserName", txtUsername.Text);
                p[1] = new SqlParameter("@ComID", item.Text);

                con1.Ins_Upd_Del("SP_ChefCommunicationHours_Insert", p);
            }
        }
        
    }
    private void add_DietType()
    {

        char[] delimiterChars = { ',' };

        string DietTypeIDs = Session["hfdietType"].ToString();
        string[] DietType = DietTypeIDs.Split(delimiterChars);

        if (DietTypeIDs != "" || DietTypeIDs != " ")
        {

            foreach (string dt in DietType)
            {
               // Response.Write("Diet Type=" + dt);
                if (dt == "" || dt == null || dt == " ")
                {
                    break;
                }
                else
                {
                    SqlParameter[] p = new SqlParameter[2];

                    p[0] = new SqlParameter("@ChefUserName", txtUsername.Text);
                    p[1] = new SqlParameter("@DietTypeID", int.Parse(dt));

                    con1.Ins_Upd_Del("SP_ChefDietType_Insert", p);
                }
            }
        }
       

    }
    private void add_FinacialDetail(string id)
    {
        SqlParameter[] p = new SqlParameter[9];

        p[0] = new SqlParameter("@ChefUserName", txtUsername.Text);
        p[1] = new SqlParameter("@AccountNo", txtaccountno.Text);
        p[2] = new SqlParameter("@ActHolderName", txtacno.Text);
        p[3] = new SqlParameter("@BankName", txtbankname.Text);
        p[4] = new SqlParameter("@BranchName", txtbranchname.Text);
        p[5] = new SqlParameter("@MICR", txtmicrcode.Text);
        p[6] = new SqlParameter("@ChefID", id);
        p[7] = new SqlParameter("@BranchCode", txtmicrcode.Text);
        p[8] = new SqlParameter("@IFSC", txtmicrcode.Text);
        con1.Ins_Upd_Del("SP_ChefFinancialDetail_Insert", p);
    }
    private void add_RegionalCuisine()
    {

        char[] delimiterChars = { ',' };

        string nationalIds = Session["hfnational"].ToString();
        string[] nationalcuisine = nationalIds.Split(delimiterChars);

        if (nationalIds != "" || nationalIds != " ")
        {

            foreach (string nc in nationalcuisine)
            {
                //Response.Write("national=" + nc);
                if (nc == "" || nc == null || nc == " ")
                {
                    break;
                }
                else
                {
                    SqlParameter[] p = new SqlParameter[2];

                    p[0] = new SqlParameter("@ChefUserName", txtUsername.Text);
                    p[1] = new SqlParameter("@CusinieID", int.Parse(nc));

                    con1.Ins_Upd_Del("SP_ChefRegionalCuisine_Insert", p);
                }
            }
        }


        //string internationalIds = Session["hfinternational"].ToString();
        //string[] internationalcuisine = internationalIds.Split(delimiterChars);


        //if (internationalIds != "" || internationalIds != " ")
        //{
        //    foreach (string inc in internationalcuisine)
        //    {
        //        //Response.Write("internatinal=" + inc);
        //        if (inc == "" || inc == null || inc == " ")
        //        {
        //            break;
        //        }
        //        else
        //        {
        //            SqlParameter[] p = new SqlParameter[2];

        //            p[0] = new SqlParameter("@ChefUserName", txtUsername.Text);
        //            p[1] = new SqlParameter("@CusinieID", int.Parse(inc));

        //            con1.Ins_Upd_Del("SP_ChefRegionalCuisine_Insert", p);
        //        }

        //    }
        //}
    }
    private void add_DishType()
    {
        char[] delimiterChars = { ',' };

        string dishIds = Session["hfdishtype"].ToString();
        string[] dishtype = dishIds.Split(delimiterChars);

        if (dishIds != "" || dishIds != " ")
        {

            foreach (string dt in dishtype)
            {
               // Response.Write("Dishtype=" + dt);
                if (dt == "" || dt == null || dt == " ")
                {
                    break;
                }
                else
                {
                    SqlParameter[] p = new SqlParameter[2];

                    p[0] = new SqlParameter("@ChefUserName", txtUsername.Text);
                    p[1] = new SqlParameter("@DishTypeID", int.Parse(dt));

                    con1.Ins_Upd_Del("SP_ChefDishType_Insert", p);
                }
            }
        }

    }
    private void add_Oil()
    {

        char[] delimiterChars = { ',' };

        string OilIds = Session["oil"].ToString();
        string[] Oils = OilIds.Split(delimiterChars);

        if (OilIds != "" || OilIds != " ")
        {

            foreach (string oil in Oils)
            {
               // Response.Write("TimeOfPreparation=" + oil);
                if (oil == "" || oil == null || oil == " ")
                {
                    break;
                }
                else
                {
                    SqlParameter[] p = new SqlParameter[2];

                    p[0] = new SqlParameter("@ChefUserName", txtUsername.Text);
                    p[1] = new SqlParameter("@oil", int.Parse(oil));

                    con1.Ins_Upd_Del("SP_ChefOilUsed_Insert", p);
                }
            }
        }

    }
    public string Addphoto(FileUpload Photo)
    {
        if ((Photo.FileName) != "")
        {
            string ext = Path.GetExtension(Photo.FileName);
            int index = Photo.FileName.IndexOf('.');
            string filename = Photo.FileName.Substring(0, index) + Session.SessionID + ext;
            string path = Server.MapPath("~/Profile_Photo/" + filename + "");
            Photo.SaveAs(path);
            return filename;
        }
        else
            return null;
    }
    protected void btnregistration_Click(object sender, EventArgs e)
    {
        Final_total_registration();
    }
    public void sending_Mail(string user)
    {
        try
        {
            string encry = en.EncryptString(user);
            string activeurl = "http://cookedin.com/uservarification.aspx?flag=0&Varification=" + encry + "";
            string subject = "Welcome to Cook'dIn - Please verify your account.";
            string body = "Dear " + txtUsername.Text + ",<br/><br/>" +
                                "Welcome to Cook'dIn<br/><br/>" +
                                "Congratulations! You are one step closer to adding products or dish's to your menu. <br/><br/>" +
                                "Verify your account by clicking on the link below:" +
                                 "<a href='" + activeurl + "'><H1><Center>Verify Now</Center></H1></a><br/><br/>" +
                                 "Your account details:<br/>" +
                                 "User Name : " + txtUsername.Text + "<br/><br/>" +
                                 "Password : '" + Session["Password"].ToString() + "' as specified during signup process.<br/><br/>" +
                                 "Where to go from here? <br/><br/>" +
                                 "After you verify your account you can sign in and adding dish's to your menu with us. Start building your fan base right here at cooked in. Add your first dish <br/><br/>" +
                                 "At Cook'dIn we endavour to provide you with the best experience, if you have any questions or need help you can contact us anytime at support@cookedin.com. <br/><br/>" +
                                 "Enjoy! <br/>" +
                                 "The Cook'dIn Team";

            if (commonfunctions.sending_Mail(txtemailid.Text, subject, body))
            {
               // Response.Redirect("~/Login.aspx");
                Response.Redirect("~/Sucess.aspx");
            }
            else
            {
                Response.Redirect("~/Sucess.aspx");
                //create table for error log


              //  lblerrormessage.Text = "There was some problem creating your account, please contact support.";
              //  lblerrormessage.ForeColor = System.Drawing.Color.Red;
            } 
          
        }
        catch (Exception ex)
        {
        }
    }
    //Encrypt
    public string EncryptString(string plainText)
    {
        string initVector = "pemgail9uzpgzl88";
        // This constant is used to determine the keysize of the encryption algorithm.
        int keysize = 256;
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
    //protected void txtUsername_TextChanged(object sender, EventArgs e)
    //{
    //    txtUsername.BorderColor = txtfname.BackColor;
    //}
    protected void btnskipsecondview_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
    }
    protected void btnskipthirdview_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 4;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Final_total_registration();
    }
    public void Add_WorkingDays(string id)
    {

        foreach (ListItem item in chkworkingdays.Items)
        {
            if (item.Selected)
            {
                SqlParameter[] p = new SqlParameter[2];

                p[0] = new SqlParameter("@Chef_ID", id);
                p[1] = new SqlParameter("@day", item.Value);
                con1.Ins_Upd_Del("SP_ChefWorkingDays_Insert", p);
            }
        }
    }
    private void Final_total_registration()
    {
        try
        {

            if (con.check_data("select * from ChefPersonalDetail where Chef_UserName='" + txtUsername.Text + "'"))
            {
                pnlwarning.Visible = true;
                pnlsuccess.Visible = false;
            }
            else
            {
               
                add_Personal();
                string id = con.singlecell("select max(Chef_ID) from ChefPersonalDetail");
                Add_WorkingDays(id);
                add_RegionalCuisine();
                add_DishType();
                add_Oil();
                add_DietType();
                add_FinacialDetail(id);
                 sending_Mail(id);
                Response.Redirect("~/Sucess.aspx");
            }
        }
        catch (Exception ex)
        {
        }
    }
   
}