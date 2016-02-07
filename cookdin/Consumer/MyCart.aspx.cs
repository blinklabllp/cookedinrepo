using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Linq;
using System.Configuration;


public partial class Consumer_MyCart : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    Myconnection con = new Myconnection();
    commonfunctions cf = new commonfunctions();
    EncryptionDecryption en = new EncryptionDecryption();
    CheckUserSession objcheck = new CheckUserSession();
    public static string addressid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Check_USerID_Exist();
            Bind_Cart();
            Bind_Area_Detail();
        }

    }
    private void Check_USerID_Exist()
    {
        if (Session["Consumer_ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
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
        //Bind_Address_dropdown();
        //Bind_Defalut_Address();
    }
    private void Bind_Address_dropdown()
    {
        SqlParameter[] p1 = new SqlParameter[1];
        p1[0] = new SqlParameter("@ConsumerID", Session["Consumer_ID"].ToString());
        ddladdress.DataSource = con1.Select("SP_ConsumerAllAddress_View", p1);
        ddladdress.DataTextField = "address";
        ddladdress.DataValueField = "Address_ID";
        ddladdress.DataBind();
        ddladdress.Items.Insert(0, "Select Address");

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
        //p[8] = new SqlParameter("@IsDefault", ddlLandmark.Text);



        if (con1.CheckData("SP_ConsumerShippingAddress_Check", p))
        {
            ////////Already Exist
        }
        else
        {
            con1.Ins_Upd_Del("SP_ConsumerShippingAddress_Insert", p);
            Bind_Address_dropdown();
            Bind_Cart();
        }

        txtapartment.Text = "";
        txtblockno.Text = "";
        Bind_Area_Detail();
        txtPinCode.Text = "";
        txtsociatyname.Text = "";

       

    }
    private void Bind_Cart()
    {
        Check_USerID_Exist();

        lblcartcount.Text = con.singlecell("SELECT count(ConsumerDishCart.ConsumerDishCart_ID) FROM  dbo.CartMaster INNER JOIN ConsumerDishCart ON dbo.CartMaster.Cart_ID = ConsumerDishCart.Cart_ID and CartMaster.Consumer_ID='"+Session["Consumer_ID"].ToString()+"'");
        SqlParameter[] p = new SqlParameter[0];
        //con1.Ins_Upd_Del("SP_CartDelete", p);

        SqlParameter[] p1 = new SqlParameter[1];
        p1[0] = new SqlParameter("@ConsumerID", Session["Consumer_ID"].ToString());
        DataList1.DataSource = con1.Select("SP_ConsumerCartDishList_View", p1);
        DataList1.DataBind();

        Bind_Defalut_Address();
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
                string getvalue=con.singlecell("Select Delivery_Amt from CartMaster where Cart_ID='" + lblCartid.Text + "'");
                if (getvalue == "-1")
                {
                    lblDelivery.Text = "Not Deliver";
                    lblDelivery.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lblDelivery.Text = getvalue;
                }
            }
        }
        lblOrderAmt.Text = totAmt.ToString();
        float taxper = float.Parse(ConfigurationManager.AppSettings["ServiceTAX"].ToString());
        float tax = (totAmt * taxper) / 100;
        lblTax.Text = tax.ToString();
        //lblFinalTotal.Text = (totAmt + tax).ToString();
        // CountDeliveryAmount();

        if (lblOrderAmt.Text == null)
        {
            lblOrderAmt.Text = "0";
        }
        if (lblshippingcharge.Text == null)
        {
            lblshippingcharge.Text = "0";
        }
        if (lblTax.Text == null)
        {
            lblTax.Text = "0";
        }
        if (lblDiscount.Text == null)
        {
            lblDiscount.Text = "0";
        }

        try
        {
            lblPayable.Text = (float.Parse(lblOrderAmt.Text) + float.Parse(lblshippingcharge.Text) + float.Parse(lblTax.Text) - float.Parse(lblDiscount.Text)).ToString();
        }
        catch(Exception ex)
        {
        }
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
                    con.update_data("Update CartMaster set Discount=0 where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");
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
           // string addressid = con.singlecell("select max(Address_ID) from ConsumerShippingAddress where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");

            DataRow dr = con.singlerow("select  * from ConsumerShippingAddress where Deleted=0 and Consumer_ID='" + Session["Consumer_ID"].ToString() + "' and Address_ID='" + ddladdress.SelectedValue + "'");
            lblhouseno.Text = dr["House_No"].ToString();
            lblblockno.Text = dr["Block_No"].ToString();
            lblsocityname.Text = dr["Society_Name"].ToString();
            lblarea.Text = dr["Area"].ToString();
            lblcity.Text = dr["City"].ToString();
            lblandmark.Text = dr["Landmark"].ToString();
            lblpincode.Text = dr["Pincode"].ToString();
            lblAddressID.Text = ddladdress.SelectedValue;
            if (!con.check_data("select * from areamaster where PinCode='" + lblpincode.Text + "'"))
            {
                lbladdressmessage.Text = System.Configuration.ConfigurationManager.AppSettings["OutOFDeliveryRangeMessage"];
                lbladdressmessage.Visible = true;
            }
            else
            {
                lbladdressmessage.Text = "";
                CountDeliveryAmount();
                lblPayable.Text = (float.Parse(lblOrderAmt.Text) + float.Parse(lblshippingcharge.Text) + float.Parse(lblTax.Text) - float.Parse(lblDiscount.Text)).ToString();
                lbladdressmessage.Visible = false;
            }


        }
    }
    public void Bind_Defalut_Address()
    {
        if (con.check_data("select * from ConsumerShippingAddress where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'"))
        {
             addressid = con.singlecell("select max(Address_ID) from ConsumerShippingAddress where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");

            if (con.check_data("select  * from ConsumerShippingAddress where Deleted=0 and Consumer_ID='" + Session["Consumer_ID"].ToString() + "' and Address_ID='" + addressid + "'"))
            {
                DataRow dr = con.singlerow("select  * from ConsumerShippingAddress where Deleted=0 and Consumer_ID='" + Session["Consumer_ID"].ToString() + "' and Address_ID='" + addressid + "'");
                lblAddressID.Text = dr["Address_ID"].ToString();
                lblhouseno.Text = dr["House_No"].ToString();
                lblblockno.Text = dr["Block_No"].ToString();
                lblsocityname.Text = dr["Society_Name"].ToString();
                lblarea.Text = dr["Area"].ToString();
                lblcity.Text = dr["City"].ToString();
                lblandmark.Text = dr["Landmark"].ToString();
                lblpincode.Text = dr["Pincode"].ToString();
                Bind_Address_dropdown();
                //CountDeliveryAmount();

                if (!con.check_data("select * from areamaster where PinCode='" + lblpincode.Text + "'"))
                {
                    lbladdressmessage.Text = System.Configuration.ConfigurationManager.AppSettings["OutOFDeliveryRangeMessage"];
                    lbladdressmessage.Visible = true;
                }
                else
                {
                    lbladdressmessage.Text = "";
                    CountDeliveryAmount();
                    //lblPayable.Text = (float.Parse(lblOrderAmt.Text) + float.Parse(lblshippingcharge.Text) + float.Parse(lblTax.Text) - float.Parse(lblDiscount.Text)).ToString();
                    lbladdressmessage.Visible = false;
                }
            }
        }
        int count = ddladdress.Items.Count;

        if (count == 1)
        {
            pnladdressbar.Visible = false;
        }
        else
        {
            pnladdressbar.Visible = true;
           // pnladdressbar.Visible = false;
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
            
            //string consumeraddresss = objcheck.get_User_Address(Session["Consumer_ID"].ToString(),false,true,addressid);
            //string chefaddress = objcheck.get_User_Address(ChefID,true,true,null);

            if (con.check_data("Select * from DeliveryCount where Cart_ID='" + lblcartid.Text + "'"))
            {
            }
            else
            {
             commonfunctions cf = new commonfunctions();
                Dictionary<string, string> fromvalues = new Dictionary<string, string>();
                //fromvalues = cf.CalculateResult(chefaddress, consumeraddresss);
                fromvalues = cf.CalculateResult(ChefZipCode, Destination);
                lblshippingcharge.Text = fromvalues["charges"];

                string shippingcarge = fromvalues["charges"];

                    int shippingcharge = int.Parse(fromvalues["charges"]);
                    SqlParameter[] p1 = new SqlParameter[3];
                    p1[0] = new SqlParameter("@CartID", lblcartid.Text);
                    p1[1] = new SqlParameter("@Mode", 3);
                    p1[2] = new SqlParameter("@DeliveryAmt", shippingcharge);

                    con1.Ins_Upd_Del("SP_ConsumerCart_Edit", p1);
                   // con.insert_data("insert into DeliveryCount values('" + ChefID + "','" + fromvalues["distancecount"] + "','" + lblcartid.Text + "','" + shippingcharge.ToString() + "')");
                    con.insert_data("insert into DeliveryCount values('" + Session["Consumer_ID"] + "','" + fromvalues["distancecount"] + "','" + lblcartid.Text + "','" + shippingcharge.ToString() + "')");
               
            }

        }
        string totdelAmt = con.singlecell("Select Sum(Amount) from DeliveryCount where Chef_ID='" + Session["Consumer_ID"] + "' and Amount!='-1'");
        con.delete_data("delete from DeliveryCount where Chef_ID='" + Session["Consumer_ID"] + "'");
        lblshippingcharge.Text = totdelAmt;
    }
 
    protected void btnCheckOut_Click(object sender, EventArgs e)
    
    {
        int flag=check_MyCart_For_Checkout();
        if (pnladdressbar.Visible == false)
        {
            lbladdressmessage.Visible = true;
            lbladdressmessage.Text = "Please Select Delivery Address";
        }
        else if (flag==1)
        {
           // lbladdressmessage.Visible = true;
          //  lbladdressmessage.Text = "Please remove the item where delivery not deliver";

            pnlwarning.Visible = true;
            lblwarningmessage.Text = System.Configuration.ConfigurationManager.AppSettings["CartDishRemoveMessage"];
        }
        else
        {
            pnlwarning.Visible = false;
            lbladdressmessage.Visible = true;
            if (Session["Coupon"] == null)
            {
                Session["Coupon"] = 0;
            }
            Session["Payable"] = lblOrderAmt.Text;
            Session["Shipping"] = lblshippingcharge.Text;
            Session["Tax"] = lblTax.Text;
            Session["Discount"] = lblDiscount.Text;
            Session["AddressID"] = lblAddressID.Text;
            Response.Redirect("~/Consumer/checkout.aspx");
        }
    }

    public int check_MyCart_For_Checkout()
    {

        int flag = 0;
        foreach (DataListItem item in DataList1.Items)
        {
            Label lblDelivery = (Label)item.FindControl("lblDelivery");

            if (lblDelivery.Text == "Not Deliver")
            {
                flag = 1;
            }
        }
        return flag;

    }
}