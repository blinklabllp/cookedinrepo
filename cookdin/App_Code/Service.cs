using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Services;
using System.Linq;


/// <summary>
/// Summary description for Service
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class Service : System.Web.Services.WebService {

    public Service () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetCustomers(string prefix)
    {
        List<string> customers = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            List<string> terms = prefix.Split(',').ToList();
            terms = terms.Select(s => s.Trim()).ToList();

            //Extract the term to be searched from the list
            string searchTerm = terms.LastOrDefault().ToString().Trim();

            //Return if Search Term is empty
            if (string.IsNullOrEmpty(searchTerm))
            {
                return new string[0];
            }

            //Populate the terms that need to be filtered out
            List<string> excludeTerms = new List<string>();
            if (terms.Count > 1)
            {
                terms.RemoveAt(terms.Count - 1);
                excludeTerms = terms;
            }

            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["constr"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                string query = "select Dish_Name, Dish_ID from DishMaster where " +
                "Dish_Name like '%' + @SearchText + '%'";

                //Filter out the existing searched items
                if (excludeTerms.Count > 0)
                {
                    query += string.Format(" and Dish_Name not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                }
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(string.Format("{0}-{1}", sdr["Dish_Name"], sdr["Dish_ID"]));
                    }
                }
                conn.Close();
            }
            return customers.ToArray();
        }
    }



    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetNationalCuisine(string prefix)
    {
        List<string> customers = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            List<string> terms = prefix.Split(',').ToList();
            terms = terms.Select(s => s.Trim()).ToList();

            //Extract the term to be searched from the list
            string searchTerm = terms.LastOrDefault().ToString().Trim();

            //Return if Search Term is empty
            if (string.IsNullOrEmpty(searchTerm))
            {
                return new string[0];
            }

            //Populate the terms that need to be filtered out
            List<string> excludeTerms = new List<string>();
            if (terms.Count > 1)
            {
                terms.RemoveAt(terms.Count - 1);
                excludeTerms = terms;
            }

            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["constr"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                string query = "select Place_Name, Regional_Cuisine_ID from RegionalCuisine where " +
                "Place_Name like '%'+ @SearchText + '%'";

                //Filter out the existing searched items
                if (excludeTerms.Count > 0)
                {
                    query += string.Format(" and Place_Name not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                }
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(string.Format("{0}-{1}", sdr["Place_Name"], sdr["Regional_Cuisine_ID"]));
                    }
                }
                conn.Close();
            }
            return customers.ToArray();
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetInterationalCuisine(string prefix)
    {
        List<string> customers = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            List<string> terms = prefix.Split(',').ToList();
            terms = terms.Select(s => s.Trim()).ToList();

            //Extract the term to be searched from the list
            string searchTerm = terms.LastOrDefault().ToString().Trim();

            //Return if Search Term is empty
            if (string.IsNullOrEmpty(searchTerm))
            {
                return new string[0];
            }

            //Populate the terms that need to be filtered out
            List<string> excludeTerms = new List<string>();
            if (terms.Count > 1)
            {
                terms.RemoveAt(terms.Count - 1);
                excludeTerms = terms;
            }

            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["constr"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                string query = "select Place_Name, Regional_Cuisine_ID from RegionalCuisine where " +
                "Place_Name like '%'+ @SearchText + '%'";

                //Filter out the existing searched items
                if (excludeTerms.Count > 0)
                {
                    query += string.Format(" and Place_Name not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                }
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(string.Format("{0}-{1}", sdr["Place_Name"], sdr["Regional_Cuisine_ID"]));
                    }
                }
                conn.Close();
            }
            return customers.ToArray();
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetTimeOfMealPrepration(string prefix)
    {
        List<string> customers = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            List<string> terms = prefix.Split(',').ToList();
            terms = terms.Select(s => s.Trim()).ToList();

            //Extract the term to be searched from the list
            string searchTerm = terms.LastOrDefault().ToString().Trim();

            //Return if Search Term is empty
            if (string.IsNullOrEmpty(searchTerm))
            {
                return new string[0];
            }

            //Populate the terms that need to be filtered out
            List<string> excludeTerms = new List<string>();
            if (terms.Count > 1)
            {
                terms.RemoveAt(terms.Count - 1);
                excludeTerms = terms;
            }

            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["constr"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                string query = "select Time_Of_Meal_Preparation, Time_Of_Preparation_ID from TimeOfMealPreparation where " +
                "Time_Of_Meal_Preparation like '%'+ @SearchText + '%'";

                //Filter out the existing searched items
                if (excludeTerms.Count > 0)
                {
                    query += string.Format(" and Time_Of_Meal_Preparation not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                }
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(string.Format("{0}-{1}", sdr["Time_Of_Meal_Preparation"], sdr["Time_Of_Preparation_ID"]));
                    }
                }
                conn.Close();
            }
            return customers.ToArray();
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetPreferredFrequency(string prefix)
    {
        List<string> customers = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            List<string> terms = prefix.Split(',').ToList();
            terms = terms.Select(s => s.Trim()).ToList();

            //Extract the term to be searched from the list
            string searchTerm = terms.LastOrDefault().ToString().Trim();

            //Return if Search Term is empty
            if (string.IsNullOrEmpty(searchTerm))
            {
                return new string[0];
            }

            //Populate the terms that need to be filtered out
            List<string> excludeTerms = new List<string>();
            if (terms.Count > 1)
            {
                terms.RemoveAt(terms.Count - 1);
                excludeTerms = terms;
            }

            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["constr"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                string query = "select Preferred_frequency, Preferred_frequency_ID from PreferredFrequencyMaster where " +
                "Preferred_frequency like '%'+ @SearchText + '%'";

                //Filter out the existing searched items
                if (excludeTerms.Count > 0)
                {
                    query += string.Format(" and Preferred_frequency not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                }
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(string.Format("{0}-{1}", sdr["Preferred_frequency"], sdr["Preferred_frequency_ID"]));
                    }
                }
                conn.Close();
            }
            return customers.ToArray();
        }
    }
        
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetCookingOilUsed(string prefix)
    {
        List<string> customers = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            List<string> terms = prefix.Split(',').ToList();
            terms = terms.Select(s => s.Trim()).ToList();

            //Extract the term to be searched from the list
            string searchTerm = terms.LastOrDefault().ToString().Trim();

            //Return if Search Term is empty
            if (string.IsNullOrEmpty(searchTerm))
            {
                return new string[0];
            }

            //Populate the terms that need to be filtered out
            List<string> excludeTerms = new List<string>();
            if (terms.Count > 1)
            {
                terms.RemoveAt(terms.Count - 1);
                excludeTerms = terms;
            }

            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["constr"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                string query = "select Ingridiant_Name, Ingridiant_ID from IngridiantMaster where " +
                "Ingridiant_Name like '%'+ @SearchText + '%'";

                //Filter out the existing searched items
                if (excludeTerms.Count > 0)
                {
                    query += string.Format(" and Ingridiant_Name not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                }
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(string.Format("{0}-{1}", sdr["Ingridiant_Name"], sdr["Ingridiant_ID"]));
                    }
                }
                conn.Close();
            }
            return customers.ToArray();
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetDietType(string prefix)
    {
        List<string> customers = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            List<string> terms = prefix.Split(',').ToList();
            terms = terms.Select(s => s.Trim()).ToList();

            //Extract the term to be searched from the list
            string searchTerm = terms.LastOrDefault().ToString().Trim();

            //Return if Search Term is empty
            if (string.IsNullOrEmpty(searchTerm))
            {
                return new string[0];
            }

            //Populate the terms that need to be filtered out
            List<string> excludeTerms = new List<string>();
            if (terms.Count > 1)
            {
                terms.RemoveAt(terms.Count - 1);
                excludeTerms = terms;
            }

            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["constr"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                string query = "select Diet_Type, Diet_Type_ID from DietTypeMaster where " +
                "Diet_Type like '%'+ @SearchText + '%'";

                //Filter out the existing searched items
                if (excludeTerms.Count > 0)
                {
                    query += string.Format(" and Diet_Type not in ({0})", string.Join("", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                }
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(string.Format("{0}-{1}", sdr["Diet_Type"], sdr["Diet_Type_ID"]));
                    }
                }
                conn.Close();
            }
            return customers.ToArray();
        }
    }
    //[WebMethod]
    //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public string[] GetDietType(string prefix)
    //{
    //    List<string> customers = new List<string>();
    //    using (SqlConnection conn = new SqlConnection())
    //    {
    //        List<string> terms = prefix.Split(',').ToList();
    //        terms = terms.Select(s => s.Trim()).ToList();

    //        //Extract the term to be searched from the list
    //        string searchTerm = terms.LastOrDefault().ToString().Trim();

    //        //Return if Search Term is empty
    //        if (string.IsNullOrEmpty(searchTerm))
    //        {
    //            return new string[0];
    //        }

    //        //Populate the terms that need to be filtered out
    //        List<string> excludeTerms = new List<string>();
    //        if (terms.Count > 1)
    //        {
    //            terms.RemoveAt(terms.Count - 1);
    //            excludeTerms = terms;
    //        }

    //        conn.ConnectionString = ConfigurationManager
    //                .ConnectionStrings["constr"].ConnectionString;
    //        using (SqlCommand cmd = new SqlCommand())
    //        {
    //            string query = "select Diet_Type, Diet_Type_ID from DietTypeMaster where " +
    //            "Diet_Type like @SearchText + '%'";

    //            //Filter out the existing searched items
    //            if (excludeTerms.Count > 0)
    //            {
    //                query += string.Format(" and Diet_Type not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
    //            }
    //            cmd.CommandText = query;
    //            cmd.Parameters.AddWithValue("@SearchText", searchTerm);
    //            cmd.Connection = conn;
    //            conn.Open();
    //            using (SqlDataReader sdr = cmd.ExecuteReader())
    //            {
    //                while (sdr.Read())
    //                {
    //                    customers.Add(string.Format("{0}-{1}", sdr["Diet_Type"], sdr["Diet_Type_ID"]));
    //                }
    //            }
    //            conn.Close();
    //        }
    //        return customers.ToArray();
    //    }
    //}


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetDishType(string prefix)
    {
        List<string> customers = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            List<string> terms = prefix.Split(',').ToList();
            terms = terms.Select(s => s.Trim()).ToList();

            //Extract the term to be searched from the list
            string searchTerm = terms.LastOrDefault().ToString().Trim();

            //Return if Search Term is empty
            if (string.IsNullOrEmpty(searchTerm))
            {
                return new string[0];
            }

            //Populate the terms that need to be filtered out
            List<string> excludeTerms = new List<string>();
            if (terms.Count > 1)
            {
                terms.RemoveAt(terms.Count - 1);
                excludeTerms = terms;
            }

            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["constr"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                string query = "select Dish_Type, Dish_Type_ID from DishType where " +
                "Dish_Type like '%'+ @SearchText + '%'";

                //Filter out the existing searched items
                if (excludeTerms.Count > 0)
                {
                    query += string.Format(" and Dish_Type not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                }
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(string.Format("{0}-{1}", sdr["Dish_Type"], sdr["Dish_Type_ID"]));
                    }
                }
                conn.Close();
            }
            return customers.ToArray();
        }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetGender(string prefix)
    {
        List<string> customers = new List<string>();
    
                        customers.Add( "Male");
                        customers.Add("Female");
                        customers.Add("Other");
             
            return customers.ToArray();
    }


    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetLandMark(string prefix)
    {
        List<string> customers = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            List<string> terms = prefix.Split(',').ToList();
            terms = terms.Select(s => s.Trim()).ToList();

            //Extract the term to be searched from the list
            string searchTerm = terms.LastOrDefault().ToString().Trim();

            //Return if Search Term is empty
            if (string.IsNullOrEmpty(searchTerm))
            {
                return new string[0];
            }

            //Populate the terms that need to be filtered out
            List<string> excludeTerms = new List<string>();
            if (terms.Count > 1)
            {
                terms.RemoveAt(terms.Count - 1);
                excludeTerms = terms;
            }

            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["constr"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                string query = "select Landmark_Name from LandmarkMaster where Landmark_Name like '%'+ @SearchText + '%'";

                //Filter out the existing searched items
                if (excludeTerms.Count > 0)
                {
                    query += string.Format(" and LandmarkMaster not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                }
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(string.Format("{0}-{1}", sdr["Landmark_Name"], sdr["Landmark_Name"]));
                    }
                }
                conn.Close();
            }
            return customers.ToArray();
        }
    }

     [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string[] GetLevelofSpices(string prefix)
    {
        List<string> customers = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            List<string> terms = prefix.Split(',').ToList();
            terms = terms.Select(s => s.Trim()).ToList();

            //Extract the term to be searched from the list
            string searchTerm = terms.LastOrDefault().ToString().Trim();

            //Return if Search Term is empty
            if (string.IsNullOrEmpty(searchTerm))
            {
                return new string[0];
            }

            //Populate the terms that need to be filtered out
            List<string> excludeTerms = new List<string>();
            if (terms.Count > 1)
            {
                terms.RemoveAt(terms.Count - 1);
                excludeTerms = terms;
            }

            conn.ConnectionString = ConfigurationManager
                    .ConnectionStrings["constr"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                string query = "select levelofSpices,LevelofSpiceid from levelofSpicesMaster where levelOfSpices like '%'+ @SearchText + '%'";

                //Filter out the existing searched items
                if (excludeTerms.Count > 0)
                {
                    query += string.Format(" and levelofSpices not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                }
                cmd.CommandText = query;
                cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(string.Format("{0}-{1}", sdr["LevelofSpices"], sdr["LevelofSpiceid"]));
                    }
                }
                conn.Close();
            }
            return customers.ToArray();
        }
    }

     [WebMethod]
     [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
     public string[] GetMealInclude(string prefix)
     {
         List<string> customers = new List<string>();
         using (SqlConnection conn = new SqlConnection())
         {
             List<string> terms = prefix.Split(',').ToList();
             terms = terms.Select(s => s.Trim()).ToList();

             //Extract the term to be searched from the list
             string searchTerm = terms.LastOrDefault().ToString().Trim();

             //Return if Search Term is empty
             if (string.IsNullOrEmpty(searchTerm))
             {
                 return new string[0];
             }

             //Populate the terms that need to be filtered out
             List<string> excludeTerms = new List<string>();
             if (terms.Count > 1)
             {
                 terms.RemoveAt(terms.Count - 1);
                 excludeTerms = terms;
             }

             conn.ConnectionString = ConfigurationManager
                     .ConnectionStrings["constr"].ConnectionString;
             using (SqlCommand cmd = new SqlCommand())
             {
                 string query = "select Meal_Includes,Meal_Include_Id from MealIncludesMaster where Meal_Includes like '%'+ @SearchText + '%'";

                 //Filter out the existing searched items
                 if (excludeTerms.Count > 0)
                 {
                     query += string.Format(" and Meal_Includes not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                 }
                 cmd.CommandText = query;
                 cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                 cmd.Connection = conn;
                 conn.Open();
                 using (SqlDataReader sdr = cmd.ExecuteReader())
                 {
                     while (sdr.Read())
                     {
                         customers.Add(string.Format("{0}-{1}", sdr["Meal_Includes"], sdr["Meal_Include_Id"]));
                     }
                 }
                 conn.Close();
             }
             return customers.ToArray();
         }
     }


     [WebMethod]
     [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
     public string[] GetAllCuisine(string prefix)
     {
         List<string> customers = new List<string>();
         using (SqlConnection conn = new SqlConnection())
         {
             List<string> terms = prefix.Split(',').ToList();
             terms = terms.Select(s => s.Trim()).ToList();

             //Extract the term to be searched from the list
             string searchTerm = terms.LastOrDefault().ToString().Trim();

             //Return if Search Term is empty
             if (string.IsNullOrEmpty(searchTerm))
             {
                 return new string[0];
             }

             //Populate the terms that need to be filtered out
             List<string> excludeTerms = new List<string>();
             if (terms.Count > 1)
             {
                 terms.RemoveAt(terms.Count - 1);
                 excludeTerms = terms;
             }

             conn.ConnectionString = ConfigurationManager
                     .ConnectionStrings["constr"].ConnectionString;
             using (SqlCommand cmd = new SqlCommand())
             {
                 string query = "select Place_Name, Regional_Cuisine_ID from RegionalCuisine where " +
                 "Place_Name like '%'+ @SearchText + '%'";

                 //Filter out the existing searched items
                 if (excludeTerms.Count > 0)
                 {
                     query += string.Format(" and Place_Name not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                 }
                 cmd.CommandText = query;
                 cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                 cmd.Connection = conn;
                 conn.Open();
                 using (SqlDataReader sdr = cmd.ExecuteReader())
                 {
                     while (sdr.Read())
                     {
                         customers.Add(string.Format("{0}-{1}", sdr["Place_Name"], sdr["Regional_Cuisine_ID"]));
                     }
                 }
                 conn.Close();
             }
             return customers.ToArray();
         }
     }


     [WebMethod]
     [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
     public string[] GetArea(string prefix)
     {
         List<string> customers = new List<string>();
         using (SqlConnection conn = new SqlConnection())
         {
             List<string> terms = prefix.Split(',').ToList();
             terms = terms.Select(s => s.Trim()).ToList();

             //Extract the term to be searched from the list
             string searchTerm = terms.LastOrDefault().ToString().Trim();

             //Return if Search Term is empty
             if (string.IsNullOrEmpty(searchTerm))
             {
                 return new string[0];
             }

             //Populate the terms that need to be filtered out
             List<string> excludeTerms = new List<string>();
             if (terms.Count > 1)
             {
                 terms.RemoveAt(terms.Count - 1);
                 excludeTerms = terms;
             }

             conn.ConnectionString = ConfigurationManager
                     .ConnectionStrings["constr"].ConnectionString;
             using (SqlCommand cmd = new SqlCommand())
             {
                 string query = "select Area_Name, Area_ID from AreaMaster where " +
                 "Area_Name like '%'+ @SearchText + '%'";

                 //Filter out the existing searched items
                 if (excludeTerms.Count > 0)
                 {
                     query += string.Format(" and Area_Name not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                 }
                 cmd.CommandText = query;
                 cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                 cmd.Connection = conn;
                 conn.Open();
                 using (SqlDataReader sdr = cmd.ExecuteReader())
                 {
                     while (sdr.Read())
                     {
                         customers.Add(string.Format("{0}-{1}", sdr["Area_Name"], sdr["Area_ID"]));
                     }
                 }
                 conn.Close();
             }
             return customers.ToArray();
         }
     }

     [WebMethod]
     [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
     public string[] GetAllCuisine_SingleSelection(string prefix)
     {
         List<string> customers = new List<string>();
         using (SqlConnection conn = new SqlConnection())
         {
             List<string> terms = prefix.Split(',').ToList();
             terms = terms.Select(s => s.Trim()).ToList();

             //Extract the term to be searched from the list
             string searchTerm = terms.LastOrDefault().ToString().Trim();

             //Return if Search Term is empty
             if (string.IsNullOrEmpty(searchTerm))
             {
                 return new string[0];
             }

             //Populate the terms that need to be filtered out
             List<string> excludeTerms = new List<string>();
             if (terms.Count > 1)
             {
                 terms.RemoveAt(terms.Count - 1);
                 excludeTerms = terms;
             }

             conn.ConnectionString = ConfigurationManager
                     .ConnectionStrings["constr"].ConnectionString;
             using (SqlCommand cmd = new SqlCommand())
             {
                 string query = "select Place_Name, Regional_Cuisine_ID from RegionalCuisine where " +
                 "Place_Name like '%'+ @SearchText + '%'";

                // Filter out the existing searched items
                 if (excludeTerms.Count > 0)
                 {
                    query += string.Format(" and Place_Name not in ({0})", string.Join(",", excludeTerms.Select(s => "'" + s + "'").ToArray()));
                   // query += string.Format(" and Place_Name not in ({0})");
                 }
                 cmd.CommandText = query;
                 cmd.Parameters.AddWithValue("@SearchText", searchTerm);
                 cmd.Connection = conn;
                 conn.Open();
                 using (SqlDataReader sdr = cmd.ExecuteReader())
                 {
                     while (sdr.Read())
                     {
                         customers.Add(string.Format("{0}-{1}", sdr["Place_Name"], sdr["Regional_Cuisine_ID"]));
                     }
                 }
                 conn.Close();
             }
             return customers.ToArray();
         }
     }

    

}

