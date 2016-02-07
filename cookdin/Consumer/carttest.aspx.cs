using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Linq;
using System.Net;
using System.IO;

public partial class Consumer_carttest : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    commonfunctions cf = new commonfunctions();

    string Chef_ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Check_USerID_Exist();

            Check_QueryString();
           
            Bind_Cart();
            Bind_Address();
            Bind_Area_Detail();

            // Bind_Dropdown();

        }
    }

    private void Check_QueryString()
    {
        if (Request.QueryString.Get("did") != null)
        {
            Chef_ID = Request.QueryString.Get("cid");
        }
    }
    private void Check_USerID_Exist()
    {
        Session["Consumer_ID"] = "3";

        if (Session["Consumer_ID"] == null)
        {
            Response.Redirect("~/consumer_Login.aspx");
        }
    }

    private void Bind_Area_Detail()
    {
        ddlarea.DataSource = con1.Select("SP_Area_View");
        ddlarea.DataTextField = "Area_Name";
        ddlarea.DataValueField = "Area_ID";
        ddlarea.DataBind();

        ddlcity.DataSource = con1.Select("SP_City_View");
        ddlcity.DataTextField = "City_Name";
        ddlcity.DataValueField = "City_ID";
        ddlcity.DataBind();


        ddlLandMark.DataSource = con1.Select("SP_LandMark_View");
        ddlLandMark.DataTextField = "LandMark_Name";
        ddlLandMark.DataValueField = "LandMark_ID";
        ddlLandMark.DataBind();

        ddlarea.Items.Insert(0, "Area");
        ddlcity.Items.Insert(0, "City");
        ddlLandMark.Items.Insert(0, "LandMark");
    }

    private void Bind_Cart()
    {
       // SqlParameter[] p = new SqlParameter[0];
        //con1.Ins_Upd_Del("SP_CartDelete", p);

        SqlParameter[] p1 = new SqlParameter[1];
        p1[0] = new SqlParameter("@ConsumerID", Session["Consumer_ID"].ToString());
        DataList1.DataSource = con1.Select("SP_ConsumerCartDishList_View", p1);
        DataList1.DataBind();
        int totAmt=0;
       foreach(DataListItem item in DataList1.Items)
       {
            Label lblprice = (Label)item.FindControl("lblprice");
            totAmt+=int.Parse(lblprice.Text);
       }


        lblTotalAmt.Text = totAmt.ToString();
        float tax = (totAmt * 12) / 100;
        lblTax.Text = tax.ToString();
        lblFinalTotal.Text = (totAmt+tax).ToString();
       // CountDeliveryAmount();
      
     }
 
    private void Bind_Delivery_Time(DataListItem item, Label lbldishtype)
    {
        //SqlParameter[] p2 = new SqlParameter[1];
        //string dishtype = lbldishtype.Text;
        //p2[0] = new SqlParameter("@DishType", dishtype);
        //DataList DataListdeliverytime = (DataList)item.FindControl("DataListdeliverytime");
        //DataListdeliverytime.DataSource = con1.Select("SP_TimeSlotMaster_View", p2);
        //DataListdeliverytime.DataBind();
    }

    private void Bind_Dish_Item(DataListItem item, DataList DataListdishitem)
    {
        //Label lblcartid = (Label)item.FindControl("lblcartid");
        //string cartid = lblcartid.Text;
        //SqlParameter[] p = new SqlParameter[1];
        //p[0] = new SqlParameter("@CartId", int.Parse(cartid));
        //DataListdishitem.DataSource = con1.Select("SP_ConsumerCartDishList_View", p);
        //DataListdishitem.DataBind();
    }

    protected void DataListdishitem_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Label cid = (Label)e.Item.FindControl("lblCartid");
        Label lblqty = (Label)e.Item.FindControl("lblqty");
        Label lblprice = (Label)e.Item.FindControl("lblprice");
        Label lblUnitPrice = (Label)e.Item.FindControl("lblUnitPrice");
        Label lblConsumerDishCart = (Label)e.Item.FindControl("lblDishcartid");
        string id = lblConsumerDishCart.Text;
        int count = int.Parse(lblqty.Text);
        if (e.CommandName == "Minus")
        {

            if (count > 1)
            {
                count = count - 1;
                lblqty.Text = count.ToString();
                lblprice.Text = (int.Parse(lblqty.Text) * int.Parse(lblUnitPrice.Text)).ToString();
                
                con.update_data("update guest.ConsumerDishCart set  Qty='" + count.ToString() + "' where ConsumerDishCart_ID='" + id + "'");
                con.update_data("update dbo.CartMaster set Cart_Price=Cart_Price-"+int.Parse(lblUnitPrice.Text)+" where Cart_ID='"+cid.Text+"'");
            }
        }
        else if (e.CommandName == "Plus")
        {
            count = count + 1;
            lblqty.Text = count.ToString();
            lblprice.Text = (int.Parse(lblqty.Text) * int.Parse(lblUnitPrice.Text)).ToString();
            con.update_data("update guest.ConsumerDishCart set  Qty='" + count.ToString() + "' where ConsumerDishCart_ID='" + id + "'");
            con.update_data("update dbo.CartMaster set Cart_Price=Cart_Price+" + int.Parse(lblUnitPrice.Text) + " where Cart_ID='" + cid.Text + "'");
        }
        else
        {
            con.delete_data("Delete from guest.ConsumerDishCart where ConsumerDishCart_ID='" + id + "'");
           
        }
        Bind_Cart();
     

    }

    private void Bind_Address()
    {
        SqlParameter[] p1 = new SqlParameter[1];
        p1[0] = new SqlParameter("@ConsumerID", Session["Consumer_ID"].ToString());
        ddladdress.DataSource = con1.Select("SP_ConsumerAllAddress_View",p1);
        ddladdress.DataTextField = "address";
        ddladdress.DataValueField = "Address_ID";
        ddladdress.DataBind();
        ddladdress.Items.Insert(0,"Select Address"); 

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //Response.Redirect("~/Consumer/BillingAddress.aspx");

        ModalPopupExtender1.Show();
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
       // Final_Order_Place();
        //send_verification_code();
        ModalPopupExtender2.Show();

    }

    private void Final_Order_Place()
    {
        // DataSet ds=con.select_data("select * from Cart_Master where Consumer_ID='"+Session["Consumer_ID"].ToString()+"'");
        if (ddladdress.SelectedIndex != 0)
        {

            insertOrderMaster();


            string orderid = con.singlecell("select MAX(Order_ID) from OrderMaster where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");
            insertOrderDish(orderid);

            //InsertTransactionMaster(orderid);



            //con.insert_data("insert into TransactionMaster values('" + orderid + "','','" + lblshippingcharge.Text + "','0','Delivery Charge..','UnPaid','0','" + DateTime.Now + "','" + DateTime.Now + "')");



            Response.Redirect("~/Consumer/dishorder.aspx?Orderid=" + orderid + "");
        }
        else
        {
            lblError.Text = "Please Select Delivery Address ..";
            lblError.ForeColor = System.Drawing.Color.Red;
        }
    }

    public void send_verification_code()
    {
        Random random = new Random();
        int rno = random.Next(0,1000);

        string randomnumber = rno.ToString();

        con.insert_data("insert into Consumer_Varification_Code values('" + randomnumber + "','" + Session["Consumer_ID"].ToString() + "')");

        // use the API URL here  
        string strUrl = "http://bulksms.mysmsmantra.com:8080/WebSMS/SMSAPI.jsp?username=vertilex09&password=rysha2405&sendername=ohsrem&mobileno="+lblcontactno.Text+"&message=" + randomnumber + "";
        // Create a request object  
        WebRequest request = HttpWebRequest.Create(strUrl);
        // Get the response back  
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Stream s = (Stream)response.GetResponseStream();
        StreamReader readStream = new StreamReader(s);
        string dataString = readStream.ReadToEnd();
        response.Close();
        s.Close();
        readStream.Close();   


    }

    private void insertOrderDish(string orderid)
    {
        foreach (DataListItem item in DataList1.Items)
        {
            Label lblDishID = (Label)item.FindControl("lbldishid");
            Label lblSlot = (Label)item.FindControl("lblSlot");
            Label lblChefID = (Label)item.FindControl("lblChefid");
            Label lblQty = (Label)item.FindControl("lblqty");
            Label lblOrderDeliveryDate = (Label)item.FindControl("lblDate");
            Label lblPrice = (Label)item.FindControl("lblPrice");

            SqlParameter[] p1 = new SqlParameter[6];

            p1[0] = new SqlParameter("@OrderID", orderid);
            p1[1] = new SqlParameter("@DishID", int.Parse(lblDishID.Text));
            p1[2] = new SqlParameter("@Slot", lblSlot.Text);
            p1[3] = new SqlParameter("@ChefID", int.Parse(lblChefID.Text));
            p1[4] = new SqlParameter("@Qty", int.Parse(lblQty.Text));
            p1[5] = new SqlParameter("@OrderDeliveryDate", DateTime.Parse(lblOrderDeliveryDate.Text));

            con1.Ins_Upd_Del("SP_OrderDish_Insert", p1);
        }
    }

    private void insertOrderMaster()
    {
        SqlParameter[] p = new SqlParameter[9];
        p[0] = new SqlParameter("@CouponCode", txtCoupon.Text);
        p[1] = new SqlParameter("@Address_ID", int.Parse(ddladdress.SelectedValue));
        p[2] = new SqlParameter("@ConsumerID", Session["Consumer_ID"].ToString());
        p[3] = new SqlParameter("@PaymentMethod", "Cash On Delivery");
        p[4] = new SqlParameter("@TotalAmt", decimal.Parse(lblTotalAmt.Text));
        p[5] = new SqlParameter("@Tax", decimal.Parse(lblTax.Text));
        p[6] = new SqlParameter("@Discount", decimal.Parse(lblDiscount.Text));
        p[7] = new SqlParameter("@DeliveryCharges", lblshippingcharge.Text);
        p[8] = new SqlParameter("@PayableAmt", decimal.Parse(lblFinalTotal.Text));
        con1.Ins_Upd_Del("SP_OrderMaster_Insert", p);
    }

    protected void btnCoupon_Click(object sender, EventArgs e)
    {
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@CouponCode", txtCoupon.Text);
        if (con1.CheckData("SP_CouponMaster_View", p))
        {

            DataRow dr = con1.SingleRow("SP_CouponMaster_View", p);

            if (dr["Free_Shipping"].ToString() == "true")
            {

                ////Delivery Charges are 0...
            }
            else
            {
                int tot = int.Parse(lblTotalAmt.Text.ToString());
                int dis = int.Parse(dr["Discount"].ToString());
                float discount = ((tot * dis) / 100);
                lblDiscount.Text = discount.ToString();
                lblFinalTotal.Text = (int.Parse(lblTotalAmt.Text) - int.Parse(lblDiscount.Text)).ToString();
               // txtCoupon.Text = "";
            }

        }

    }

    protected void ddladdress_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddladdress.SelectedIndex == 0)
        {

        }
        else
        {
            CountDeliveryAmount();
            lblcontactno.Text = con.singlecell("select MobileNo from ConsumerShippingAddress where Address_ID='"+ddladdress.SelectedValue+"'");
        } 
    }

    private void CountDeliveryAmount()
    {
        foreach (DataListItem item in DataList1.Items)
        {
            Label lblcartid = (Label)item.FindControl("lblCartid");
            string ChefID = con.singlecell("select Chef_ID from CartMaster where Cart_ID='" + lblcartid.Text + "'");
            string ChefZipCode = con.singlecell("Select PinCode from ChefPersonalDetail Where Chef_ID='" + ChefID + "'");
            string Destination = con.singlecell("Select Pincode from ConsumerShippingAddress where Address_ID='" + ddladdress.SelectedValue + "'");


            if (con.check_data("Select * from DeliveryCount where Cart_ID='" + lblcartid.Text + "'"))
            {
            }
            else
            {

                var result1 = cf.GetGeocodingSearchResults(ChefZipCode);
                var result2 = cf.GetGeocodingSearchResults(Destination);
                string distance = ShowResults(result1, ChefZipCode, result2, Destination);
                decimal distancedesimal = decimal.Parse(distance);

                int consumerdistance = (int)Math.Round(distancedesimal);

                // txtdestinationzipcode.Text = consumerdistance.ToString();

                int discountdistance = 4, shippingcharge;

                if (consumerdistance <= discountdistance)
                {
                    shippingcharge = 40;
                }
                else
                {
                    consumerdistance = consumerdistance - discountdistance;
                    shippingcharge = (consumerdistance * 8) + 40;
                }

                SqlParameter[] p1 = new SqlParameter[3];
                p1[0] = new SqlParameter("@CartID", lblcartid.Text);
                p1[1] = new SqlParameter("@Mode", 3);
                p1[2] = new SqlParameter("@DeliveryAmt", shippingcharge);
                con1.Ins_Upd_Del("SP_ConsumerCart_Edit", p1);
                con.insert_data("insert into DeliveryCount values('" + ChefID + "','" + consumerdistance.ToString() + "','" + lblcartid.Text + "','" + shippingcharge.ToString() + "')");
            }

        }
        string totdelAmt = con.singlecell("Select Sum(Amount) from DeliveryCount");
        con.delete_data("delete from DeliveryCount");
        lblshippingcharge.Text = totdelAmt;
    }

    public string ShowResults(XElement result1, string zip1, XElement result2, string zip2)
    {
        string loadData = String.Empty;
        var address1 = result1.Element("result").Element("formatted_address").Value;
        var address2 = result2.Element("result").Element("formatted_address").Value;
        double lat1, lat2, lng1, lng2, calcdistance;

        // Get the lat/long info about the address
        var results1 = cf.GetGeocodingSearchResults(address1);
        var results2 = cf.GetGeocodingSearchResults(address2);

        // Set the latitude and longtitude parameters based on the address being searched on
        var lats1 = results1.Element("result").Element("geometry").Element("location").Element("lat").Value;
        var lngs1 = results1.Element("result").Element("geometry").Element("location").Element("lng").Value;
        lat1 = Convert.ToDouble(lats1);
        lng1 = Convert.ToDouble(lngs1);

        var lats2 = results2.Element("result").Element("geometry").Element("location").Element("lat").Value;
        var lngs2 = results2.Element("result").Element("geometry").Element("location").Element("lng").Value;
        lat2 = Convert.ToDouble(lats2);
        lng2 = Convert.ToDouble(lngs2);

        calcdistance = cf.distance(lat1, lng1, lat2, lng2, 'K');
        return calcdistance.ToString();

    }

    protected void ddlarea_SelectedIndexChanged(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
        txtPinCode.Text = con.singlecell("select PinCode from AreaMaster where Area_ID='"+ddlarea.SelectedValue+"'");
    }

    protected void btnAddAddress_Click(object sender, EventArgs e)
    {
        AddAddress();
        Bind_Address();
        //Response.Redirect("~/Consumer/carttest.aspx");
    }

    private void AddAddress()
    {
        SqlParameter[] p = new SqlParameter[9];
        p[0] = new SqlParameter("@ConsumerID", int.Parse(Session["Consumer_ID"].ToString()));
        p[1] = new SqlParameter("@Pincode", txtPinCode.Text);
        p[2] = new SqlParameter("@House", txtapartment.Text);
        p[3] = new SqlParameter("@Block", txtblockno.Text);
        p[4] = new SqlParameter("@Society", txtsociatyname.Text);
        p[5] = new SqlParameter("@Area", ddlarea.SelectedItem.ToString());
        p[6] = new SqlParameter("@City", ddlcity.SelectedItem.ToString());
        p[7] = new SqlParameter("@LandMark", ddlLandMark.SelectedItem.Text);
        p[8] = new SqlParameter("@MobileNo", txtmobileno.Text);
        
        if (con1.CheckData("SP_ConsumerShippingAddress_Check", p))
        {
            ////////Already Exist
        }
        else
        {
            con1.Ins_Upd_Del("SP_ConsumerShippingAddress_Insert", p);
        }

        txtapartment.Text = "";
        txtblockno.Text = "";
        Bind_Area_Detail();
        txtPinCode.Text = "";
        txtsociatyname.Text = "";
    }
    protected void btnVarificationCheck_Click(object sender, EventArgs e)
    {
        string verificationcode = con.singlecell("select code from Consumer_Varification_Code where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");

        if (txtcode.Text == verificationcode)
        {
            lblverificationerror.Visible = false;
           // Final_Order_Place();
            ModalPopupExtender2.Hide();
        }
        else
        {
            lblverificationerror.Visible = true;  
        }
    }
}