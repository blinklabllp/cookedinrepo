using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_View_Account : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string orderid = Request.QueryString.Get("oid");
            if (orderid != null)
            {
                OrderDetail(orderid);
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
                Repeater1.DataSource = con1.Select("SP_AdminTransaction_View");
                Repeater1.DataBind();
            }
        }
    }
    private void OrderDetail(string oid)
    {
        MultiView1.ActiveViewIndex = 1;

        SqlParameter[] p=new SqlParameter[1];
        p[0] = new SqlParameter("@OrderID",oid);
        Repeater2.DataSource = con1.Select("SP_OrderTransaction_View",p);
        Repeater2.DataBind();
    }
}