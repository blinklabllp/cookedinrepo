using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

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

            Bind_State();

            Repeater1.DataSource = con1.Select("SP_CityState_View");
            Repeater1.DataBind();

            ModifyCity();
        }
    }

    private void ModifyCity()
    {
        eid = Request.QueryString.Get("eid");
        did = Request.QueryString.Get("did");
        if (did != null)
        {
            delete_City(did);
        }
        else if (eid != null)
        {
            edit_City(eid);
        }
    }

    private void Bind_State()
    {
        ddlState.DataSource = con1.Select("SP_State_View");
        ddlState.DataTextField = "State_Name";
        ddlState.DataValueField = "State_ID";
        ddlState.DataBind();
    }
    private void edit_City(string id)
    {
        txtCity.Text = con.singlecell("select City_Name from CityMaster where City_ID='" + id + "'");
        ddlState.SelectedValue = con.singlecell("select State_ID from CityMaster where City_ID='" + id + "'");
        
        MultiView1.ActiveViewIndex = 0;
    }
    private void delete_City(string id)
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@City_Id", id);
        p[1] = new SqlParameter("@Mode", 1);
        con1.Ins_Upd_Del("SP_City_Edit", p);
        redirect();
      //  con.delete_data("delete from CityMaster where City_ID='" + id + "'");
      

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Check_Insert();
        redirect();
    }

    private void Check_Insert()
    {
        eid = Request.QueryString.Get("eid");
        if (eid != null)
        {
            UpdateCity(eid);
        }
        else
        {
            InsertCity();
        }
       
    }

    private void InsertCity()
    {
        if (con.check_data("select * from CityMaster where City_Name='" + txtCity.Text + "'") == true)
        {
            pnlwarning.Visible = true;
            pnlsuccess.Visible = false;
        }
        else
        {
            pnlwarning.Visible = false;
            SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@CityName", txtCity.Text);
            p[1] = new SqlParameter("@StateId", int.Parse(ddlState.SelectedValue));
            con1.Ins_Upd_Del("SP_City_Insert", p);
            txtCity.Text = "";
        }
       // con.insert_data("insert into CityMaster values('" + txtCity.Text + "','" + ddlState.SelectedValue + "')");
    }

    private void UpdateCity(string eid)
    {
        SqlParameter[] p = new SqlParameter[4];
        p[0] = new SqlParameter("@City_Id", eid);
        p[1] = new SqlParameter("@city_Name", txtCity.Text);
        p[2] = new SqlParameter("@State_Id", int.Parse(ddlState.SelectedValue));
        p[3] = new SqlParameter("@Mode", 2);
        con1.Ins_Upd_Del("SP_City_Edit", p);
      
    }
    protected void btnDanger_Click(object sender, EventArgs e)
    {
        redirect();
    }

    private void redirect()
    {
        Response.Redirect("~/Admin/AddCity.aspx");
    }
    protected void btnsaveandcontinue_Click(object sender, EventArgs e)
    {
        pnlsuccess.Visible = true;
        Check_Insert();
    }
}