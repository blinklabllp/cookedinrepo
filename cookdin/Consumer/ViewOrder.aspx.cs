using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Consumer_ViewOrder : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    Myconnection con = new Myconnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            Check_USerID_Exist();
            
            Bind_Cart();
        }
    }

    private void Check_USerID_Exist()
    {
        if (Session["Consumer_ID"] == null)
        {
            Response.Redirect("~/consumer_Login.aspx");
        }
    }

    private void Bind_Cart()
    {
        //SqlParameter[] p = new SqlParameter[0];
        //con1.Ins_Upd_Del("SP_CartDelete", p);

        Check_USerID_Exist();

        string Order = Request.QueryString.Get("oid");
        lblordernumber.Text = Order;
        DataRow drOrder = con.singlerow("select * from OrderMaster where Order_ID='" + Order + "'");
        DataRow drPersonal = con.singlerow("Select * from ConsumerPersonalDetail where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");
        DataRow drAddress = con.singlerow("Select * from ConsumerShippingAddress where Address_ID='" + drOrder["Address_ID"] + "'");


        SqlParameter[] p1 = new SqlParameter[1];
        p1[0] = new SqlParameter("@OrderID", Order);
        DataList1.DataSource = con1.Select("SP_MyOrder_View", p1);
        DataList1.DataBind();
        int totAmt = 0;
        foreach (DataListItem item in DataList1.Items)
        {
            Label lblprice = (Label)item.FindControl("lblprice");
            totAmt += int.Parse(lblprice.Text);
        }

        lblorderdate.Text = drOrder["Order_Date"].ToString();
        lblFinalTotal.Text = drOrder["Payable_Amount"].ToString();
        lblmobileno.Text = drPersonal["Mobile_No"].ToString();
        lblconsumnername.Text = drPersonal["Consumer_Fname"].ToString() + "" + drPersonal["Consumer_Lname"].ToString();
        lblhouseno.Text = drAddress["House_No"].ToString();
        lblBlockNo.Text = drAddress["Block_No"].ToString();
        lblsociatyname.Text=drAddress["Society_Name"].ToString();
        lblcity.Text = drAddress["City"].ToString();
        lbllandmark.Text = drAddress["Landmark"].ToString();
        lblTotalAmt.Text = drOrder["Total_Amount"].ToString();
        lblDiscount.Text = drOrder["Discount_Amount"].ToString();

        float tax = (totAmt * 12) / 100;
        lblTax.Text = tax.ToString();
       

    }
}