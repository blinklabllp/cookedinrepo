using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class usercontroldemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
 //Response.Write(DateTime.Now.ToString("dd/MM/yyyy mm:hh:ss tt"));

 //TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("Pacific SA Standard Time");

        Response.Write(DateTime.UtcNow.ToString());


       // Response.Write(timeZoneInfo.ToString());
    }
}