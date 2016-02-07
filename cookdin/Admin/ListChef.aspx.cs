using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_ListBusinessUser : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    string did,aid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Repeater1.DataSource = con1.Select("SP_Chef_View");
            Repeater1.DataBind();
            did = Request.QueryString.Get("did");
            aid = Request.QueryString.Get("aid");
            if (did != null)
            {
                delete_User(did);
            }
            else if (aid != null)
            {
                Approve_User(aid);
            }
               
        }
    }

    private void delete_User(string id)
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Chef_ID", id);
        p[1] = new SqlParameter("@Mode", 1);
        con1.Ins_Upd_Del("SP_Chef_Edit", p);

        //con.delete_data("delete from ChefPersonalDetail where Chef_ID='" + id + "'");
        Response.Redirect("~/Admin/ListChef.aspx");

    }
    private void Approve_User(string id)
    {
        SqlParameter[] p=new SqlParameter[2];
        p[0] = new SqlParameter("@Chef_ID", id);
        p[1] = new SqlParameter("@Mode",3);
        con1.Ins_Upd_Del("SP_Chef_Edit",p);
       // con.update_data("update ChefPersonalDetail set IsApprove='Approved' where Chef_ID='" + id + "'");
        Response.Redirect("~/Admin/ListChef.aspx");

    }

}