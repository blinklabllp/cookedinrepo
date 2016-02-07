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
        Repeater1.DataSource = con1.Select("SP_MealIncludesMaster_View");
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
        txtMealIncludes.Text = con.singlecell("select Meal_Includes from MealIncludesMaster where Meal_Include_Id='" + id + "'");
        txtDescription.Text = con.singlecell("select Description from MealIncludesMaster where Meal_Include_Id='" + id + "'");
        MultiView1.ActiveViewIndex = 0;
    }
    private void delete_Cuisine(string id)
    {
        SqlParameter[] p = new SqlParameter[2];

        p[0] = new SqlParameter("@MealIncludeID", id);
        p[1] = new SqlParameter("@Mode", 1);
        con1.Ins_Upd_Del("SP_MealIncludesMaster_Edit", p);

        Redirect();

    }

    private void Redirect()
    {
        Response.Redirect("~/Admin/MealIncludes.aspx");
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
        Check_And_Insert_MealIncluse();
        Redirect();
    }

    private void Check_And_Insert_MealIncluse()
    {
        eid = Request.QueryString.Get("eid");
        if (eid != null)
        {
            string img = con.singlecell("select Icon from MealIncludesMaster where Meal_Include_Id='" + eid + "'");
            if (FileUpload1.HasFile)
            {
                img = Addphoto(FileUpload1);
            }

            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@MealIncludeID", eid);
            p[1] = new SqlParameter("@MealIncludes", txtMealIncludes.Text);

            p[2] = new SqlParameter("@Description", txtDescription.Text);
            p[3] = new SqlParameter("@Icon", img);
            p[4] = new SqlParameter("@Mode", 2);
            con1.Ins_Upd_Del("SP_MealIncludesMaster_Edit", p);
        }
        else
        {

            if (con.check_data("select * from MealIncludesMaster where Meal_Includes='" + txtMealIncludes.Text + "'") == true)
            {
                pnlwarning.Visible = true;
                pnlsuccess.Visible = false;
            }
            else
            {
                string img = null;
                if (FileUpload1.HasFile)
                {
                    img = Addphoto(FileUpload1);
                }
                SqlParameter[] p = new SqlParameter[3];

                p[0] = new SqlParameter("@MealIncludes", txtMealIncludes.Text);

                p[1] = new SqlParameter("@Description", txtDescription.Text);
                p[2] = new SqlParameter("@Icon", img);

                con1.Ins_Upd_Del("SP_MealIncludesMaster_Insert", p);

                pnlsuccess.Visible = true;
                pnlwarning.Visible = false;

                txtDescription.Text = "";
                txtMealIncludes.Text = "";
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
        Check_And_Insert_MealIncluse();
    }
}