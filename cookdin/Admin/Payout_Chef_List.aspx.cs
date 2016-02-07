using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_Payout_Chef_List : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }
        
    }

    private void Bind()
    {
        Repeater1.DataSource = con1.Select("SP_PayoutChefList");
        Repeater1.DataBind();
    }
    protected void btnProcessing_Click(object sender, EventArgs e)
    {
        foreach (DataListItem item in Repeater1.Items)
        {
            CheckBox checkDatalist = (CheckBox)item.FindControl("checkDatalist");
            Label lblInvoiceID = (Label)item.FindControl("lblInvoiceID");
            if (checkDatalist.Checked)
            {
                con.update_data("update InvoiceMaster set PaymentStatus='Processing' where Invoice_ID='"+lblInvoiceID.Text+"'");
               
            }
        }
        Bind();
        checkMain.Checked = false;
    }
    protected void btnPaid_Click(object sender, EventArgs e)
    {
        foreach (DataListItem item in Repeater1.Items)
        {
            CheckBox checkDatalist = (CheckBox)item.FindControl("checkDatalist");
            Label lblInvoiceID = (Label)item.FindControl("lblInvoiceID");
            if (checkDatalist.Checked)
            {
                con.update_data("update InvoiceMaster set PaymentStatus='Paid' where Invoice_ID='" + lblInvoiceID.Text + "'");

                string chef_ID = con.singlecell("Select Chef_ID from InvoiceMaster where Invoice_Id='"+lblInvoiceID.Text+"'");
                ChangeAccountDetail(chef_ID);

            }
        }
        Bind();
        checkMain.Checked = false;
    }

    private void ChangeAccountDetail(string chef_ID)
    {
        float amount = float.Parse(con.singlecell("Select Available_Balance from ChefAccountDetail where Chef_ID='"+chef_ID+"'"));


        //Add AdminEMoney..
        SqlParameter[] pa = new SqlParameter[2];
        pa[0] = new SqlParameter("@Mode", 2);
        pa[1] = new SqlParameter("@Amount", amount);
        con1.Ins_Upd_Del("SP_AdminWallet_Edit", pa);



        //Minus AvailableBal
        SqlParameter[] p1 = new SqlParameter[3];
        p1[0] = new SqlParameter("@Mode", 6);
        p1[1] = new SqlParameter("@AvailableBal", amount);
        p1[2] = new SqlParameter("@Chef_ID", chef_ID);
        con1.Ins_Upd_Del("SP_ChefAccountDetail_Edit", p1);

        //Add Withdrawal Bal
        SqlParameter[] p2 = new SqlParameter[3];
        p2[0] = new SqlParameter("@Mode", 3);
        p2[1] = new SqlParameter("@AvailableBal", amount);
        p2[2] = new SqlParameter("@Chef_ID", chef_ID);
        con1.Ins_Upd_Del("SP_ChefAccountDetail_Edit", p2);
    }
    protected void btnBlock_Click(object sender, EventArgs e)
    {
        foreach (DataListItem item in Repeater1.Items)
        {
            CheckBox checkDatalist = (CheckBox)item.FindControl("checkDatalist");
            Label lblInvoiceID = (Label)item.FindControl("lblInvoiceID");
            if (checkDatalist.Checked)
            {
                con.update_data("update InvoiceMaster set PaymentStatus='Block' where Invoice_ID='" + lblInvoiceID.Text + "'");

            }
            else
            {
                checkMain.Checked = false;
            }
        }
        checkMain.Checked = false;
        Bind();
    }
    protected void checkMain_CheckedChanged(object sender, EventArgs e)
    {
        if (checkMain.Checked)
        {
            foreach (DataListItem item in Repeater1.Items)
            {
                CheckBox checkDatalist = (CheckBox)item.FindControl("checkDatalist");
                checkDatalist.Checked = true;
            }
        }
        else
        {
            foreach (DataListItem item in Repeater1.Items)
            {
                CheckBox checkDatalist = (CheckBox)item.FindControl("checkDatalist");
                checkDatalist.Checked = false;
            }
        }
     
    }
}