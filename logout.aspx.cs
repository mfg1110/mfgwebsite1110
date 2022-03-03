using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];

        Session.Clear();
        Session.Abandon();
        if (nameCookie != null)
        {

            HttpCookie aCookie = HttpContext.Current.Request.Cookies["Name"];
            HttpCookie bCookie = HttpContext.Current.Request.Cookies["id"];
            aCookie.Expires = DateTime.Now.AddDays(-10);
            aCookie.Value = "";
            HttpContext.Current.Response.Cookies.Add(aCookie);

            bCookie.Expires = DateTime.Now.AddDays(-10);
            bCookie.Value = "";
            HttpContext.Current.Response.Cookies.Add(bCookie);
        }
        Response.Redirect("main.aspx");
    }
}