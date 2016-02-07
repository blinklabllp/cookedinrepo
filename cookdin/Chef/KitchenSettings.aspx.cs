using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class KitchenSettings : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Check_USerID_Exist();
            Bind_National_Cuisine();
            Bind_Cooking_Oil();
            Bind_DishType();
            Bind_Cooking_Capacity();
            check_Payment_Mode();
            Bind_WorkingDays();
            
        }
    }
    private void Check_USerID_Exist()
    {
        //Session["Chef_ID"] = "14";
        //Session["Chef_UserName"] = "kadiamadhuri89@gmail.com";
        if (Session["Chef_ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    private void Bind_National_Cuisine()
    {
        DataListnationalcuisine.DataSource = con.select_data("SELECT dbo.ChefRegionalCuisine.*,dbo.RegionalCuisine.Place_Name FROM  dbo.ChefRegionalCuisine INNER JOIN  dbo.RegionalCuisine ON dbo.ChefRegionalCuisine.Regional_Cuisine_ID = dbo.RegionalCuisine.Regional_Cuisine_ID where ChefRegionalCuisine.Chef_UserName='" + Session["Chef_UserName"] + "'");
        DataListnationalcuisine.DataBind();
    }
    protected void btnaddcuisine_Click(object sender, EventArgs e)
    {
        add_RegionalCuisine();
        Bind_National_Cuisine();
    }

    private void add_RegionalCuisine()
    {

        char[] delimiterChars = { ',' };

        //Session["hfnational"] = Request.Form[hfnational.UniqueID];
        //string nationalIds = Session["hfnational"].ToString();
        string nationalIds = Request.Form[hfnational.UniqueID];
        string[] nationalcuisine = nationalIds.Split(delimiterChars);

        if (nationalIds != "" || nationalIds != " ")
        {

            foreach (string nc in nationalcuisine)
            {
                if (nc == "" || nc == null || nc == " ")
                {
                    break;
                }
                else
                {
                    SqlParameter[] p = new SqlParameter[2];

                    p[0] = new SqlParameter("@ChefUserName", Session["Chef_UserName"]);
                    p[1] = new SqlParameter("@CusinieID", int.Parse(nc));

                    con1.Ins_Upd_Del("SP_ChefRegionalCuisine_Insert", p);
                }
            }

            txtnational.Text = "";
        }
    }
    protected void DataListnationalcuisine_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Label lblid = (Label)e.Item.FindControl("lblid");
        txtselectedcuisine.Text = con.singlecell("select Place_Name from RegionalCuisine where Regional_Cuisine_ID='"+lblid.Text+"'");
        lblcuisineid.Text = lblid.Text;
    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        con.delete_data("delete from dbo.ChefRegionalCuisine where Regional_Cuisine_ID='"+lblcuisineid.Text+"'");
        Bind_National_Cuisine();
        txtnational.Text = "";
        txtselectedcuisine.Text = "";
    }

    private void Bind_Cooking_Oil()
    {
        DataListcookingoil.DataSource = con.select_data("SELECT        dbo.ChefOilUsed.*, dbo.IngridiantMaster.Ingridiant_Name FROM            dbo.ChefOilUsed INNER JOIN dbo.IngridiantMaster ON dbo.ChefOilUsed.Ingridiant_ID = dbo.IngridiantMaster.Ingridiant_ID where dbo.ChefOilUsed.Chef_UserName='" + Session["Chef_UserName"] + "'");
        DataListcookingoil.DataBind();
    }
    protected void DataListcookingoil_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Label lblid = (Label)e.Item.FindControl("lblid");
        txtselectedcookingoil.Text = con.singlecell("select Ingridiant_Name from dbo.IngridiantMaster where Ingridiant_ID='" + lblid.Text + "'");
        lblcookingoilid.Text = lblid.Text;
    }
    protected void btncookingoildelete_Click(object sender, EventArgs e)
    {
        con.delete_data("delete from dbo.ChefOilUsed where Ingridiant_ID='" + lblcookingoilid.Text + "'");
        Bind_Cooking_Oil();
        txtcookingoil.Text = "";
        txtselectedcookingoil.Text = "";
    }
    protected void btncookingoiladd_Click(object sender, EventArgs e)
    {
        add_Oil();
        Bind_Cooking_Oil();
    }
    private void add_Oil()
    {

        char[] delimiterChars = { ',' };
      //  Session["oil"] = Request.Form[hfcookingoil.UniqueID];
      //  string OilIds = Session["oil"].ToString();
        string OilIds = Request.Form[hfcookingoil.UniqueID];
        string[] Oils = OilIds.Split(delimiterChars);

        if (OilIds != "" || OilIds != " ")
        {

            foreach (string oil in Oils)
            {
              //  Response.Write("TimeOfPreparation=" + oil);
                if (oil == "" || oil == null || oil == " ")
                {
                    break;
                }
                else
                {
                    SqlParameter[] p = new SqlParameter[2];

                    p[0] = new SqlParameter("@ChefUserName", Session["Chef_UserName"]);
                    p[1] = new SqlParameter("@oil", int.Parse(oil));

                    con1.Ins_Upd_Del("SP_ChefOilUsed_Insert", p);
                }
            }

            txtcookingoil.Text = "";
        }

    }

    private void Bind_DishType()
    {
    //    DataListdishtype.DataSource = con.select_data("SELECT        dbo.ChefDishType.*, dbo.DishType.Dish_Type FROM  dbo.ChefDishType INNER JOIN  dbo.DishType ON dbo.ChefDishType.Dish_Type_ID = dbo.DishType.Dish_Type_ID where dbo.ChefDishType.Chef_UserName='"+Session["Chef_UserName"]+"'");

        DataListdishtype.DataSource = con.select_data("select * from dbo.DishType");
        DataListdishtype.DataBind();

        for (int i = 0; i < DataListdishtype.Items.Count; i++)
        {
            DataListItem item= DataListdishtype.Items[i];
            Label lblid = (Label)item.FindControl("lblid");
            CheckBox chkcheck = (CheckBox)item.FindControl("chkdishtypecheck");

            if (con.check_data("select * from ChefDishType where ChefDishType.Dish_Type_ID='"+lblid.Text+"' and Chef_UserName='"+Session["Chef_UserName"]+"'") == true)
            {
                chkcheck.Checked = true;
                //chkcheck.CssClass = "active";
            }

        }
    }
    protected void btndishtypesave_Click(object sender, EventArgs e)
    {
        con.delete_data("delete from ChefDishType where Chef_UserName='"+Session["Chef_UserName"]+"'");
        for (int i = 0; i < DataListdishtype.Items.Count; i++)
        {
            DataListItem item = DataListdishtype.Items[i];
            Label lblid = (Label)item.FindControl("lblid");
            CheckBox chkcheck = (CheckBox)item.FindControl("chkdishtypecheck");

            if (chkcheck.Checked == true)
            {
                SqlParameter[] p = new SqlParameter[2];

                p[0] = new SqlParameter("@ChefUserName", Session["Chef_UserName"]);
                p[1] = new SqlParameter("@DishTypeID",lblid.Text);

                con1.Ins_Upd_Del("SP_ChefDishType_Insert", p);
            }
        }
        Bind_DishType();
    }

    protected void Bind_Cooking_Capacity()
    {
        try
        {
            txtcookcapacity.Text = con.singlecell("select Meal_Quantity from ChefPersonalDetail where Chef_UserName='" + Session["Chef_UserName"] + "'");
        }
        catch (Exception ex)
        {
        }
    }
    protected void btncapacitysave_Click(object sender, EventArgs e)
    {
        con.update_data("update ChefPersonalDetail set Meal_Quantity='" + txtcookcapacity.Text + "' where Chef_UserName='" + Session["Chef_UserName"] + "'");
        Bind_Cooking_Capacity();
    }
    protected void btnpaymentmode_Click(object sender, EventArgs e)
    {
        string paymentmode;
        try
        {

            if (chkpaymode.Checked)
            {
                paymentmode = "Auto";
            }
            else
            {
                paymentmode = "Manual";
            }
            SqlParameter[] p = new SqlParameter[3];

            p[0] = new SqlParameter("@Chef_ID", Session["Chef_ID"]);
            p[1] = new SqlParameter("@PaymentMode", paymentmode);
            p[2] = new SqlParameter("@Mode", "4");

            con1.Ins_Upd_Del("SP_ChefAccountDetail_Edit", p);
        }
        catch (Exception ex)
        {
        }
    }
    public void check_Payment_Mode()
    {
        try
        {
            string paymentmode = con.singlecell("select Payment_Mode from ChefAccountDEtail where Chef_ID='" + Session["Chef_ID"] + "'");

            if (paymentmode == "Auto")
            {
                chkpaymode.Checked = true;
            }
            else
            {
                chkpaymode.Checked = false;
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnworkingdays_Click(object sender, EventArgs e)
    {
        con.delete_data("delete from dbo.ChefWorkingDays where  Chef_ID='" + Session["Chef_ID"] + "'");

        foreach(ListItem item in chkworkingdays.Items)
        {
            if (item.Selected)
            {
                SqlParameter[] p = new SqlParameter[2];

                p[0] = new SqlParameter("@Chef_ID", Session["Chef_ID"]);
                p[1] = new SqlParameter("@day", item.Value);
                con1.Ins_Upd_Del("SP_ChefWorkingDays_Insert", p);
            }
        }

        Bind_WorkingDays();

    }
    public void Bind_WorkingDays()
    {
        foreach (ListItem item in chkworkingdays.Items)
        {

            if (con.check_data("select * from dbo.ChefWorkingDays where DayOfWorking='" + item.Value + "' and Chef_ID='" + Session["Chef_ID"] + "'"))
            {
                item.Selected = true;
            }
        }
    }
}