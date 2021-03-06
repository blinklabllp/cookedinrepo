﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class Chef_editpro : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    Myconnection con = new Myconnection();
    EncryptionDecryption en = new EncryptionDecryption();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                Check_USerID_Exist();
                Design_btnperson();
                Fill_Personal();
                bind_area();
                Fill_Financial();
            }
            catch (Exception ex)
            {
            }
            FileUpload1.Attributes["onchange"] = "UploadFile(this)";
        }
    }
    private void Check_USerID_Exist()
    {
        if (Session["Chef_ID"] == null)
            Response.Redirect("~/Login.aspx");
    }
    private void bind_area()
    {
        ddlarea.DataSource = con1.Select("SP_Area_View");
        ddlarea.DataTextField = "Area_Name";
        ddlarea.DataValueField = "Area_ID";
        ddlarea.DataBind();

        ddlcity.DataSource = con1.Select("SP_City_View");
        ddlcity.DataTextField = "City_Name";
        ddlcity.DataValueField = "City_ID";
        ddlcity.DataBind();
    }
    private void Fill_Personal()
    {
        DataRow dr = con.singlerow("select * from ChefPersonalDetail where Chef_ID='" + Session["Chef_ID"] + "'");

        lblusername.Text = Session["Chef_UserName"].ToString();
        txtfname.Text = dr["Chef_Fname"].ToString();
        txtmname.Text = dr["Chef_Mname"].ToString();
        txtlname.Text = dr["Chef_Lname"].ToString();
        txtdob.Text = dr["Date_Of_Birth"].ToString();
        txtemail.Text = dr["Email_ID"].ToString();
        txtgender.Text = dr["Gender"].ToString();
        txtmobile.Text = dr["Mobile_No"].ToString();
        txtphone.Text = dr["Contact_No"].ToString();
        txtabout.Text = dr["Detail"].ToString();

        txtApart.Text = dr["House_No"].ToString();
        txtBlock.Text = dr["Block_No"].ToString();
        txtSoc.Text = dr["Society_Name"].ToString();
        txtqty.Text = dr["Meal_Quantity"].ToString();
        txtlandmark.Text = dr["LandMark"].ToString();
        txtUserName.Text = dr["Chef_UserName"].ToString();

        ddlcity.SelectedIndex = ddlcity.Items.IndexOf(ddlcity.Items.FindByText(dr["City"].ToString()));
        ddlarea.SelectedIndex = ddlarea.Items.IndexOf(ddlarea.Items.FindByText(dr["Area"].ToString()));

        if (dr["Photo"].ToString() == "")
        {
            ProfilePhoto.ImageUrl = "~/templete/image/DChef.png";
        }
        else
        {
            ProfilePhoto.ImageUrl = "~/Profile_Photo/" + dr["Photo"].ToString();
        }

    }
    private void Fill_Financial()
    {
        DataRow dr1 = con.singlerow("select * from ChefFinancialDetail where Chef_ID='" + Session["Chef_ID"] + "'");
        txtaccountno.Text = dr1["Account_No"].ToString();
        txtbankbranck.Text = dr1["Branch_Name"].ToString();
        txtbankname.Text = dr1["Bank_Name"].ToString();
        txtbranchcode.Text = dr1["Branch_Code"].ToString();
        txtmicr.Text = dr1["MICR_Code"].ToString();
        txtholdername.Text = dr1["Account_Holder_Name"].ToString();
        txtbranchcode.Text = dr1["Branch_Code"].ToString();
        txtIFSC.Text = dr1["IFSC_Code"].ToString();
    }
    protected void btnper_Click(object sender, EventArgs e)
    {
        string date;
        Button btn = (Button)sender;
        switch (btn.ID)
        {
            case "btnper":
                Design_btnperson();
                break;
            case "btnfin":
                Design_btnfinancial();
                break;
            case "btncng":
                Design_changePassword();
                break;
            
        }
    }

    private void Design_changePassword()
    {
        lblmessage.Visible = false;
        btnper.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
        btnfin.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
        btncng.BackColor = System.Drawing.ColorTranslator.FromHtml("#D94352");

        btncng.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
        btnper.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D94352");
        btnfin.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D94352");
        MultiView1.ActiveViewIndex = 2;

    }

    private void Design_btnfinancial()
    {
        lblmessage.Visible = false;
        btnper.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
        btnfin.BackColor = System.Drawing.ColorTranslator.FromHtml("#D94352");
        btncng.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");

        btnfin.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
        btnper.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D94352");
        btncng.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D94352");
        MultiView1.ActiveViewIndex = 1;
    }

    private void Design_btnperson()
    {
        lblmessage.Visible = false;
        btnper.BackColor = System.Drawing.ColorTranslator.FromHtml("#D94352");
        btnfin.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");
        btncng.BackColor = System.Drawing.ColorTranslator.FromHtml("#fff");

        btnper.ForeColor = System.Drawing.ColorTranslator.FromHtml("#fff");
        btnfin.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D94352");
        btncng.ForeColor = System.Drawing.ColorTranslator.FromHtml("#D94352");
        MultiView1.ActiveViewIndex = 0;
    }

    protected void Upload(object sender, EventArgs e)
    {
        Update_Profile_Photo();
        Fill_Personal();
    }

    private void changepassword()
    {
        try
        {
            string oldPwd = con.singlecell("select Password from ChefPersonalDetail where Chef_ID='" + Session["Chef_ID"].ToString() + "'");
            if (oldPwd == en.EncryptString(txtOldPwd.Text))
            {
                SqlParameter[] p = new SqlParameter[3];


                p[0] = new SqlParameter("@Mode", 5);
                p[1] = new SqlParameter("@Password", en.EncryptString(txtNewPwd.Text));
                p[2] = new SqlParameter("@Chef_ID", Session["Chef_ID"].ToString());
                con1.Ins_Upd_Del("SP_Chef_Edit", p);
            }
            else
            {
            }
        }
        catch (Exception ex)
        {
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

    private void Update_Profile_Photo()
    {
        string photourl = con.singlecell("select Photo from ChefPersonalDetail where Chef_ID='" + Session["Chef_ID"] + "'");
        if (photourl != "")
        {
            string imgpath = Server.MapPath("~/Profile_Photo/" + photourl + ""); ;
            deleteprofilephoto(imgpath);
        }

        SqlParameter[] p = new SqlParameter[2];
        string id = Session["Chef_ID"].ToString();
        string photo = Addphoto(FileUpload1);
        p[0] = new SqlParameter("@Chef_ID", id);
        p[1] = new SqlParameter("@Photo", photo);
        con1.Ins_Upd_Del("SP_Chef_ProfilePhoto_Update", p);
    }
    private void update_financialDetail()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[9];

            p[0] = new SqlParameter("@Mode", 2);
            p[1] = new SqlParameter("@AccountNo", txtaccountno.Text);
            p[2] = new SqlParameter("@ActHolderName", txtholdername.Text);
            p[3] = new SqlParameter("@BankName", txtbankname.Text);
            p[4] = new SqlParameter("@BranchName", txtbankbranck.Text);
            p[5] = new SqlParameter("@MICR", txtmicr.Text);
            p[6] = new SqlParameter("@ChefID", Session["Chef_ID"].ToString());
            p[7] = new SqlParameter("@BranchCode", txtbranchcode.Text);
            p[8] = new SqlParameter("@IFSC", txtIFSC.Text);
            con1.Ins_Upd_Del("SP_ChefFinancialDetail_Edit", p);
        }
        catch (Exception ex)
        {
        }
    }
    private void update_personalDEtail()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[19];


            p[0] = new SqlParameter("@Mode", 2);
            p[1] = new SqlParameter("@Chef_Fname", txtfname.Text);
            p[2] = new SqlParameter("@Chef_Mname", txtmname.Text);
            p[3] = new SqlParameter("@Chef_Lname", txtlname.Text);
            p[4] = new SqlParameter("@DOB", txtdob.Text);
            p[5] = new SqlParameter("@Gender", txtgender.Text);
            p[6] = new SqlParameter("@House", txtApart.Text);
            p[7] = new SqlParameter("@Block", txtBlock.Text);
            p[8] = new SqlParameter("@Society", txtSoc.Text);
            p[9] = new SqlParameter("@Area", ddlarea.SelectedItem.ToString());
            p[10] = new SqlParameter("@City", ddlcity.SelectedItem.ToString());
            p[11] = new SqlParameter("@LandMark", txtlandmark.Text);
            p[12] = new SqlParameter("@Email", txtemail.Text);
            p[13] = new SqlParameter("@Mobile", txtmobile.Text);
            p[14] = new SqlParameter("@Contact", txtphone.Text);
            p[15] = new SqlParameter("@User_Name", txtUserName.Text);
            p[16] = new SqlParameter("@Description", txtabout.Text);
            p[17] = new SqlParameter("@Qty", txtqty.Text);
            p[18] = new SqlParameter("@Chef_ID", Session["Chef_ID"].ToString());
            con1.Ins_Upd_Del("SP_Chef_Edit", p);
        }
        catch (Exception ex)
        {

        }
    }
    
    private void deleteprofilephoto(string photourl)
    {
        System.IO.File.Delete(photourl);
    }
    protected void btnPassword_Click(object sender, EventArgs e)
    {
        changepassword();
        Design_changePassword();
        lblmessage.Visible = true;
    }
    protected void btnFinancial_Click(object sender, EventArgs e)
    {
        update_financialDetail();
        Design_btnfinancial();
        Fill_Financial();
        lblmessage.Visible = true;
    }
    protected void btnPersonal_Click(object sender, EventArgs e)
    {
        update_personalDEtail();
        Design_btnperson();
        Fill_Personal();
        lblmessage.Visible = true;
    }
}