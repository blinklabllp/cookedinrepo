using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Consumer_dishorder : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    string OrderID;


    protected void Page_Load(object sender, EventArgs e)
    {
      OrderID = Request.QueryString.Get("Orderid");
       
        if (!IsPostBack)
        {

            Check_USerID_Exist();
            
            lblordernumber.Text = OrderID;

            DataRow drOrder = con.singlerow("select * from OrderMaster where Order_ID='"+OrderID+"'");
            DataRow drPersonal = con.singlerow("Select * from ConsumerPersonalDetail where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");
            DataRow drAddress = con.singlerow("Select * from ConsumerShippingAddress where Address_ID='"+drOrder["Address_ID"]+"'");

            DataSet dsDeliveryDate = con.select_data("select DeliveryDate from InvoiceMaster where Order_ID='" + OrderID + "'");
            if (dsDeliveryDate.Tables[0].Rows.Count > 1)
            {
                lbldeliverydate.Text = "multiple";
            }
            else
            {
                lbldeliverydate.Text = dsDeliveryDate.Tables[0].Rows[0][0].ToString();
            }

            lblorderdate.Text = drOrder["Order_Date"].ToString();
            lbltotalprice.Text = drOrder["Payable_Amount"].ToString();
            lblmobileno.Text = drPersonal["Mobile_No"].ToString();
            lblconsumnername.Text = drPersonal["Consumer_Fname"].ToString() + "" + drPersonal["Consumer_Lname"].ToString(); 
            lblhouseno.Text = drAddress["House_No"].ToString();
            lblsociatyname.Text = drAddress["Block_No"].ToString();
            lblcity.Text = drAddress["City"].ToString();
            lbllandmark.Text = drAddress["Landmark"].ToString();

                          
            
        }
    }
    protected void btnViewOrder_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Consumer/ViewOrder.aspx?oid="+OrderID+"");
    }

    private void Check_USerID_Exist()
    {
        if (Session["Consumer_ID"] == null)
        {
            Response.Redirect("~/consumer_Login.aspx");
        }
    }
}