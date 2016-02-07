using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RegionalCuisine : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    string did, eid;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 1;
            Repeater1.DataSource = con.select_data("select * from CommunicationHours");
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
    }

    private void edit_Cuisine(string id)
    {
        txtComHours.Text = con.singlecell("select Hour_Range from CommunicationHours where Communication_ID='" + id + "'");

        MultiView1.ActiveViewIndex = 0;
    }
    private void delete_Cuisine(string id)
    {
        con.delete_data("delete from CommunicationHours where Communication_ID='" + id + "'");
        Response.Redirect("~/Admin/CommunicationHours.aspx");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btnDanger_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/CommunicationHours.aspx");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        eid = Request.QueryString.Get("eid");
        if (eid != null)
        {
            con.update_data("update CommunicationHours set Hour_Range='" + txtComHours.Text + "' where Communication_ID='" + eid + "'");
        }
        else
        {
            con.insert_data("insert into CommunicationHours values('" + txtComHours.Text + "','True')");
        }
        Response.Redirect("~/Admin/CommunicationHours.aspx");
    }
}