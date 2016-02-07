using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Consumer_checkout : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    string paymentmode="Cash On Delivery.";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblDiscount.Text = Session["Discount"].ToString();
            lblTotAmt.Text = (float.Parse(Session["Payable"].ToString()) + float.Parse(Session["Tax"].ToString()) + float.Parse(Session["Shipping"].ToString())).ToString();
            lblPayableAmt.Text = (float.Parse(lblTotAmt.Text) - float.Parse(lblDiscount.Text)).ToString();
            lblOrderAmt.Text = lblTotAmt.Text;


 try
            {

            DataRow dr = con.singlerow("select  * from ConsumerShippingAddress where Address_ID='" + Session["AddressID"].ToString() + "'");
            lblAddressID.Text = dr["Address_ID"].ToString();
            lblhouseno.Text = dr["House_No"].ToString();
            lblblockno.Text = dr["Block_No"].ToString();
            lblsocityname.Text = dr["Society_Name"].ToString();
            lblarea.Text = dr["Area"].ToString();
            lblcity.Text = dr["City"].ToString();
            lblandmark.Text = dr["Landmark"].ToString();
            lblpincode.Text = dr["Pincode"].ToString();
}
  catch(Exception ex)
            {
            }

            
        }
    }
    protected void btnProceed_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedIndex == 0)
        {
            //Response.Write("<script>alert('method will call');</script>");
            Final_Order_Place();

           
        }
        else
        {
            Response.Write("<script>alert('Credit Card Option Not Available');</script>");
        }
        
    }

    private void Final_Order_Place()
    {
        // DataSet ds=con.select_data("select * from Cart_Master where Consumer_ID='"+Session["Consumer_ID"].ToString()+"'");
       
            insertOrderMaster();
            string srno = con.singlecell("select MAX(Serial_No) from OrderMaster where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");
            string orderid = con.singlecell("Select Order_ID from OrderMaster where Serial_No='"+srno+"'");
            //insertOrderDish(orderid);
            InsertInvoiceMaster(orderid);
            //con.insert_data("insert into TransactionMaster values('" + orderid + "','','" + lblshippingcharge.Text + "','0','Delivery Charge..','UnPaid','0','" + DateTime.Now + "','" + DateTime.Now + "')");
            //InsertTransactionMaster(orderid);
            DataSet ds = con.select_data("select * from CartMaster where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DataRow dr = ds.Tables[0].Rows[i];


                con.delete_data("Delete from ConsumerDishCart where Cart_ID='" + dr["Cart_ID"].ToString() + "'");
            }
            con.delete_data("delete from CartMaster where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");
            Response.Redirect("~/Consumer/mydishorder.aspx?Orderid=" + orderid + "");
       
    }

    private void InsertInvoiceMaster(string orderid)
    {
        DataSet ds = con.select_data("select * from CartMaster where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            DataRow dr = ds.Tables[0].Rows[i];
            float adminCommision = float.Parse(con.singlecell("select Admin_Commision from ChefAccountDetail where Chef_ID='" + dr["Chef_ID"].ToString() + "'"));
            float admin_amt = (float.Parse(dr["Cart_Price"].ToString()) * adminCommision) / 100;
            float chef_amt = float.Parse(dr["Cart_Price"].ToString()) - admin_amt;
            float tax = (float.Parse(dr["Cart_Price"].ToString()) * 12) / 100;
            float Discount = float.Parse(dr["Discount"].ToString());
            float total = float.Parse(dr["Cart_Price"].ToString());
            float delivery = float.Parse(dr["Delivery_Amt"].ToString());
            float payableamt = total + tax + delivery - Discount;

            SqlParameter[] p = new SqlParameter[12];
            p[0] = new SqlParameter("@Order_ID", orderid);
            p[1] = new SqlParameter("@Chef_ID", dr["Chef_ID"].ToString());
            p[2] = new SqlParameter("@Slot", dr["Slot"].ToString());
            p[3] = new SqlParameter("@DeliveryDate", DateTime.Parse(dr["Order_Date"].ToString()));
            p[4] = new SqlParameter("@Total", total);
            p[5] = new SqlParameter("@Discount", Discount);
            p[6] = new SqlParameter("@Tax", tax);
            p[7] = new SqlParameter("@DeliveryCharge", delivery);
            p[8] = new SqlParameter("@PaymentMethod", "Case On Delivery");
            p[9] = new SqlParameter("@PayableAmount", payableamt);
            p[10] = new SqlParameter("@CouponCode", Session["Coupon"].ToString());
            p[11] = new SqlParameter("@Consumer_ID", Session["Consumer_ID"].ToString());

            con1.Ins_Upd_Del("SP_InvoiceMaster_Insert", p);
            string invoiceid = con.singlecell("Select MAX(Invoice_ID) from InvoiceMaster where Consumer_ID='" + Session["Consumer_ID"].ToString() + "'");



            DataSet ds1 = con.select_data("select * from ConsumerDishCart where Cart_ID='" + dr["Cart_ID"].ToString() + "'");

            for (int j = 0; j < ds1.Tables[0].Rows.Count; j++)
            {
                DataRow dr1 = ds1.Tables[0].Rows[j];

                string today = DateTime.Now.ToString();
                string start = con.singlecell("select OfferStartDate from ChefDishMaster where Dish_ID='" + dr1["Dish_ID"].ToString() + "'");
                string end = con.singlecell("select OfferEndDate from ChefDishMaster where Dish_ID='" + dr1["Dish_ID"].ToString() + "'");

                string price = con.singlecell("select Price from ChefDishMaster where Dish_ID='" + dr1["Dish_ID"].ToString() + "'");

                if (start != "" && end != "")
                {

                    if ((DateTime.Parse(today) >= DateTime.Parse(start) && DateTime.Parse(today) <= DateTime.Parse(end)))
                    {
                        price = con.singlecell("select SpecialOfferPrice from ChefDishMaster where Dish_ID='" + dr1["Dish_ID"].ToString() + "'");
                    }
                    //else
                    //{
                    //    price = con.singlecell("select Price from ChefDishMaster where Dish_ID='" + dr1["Dish_ID"].ToString() + "'");
                    //}
                }


                SqlParameter[] p1 = new SqlParameter[4];
                p1[0] = new SqlParameter("@Invoice_ID", invoiceid);
                p1[1] = new SqlParameter("@Dish_ID", dr1["Dish_ID"].ToString());
                p1[2] = new SqlParameter("@Qty", dr1["Qty"].ToString());
                p1[3] = new SqlParameter("@Price", price);


                con1.Ins_Upd_Del("SP_Invoice_Dish_Insert", p1);

            }


        }
    }

   

    private void insertOrderDish(string orderid)
    {
        //foreach (DataListItem item in DataList1.Items)
        //{
        //    Label lblDishID = (Label)item.FindControl("lbldishid");
        //    Label lblSlot = (Label)item.FindControl("lblSlot");
        //    Label lblChefID = (Label)item.FindControl("lblChefid");
        //    Label lblQty = (Label)item.FindControl("lblqty");
        //    Label lblOrderDeliveryDate = (Label)item.FindControl("lblDate");
        //    Label lblPrice = (Label)item.FindControl("lblPrice");

        //    SqlParameter[] p1 = new SqlParameter[6];

        //    p1[0] = new SqlParameter("@OrderID", orderid);
        //    p1[1] = new SqlParameter("@DishID", int.Parse(lblDishID.Text));
        //    p1[2] = new SqlParameter("@Slot", lblSlot.Text);
        //    p1[3] = new SqlParameter("@ChefID", int.Parse(lblChefID.Text));
        //    p1[4] = new SqlParameter("@Qty", int.Parse(lblQty.Text));
        //    p1[5] = new SqlParameter("@OrderDeliveryDate", DateTime.Parse(lblOrderDeliveryDate.Text));

        //    con1.Ins_Upd_Del("SP_OrderDish_Insert", p1);
        //}
    }

    private void insertOrderMaster()
    {

        SqlParameter[] p = new SqlParameter[9];
        p[0] = new SqlParameter("@CouponCode", Session["Coupon"].ToString());
        p[1] = new SqlParameter("@Address_ID", int.Parse(lblAddressID.Text));
        p[2] = new SqlParameter("@ConsumerID", Session["Consumer_ID"].ToString());
        p[3] = new SqlParameter("@PaymentMethod", RadioButtonList1.SelectedItem.ToString());
        p[4] = new SqlParameter("@TotalAmt", Session["Payable"].ToString());
        p[5] = new SqlParameter("@Tax", Session["Tax"].ToString());
        p[6] = new SqlParameter("@Discount", Session["Discount"].ToString());
        p[7] = new SqlParameter("@DeliveryCharges", Session["Shipping"].ToString());
        p[8] = new SqlParameter("@PayableAmt", float.Parse(lblOrderAmt.Text));
        con1.Ins_Upd_Del("SP_OrderMaster_Insert", p);
    }


   
}