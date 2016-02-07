using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_AddPortfolio : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString.Get("id");
            if (id != null)
            {
                Session["BusID"] = id;
            }
            string bid = Request.QueryString.Get("bid");
            string did = Request.QueryString.Get("did");
            if (bid != null)
            {
                MultiView1.ActiveViewIndex = 0;
            }
            else if(did!=null)
            {
                delete_Portfolio(did);
            }
            else
            {
                Repeater1.DataSource = con.select_data("select * from PortfolioMaster where Business_USer_ID=" + Session["BusID"].ToString() + "");
                Repeater1.DataBind();
                MultiView1.ActiveViewIndex = 1;
            }
           
        }
    }
    private void delete_Portfolio(string id)
    {
        con.delete_data("delete from PortfolioMaster where Portfolio_ID='" + id + "'");
        Response.Redirect("~/Admin/ListPortfolio.aspx?id='"+Session["BusID"]+"'");

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string BusID = Request.QueryString.Get("id");
        Response.Redirect("~/Admin/ListPortfolio.aspx?bid='" + BusID + "'");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string bid = Request.QueryString.Get("bid");
        if(bid!=null)
        {
        string photo = Addphoto(FileUpload1);
        con.insert_data("insert into PortfolioMaster values("+bid+",'"+txtTitle.Text+"','"+photo+"','"+txtDescription.Text+"','"+txtWebsite.Text+"','False','')");
        }
        Response.Redirect("~/Admin/ListPortfolio.aspx?id=" + bid + "");
    }
    public string Addphoto(FileUpload Photo)
    {
        if ((Photo.FileName) != "")
        {
            string ext = Path.GetExtension(Photo.FileName);
            int index = Photo.FileName.IndexOf('.');
            string filename = Photo.FileName.Substring(0, index) + Session.SessionID + ext;
            string path = Server.MapPath("~/Profile_Photo/" + filename + "");
            Photo.SaveAs(path);
            return filename;
        }
        else
            return null;
    }
}