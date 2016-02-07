using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.IO;
using System.Configuration;
using System.Threading;

/// <summary>
/// Summary description for commonfunctions
/// </summary>
public class commonfunctions
{
Myconnection con=new Myconnection();
	public commonfunctions()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public XElement GetGeocodingSearchResults(string address)
    {
        // Use the Google Geocoding service to get information about the user-entered address
        // See http://code.google.com/apis/maps/documentation/geocoding/index.html for more info...
        var url = String.Format("http://maps.google.com/maps/api/geocode/xml?address={0}&sensor=false", HttpContext.Current.Server.UrlEncode(address));

        // Load the XML into an XElement object (whee, LINQ to XML!)
        var results = XElement.Load(url);

        // Check the status
        var status = results.Element("status").Value;
//      if (status != "OK" && status != "ZERO_RESULTS")
            // Whoops, something else was wrong with the request...
//           throw new ApplicationException("There was an error with Google's Geocoding Service: " + status);



if (status == "OVER_QUERY_LIMIT")
        {
            Thread.Sleep(200);
            GetGeocodingSearchResults(address);
        }
        else if (status != "OK" && status != "ZERO_RESULTS")
        {
            // Whoops, something else was wrong with the request...     
        }




        return results;
    }
    public double distance(double lat1, double lon1, double lat2, double lon2, char unit)
    {
        double theta = lon1 - lon2;
        double dist = Math.Sin(deg2rad(lat1)) * Math.Sin(deg2rad(lat2)) + Math.Cos(deg2rad(lat1)) * Math.Cos(deg2rad(lat2)) * Math.Cos(deg2rad(theta));
        dist = Math.Acos(dist);
        dist = rad2deg(dist);
        dist = dist * 60 * 1.1515;
        if (unit == 'K')
        {
            dist = dist * 1.609344;
        }
        else if (unit == 'N')
        {
            dist = dist * 0.8684;
        }
        return (dist);
    }

    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    //::  This function converts decimal degrees to radians             :::
    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public double deg2rad(double deg)
    {
        return (deg * Math.PI / 180.0);
    }

    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    //::  This function converts radians to decimal degrees             :::
    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public double rad2deg(double rad)
    {
        return (rad / Math.PI * 180.0);
    }

    public static bool sending_Mail(string toEmail, string subject, string body)
    {

        try
        {
            string smtpAddress = "smtp-relay.gmail.com";
            int portNumber = 587;
            bool enableSSL = true;

            string emailFrom = "no-reply@cookedin.com";
          

            string username = "hd@cookedin.com";
            string password = "sf5500bb";

            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFrom);
                mail.To.Add(toEmail);
                mail.Bcc.Add("support@cookedin.com");
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                // Can set to false, if you are sending pure text.

                //mail.Attachments.Add(new Attachment("C:\\SomeFile.txt"));
                //mail.Attachments.Add(new Attachment("C:\\SomeZip.zip"));

                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new NetworkCredential(username, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);
                }
            }
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public static bool order_sending_Mail(string toEmail, string subject, string body)
    {

        try
        {
            string smtpAddress = "smtp-relay.gmail.com";
            int portNumber = 587;
            bool enableSSL = true;

            string emailFrom = "orders@cookedin.com";


            string username = "hd@cookedin.com";
            string password = "sf5500bb";

            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress(emailFrom);
                mail.To.Add(toEmail);
                mail.Bcc.Add("orders@cookedin.com");
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                // Can set to false, if you are sending pure text.

                //mail.Attachments.Add(new Attachment("C:\\SomeFile.txt"));
                //mail.Attachments.Add(new Attachment("C:\\SomeZip.zip"));

                using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                {
                    smtp.Credentials = new NetworkCredential(username, password);
                    smtp.EnableSsl = enableSSL;
                    smtp.Send(mail);
                }
            }
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    public static string PopulateBody(string userName, string title, string url, string description)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/EmailTemplate/OrderConfirmationEmailTemplate.htm")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{UserName}", userName);
        body = body.Replace("{Title}", title);
        body = body.Replace("{Url}", url);
        body = body.Replace("{Description}", description);
        return body;
    }


  public  string ShowResults(XElement result1, string zip1, XElement result2, string zip2)
    {
try
        {
        string loadData = String.Empty;
        var address1 = result1.Element("result").Element("formatted_address").Value;
        var address2 = result2.Element("result").Element("formatted_address").Value;
        double lat1, lat2, lng1, lng2, calcdistance;

        // Get the lat/long info about the address
        var results1 = GetGeocodingSearchResults(address1);
        var results2 = GetGeocodingSearchResults(address2);

        // Set the latitude and longtitude parameters based on the address being searched on
        var lats1 = results1.Element("result").Element("geometry").Element("location").Element("lat").Value;
        var lngs1 = results1.Element("result").Element("geometry").Element("location").Element("lng").Value;
        lat1 = Convert.ToDouble(lats1);
        lng1 = Convert.ToDouble(lngs1);

        var lats2 = results2.Element("result").Element("geometry").Element("location").Element("lat").Value;
        var lngs2 = results2.Element("result").Element("geometry").Element("location").Element("lng").Value;
        lat2 = Convert.ToDouble(lats2);
        lng2 = Convert.ToDouble(lngs2);

        calcdistance = distance(lat1, lng1, lat2, lng2, 'K');
        return calcdistance.ToString();
}
             catch (Exception ex) 
               {

            return "0";
                }
    }

  public Dictionary<string, string> CalculateResult(string source, string destination)
    {
                        string displayshippingvalue; 
                        int calculated_distance=0;
                        int perKMcharge = int.Parse(System.Configuration.ConfigurationManager.AppSettings["DeliveryPerKM"]);
                        int Definecharge = int.Parse(System.Configuration.ConfigurationManager.AppSettings["DeliveryCharge"]);
                        int DefaultDistance = int.Parse(System.Configuration.ConfigurationManager.AppSettings["DefaultDistance"]);
                        int DeliveryRange = int.Parse(System.Configuration.ConfigurationManager.AppSettings["DeliveryRange"]);
                        int shippingcharge;


                    if (con.check_data("select PinCode from AreaMaster where PinCode='" + destination + "'") == true)
                    {
                        var results1 = GetGeocodingSearchResults("India" + source);
                        var results2 = GetGeocodingSearchResults("India" + destination);

                        string distance = ShowResults(results1, source, results2, destination);

                        decimal distancedesimal = decimal.Parse(distance);

                        calculated_distance = (int)Math.Round(distancedesimal);

                        
                        if (calculated_distance <= DefaultDistance)
                        {
                            shippingcharge = Definecharge;
                        }
                        else if (calculated_distance <= DeliveryRange)
                        {
                            calculated_distance = calculated_distance - DefaultDistance;
                            shippingcharge = (calculated_distance * perKMcharge) + Definecharge;
                        }
                        else
                        {
                            shippingcharge = -1;
                        }
                                if (shippingcharge == -1)
                                {
                                    displayshippingvalue = "-1";
                                }
                                else
                                {
                                    displayshippingvalue = shippingcharge.ToString();
                                }
                    }
                    else
                    {
                        displayshippingvalue = "-1";
                    }

                    Dictionary<string, string> returnvalues = new Dictionary<string, string>();
                    returnvalues.Add("charges", displayshippingvalue);
                    returnvalues.Add("distancecount", calculated_distance.ToString());


                    return returnvalues;
    }

   
}