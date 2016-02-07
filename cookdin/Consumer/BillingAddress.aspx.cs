using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Consumer_BillingAddress : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            Check_USerID_Exist();

            Bind_Area_Detail();

            Bind_Address_Detail();
        }

    }

    private void Bind_Address_Detail()
    {
        Repeater1.DataSource = con.select_data("select * from ConsumerShippingAddress where Consumer_ID='" + Session["Consumer_ID"] + "'");
        Repeater1.DataBind();
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

    private void Check_USerID_Exist()
    {
        if (Session["Consumer_ID"] == null)
        {
            Response.Redirect("~/consumer_Login.aspx");
        }

    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        GetAddress();
        Response.Redirect("~/Consumer/carttest.aspx");
    }
    private void GetAddress()
    {
        SqlParameter[] p = new SqlParameter[8];
        p[0] = new SqlParameter("@ConsumerID", int.Parse(Session["Consumer_ID"].ToString()));
        p[1] = new SqlParameter("@Pincode", txtPinCode.Text);
        p[2] = new SqlParameter("@House", txtapartment.Text);
        p[3] = new SqlParameter("@Block", txtblockno.Text);
        p[4] = new SqlParameter("@Society", txtsociatyname.Text);
        p[5] = new SqlParameter("@Area", ddlarea.SelectedItem.ToString());
        p[6] = new SqlParameter("@City", ddlcity.SelectedItem.ToString());
        p[7] = new SqlParameter("@LandMark", ddlLandMark.SelectedItem.Text);
        //p[8] = new SqlParameter("@IsDefault", ddlLandmark.Text);



        if (con1.CheckData("SP_ConsumerShippingAddress_Check", p))
        {
            ////////Already Exist
        }
        else
        {
            con1.Ins_Upd_Del("SP_ConsumerShippingAddress_Insert", p);
        }
    }
}