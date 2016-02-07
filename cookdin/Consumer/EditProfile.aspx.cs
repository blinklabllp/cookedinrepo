using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class Consumer_EditProfile : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Check_USerID_Exist();
            bind_personalDetail();
        }
    }

    private void Check_USerID_Exist()
    {
        if (Session["Consumer_ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    private void modify_personal_profile(int mode)
    {
        SqlParameter[] p = new SqlParameter[8];

        string id = Session["Consumer_ID"].ToString();

        string photo = Addphoto(FileUpload1);

        p[0] = new SqlParameter("@Consumer_ID", id);
        p[1] = new SqlParameter("@Consumer_Fname", txtfirstname.Text);
        p[2] = new SqlParameter("@Consumer_Mname", txtmiddlename.Text);
        p[3] = new SqlParameter("@Consumer_Lname", txtlastname.Text);
        p[4] = new SqlParameter("@Gender", txtgender.Text);
        p[5] = new SqlParameter("@Mobile_No", txtcontactno.Text);
        p[6] = new SqlParameter("@Photo", photo);
        p[7] = new SqlParameter("@Mode", mode);

        con1.Ins_Upd_Del("SP_ConsumerPersonalDetail_Insert_Update", p);
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (con.check_data("select * from ConsumerPersonalDetail where Consumer_ID='" + Session["Consumer_ID"] + "'") == true)
        {
            //For Update Profile

            if (FileUpload1.HasFile)
            {
                string photourl = con.singlecell("select Photo from ConsumerPersonalDetail where Consumer_ID='" + Session["Consumer_ID"] + "'");
                if (photourl != "")
                {
                    string imgpath = Server.MapPath("~/Profile_Photo/" + photourl + ""); ;
                    deleteprofilephoto(imgpath);
                }
                    modify_personal_profile(3);
                Cleardata();
                Response.Redirect("~/Consumer/MyProfile.aspx");
            }
            else
            {

                modify_personal_profile(2);
                Cleardata();
                Response.Redirect("~/Consumer/MyProfile.aspx");
            }
        }
        else
        {
            //For Insert Profile
            modify_personal_profile(1);
            Cleardata();
            Response.Redirect("~/Consumer/MyProfile.aspx");
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

    private void bind_personalDetail()
    {
        if (con.check_data("select * from ConsumerPersonalDetail where Consumer_ID='" + Session["Consumer_ID"] + "'") == true)
        {
            DataRow dr = con.singlerow("select * from ConsumerPersonalDetail where  Consumer_ID='" + Session["Consumer_ID"] + "'");

            txtfirstname.Text = dr["Consumer_Fname"].ToString();
            txtmiddlename.Text = dr["Consumer_Mname"].ToString();
            txtlastname.Text = dr["Consumer_Lname"].ToString();
            txtgender.Text = dr["Gender"].ToString();
            txtcontactno.Text = dr["Mobile_No"].ToString();
        }
    }

    private void Cleardata()
    {
        txtfirstname.Text = "";
        txtmiddlename.Text = "";
        txtlastname.Text = "";
        txtgender.Text = "";
        txtcontactno.Text = "";
    }

    private void deleteprofilephoto(string photourl)
    {
        System.IO.File.Delete(photourl);
    }

    protected void btnchange_Click(object sender, EventArgs e)
    {
        string currentPwd = con.singlecell("select Password from ConsumerSignUp where Consumer_ID='" + Session["Consumer_ID"] + "'");
        if (currentPwd == txtcurrent.Text)
        {
            string id = Session["Consumer_ID"].ToString();
            SqlParameter[] p = new SqlParameter[3];

            p[0] = new SqlParameter("@Mode", 4);
            p[1] = new SqlParameter("@Password", txtnew.Text);
            p[2] = new SqlParameter("@Consumer_ID", id);

            con1.Ins_Upd_Del("SP_ConsumerPersonalDetail_Insert_Update", p);
        }
        else
        {
        }
    }
}