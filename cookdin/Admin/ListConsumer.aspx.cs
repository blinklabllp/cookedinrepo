using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ListEndUser : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    string did;
    protected void Page_Load(object sender, EventArgs e)
    {
        Repeater1.DataSource = con.select_data("select * from ConsumerPersonalDetail");
        Repeater1.DataBind();
        did = Request.QueryString.Get("did");
        if (did != null)
        {
            delete_User(did);
        }
    }
    private void delete_User(string id)
    {
        con.delete_data("delete from ConsumerPersonalDetail where Consumer_ID='" + id + "'");
        Response.Redirect("~/Admin/Listconsumer.aspx");
    }
}