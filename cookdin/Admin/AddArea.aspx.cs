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

            Bind_data();
        }
    }

    private void Bind_data()
    {
        ddlCity.DataSource = con1.Select("SP_City_View");
        ddlCity.DataTextField = "City_Name";
        ddlCity.DataValueField = "City_ID";
        ddlCity.DataBind();

        Repeater1.DataSource = con1.Select("SP_AreaCity_View");
        Repeater1.DataBind();
        eid = Request.QueryString.Get("eid");
        did = Request.QueryString.Get("did");
        if (did != null)
        {
            delete_Area(did);
        }
        else if (eid != null)
        {
            edit_Area(eid);
        }
    }
    private void edit_Area(string id)
    {
        txtArea.Text = con.singlecell("select Area_Name from AreaMaster where Area_ID='" + id + "'");
        ddlCity.SelectedValue = con.singlecell("select City_ID from AreaMaster where Area_ID='" + id + "'");
        
        MultiView1.ActiveViewIndex = 0;
    }
    private void delete_Area(string id)
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@AreaId", id);
        p[1] = new SqlParameter("@Mode", 1);
        con1.Ins_Upd_Del("SP_Area_Edit", p);
        Redirect();

    }

    private void Redirect()
    {
        Response.Redirect("~/Admin/AddArea.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Check_And_Insert_Area();
        
        Redirect();
    }

    private void Check_And_Insert_Area()
    {
        eid = Request.QueryString.Get("eid");

        if (eid != null)
        {
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@AreaId", eid);
            p[1] = new SqlParameter("@CityId", ddlCity.SelectedValue.ToString());

            p[2] = new SqlParameter("@AreaName", txtArea.Text);
            p[3] = new SqlParameter("@Mode", 2);
            p[4] = new SqlParameter("@Pincode", int.Parse(txtPincode.Text));
            con1.Ins_Upd_Del("SP_Area_Edit", p);
        }
        else
        {
            if (con.check_data("select * from AreaMaster where Area_Name='"+txtArea.Text+"' and City_ID='"+ddlCity.SelectedValue+"'") == true)
            {
                pnlwarning.Visible = true;
                pnlsuccess.Visible = false;
            }
            else
            {

                SqlParameter[] p = new SqlParameter[3];

                p[0] = new SqlParameter("@CityId", ddlCity.SelectedValue.ToString());

                p[1] = new SqlParameter("@AreaName", txtArea.Text);
                p[2] = new SqlParameter("@Pincode", int.Parse(txtPincode.Text));
                con1.Ins_Upd_Del("SP_AreaMaster_Insert", p);
                pnlwarning.Visible = false;
                pnlsuccess.Visible = true;
                txtArea.Text = "";
                txtPincode.Text = "";
            }
        }
    }
    protected void btnDanger_Click(object sender, EventArgs e)
    {
        Redirect();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Check_And_Insert_Area();
    }
}