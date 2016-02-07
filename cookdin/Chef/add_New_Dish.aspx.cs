using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class Chef_add_New_recipe : System.Web.UI.Page
{
    Myconnection con = new Myconnection();
    SP_MyConnection con1 = new SP_MyConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Check_USerID_Exist();
            Bind_DIshType();
            bind_levelof_spices();
        }
    }
  
    private void Check_USerID_Exist()
    {
        if(Session["Chef_ID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }

    }
    
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string dietid = get_diet_type_Id();
        string reginalcuisine = get_cuisine_type_Id();
       // string levelofspices = get_level_of_spices_Id();
        string mealincludelist = get_Meal_Include_list_Id();

        SqlParameter[] p = new SqlParameter[14];
        p[0] = new SqlParameter("@Dish_Name", txtdishname.Text);
        p[1] = new SqlParameter("@Chef_ID", int.Parse(Session["Chef_ID"].ToString()));
        p[2] = new SqlParameter("@Chef_UserName", Session["Chef_UserName"].ToString());
        p[3] = new SqlParameter("@Diet_Type_ID", int.Parse(dietid));
        p[4] = new SqlParameter("@Regional_Cuisine_ID", int.Parse(reginalcuisine));
        p[5] = new SqlParameter("@Levelofspiceid", rdolevelofspice.SelectedValue);
        p[6] = new SqlParameter("@MealIncludeId", int.Parse(mealincludelist));
        p[7] = new SqlParameter("@DishTyeId", int.Parse(ddldishtype.SelectedValue));
        p[8] = new SqlParameter("@Price", int.Parse(txtprice.Text));
        p[9] = new SqlParameter("@Description", txtdescription.Text);

        if(txtofferprice.Text == "")
            p[10] = new SqlParameter("@SpecialOfferPrice",null);
        else
            p[10] = new SqlParameter("@SpecialOfferPrice", txtofferprice.Text);
        if(txtofferstartdate.Text == "")
            p[11] = new SqlParameter("@OfferStartDate", null);
        else
            p[11] = new SqlParameter("@OfferStartDate", txtofferstartdate.Text);
        if(txtofferenddate.Text == "")
            p[12] = new SqlParameter("@OfferEndDate", null);
        else
            p[12] = new SqlParameter("@OfferEndDate", txtofferstartdate.Text); 
        
        
        p[13] = new SqlParameter("@IsVeg", RadioButtonList1.SelectedItem.ToString());
        con1.Ins_Upd_Del("SP_ChefDish_Insert", p);

       //con.insert_data("insert into DishMaster values('" + txtdishname.Text + "','" + Session["Chef_ID"] + "','" + Session["Chef_UserName"] + "','" + txtdiettype.Text + "','" + txtcuisine.Text + "','" + txtlevelofspices.Text + "','" + txtprice.Text + "','" + txtdescription.Text + "','" + txtofferprice.Text + "','" + DateTime.Parse(txtofferstartdate.Text) + "','" + DateTime.Parse(txtofferenddate.Text) + "','Pendding','0','"+DateTime.Now+"','"+DateTime.Now+"')");

        string dishid = con.singlecell("select max(Dish_ID) from ChefDishMaster where Chef_ID='" + Session["Chef_ID"] + "'");

        if (dishid != "")
        {
            Add_Dish_Dish_Type(dishid);
            Add_Dish_Ingridient(dishid);
            Upload_Image_Gallery(dishid);
        }
        Response.Redirect("~/Chef/ListDish.aspx");

    }

    private void bind_levelof_spices()
    {
        rdolevelofspice.DataSource = con1.Select("SP_LevelOfSpice_View");
        rdolevelofspice.DataTextField = "LevelofSpices";
        rdolevelofspice.DataValueField = "Levelofspiceid";
        rdolevelofspice.DataBind();
    }

    private void Upload_Image_Gallery(string dishid)
    {
        HttpFileCollection fileCollection = Request.Files;
        int files = fileCollection.Count;
        int count = 0;
        for (int i = 0; i < files; i++)
        {
            HttpPostedFile uploadfile = fileCollection[i];
            string fileName = Session.SessionID +  Path.GetFileName(uploadfile.FileName);
            if (uploadfile.ContentLength > 0)
            {
                count = count + 1;
                uploadfile.SaveAs(Server.MapPath("~/dishphotoupload/") + fileName);
                //lblMessage.Text += fileName + "Saved Successfully<br>";

                SqlParameter[] p2 = new SqlParameter[4];

                p2[0] = new SqlParameter("@Chef_ID", int.Parse(Session["Chef_ID"].ToString()));
                p2[1] = new SqlParameter("@Dish_ID", int.Parse(dishid));
                p2[2] = new SqlParameter("@Dish_Image", fileName);
                if (count == 1)
                {
                    p2[3] = new SqlParameter("@Is_Default", "1");
                }
                else
                {
                    p2[3] = new SqlParameter("@Is_Default", "0");
                }

                con1.Ins_Upd_Del("SP_ChefDishGallery_Insert", p2);
            }
        }
    }

    private void Add_Dish_Dish_Type(string dishid)
    {
        char[] delimiterChars = { ',' };

        //string dishIds = Request.Form[hfdishtype.UniqueID];
        //string[] dishtype = dishIds.Split(delimiterChars);

        //if (dishIds != "" || dishIds != " ")
        //{

        //    foreach (string dt in dishtype)
        //    {
              
        //        if (dt == "" || dt == null || dt == " ")
        //        {
        //            break;
        //        }
        //        else
        //        {
        //            SqlParameter[] p = new SqlParameter[2];

        //            p[0] = new SqlParameter("@Dish_ID", int.Parse(dishid));
        //            p[1] = new SqlParameter("@Dish_Type_ID", int.Parse(dt));

        //            con1.Ins_Upd_Del("SP_ChefDishDishType_Insert", p);
        //        }
        //    }
        //}
    }

    private string get_diet_type_Id()
    {
        string id="";
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

        return id;
    }

    private string get_cuisine_type_Id()
    {
        string id = "";
        char[] delimiterChars = { ',' };

        string CouIds = Request.Form[hfcuisine.UniqueID];
        string[] dishtype = CouIds.Split(delimiterChars);

        if (CouIds != "" || CouIds != " ")
        {

            foreach (string co in dishtype)
            {

                if (co == "" || co == null || co == " ")
                {
                    break;

                }
                else
                {
                    id = co;
                }
            }
        }

        return id;
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

        return id;
    }

    private void Add_Dish_Ingridient(string dishid)
    {
        char[] delimiterChars = { ',' };

        string ingIds = Request.Form[hfingri.UniqueID];
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

   
}