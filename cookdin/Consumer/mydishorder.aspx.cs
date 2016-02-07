using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Consumer_mydishorder : System.Web.UI.Page
{
    
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    string OrderID;


    protected void Page_Load(object sender, EventArgs e)
    {
      OrderID = Request.QueryString.Get("Orderid");
  
        if (!IsPostBack)
        {
            Bind_ConfirmOrder_Detail();
            send_Confirmation_Mail();
        }
    }
    private void Bind_ConfirmOrder_Detail()
    {
        try
        {
            Check_USerID_Exist();

            lblordernumber.Text = OrderID;

            DataRow drOrder = con.singlerow("select * from OrderMaster where Order_ID='" + OrderID + "'");
            DataRow drPersonal = con.singlerow("Select * from ConsumerPersonalDetail where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");
            DataRow drAddress = con.singlerow("Select * from ConsumerShippingAddress where Address_ID='" + drOrder["Address_ID"] + "'");

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
        catch (Exception ex)
        {
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
            Response.Redirect("~/Login.aspx");
        }
    }

    public string get_Order_Delivery_Address()
    {
        string address;
         
          DataRow drOrder = con.singlerow("select * from OrderMaster where Order_ID='" + Request.QueryString.Get("Orderid") + "'");
          DataRow drAddress = con.singlerow("Select * from ConsumerShippingAddress where Address_ID='" + drOrder["Address_ID"] + "'");
          DataRow drPersonal = con.singlerow("Select * from ConsumerPersonalDetail where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");


        address = "<h2> Delivery Address </h2>";
        address += "Order Date :" + drOrder["Order_Date"].ToString() + "<br/>";
        address += "<b>" + drPersonal["Consumer_Fname"].ToString() + " " + drPersonal["Consumer_Lname"].ToString() + "</b><br/>";
        address += drAddress["House_No"].ToString() + " - ";
        address += drAddress["Block_No"].ToString() + "," +"<br/>";
        address += drAddress["Society_Name"].ToString() + "," + "<br/>";
        address += drAddress["Landmark"].ToString() + "," + "<br/>";
        address += drAddress["City"].ToString() + "," + drAddress["Pincode"].ToString() + "<br/>";

        return address;
       
    }
    public string get_Order_Description()
    {
        string description;
        SqlParameter[] p1 = new SqlParameter[1];
        p1[0] = new SqlParameter("@OrderID", Request.QueryString.Get("Orderid"));
        DataSet ds = con1.Select("SP_MyOrder_View", p1);

        description = get_Order_Delivery_Address();

        description += "<br/><br/>";

        description += "<TABLE STYLE='BORDER:1PX SOLID BLACK; WIDTH:100%; TEXT-ALIGN:CENTER;'> " +

            "<TR> <TH></TH> <TH>Dish</TH><TH>Cook</TH><TH>Quantity</TH><TH>Dish Price</TH><TH>Total Price</TH><TH>Delivery Time</TH> </TR> ";

        string imgurl;

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            DataRow dr = ds.Tables[0].Rows[i];

            string weburl = "https://cookedin.com/dishphotoupload/";
            
            imgurl = weburl  + dr["Dish_Image"].ToString();
            
            description += "<TR>"+
                                     "<TD><img src = "+imgurl+" HEIGHT='40px' WIDTH='40px' /></TD> "+
                                     "<TD>"+dr["Dish_Name"].ToString()+"</TD> "+
                                     "<TD>" + dr["Chef_UserName"].ToString() + "</TD>" +
                                     "<TD>" + dr["Qty"].ToString() + "</TD>" +
                                     "<TD>" + dr["Price"].ToString() + "</TD>" +
                                      "<TD>" + dr["totPrice"].ToString() + "</TD>" +
                                     "<TD>" + dr["Slot"].ToString() +"<br/>" + dr["DeliveryDate"].ToString() + "</TD>" +
                          "</TR> ";
        }

        description += "</TABLE>";

        return description;
    }
    public void send_Confirmation_Mail()
    {
        string username, title, url, description,consumer_emailaddress;
        username = Session["Consumer_UserName"].ToString();
        title = "Order Detail";
        url = "";
        consumer_emailaddress = con.singlecell("select Consumer_EmailID from ConsumerSignUp where Consumer_UserName='" + Session["Consumer_UserName"].ToString() + "'");
        description = get_Order_Description();
        send_Mail(username, title, url, description, consumer_emailaddress);
        
    }
    public void send_Mail(string username,string title,string url,string description,string consumer_emailaddress)
    {
        string body = commonfunctions.PopulateBody(username, title, url, description);
        commonfunctions.order_sending_Mail(consumer_emailaddress,"Order Confirmation",body);
    }
}