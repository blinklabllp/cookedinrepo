using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_ViewUser : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String id = Request.QueryString.Get("vid");
            if (id != null)
            {
                DataRow dr = con.singlerow("select * from ConsumerPersonalDetail where Consumer_ID='" + id + "'");

                lblUserName.Text = dr["Consumer_UserName"].ToString();

                imgProfile.ImageUrl = "~/Profile_Photo/" + dr["Photo"].ToString();
                lblFullName.Text = dr["Consumer_Fname"].ToString() + " " + dr["Consumer_Mname"].ToString() + "" + dr["Consumer_Lname"].ToString();
                lblBlock.Text = dr["Block_No"].ToString();
                lblHouse.Text = dr["House_No"].ToString();
                lblSoc.Text = dr["Society_Name"].ToString();
                lblArea.Text = dr["Area"].ToString();
                lblCity.Text = dr["City"].ToString();
                lblLandmark.Text = dr["Landmark"].ToString();

                lblContactNo.Text = dr["Contact_No"].ToString();
                lblMobileNo.Text = dr["Mobile_No"].ToString();

                lblEmail.Text = dr["Email_ID"].ToString();

                lblDescription.Text = "~/Profile_Photo/" + dr["Photo"].ToString();
            }
        }
    }
}