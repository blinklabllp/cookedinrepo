using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_AddCountry : System.Web.UI.Page
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
        ddlArea.DataSource = con1.Select("SP_Area_View");
        ddlArea.DataTextField = "Area_Name";
        ddlArea.DataValueField = "Area_ID";
        ddlArea.DataBind();
        Repeater1.DataSource = con1.Select("SP_LandMarkArea_View");
        Repeater1.DataBind();
        eid = Request.QueryString.Get("eid");
        did = Request.QueryString.Get("did");
        if (did != null)
        {
            delete_City(did);
        }
        else if (eid != null)
        {
            edit_Area(eid);
        }
    }
    private void edit_Area(string id)
    {
        txtlandmark.Text = con.singlecell("select Landmark_Name from LandmarkMaster where Landmark_ID='" + id + "'");
        ddlArea.SelectedValue = con.singlecell("select Area_ID from LandmarkMaster where Landmark_ID='" + id + "'");
        MultiView1.ActiveViewIndex = 0;
    }
    private void delete_City(string id)
    {
        con.delete_data("delete from LandmarkMaster where Landmark_ID='" + id + "'");
        
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@LandMarkId", id);
        p[1] = new SqlParameter("@Mode", 1);
        con1.Ins_Upd_Del("SP_LandMarkMaster_Edit", p);
        Redirect();

    }

    private void Redirect()
    {
        Response.Redirect("~/Admin/AddLandmark.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Check_And_Insert_Location();
        Redirect();
    }

    private void Check_And_Insert_Location()
    {
        eid = Request.QueryString.Get("eid");
        if (eid != null)
        {
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@LandMArkId", eid);
            p[1] = new SqlParameter("@AreaId", ddlArea.SelectedValue.ToString());

            p[2] = new SqlParameter("@LandMarkName", txtlandmark.Text);
            p[3] = new SqlParameter("@Mode", 2);
            con1.Ins_Upd_Del("SP_LandMarkMaster_Edit", p);
        }
        else
        {
            if (con.check_data("select * from LandmarkMaster where Landmark_Name='"+txtlandmark.Text+"' and Area_ID='"+ddlArea.SelectedValue+"'") == true)
            {
                pnlsuccess.Visible = false;
                pnlwarning.Visible = true;
            }
            else
            {
                SqlParameter[] p = new SqlParameter[2];
                p[0] = new SqlParameter("@AreaId", ddlArea.SelectedValue.ToString());
                p[1] = new SqlParameter("@LandMarkName", txtlandmark.Text);
                con1.Ins_Upd_Del("SP_LandMarkMAster_Insert", p);
                pnlsuccess.Visible = true;
                pnlwarning.Visible = false;
                txtlandmark.Text = "";
                
            }
        }
    }
    protected void btnDanger_Click(object sender, EventArgs e)
    {
        Redirect();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Check_And_Insert_Location();
    }
}