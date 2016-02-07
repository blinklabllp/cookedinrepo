using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_RegionalCuisine : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    string did, eid;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 1;
            Bind_Data();
        }
    }

    private void Bind_Data()
    {
        Repeater1.DataSource = con1.Select("SP_RegionalCuisine_View");
        Repeater1.DataBind();
        eid = Request.QueryString.Get("eid");
        did = Request.QueryString.Get("did");
        if (did != null)
        {
            delete_Cuisine(did);
        }
        else if (eid != null)
        {
            edit_Cuisine(eid);
        }
    }

    private void edit_Cuisine(string id)
    {
        txtcuisine.Text = con.singlecell("select Place_Name from RegionalCuisine where Regional_Cuisine_ID='" + id + "'");
        txtDescription.Text = con.singlecell("select Description from RegionalCuisine where Regional_Cuisine_ID='" + id + "'");
        //ddlCategory.SelectedItem = con.singlecell("select Place_Name from RegionalCuisine where Regional_Cuisine_ID='" + id + "'").ToString();
        MultiView1.ActiveViewIndex = 0;
    }
    private void delete_Cuisine(string id)
    {
        SqlParameter[] p = new SqlParameter[2];

        p[0] = new SqlParameter("@RegionalCuisineID", id);
        p[1] = new SqlParameter("@Mode", 1);
        con1.Ins_Upd_Del("SP_regionalCuisine_Edit", p);
        Redirect();

    }

    private void Redirect()
    {
        Response.Redirect("~/Admin/RegionalCuisine.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btnDanger_Click(object sender, EventArgs e)
    {
        Redirect();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Check_And_Insert_Regional_Cuisine();
        Redirect();
    }

    private void Check_And_Insert_Regional_Cuisine()
    {
        eid = Request.QueryString.Get("eid");
        if (eid != null)
        {
            string img = con.singlecell("select Icon from IngridiantMaster where Ingridiant_ID='" + eid + "'");
            if (FileUpload1.HasFile)
            {
                img = Addphoto(FileUpload1);
            }

            SqlParameter[] p = new SqlParameter[6];
            p[0] = new SqlParameter("@RegionalCuisineID", eid);
            p[1] = new SqlParameter("@CuisineType", ddlCategory.SelectedItem.ToString());

            p[2] = new SqlParameter("@Description", txtDescription.Text);
            p[3] = new SqlParameter("@Icon", img);
            p[4] = new SqlParameter("@Mode", 2);
            p[5] = new SqlParameter("@PlaceName", txtcuisine.Text);
            con1.Ins_Upd_Del("SP_RegionalCuisine_Edit", p);
        }
        else
        {
            if (con.check_data("select * from RegionalCuisine where Place_Name='"+txtcuisine.Text+"'") == true)
            {
                pnlsuccess.Visible = false;
                pnlwarning.Visible = true;
            }
            else
            {
                string img = null;
                if (FileUpload1.HasFile)
                {
                    img = Addphoto(FileUpload1);
                }
                SqlParameter[] p = new SqlParameter[4];
                p[0] = new SqlParameter("@PlaceName", txtcuisine.Text);
                p[1] = new SqlParameter("@CuisineType", ddlCategory.SelectedItem.ToString());

                p[2] = new SqlParameter("@Description", txtDescription.Text);
                p[3] = new SqlParameter("@Icon", img);

                con1.Ins_Upd_Del("SP_RegionalCuisine_Insert", p);
                pnlsuccess.Visible = true;
                pnlwarning.Visible = false;

                txtcuisine.Text = "";
                txtDescription.Text = "";
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
            string path = Server.MapPath("~/UploadIcon/" + filename + "");
            Photo.SaveAs(path);
            return filename;
        }
        else
            return null;
    }
    protected void btnsubmitandcontinue_Click(object sender, EventArgs e)
    {
        Check_And_Insert_Regional_Cuisine();
    }
}