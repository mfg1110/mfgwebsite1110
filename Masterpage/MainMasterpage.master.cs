using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Masterpage_MainMasterpage : System.Web.UI.MasterPage
{
    Registration.Registration Registrationobj = new Registration.Registration();
    public static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (idCookie != null)
        {

            id = Convert.ToInt32(idCookie.Value);
            lidashboard.Visible = true;
            lilogout.Visible = true;
            lisignin.Visible = false;
            lisignup.Visible = false;
        }
        else if (Session["id"] != null)
        {

            id = Convert.ToInt32(Session["id"].ToString());
            lidashboard.Visible = true;
            lilogout.Visible = true;
            lisignin.Visible = false;
            lisignup.Visible = false;
        }
        else
        {
            lidashboard.Visible = false;
            lilogout.Visible = false;
            lisignin.Visible = true;
            lisignup.Visible = true;
            // Response.Redirect("Login.aspx");
        }
       
    }
}
