using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Payout_Chef_List : System.Web.UI.Page
{
    SP_MyConnection con1 = new SP_MyConnection();
    Myconnection con = new Myconnection();
    protected void Page_Load(object sender, EventArgs e)
     {

        if (!IsPostBack)
        {
           string Invoiceid = Request.QueryString.Get("id");
           if (Invoiceid != null)
           {
               SqlParameter[] p1 = new SqlParameter[2];
               p1[0] = new SqlParameter("@InvoiceID", int.Parse(Invoiceid));
               p1[1] = new SqlParameter("@Mode", 3);
               con1.Ins_Upd_Del("SP_CookingStatus_Edit", p1);

               InsertTransactionMaster(Invoiceid);

               
           }
           
               Repeater1.DataSource = con1.Select("SP_ReadyToPickUpOrderList_View");
               Repeater1.DataBind();


           
        }
    }


    private void InsertTransactionMaster(string Invoiceid)
    {
        DataRow dr = con.singlerow("select * from InvoiceMaster where Invoice_ID='" + Invoiceid + "'");
        // DataRow dr = ds.Tables[0].Rows[i];

            int adminCommision = int.Parse(con.singlecell("select Admin_Commision from ChefAccountDetail where Chef_ID='" + dr["Chef_ID"].ToString() + "'"));
            float admin_amt = (float.Parse(dr["Total"].ToString()) * adminCommision) / 100;
            float chef_amt = float.Parse(dr["Total"].ToString()) - admin_amt;

            ////Add TransactionMAster

            SqlParameter[] p2 = new SqlParameter[6];

            p2[0] = new SqlParameter("@Chef_ID", int.Parse(dr["Chef_ID"].ToString()));
            p2[1] = new SqlParameter("@Slot", dr["Slot"].ToString());
            p2[2] = new SqlParameter("@InvoiceID", Invoiceid);
            p2[3] = new SqlParameter("@AdminAmount", admin_amt);
            p2[4] = new SqlParameter("@ChefAmt", chef_amt);
            p2[5] = new SqlParameter("@Detail", "Dish Selling..");
            p2[6] = new SqlParameter("@Delivery_Amount", dr["DeliveryCharge"].ToString());
            p2[7] = new SqlParameter("@Tax", dr["TAX"].ToString());
            p2[8] = new SqlParameter("@Discount", dr["Discount"].ToString());
            con1.Ins_Upd_Del("SP_TransactionMaster1_Insert", p2);

            //Add AdminCommision
            SqlParameter[] p = new SqlParameter[3];
            p[0] = new SqlParameter("@Mode", 1);
            p[1] = new SqlParameter("@AdminCommision", admin_amt);
            p[2] = new SqlParameter("@Chef_ID", int.Parse(dr["Chef_ID"].ToString()));
            con1.Ins_Upd_Del("SP_ChefAccountDetail_Edit", p);

            admin_amt=admin_amt+float.Parse(dr["DeliveryCharge"].ToString())+float.Parse(dr["TAX"].ToString())-float.Parse(dr["Discount"].ToString());


            //Add AdminEMoney..
            SqlParameter[] pa = new SqlParameter[2];
            pa[0] = new SqlParameter("@Mode", 2);
            pa[1] = new SqlParameter("@Amount", admin_amt);
            con1.Ins_Upd_Del("SP_AdminWallet_Edit", pa);

           

            //Add AvailableBal
            SqlParameter[] p1 = new SqlParameter[3];
            p1[0] = new SqlParameter("@Mode", 2);
            p1[1] = new SqlParameter("@AvailableBal", chef_amt);
            p1[2] = new SqlParameter("@Chef_ID", int.Parse(dr["Chef_ID"].ToString()));
            con1.Ins_Upd_Del("SP_ChefAccountDetail_Edit", p1);


    }

}