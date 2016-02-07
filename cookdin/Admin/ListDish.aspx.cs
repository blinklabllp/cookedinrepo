using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_ListDish : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    string aid,uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            Repeater1.DataSource = con.select_data("select ChefDishMaster.*,ChefPersonalDetail.* from ChefDishMaster INNER JOIN ChefPersonalDetail ON ChefDishMaster.Chef_ID=ChefPersonalDetail.Chef_ID");
            Repeater1.DataBind();
           

            aid = Request.QueryString.Get("aid");
            uid = Request.QueryString.Get("uid");
            if (aid != null)
            {
                Approve_Dish(aid);
            }
            else if (uid != null)
            {
                UnApprove_Dish(uid);
            }
        }
    }

   
    private void Approve_Dish(string id)
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Dish_ID", id);
        p[1] = new SqlParameter("@Mode", 2);
        con1.Ins_Upd_Del("SP_ChefDishMaster_Edit", p);
        
        string SK=con.singlecell("SELECT SKU_ID FROM dbo.ChefDishMaster WHERE Dish_ID='"+id+"'");
        if (SK == null && SK == "")
        {
            SqlParameter[] p1 = new SqlParameter[2];
            p1[0] = new SqlParameter("@Dish_ID", id);
            p1[1] = new SqlParameter("@Mode", 6);
            con1.Ins_Upd_Del("SP_ChefDishMaster_Edit", p1);
        }


        Response.Redirect("~/Admin/ListDish.aspx");

    }
    private void UnApprove_Dish(string id)
    {
        SqlParameter[] p = new SqlParameter[2];
        p[0] = new SqlParameter("@Dish_ID", id);
        p[1] = new SqlParameter("@Mode", 3);
        con1.Ins_Upd_Del("SP_ChefDishMaster_Edit", p);

       // con.update_data("update ChefDishMaster set Status='Pendding' where Dish_ID='" + id + "'");
        Response.Redirect("~/Admin/ListDish.aspx");

    }
}