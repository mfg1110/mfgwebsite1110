using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Profile : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath, postimage, filename;
    int id;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {
            id = Convert.ToInt32(idCookie.Value);
            if (!IsPostBack)
            {
                //Bindddl();
            }
        }
        else if (Session["id"] != null)
        {
            id = Convert.ToInt32(Session["id"].ToString());
            //txtpostedby.Text = Session["Fname"].ToString();
            if (!IsPostBack)
            {
               // Bindddl();
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
}