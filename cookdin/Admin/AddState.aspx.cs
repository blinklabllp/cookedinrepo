using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_AddState : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    string did,eid;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 1;

            Repeater1.DataSource = con1.Select("SP_State_View");
            Repeater1.DataBind();

            ModifyState();
        }
    }

    private void ModifyState()
    {
        eid = Request.QueryString.Get("eid");
        did = Request.QueryString.Get("did");

        if (did != null)
        {
            delete_State(did);
        }
        else if (eid != null)
        {
            edit_state(eid);
        }
    }
    private void edit_state(string id)
    {
        txtState.Text = con.singlecell("select State_Name from StateMaster where State_ID='" + id + "'");
        
        MultiView1.ActiveViewIndex = 0;
    }
    private void delete_State(string id)
    {
        SqlParameter[] p = new SqlParameter[2];
            p[0] = new SqlParameter("@StateId", id);
            p[1] = new SqlParameter("@Mode", 1);
        con1.Ins_Upd_Del("SP_State_Edit", p);
        redirect();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void btnDanger_Click(object sender, EventArgs e)
    {
        redirect();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Check_And_Insert_State();

        redirect();
    }

    private void Check_And_Insert_State()
    {
        eid = Request.QueryString.Get("eid");
        if (eid != null)
        {
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@StateId", eid);
            p[1] = new SqlParameter("@State_Name", txtState.Text);
            p[2] = new SqlParameter("@Mode", 2);
            con1.Ins_Upd_Del("SP_State_Edit", p);
        }
        else
        {
            if (con.check_data("select * from StateMaster where State_Name='"+txtState.Text+"'") == true)
            {
                pnlsuccess.Visible = false;
                pnlwarning.Visible = true;
            }
            else
            {
                SqlParameter[] p = new SqlParameter[2];
                p[0] = new SqlParameter("@State_Name", txtState.Text);
                p[1] = new SqlParameter("@Country_Id", 1);
                con1.Ins_Upd_Del("SP_State_Insert", p);
                pnlsuccess.Visible = true;
                pnlwarning.Visible = false;
                txtState.Text = "";
            }
        }
    }

    private void redirect()
    {
        Response.Redirect("~/Admin/AddState.aspx");
    }
    protected void btnsubmitandinsert_Click(object sender, EventArgs e)
    {
        Check_And_Insert_State();
    }
}