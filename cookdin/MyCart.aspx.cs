using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Linq;
public partial class Consumer_MyCart : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    Myconnection con = new Myconnection();
    commonfunctions cf = new commonfunctions();
    EncryptionDecryption en = new EncryptionDecryption();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Check_USerID_Exist();
            Bind_Cart(); 
 pnladdressbar.Visible = false;
        }

    }
    private void Check_USerID_Exist()
    {
        Session["Temp_Consumer_ID"] = con1.getipaddress();
        if (Session["Temp_Consumer_ID"] == null)
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
    protected void ddlarea_SelectedIndexChanged(object sender, EventArgs e)
    {
        ModalPopupExtender1.Show();
        txtPinCode.Text = con.singlecell("select PinCode from AreaMaster where Area_ID='" + ddlarea.SelectedValue + "'");
    }
    protected void btnAddAddress_Click(object sender, EventArgs e)
    {
        AddAddress();
        Bind_Address_dropdown();
        Bind_Defalut_Address();
    }
    private void Bind_Address_dropdown()
    {
        SqlParameter[] p1 = new SqlParameter[1];
        p1[0] = new SqlParameter("@ConsumerID", Session["Temp_Consumer_ID"].ToString());
        ddladdress.DataSource = con1.Select("SP_ConsumerAllAddress_View", p1);
        ddladdress.DataTextField = "address";
        ddladdress.DataValueField = "Address_ID";
        ddladdress.DataBind();
        ddladdress.Items.Insert(0, "Select Address");

    }
    private void AddAddress()
    {
        SqlParameter[] p = new SqlParameter[9];
        p[0] = new SqlParameter("@ConsumerID", int.Parse(Session["Temp_Consumer_ID"].ToString()));
        p[1] = new SqlParameter("@Pincode", txtPinCode.Text);
        p[2] = new SqlParameter("@House", txtapartment.Text);
        p[3] = new SqlParameter("@Block", txtblockno.Text);
        p[4] = new SqlParameter("@Society", txtsociatyname.Text);
        p[5] = new SqlParameter("@Area", ddlarea.SelectedItem.ToString());
        p[6] = new SqlParameter("@City", ddlcity.SelectedItem.ToString());
        p[7] = new SqlParameter("@LandMark", ddlLandMark.SelectedItem.Text);
        p[8] = new SqlParameter("@MobileNo", txtmobileno.Text);
        //p[8] = new SqlParameter("@IsDefault", ddlLandmark.Text);



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

        Bind_Address_dropdown();

    }
    private void Bind_Cart()
    {
        Check_USerID_Exist();

        lblcartcount.Text = con.singlecell("SELECT count(ConsumerDishCart.ConsumerDishCart_ID) FROM  dbo.CartMaster INNER JOIN ConsumerDishCart ON dbo.CartMaster.Cart_ID = ConsumerDishCart.Cart_ID and CartMaster.Consumer_ID='"+Session["Temp_Consumer_ID"].ToString()+"'");
        SqlParameter[] p = new SqlParameter[0];
        //con1.Ins_Upd_Del("SP_CartDelete", p);

        SqlParameter[] p1 = new SqlParameter[1];
        p1[0] = new SqlParameter("@ConsumerID", Session["Temp_Consumer_ID"].ToString());
        DataList1.DataSource = con1.Select("SP_ConsumerCartDishList_View", p1);
        DataList1.DataBind();
        int totAmt = 0;
        foreach (DataListItem item in DataList1.Items)
        {
            Label lblprice = (Label)item.FindControl("lblprice");
            Label lblDelivery = (Label)item.FindControl("lblDelivery");
            Label lblStatus = (Label)item.FindControl("lblStatus");
           Label lblCartid = (Label)item.FindControl("lblCartid");
           Label Dishid = (Label)item.FindControl("lbldishid");
            Label lblQty = (Label)item.FindControl("lblqty");
            Label lblUnitPrice = (Label)item.FindControl("lblUnitPrice");

           DataRow dr = con.singlerow("select * from ChefDishMaster where Dish_ID='"+Dishid.Text+"'");


           string today = DateTime.Now.ToString();
           string start = dr["OfferStartDate"].ToString();
           string end = dr["OfferEndDate"].ToString();
           int price = int.Parse(dr["Price"].ToString());
           if (start != "" && end != "")
           {

               if ((DateTime.Parse(today) >= DateTime.Parse(start) && DateTime.Parse(today) <= DateTime.Parse(end)))
               {
                   price = int.Parse(dr["SpecialOfferPrice"].ToString());
               }
           }

           lblUnitPrice.Text = price.ToString();
           lblprice.Text = (price*(int.Parse(lblQty.Text))).ToString();
            

            totAmt += int.Parse(lblprice.Text);
            if (lblStatus.Text == "True")
            {
                lblDelivery.Text = con.singlecell("Select Delivery_Amt from CartMaster where Cart_ID='"+lblCartid.Text+"'");
            }
            

        }
        lblOrderAmt.Text = totAmt.ToString();

        float tax = (totAmt * 12) / 100;
        lblTax.Text = tax.ToString();
        //lblFinalTotal.Text = (totAmt + tax).ToString();
        // CountDeliveryAmount();
        lblPayable.Text = (float.Parse(lblOrderAmt.Text) + float.Parse(lblshippingcharge.Text) + float.Parse(lblTax.Text) - float.Parse(lblDiscount.Text)).ToString();
        if (DataList1.Items.Count <= 0)
        {
            MultiView1.ActiveViewIndex = 1;
        }
        else
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Check_USerID_Exist();

        Label cid = (Label)e.Item.FindControl("lblCartid");
        Label lblqty = (Label)e.Item.FindControl("lblqty");
        Label lblprice = (Label)e.Item.FindControl("lblprice");
        Label lblUnitPrice = (Label)e.Item.FindControl("lblUnitPrice");
        Label lblConsumerDishCart = (Label)e.Item.FindControl("lblDishcartid");
        Label lblDate = (Label)e.Item.FindControl("lblDate");
        TextBox txtCoupon = (TextBox)e.Item.FindControl("txtCoupon");
        Label lblChefid = (Label)e.Item.FindControl("lblChefid");
        Label lblcoupon = (Label)e.Item.FindControl("lblcoupon");
        string id = lblConsumerDishCart.Text;
        int count = int.Parse(lblqty.Text);
        if (e.CommandName == "Minus")
        {

            if (count > 1)
            {
                count = count - 1;
                lblqty.Text = count.ToString();
                lblprice.Text = (int.Parse(lblqty.Text) * int.Parse(lblUnitPrice.Text)).ToString();

                con.update_data("update ConsumerDishCart set  Qty='" + count.ToString() + "' where ConsumerDishCart_ID='" + id + "'");
                con.update_data("update dbo.CartMaster set Cart_Price=Cart_Price-" + int.Parse(lblUnitPrice.Text) + " where Cart_ID='" + cid.Text + "'");
//CountDeliveryAmount();

            }
        }
        else if (e.CommandName == "Plus")
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@Chef_ID", lblChefid.Text);
            string chefqty = con1.SingleCell("SP_ChefQty_View", p);
            string date = lblDate.Text;
            if (date == "")
            {
                date = DateTime.Now.ToString();
            }
            SqlParameter[] p1 = new SqlParameter[2];
            p1[0] = new SqlParameter("@Chef_ID", lblChefid.Text);
            p1[1] = new SqlParameter("@OrderDate", DateTime.Parse(date));

            string cartqty = con1.SingleCell("SP_ConsumerDishCartQty_View", p1);
            int chef_qty = int.Parse(chefqty);
            int Cart_qty;
            if (cartqty == "" || cartqty == null)
            {
                Cart_qty = 0;

            }
            else
                Cart_qty = int.Parse(cartqty);
            if (chef_qty > Cart_qty && (chef_qty - Cart_qty) > int.Parse(lblqty.Text))
            {
                count = count + 1;
                lblqty.Text = count.ToString();
                lblprice.Text = (int.Parse(lblqty.Text) * int.Parse(lblUnitPrice.Text)).ToString();
                con.update_data("update ConsumerDishCart set  Qty='" + count.ToString() + "' where ConsumerDishCart_ID='" + id + "'");
                con.update_data("update dbo.CartMaster set Cart_Price=Cart_Price+" + int.Parse(lblUnitPrice.Text) + " where Cart_ID='" + lblChefid.Text + "'");
//CountDeliveryAmount();

            }
            
        }
        else if (e.CommandName == "Remove")
        {
            con.delete_data("Delete from ConsumerDishCart where ConsumerDishCart_ID='" + id + "'");

        }
        else if (e.CommandName == "Apply")
        {
            
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@CouponCode", txtCoupon.Text);
            if (con1.CheckData("SP_CouponMaster_View", p))
            {
                Session["Coupon"] = txtCoupon.Text;
                DataRow dr = con1.SingleRow("SP_CouponMaster_View", p);

                if (dr["Free_Shipping"].ToString() == "true")
                {

                    ////Delivery Charges are 0...
                    con.update_data("Update CartMaster Delivery_Amt=0 where Cart_ID='" + cid.Text + "'");
                }
                else
                {
                    float tot = float.Parse(lblprice.Text);
                    int dis = int.Parse(dr["Discount"].ToString());
                    float discount = ((tot * dis) / 100);
                    lblDiscount.Text = discount.ToString();
                    lblprice.Text = (float.Parse(lblprice.Text) - float.Parse(lblDiscount.Text)).ToString();
                    // txtCoupon.Text = "";
                    con.update_data("Update CartMaster set Discount=0 where Consumer_ID='" + Session["Temp_Consumer_ID"].ToString() + "'");
                    con.update_data("Update CartMaster set Discount=" + lblDiscount.Text + " where Cart_ID='" + cid.Text + "'");

                }

                lblcoupon.ForeColor = System.Drawing.Color.Green;
                lblcoupon.Text = "Coupon Code Applied.";

            }
            else
            {
                lblcoupon.ForeColor = System.Drawing.Color.Red;
                lblcoupon.Text = "Coupon Code has been Expired";   
            }

        }
        Bind_Cart();

    }
    protected void ddladdress_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddladdress.SelectedIndex == 0)
        {

        }
        else
        {
           // CountDeliveryAmount();
           // lblcontactno.Text = con.singlecell("select MobileNo from ConsumerShippingAddress where Address_ID='" + ddladdress.SelectedValue + "'");
           // string addressid = con.singlecell("select max(Address_ID) from ConsumerShippingAddress where Consumer_ID='" + Session["Temp_Consumer_ID"].ToString() + "'");

            DataRow dr = con.singlerow("select  * from ConsumerShippingAddress where Deleted=0 and Consumer_ID='" + Session["Temp_Consumer_ID"].ToString() + "' and Address_ID='" + ddladdress.SelectedValue + "'");
            lblhouseno.Text = dr["House_No"].ToString();
            lblblockno.Text = dr["Block_No"].ToString();
            lblsocityname.Text = dr["Society_Name"].ToString();
            lblarea.Text = dr["Area"].ToString();
            lblcity.Text = dr["City"].ToString();
            lblandmark.Text = dr["Landmark"].ToString();
            lblpincode.Text = dr["Pincode"].ToString();
            lblAddressID.Text = ddladdress.SelectedValue;
            


        }
    }
    public void Bind_Defalut_Address()
    {
        if (con.check_data("select max(Address_ID) from ConsumerShippingAddress where Consumer_ID='" + Session["Temp_Consumer_ID"].ToString() + "'"))
        {
            //DataRow dr = con.singlerow("select * from ConsumerShippingAddress where Deleted=0 and Consumer_ID='" + Session["Temp_Consumer_ID"].ToString() + "'");
            //lblAddressID.Text = dr["Address_ID"].ToString();
            //lblhouseno.Text = dr["House_No"].ToString();
            //lblblockno.Text = dr["Block_No"].ToString();
            //lblsocityname.Text = dr["Society_Name"].ToString();
            //lblarea.Text = dr["Area"].ToString();
            //lblcity.Text = dr["City"].ToString();
            //lblandmark.Text = dr["Landmark"].ToString();
            //lblpincode.Text = dr["Pincode"].ToString();



            string addressid = con.singlecell("select max(Address_ID) from ConsumerShippingAddress where Consumer_ID='" + Session["Temp_Consumer_ID"].ToString() + "'");

            DataRow dr = con.singlerow("select  * from ConsumerShippingAddress where Deleted=0 and Consumer_ID='" + Session["Temp_Consumer_ID"].ToString() + "' and Address_ID='" + addressid + "'");
            lblAddressID.Text = dr["Address_ID"].ToString();
            lblhouseno.Text = dr["House_No"].ToString();
            lblblockno.Text = dr["Block_No"].ToString();
            lblsocityname.Text = dr["Society_Name"].ToString();
            lblarea.Text = dr["Area"].ToString();
            lblcity.Text = dr["City"].ToString();
            lblandmark.Text = dr["Landmark"].ToString();
            lblpincode.Text = dr["Pincode"].ToString();
            Bind_Address_dropdown();
            
        }
        int count = ddladdress.Items.Count;

        if (count == 1)
        {
            pnladdressbar.Visible = false;
        }
        else
        {
            pnladdressbar.Visible = true;
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {

    }
    private void CountDeliveryAmount()
    {
        foreach (DataListItem item in DataList1.Items)
        {
            Label lblcartid = (Label)item.FindControl("lblCartid");
            string ChefID = con.singlecell("select Chef_ID from CartMaster where Cart_ID='" + lblcartid.Text + "'");
            string ChefZipCode = con.singlecell("Select PinCode from ChefPersonalDetail Where Chef_ID='" + ChefID + "'");
            string Destination = lblpincode.Text;


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
    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/checkout.aspx");
    }
}