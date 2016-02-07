using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Chef_EditDish : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    EncryptionDecryption en = new EncryptionDecryption();

    public static string Dish_Id;
    public static string  diat_type_id;
    public static string cuisine_id;
    public static string meal_include_id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string querystrng = Request.QueryString.Get("did").ToString();
            // string querystrng = "tmKVl+NtVv31Brg4erEN4g==";
            querystrng = querystrng.Replace(" ", "+");
            Dish_Id = en.DecryptString(querystrng.Trim());

            Check_USerID_Exist();
            Bind_DIshType();
            bind_dishDetail(Dish_Id);
            bind_levelof_spices();
        }
    }
    public void Bind_DishGallery(string Dish_Id)
    {
        DataListImage.DataSource = con.select_data("select Dish_Image,Gallery_ID from ChefDishGallery where Dish_ID='" + Dish_Id + "'");
        DataListImage.DataBind();
    }
    private void Check_USerID_Exist()
    {
        if (Session["Chef_ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        update_dish();
        Response.Redirect("~/Chef/ListDish.aspx");
    }

    private void Upload_Image_Gallery(string dishid)
    {
        HttpFileCollection fileCollection = Request.Files;
        int files = fileCollection.Count;
        int count = 0;
        for (int i = 0; i < files; i++)
        {
            HttpPostedFile uploadfile = fileCollection[i];
            string fileName = Session.SessionID + Path.GetFileName(uploadfile.FileName);
            if (uploadfile.ContentLength > 0)
            {
                count = count + 1;
                uploadfile.SaveAs(Server.MapPath("~/dishphotoupload/") + fileName);
                //lblMessage.Text += fileName + "Saved Successfully<br>";

                SqlParameter[] p2 = new SqlParameter[4];

                p2[0] = new SqlParameter("@Chef_ID", int.Parse(Session["Chef_ID"].ToString()));
                p2[1] = new SqlParameter("@Dish_ID", int.Parse(dishid));
                p2[2] = new SqlParameter("@Dish_Image", fileName);
                p2[3] = new SqlParameter("@Is_Default", "0");
                

                con1.Ins_Upd_Del("SP_ChefDishGallery_Insert", p2);
            }
        }
    }
    private void bind_levelof_spices()
    {
        rdolevelofspice.DataSource = con1.Select("SP_LevelOfSpice_View");
        rdolevelofspice.DataTextField = "LevelofSpices";
        rdolevelofspice.DataValueField = "Levelofspiceid";
        rdolevelofspice.DataBind();
    }
    private string get_diet_type_Id()
    {
        string id = "";
        char[] delimiterChars = { ',' };

        string dishIds = Request.Form[hfdiettype.UniqueID];
        string[] dishtype = dishIds.Split(delimiterChars);

        if (dishIds != "" || dishIds != " ")
        {

            foreach (string dt in dishtype)
            {

                if (dt == "" || dt == null || dt == " ")
                {
                    break;

                }
                else
                {
                    id = dt;
                }
            }
        }

        if (id == "")
        {
          return  id = diat_type_id;
        }
        else
        {
            return id;
        }
    }
    private string get_cuisine_type_Id()
    {
        string id = "";
        char[] delimiterChars = { ',' };

        string dishIds = Request.Form[hfcuisine.UniqueID];
        string[] dishtype = dishIds.Split(delimiterChars);

        if (dishIds != "" || dishIds != " ")
        {

           foreach (string di in dishtype)
            {

                if (di == "" || di == null || di == " ")
                {
                    break;
                }
                else
                {
                    id = di;
                }
           }
        }

        if (id == "")
        {
           return id = cuisine_id;
        }
        else
        {
            return id;
        }
    }
   
    private string get_Meal_Include_list_Id()
    {
        string id = "";
        char[] delimiterChars = { ',' };

        string mealincludelistIds = Request.Form[hfmealinclude.UniqueID];
        string[] mealincludelist = mealincludelistIds.Split(delimiterChars);

        if (mealincludelistIds != "" || mealincludelistIds != " ")
        {

            foreach (string mil in mealincludelist)
            {

                if (mil == "" || mil == null || mil == " ")
                {
                    break;

                }
                else
                {
                    id = mil;
                }
            }
        }

        if (id == "")
        {
           return id = meal_include_id;
        }
        else
        {
            return id;
        }
    }
    private void Add_Dish_Ingridient(string dishid)
    {
        con.delete_data("delete from DishIngridiant where Dish_ID='"+dishid+"'");
        
        char[] delimiterChars = { ',' };

      //  string ingIds = Request.Form[hfingri.UniqueID];
        string ingIds = getnewing_ID();
        string[] dishtype = ingIds.Split(delimiterChars);

        if (ingIds != "" || ingIds != " ")
        {

            foreach (string ing in dishtype)
            {

                if (ing == "" || ing == null || ing == " ")
                {
                    break;
                }
                else
                {
                    SqlParameter[] p = new SqlParameter[2];

                    p[0] = new SqlParameter("@Dish_ID", int.Parse(dishid));
                    p[1] = new SqlParameter("@IngridiantId", int.Parse(ing));

                    con1.Ins_Upd_Del("SP_ChefDishIngridiant_Insert", p);
                }
            }
        }
    }
    private void Bind_DIshType()
    {
        ddldishtype.DataSource = con1.Select("SP_DishTypeMaster_View");
        ddldishtype.DataTextField = "Dish_Type";
        ddldishtype.DataValueField = "Dish_Type_ID";
        ddldishtype.DataBind();
    }
    public void bind_dishDetail(string Dish_Id)
    {
        DataRow dr = con.singlerow("select * from dbo.ChefDishMaster where Dish_ID='" + Dish_Id + "'");
        txtdishname.Text = dr["Dish_Name"].ToString();
        diat_type_id = dr["Diet_Type_ID"].ToString();
        txtdiettype.Text = con.singlecell("select Diet_Type from dbo.DietTypeMaster where Diet_Type_ID='" + dr["Diet_Type_ID"].ToString() + "'");
        cuisine_id = dr["Regional_Cuisine_ID"].ToString();
        txtcuisine.Text = con.singlecell("select Place_Name from dbo.RegionalCuisine where Regional_Cuisine_ID='" + dr["Regional_Cuisine_ID"].ToString() + "'");
        meal_include_id = dr["Meal_Include_ID"].ToString();
        txtmealinclude.Text = con.singlecell("select Meal_Includes from dbo.MealIncludesMaster where Meal_Include_ID='" + dr["Meal_Include_ID"].ToString() + "'");
        txtdescription.Text = dr["description"].ToString();
        txtprice.Text = dr["Price"].ToString();
        txtofferprice.Text = dr["SpecialOfferPrice"].ToString();
        txtofferstartdate.Text = dr["OfferStartDate"].ToString();
        txtofferenddate.Text = dr["OfferEndDate"].ToString();

        //ddldishtype.SelectedIndex = ddldishtype.Items.IndexOf(ddldishtype.Items.FindByText(dr["Dish_Type_ID"].ToString()));
        ddldishtype.SelectedValue = dr["Dish_Type_ID"].ToString();
        RadioButtonList1.SelectedValue = dr["Is_Veg"].ToString() ;
        rdolevelofspice.SelectedValue=dr["Levelofspiceid"].ToString();
        DataListIngridian.Visible = false;
        txtingri.Text = Bind_Ing_List(Dish_Id);
        Bind_DishGallery(Dish_Id);
    }
    public string Bind_Ing_List(string dishid)
    {
        string inglist=null,inglistids=null;
        DataListIngridian.DataSource = con.select_data("select Ingridiant_ID,Ingridiant_Name from IngridiantMaster where Ingridiant_ID in(select Ingridiant_ID from DishIngridiant where Dish_Id='" + dishid + "')");
        DataListIngridian.DataBind();

         foreach (DataListItem item in DataListIngridian.Items)
         {
             Label lblingri = (Label)item.FindControl("lblingri");
             Label lblid = (Label)item.FindControl("lblid");
             inglist += lblingri.Text + ",";
             inglistids += lblid.Text + ",";
         }

         return inglist;
    }
    public string getnewing_ID()
    {
        string passvalue = null;
        string[] ingnamecollection = txtingri.Text.Split(',');

        foreach (string ingname in ingnamecollection)
        {
            if (ingname == "" || ingname == null || ingname == " ")
            {
               // break;
            }
            else
            {
                SqlParameter[] p = new SqlParameter[2];
                p[0] = new SqlParameter("@IngridiantName", ingname);

                if (!con.check_data("select ingridiant_Name from IngridiantMaster where ingridiant_Name='" + ingname + "'"))
                {
                    p[1] = new SqlParameter("@Mode", "1");
                }
                else
                {
                    p[1] = new SqlParameter("@Mode", "2");
                }
                string displayValue = con1.SingleCell("SPH_IngridiantMaster_Insert", p) + ",";
                passvalue += displayValue;
            }
        }
        return passvalue;
    }
    public void update_dish()
    {
      //  string querystrng = Request.QueryString.Get("did").ToString();
      ////  string querystrng = "tmKVl+NtVv31Brg4erEN4g==";
      //  querystrng = querystrng.Replace(" ", "+");
      //  string Dish_Id = en.DecryptString(querystrng.Trim());

        Add_Dish_Ingridient(Dish_Id);
        update_dish_detail(Dish_Id);
        Upload_Image_Gallery(Dish_Id);

    }
    public void update_dish_detail(string dishid)
    {
        string dietid = get_diet_type_Id();
        int reginalcuisine = int.Parse(get_cuisine_type_Id());
        string levelofspices = rdolevelofspice.SelectedValue;
        string mealincludelist = get_Meal_Include_list_Id();

        //SqlParameter[] p = new SqlParameter[13];
        //p[0] = new SqlParameter("Dish_ID", dishid);
        //p[1] = new SqlParameter("@Dish_Name", txtdishname.Text);
        //p[2] = new SqlParameter("@Diet_Type_ID", int.Parse(dietid));
        //p[3] = new SqlParameter("@Regional_Cuisine_ID", 1);
        //p[4] = new SqlParameter("@Levelofspiceid", int.Parse(levelofspices));
        //p[5] = new SqlParameter("@MealIncludeId", int.Parse(mealincludelist));
        //p[6] = new SqlParameter("@DishTyeId", int.Parse(ddldishtype.SelectedValue));
        //p[7] = new SqlParameter("@Price", int.Parse(txtprice.Text));
        //p[8] = new SqlParameter("@Description", txtdescription.Text);
        //p[9] = new SqlParameter("@SpecialOfferPrice", txtofferprice.Text);
        //p[10] = new SqlParameter("@OfferStartDate", txtofferstartdate.Text);
        //p[11] = new SqlParameter("@OfferEndDate", txtofferstartdate.Text);
        //p[12] = new SqlParameter("@IsVeg", RadioButtonList1.SelectedItem.ToString());
        //con1.Ins_Upd_Del("SP_ChefDish_Detail__Insert", p);


        if (txtofferprice.Text == "") txtofferprice.Text = null;
        if (txtofferstartdate.Text == "")txtofferstartdate.Text = null;
        if (txtofferenddate.Text == "") txtofferenddate.Text = null;

        con.update_data("update ChefDishMaster set Dish_Name='" + txtdishname.Text + "',Diet_Type_ID='" + dietid + "',Regional_Cuisine_ID='" + reginalcuisine + "',Levelofspiceid='"+levelofspices+"',Meal_Include_ID='"+mealincludelist+"',Dish_Type_Id='"+ddldishtype.SelectedValue+"',Price='"+txtprice.Text+"',Description='"+txtdescription.Text+"',SpecialOfferPrice='"+txtofferprice.Text+"',OfferStartDate='"+txtofferstartdate.Text+"',offerEndDate='"+txtofferenddate.Text+"' where Dish_ID='"+dishid+"'");
    }
    protected void DataListImage_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "deleteimg")
            {
                Label lblgalleryid = (Label)e.Item.FindControl("lblid");
                Label lbldishimg = (Label)e.Item.FindControl("lbldishname");
                string imgpath = Server.MapPath("~/dishphotoupload/" + lbldishimg.Text + ""); 
                deleteprofilephoto(imgpath);
                con.delete_data("delete from ChefDishGallery where Gallery_ID='"+lblgalleryid.Text+"' and Is_Defualt!=1");
                
            }
        bind_dishDetail(Dish_Id);

    }
    private void deleteprofilephoto(string photourl)
    {
        System.IO.File.Delete(photourl);
    }
}