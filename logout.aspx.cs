using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {
            DateTime dtExpiry = DateTime.Now.AddDays(-1); 
            Response.Cookies["Name"].Expires = dtExpiry;
            Response.Cookies["id"].Expires = dtExpiry;
        }
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}