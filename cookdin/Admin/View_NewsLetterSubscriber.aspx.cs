using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_View_NewsLetterSubscriber : System.Web.UI.Page
{
    SP_MyConnection con = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_newsletter_subscriber();
        }
    }
    public void bind_newsletter_subscriber()
    {
        Repeater1.DataSource = con.Select("SP_NewsLetterSubscriber_View");
        Repeater1.DataBind();
    }
}