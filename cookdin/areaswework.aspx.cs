using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class areaswework : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind_State();
        }

    }

    public void Bind_State()
    {
        ddlstate.DataSource = con1.Select("SP_State_View");
        ddlstate.DataTextField = "State_Name";
        ddlstate.DataValueField = "State_ID";
        ddlstate.DataBind();
        ddlstate.Items.Insert(0,"--Select State--");
    }

    public void bind_City()
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@State_Id",int.Parse(ddlstate.SelectedValue));
        ddlcity.DataSource = con1.Select("SP_City_View_Statewise",p);
        ddlcity.DataTextField = "City_Name";
        ddlcity.DataValueField = "City_ID";
        ddlcity.DataBind();
        ddlcity.Items.Insert(0,"--Select City--");
    }
    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlstate.SelectedIndex != 0)
        {
            bind_City();
        }
     
    }
    protected void ddlcity_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlcity.SelectedIndex != 0)
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@City_ID", ddlcity.SelectedValue);
            string count = con1.SingleCell("SP_CountArea_CityWise", p);


            if (int.Parse(count) == 0)
            {
                pnlfailer.Visible = true;
                pnlsuccess.Visible = false;
            }
            else
            {
                pnlfailer.Visible = false;
                pnlsuccess.Visible = true;
            }
        }
    }
}