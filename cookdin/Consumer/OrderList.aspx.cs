using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Consumer_OrderList : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Check_USerID_Exist();
            Bind_Order();
        }
    }
    private void Bind_Order()
    {
        SqlParameter[] p1 = new SqlParameter[1];
        p1[0] = new SqlParameter("@Consumer_ID", Session["Consumer_ID"].ToString());
        DataList1.DataSource = con1.Select("SP_Consumer_OrderList",p1);
        DataList1.DataBind();
    }
    private void Check_USerID_Exist()
    {
        if (Session["Consumer_ID"] == null)
        {
            Response.Redirect("~/consumer_Login.aspx");
        }
    }
}