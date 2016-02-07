using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;


public partial class Admin_EditChef : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    string eid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            ddlState.DataSource = con.select_data("select * from StateMaster");
            ddlState.DataTextField = "State_Name";
            ddlState.DataValueField = "State_ID";
            ddlState.DataBind();

            ddlCity.DataSource = con.select_data("select * from CityMaster");
            ddlCity.DataTextField = "City_Name";
            ddlCity.DataValueField = "City_ID";
            ddlCity.DataBind();

            ddlArea.DataSource = con.select_data("select * from AreaMaster");
            ddlArea.DataTextField = "Area_Name";
            ddlArea.DataValueField = "Area_ID";
            ddlArea.DataBind();

            ddlLandmark.DataSource = con.select_data("select * from LandmarkMaster");
            ddlLandmark.DataTextField = "Landmark_Name";
            ddlLandmark.DataValueField = "Landmark_ID";
            ddlLandmark.DataBind();

            eid = Request.QueryString.Get("eid");
            if (eid != null)
            {
                fill_Form(eid);
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
    private void fill_Form(string id)
    {
        DataRow dr = con.singlerow("select * from ChefPersonalDetail where Chef_ID='" + id + "'");

        txtFname.Text = dr["Chef_Fname"].ToString();
        txtMname.Text = dr["Chef_Mname"].ToString();
        txtLname.Text = dr["Chef_Lname"].ToString();
        txtDOB.Text = dr["Date_Of_Birth"].ToString();
        txtHouse.Text = dr["House_No"].ToString();
        txtBlock.Text = dr["Block_No"].ToString();
        txtSoc.Text = dr["Society_Name"].ToString();
        txtEmail.Text = dr["Email_ID"].ToString();
        txtChefName.Text = dr["Chef_UserName"].ToString();
        txtDescription.Text = dr["Detail"].ToString();
        txtMobileNo.Text = dr["Mobile_No"].ToString();
        txtContactNo.Text = dr["Contact_No"].ToString();
               
        //ddlState.SelectedIndex = ddlState.Items.IndexOf(ddlState.Items.FindByText(dr["State"].ToString()));
        ddlCity.SelectedIndex = ddlCity.Items.IndexOf(ddlCity.Items.FindByText(dr["City"].ToString()));
        ddlArea.SelectedIndex = ddlArea.Items.IndexOf(ddlArea.Items.FindByText(dr["Area"].ToString()));
       ddlLandmark.SelectedIndex = ddlLandmark.Items.IndexOf(ddlLandmark.Items.FindByText(dr["Landmark"].ToString()));

    }

    private void redirect()
    {
        Response.Redirect("~/Admin/EditChef.aspx");
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        eid = Request.QueryString.Get("eid");
        if (eid != null)
        {

            string img = Addphoto(FileUpload1);

            SqlParameter[] p = new SqlParameter[20];
            p[0] = new SqlParameter("@Mode", 2);
            p[1] = new SqlParameter("@Chef_ID", eid);
            p[2] = new SqlParameter("@Chef_Fname", txtFname.Text);
            p[3] = new SqlParameter("@Chef_Mname", txtMname.Text);
            p[4] = new SqlParameter("@Chef_Lname", txtLname.Text);
            p[5] = new SqlParameter("@DOB", txtDOB.Text);
            p[6] = new SqlParameter("@Gender", ddlGender.SelectedItem.ToString());
            p[7] = new SqlParameter("@House", txtHouse.Text);
            p[8] = new SqlParameter("@Block", txtBlock.Text);
            p[9] = new SqlParameter("@Society", txtSoc.Text);
            p[10] = new SqlParameter("@Area", ddlArea.SelectedItem.ToString());
            p[11] = new SqlParameter("@City", ddlCity.SelectedItem.ToString());
            p[12] = new SqlParameter("@LandMark", ddlLandmark.SelectedItem.ToString());
            p[13] = new SqlParameter("@Email", txtEmail.Text);
            p[14] = new SqlParameter("@Mobile", txtMobileNo.Text);
            p[15] = new SqlParameter("@Contact", txtContactNo.Text);
            p[16] = new SqlParameter("@User_Name", txtChefName.Text);
            p[17] = new SqlParameter("@Description", txtDescription.Text);
            if (img != null)
            {
                p[18] = new SqlParameter("@Photo", img);
            }
            else
            {
                p[18] = new SqlParameter("@Photo", null);
            }
            p[19] = new SqlParameter("@Status", 0);

            con1.Ins_Upd_Del("SP_Chef_Edit", p);
            //con.update_data("update BusinessUSerDetail set Company_Name='" + txtComName.Text + "',Contact_Person_fname='" + txtBusfName.Text + "',Contact_Person_Lname='" + txtBuslName.Text + "', Address='" + txtAddress.Text + "', Contact_No='" + txtContactNo.Text + "',Mobile_No='" + txtMobileNo.Text + "',Email_ID='" + txtEmail.Text + "',Website='" + txtWebsite.Text + "',Description='" + txtDescription.Text + "',User_Name='" + txtBusUSerName.Text + "',Password='" + txtPwd.Text + "',Business_Category='" + ddlBusCategory.SelectedItem + "',Country='" + ddlCountry.SelectedItem + "',State='" + ddlState.SelectedItem + "',City='" + ddlCity.SelectedItem + "' where Business_User_ID='" + eid + "'");

        }
        else
        {
            string img = Addphoto(FileUpload1);
            SqlParameter[] p = new SqlParameter[18];

            p[0] = new SqlParameter("@Status", 0);
            if (img != null)
            {
                p[1] = new SqlParameter("@Photo", img);
            }
            else
            {
                p[1] = new SqlParameter("@Photo", null);
            }
            p[2] = new SqlParameter("@Chef_Fname", txtFname.Text);
            p[3] = new SqlParameter("@Chef_Mname", txtMname.Text);
            p[4] = new SqlParameter("@Chef_Lname", txtLname.Text);
            p[5] = new SqlParameter("@DOB", txtDOB.Text);
            p[6] = new SqlParameter("@Gender", ddlGender.SelectedItem.ToString());
            p[7] = new SqlParameter("@House", txtHouse.Text);
            p[8] = new SqlParameter("@Block", txtBlock.Text);
            p[9] = new SqlParameter("@Society", txtSoc.Text);
            p[10] = new SqlParameter("@Area", ddlArea.SelectedItem.ToString());
            p[11] = new SqlParameter("@City", ddlCity.SelectedItem.ToString());
            p[12] = new SqlParameter("@LandMark", ddlLandmark.SelectedItem.ToString());
            p[13] = new SqlParameter("@Email", txtEmail.Text);
            p[14] = new SqlParameter("@Mobile", txtMobileNo.Text);
            p[15] = new SqlParameter("@Contact", txtContactNo.Text);
            p[16] = new SqlParameter("@User_Name", txtChefName.Text);
            p[17] = new SqlParameter("@Description", txtDescription.Text);



            con1.Ins_Upd_Del("SP_Chef_Insert", p);

            //con.insert_data("insert into BusinessUSerDetail values('" + txtComName.Text + "','" + txtBusfName.Text + "','" + txtBuslName.Text + "','" + txtAddress.Text + "','" + ddlCountry.SelectedItem + "','" + ddlState.SelectedItem + "','" + ddlCity.SelectedItem + "','" + txtContactNo.Text + "','" + txtMobileNo.Text + "','" + txtEmail.Text + "','" + txtWebsite.Text + "','" + ddlBusCategory.SelectedItem + "','" + txtDescription.Text + "','LOGO','" + txtBusUSerName.Text + "','" + txtPwd.Text + "','Inactive','Approved','" + DateTime.Today.ToString("dd/MM/yyyy") + "')");

        }
    }
    protected void btnDanger_Click(object sender, EventArgs e)
    {
        redirect();
    }
}