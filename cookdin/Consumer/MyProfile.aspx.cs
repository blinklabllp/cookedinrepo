using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Consumer_MyProfile : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Check_USerID_Exist();     
            bind_personalDetail();
        }
    }

    private void Check_USerID_Exist()
    {
// Session["Consumer_ID"] = "2";
        if (Session["Consumer_ID"] == null)
        {
            Response.Redirect("~/consumer_Login.aspx");
        }
    }
    private void bind_personalDetail()
    {
        if (con.check_data("select * from ConsumerPersonalDetail where Consumer_ID='" + Session["Consumer_ID"] + "'") == true)
        {
            DataRow dr = con.singlerow("select * from ConsumerPersonalDetail where  Consumer_ID='" + Session["Consumer_ID"] + "'");

            string fname, mname, lname;
            fname = dr["Consumer_Fname"].ToString();
            mname = dr["Consumer_Mname"].ToString();
            lname = dr["Consumer_Lname"].ToString();
            lblName.Text = fname + " "  + mname + " " + lname;
            lblcontactno.Text = dr["Mobile_No"].ToString();

            if (dr["Photo"].ToString() == "")
            {
                ProfilePhoto.ImageUrl = "~/templete/image/Duser.png";
            }
            else
            {
                ProfilePhoto.ImageUrl = "~/Profile_Photo/" + dr["Photo"].ToString();
            }

        }
        DataRow drsignup = con.singlerow("select * from ConsumerSignUp where Consumer_ID='" + Session["Consumer_ID"] + "'");
        lblemailid.Text = drsignup["Consumer_EmailID"].ToString();
        lblusername.Text = drsignup["Consumer_UserName"].ToString();
    }

    protected void btnedit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Consumer/EditProfile.aspx");
    }
    //protected void btnbillingaddress_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/Consumer/BillingAddress.aspx");
    //}
    protected void btnorderlist_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Consumer/OrderList.aspx");
    }
}