using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Chef_MySchedule : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Check_USerID_Exist();
          //  Session["Chef_ID"] = "1";
            bind_date();
            Bind_Order(btnfirst.Text);
            lblorderlistdate.Text = "Order List Of :    " + btnfirst.Text;
          //  CheckOrlderAvailable();
           
        }
    }
    private void Check_USerID_Exist()
    {
        if (Session["Chef_ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        add_Vacation_Date();
    }

    private void add_Vacation_Date()
    {

        char[] delimiterChars = { ',' };

        string vacationdates = textboxDate.Text;
        string[] vacationdate = vacationdates.Split(delimiterChars);
        string sucess = "";
        string Problem = "";
        if (vacationdates != "" || vacationdates != " ")
        {
            string dates = "" ;
            foreach (string dt in vacationdate)
            {
                if (dt == "" || dt == null || dt == " ")
                {
                    break;
                }
                else
                {
                    SqlParameter[] p1=new SqlParameter[1];
                    p1[0]=new SqlParameter("@date",DateTime.Parse(dt).Date);

                    if (!(con1.CheckData("SP_ChefVacationMode_chk",p1)))
                    {
                        SqlParameter[] p = new SqlParameter[3];

                        p[0] = new SqlParameter("@Chef_ID", Session["Chef_ID"]);
                        p[1] = new SqlParameter("@ChefUserName", Session["Chef_UserName"]);
                        p[2] = new SqlParameter("@VacationDate", DateTime.Parse(dt));

                        con1.Ins_Upd_Del("SP_ChefVacationMode_Insert", p);
                        sucess = "Your Selected Dates Vacation Mode is added. ";
                    }
                    else
                    {
                        dates = dates + dt + " ";
                        Problem = "The dates " + dates + " has already order so that these dates vacation mode is not on.";
                    }
                }
            }

            lblmessage.Text = sucess+Problem;

        }
    }

    private void bind_date()
    {
        btnfirst.Text = DateTime.Now.ToString("dd/MM/yyyy");
        btnsecond.Text = DateTime.Now.AddDays(1).ToString("dd/MM/yyyy");
        btnthird.Text = DateTime.Now.AddDays(2).ToString("dd/MM/yyyy");
        btnforth.Text = DateTime.Now.AddDays(3).ToString("dd/MM/yyyy");
        btnfifth.Text = DateTime.Now.AddDays(4).ToString("dd/MM/yyyy");
        btnsix.Text = DateTime.Now.AddDays(5).ToString("dd/MM/yyyy");
        btnseven.Text = DateTime.Now.AddDays(6).ToString("dd/MM/yyyy");
    }

    public void btn_Click(object sender, EventArgs e)
    {
        string date;
        Button btn = (Button)sender;
        switch (btn.ID)
        {
            case "btnfirst":
                Bind_Order(btnfirst.Text);
               
            break;
            case "btnsecond":
                 Bind_Order(btnsecond.Text);
            break;
            case "btnthird":
                Bind_Order(btnthird.Text);
            break;
            case "btnforth":
                Bind_Order(btnforth.Text);
            break;
            case "btnfifth":
                Bind_Order(btnfifth.Text);
            break;
            case "btnsix":
                Bind_Order(btnsix.Text);
              break;
            case "btnseven":
                Bind_Order(btnseven.Text);
            break;
        }
    }


    private void Bind_Order(string deliverydate)
    {
      
        SqlParameter[] p1 = new SqlParameter[2];
        p1[0] = new SqlParameter("@Order_Delivery_Date", DateTime.ParseExact(deliverydate, "dd/MM/yyyy", null));
        p1[1] = new SqlParameter("@Chef_ID",Session["Chef_ID"]);
        DataList1.DataSource = con1.Select("SP_ChefOrder_View", p1);
        DataList1.DataBind();

       // DataList1.DataSource = con.select_data("SELECT OrderMaster.Order_Date, guest.OrderDish.Slot, guest.OrderDish.Qty, guest.OrderDish.Order_Delivery_Date, dbo.ChefDishMaster.Dish_Name, dbo.ChefDishMaster.Chef_UserName, dbo.ChefDishGallery.Dish_Image,  dbo.ChefDishMaster.Price,(guest.OrderDish.Qty*dbo.ChefDishMaster.Price) as totPrice FROM guest.OrderDish INNER JOIN dbo.OrderMaster ON guest.OrderDish.Order_ID = dbo.OrderMaster.Order_ID INNER JOIN dbo.ChefDishMaster ON guest.OrderDish.Dish_ID = dbo.ChefDishMaster.Dish_ID INNER JOIN dbo.ChefDishGallery ON dbo.ChefDishMaster.Dish_ID = dbo.ChefDishGallery.Dish_ID where  ChefDishGallery.Is_Defualt='true'  AND guest.OrderDish.Chef_ID='"+Session["Chef_ID"].ToString()+"'");
      //  DataList1.DataBind();
    }

    private void CheckOrlderAvailable()
    {
        int count = DataList1.Items.Count;
        if (count == 0)
        {
          //  pnlwarning.Visible = true;
         //   DataList1.Visible = false;
            
        }
        else
        {
         //   pnlwarning.Visible = false;
         //   DataList1.Visible = true;
        }
    }
    protected void btnfirst_Click(object sender, EventArgs e)
    {
        lblorderlistdate.Text = "Order List Of :    "+ btnfirst.Text;
        Bind_Order(btnfirst.Text);
    }
    protected void btnsecond_Click(object sender, EventArgs e)
    {
        lblorderlistdate.Text = "Order List Of :    " + btnsecond.Text;
        Bind_Order(btnsecond.Text);
    }
    protected void btnthird_Click(object sender, EventArgs e)
    {
        lblorderlistdate.Text = "Order List Of :    " + btnthird.Text;
        Bind_Order(btnthird.Text);
    }
    protected void btnforth_Click(object sender, EventArgs e)
    {
        lblorderlistdate.Text = "Order List Of :    " + btnforth.Text;
        Bind_Order(btnforth.Text);
    }
    protected void btnfifth_Click(object sender, EventArgs e)
    {
        lblorderlistdate.Text = "Order List Of :    " + btnfifth.Text;
        Bind_Order(btnfifth.Text);
    }
    protected void btnsix_Click(object sender, EventArgs e)
    {
        lblorderlistdate.Text = "Order List Of :    " + btnsix.Text;
        Bind_Order(btnsix.Text);
    }
    protected void btnseven_Click(object sender, EventArgs e)
    {
        lblorderlistdate.Text = "Order List Of :    " + btnseven.Text;
        Bind_Order(btnseven.Text);
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Label id = (Label)e.Item.FindControl("lblid");

        if (e.CommandName == "cooked")
        {
            //mode 1 for Cooked

            SqlParameter[] p1 = new SqlParameter[2];
            p1[0] = new SqlParameter("@InvoiceDish_ID", int.Parse(id.Text));
            p1[1] = new SqlParameter("@Mode", 1);
            con1.Ins_Upd_Del("SP_DishCookingStatus_Edit", p1);
        }
        else
        {
            //Mode 2 ready for Pickup

            SqlParameter[] p1 = new SqlParameter[2];
            p1[0] = new SqlParameter("@InvoiceDish_ID", int.Parse(id.Text));
            p1[1] = new SqlParameter("@Mode", 2);
            con1.Ins_Upd_Del("SP_DishCookingStatus_Edit", p1);
        }

        Bind_Order(DateTime.Now.ToString("dd/MM/yyyy"));

       

       // Response.Redirect("~/Chef/MySchedule.aspx");
    }
}