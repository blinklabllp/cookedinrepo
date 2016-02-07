using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    SP_MyConnection con1 = new SP_MyConnection();
    Myconnection con = new Myconnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlParameter[] p= new SqlParameter[0];
            con1.Ins_Upd_Del("SP_ClearOutDatedCart",p);   
        }
    }
   

   
}
