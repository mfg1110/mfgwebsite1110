using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class demo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     //  thirdparty();
        send();
       // httpclient();
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
            values["Name"] = "Savita";
            //values["thing2"] = "world";
            string name = "falguni";
            var response = client.UploadValues("https://api.ohmsoftwaresinc.com/api/Matrimonyforgujarati/iNSERTDEMO?Name=", values);

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


        string apiUrl = "https://api.ohmsoftwaresinc.com/api/Matrimonyforgujarati";
        var input = new
        {
            Name ="Falguni",
        };
        string inputJson = (new JavaScriptSerializer()).Serialize(input);
        HttpWebRequest httpRequest = (HttpWebRequest)WebRequest.Create(new Uri(apiUrl + "/iNSERTDEMO"));
        httpRequest.ContentType = "application/json";
        httpRequest.Method = "POST";

        byte[] bytes = Encoding.UTF8.GetBytes(inputJson);
        using (Stream stream = httpRequest.GetRequestStream())
        {
            stream.Write(bytes, 0, bytes.Length);
            stream.Close();
        }
    }

  
}