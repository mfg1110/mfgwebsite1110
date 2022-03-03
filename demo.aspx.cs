using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Routing;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Xml;
public partial class demo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //  thirdparty();
        //  send();
        //httpclient();

    }


    public void thirdparty()
    {
        var request = (HttpWebRequest)WebRequest.Create("https://api.ohmsoftwaresinc.com/api/Matrimonyforgujarati/iNSERTDEMO");

        var postData = "Name=" + Uri.EscapeDataString("geeta");
        //postData += "&thing2=" + Uri.EscapeDataString("world");
        var data = Encoding.ASCII.GetBytes(postData);

        request.Method = "POST";
        request.ContentType = "application/x-www-form-urlencoded";
        request.ContentLength = data.Length;

        using (var stream = request.GetRequestStream())
        {
            stream.Write(data, 0, data.Length);
        }

        var response = (HttpWebResponse)request.GetResponse();

        var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();
    }

    public void httpclient()
    {
        using (var client = new WebClient())
        {
            var values = new NameValueCollection();
            values["Name"] = txtemailid.Text;
            //values["thing2"] = "world";
            string name = "falguni";
            var response = client.UploadValues("https://api.ohmsoftwaresinc.com/api/Matrimonyforgujarati/iNSERTDEMO", values);

            var responseString = Encoding.Default.GetString(response);
        }
    }

    public void send()
    {
        //string name="falguni";
        //string url = "https://api.ohmsoftwaresinc.com/api/Matrimonyforgujarati/iNSERTDEMO?Name=" + name;
        //HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        //request.Method = "POST";
        //request.ContentType = "application/json";
        //request.ContentLength = url.Length;
        //HttpWebResponse response = (HttpWebResponse)request.GetResponse();


        //string apiUrl = "https://api.ohmsoftwaresinc.com/api/Matrimonyforgujarati";
        //var input = new
        //{
        //    Name ="Falguni",
        //};
        //string inputJson = (new JavaScriptSerializer()).Serialize(input);
        //HttpWebRequest httpRequest = (HttpWebRequest)WebRequest.Create(new Uri(apiUrl + "/iNSERTDEMO2"));
        //httpRequest.ContentType = "application/json";
        //httpRequest.Method = "POST";

        //byte[] bytes = Encoding.UTF8.GetBytes(inputJson);
        //using (Stream stream = httpRequest.GetRequestStream())
        //{
        //    stream.Write(bytes, 0, bytes.Length);
        //    stream.Close();
        //}



    }


    protected void lnksend_Click(object sender, EventArgs e)
    {

        string URI = "https://mfgauth.ohm.matrimonyforgujarati.com/api/MFG/iNSERTDEMO";
        string value1 = txtemailid.Text;
        string myParameters = "Name=" + value1 + "";
        string HtmlResult;

        //using (WebClient wc = new WebClient())
        //{
        //    wc.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";
        //    //  HtmlResult = wc.UploadString(URI, myParameters);
        //    // request.Credentials = new NetworkCredential("user", "password");
        //    // request.EnableSsl = true;
        //    wc.QueryString.Add("Name", value1);
        //    //wc.QueryString.Add("parameter2", "www.stopbyte.com");
        //    //wc.QueryString.Add("parameter3", "parameter 3 value.");

        //    var data = wc.UploadValues(URI, "POST", wc.QueryString);

        //    // data here is optional, in case we recieve any string data back from the POST request.
        //    var responseString = UnicodeEncoding.UTF8.GetString(data);

           
        //}

        System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate(object s,
                System.Security.Cryptography.X509Certificates.X509Certificate certificate,
                System.Security.Cryptography.X509Certificates.X509Chain chain,
                System.Net.Security.SslPolicyErrors sslPolicyErrors)
        {
            return true;
        };

     
        using (WebClient Client = new WebClient()) // InitWebClient() initialises a new WebClient and sets the BaseAddress and Encoding properties
        {
            Client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
            TaskCompletionSource<string> tcs = new TaskCompletionSource<string>();
            NameValueCollection Values = new NameValueCollection
            {      
                {"Name", value1}
            };
            byte[] response = Client.UploadValues(URI, "POST", Values);
            string result = System.Text.Encoding.UTF8.GetString(response);
           
            Client.Dispose();

            var model = new JavaScriptSerializer().Deserialize<dynamic>(result);

            for (int i = 0; i < model["response"]["recs"]["count"]; i++)
            {
                string type = model["response"]["recs"]["objs"][i]["type"];

                if (type == "A")
                {
                    //return new
                    //{
                    //    rec_id = model["response"]["recs"]["objs"][i]["rec_id"],
                    //    content = model["response"]["recs"]["objs"][i]["content"],
                    //    name = model["response"]["recs"]["objs"][i]["name"],
                    //    service_mode = model["response"]["recs"]["objs"][i]["service_mode"],
                    //    ttl = model["response"]["recs"]["objs"][i]["ttl"]
                    //};
                }

            }

           
        }
      

        //gvCustomers.DataSource = (new JavaScriptSerializer()).Deserialize<List<Customer>>(response_data.ToString());
        //gvCustomers.DataBind();

        ServicePointManager.ServerCertificateValidationCallback =
                                    (s, certificate, chain, sslPolicyErrors) => true;



    }


    public class Customer
    {
        public string ID { get; set; }
        public string Email { get; set; }

    }


}