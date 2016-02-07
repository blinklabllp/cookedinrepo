using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_AddCity : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    string did,eid;
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
        ddlCategory.DataSource = con1.Select("SP_IngridiantCategory_View");
        ddlCategory.DataTextField = "Category_Name";
        ddlCategory.DataValueField = "Ingridiant_Category_ID";
        ddlCategory.DataBind();
        Repeater1.DataSource = con1.Select("SP_IngridiantCategoryIngridiant_View");
        Repeater1.DataBind();
        eid = Request.QueryString.Get("eid");
        did = Request.QueryString.Get("did");
        if (did != null)
        {
            delete_Ingridiant(did);
        }
        else if (eid != null)
        {
            edit_Ingridiant(eid);
        }
    }
    private void edit_Ingridiant(string id)
    {
        txtIngridiant.Text = con.singlecell("select Ingridiant_Name from IngridiantMaster where Ingridiant_ID='" + id + "'");
        ddlCategory.SelectedValue = con.singlecell("select Ingridiant_Category_ID from IngridiantMaster where Ingridiant_ID='" + id + "'");
        txtDescription.Text = con.singlecell("select Description from IngridiantMaster where Ingridiant_ID='" + id + "'");
        MultiView1.ActiveViewIndex = 0;
    }
    private void delete_Ingridiant(string id)
    {
        SqlParameter[] p = new SqlParameter[2];

        p[0] = new SqlParameter("@IngridiantID", id);
        p[1] = new SqlParameter("@Mode", 1);
        con1.Ins_Upd_Del("SP_IngridiantMaster_Edit", p);
        Redirect();

    }

    private void Redirect()
    {
        Response.Redirect("~/Admin/Ingridiant.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Check_And_Insert_Ingridiant();
        Redirect();
    }

    private void Check_And_Insert_Ingridiant()
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
            p[0] = new SqlParameter("@IngridiantID", eid);
            p[1] = new SqlParameter("@CategoeyID", ddlCategory.SelectedValue.ToString());

            p[2] = new SqlParameter("@Description", txtDescription.Text);
            p[3] = new SqlParameter("@Icon", img);
            p[4] = new SqlParameter("@Mode", 2);
            p[5] = new SqlParameter("@IngridiantName", txtIngridiant.Text);
            con1.Ins_Upd_Del("SP_IngridiantMaster_Edit", p);
        }
        else
        {
            if (con.check_data("select * from IngridiantMaster where ingridiant_Name='"+txtIngridiant.Text+"'") == true)
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
                SqlParameter[] p = new SqlParameter[4];

                p[0] = new SqlParameter("@IngridiantName", txtIngridiant.Text);
                p[1] = new SqlParameter("@CategoeyID", ddlCategory.SelectedValue.ToString());
                p[2] = new SqlParameter("@Description", txtDescription.Text);
                p[3] = new SqlParameter("@Icon", img);

                con1.Ins_Upd_Del("SP_IngridiantMaster_Insert", p);

                pnlsuccess.Visible = true;
                pnlwarning.Visible = false;

                txtIngridiant.Text = "";
                txtDescription.Text = "";
            }
        }
    }
    protected void btnDanger_Click(object sender, EventArgs e)
    {
        Redirect();
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
    protected void btnsubmitcontinue_Click(object sender, EventArgs e)
    {
        Check_And_Insert_Ingridiant();
    }
}