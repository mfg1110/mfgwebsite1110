//using Newtonsoft.Json;
//using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserDashboard_Biodata : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath, postimage, filename;
    int randomdigit;
    public static int Biodata_id, id, stepid, step, indexid;
    public static int flagprev = 0;
    DataSet ds;
    string Mobileno1, Mobileno2, totnoofchild, monthlyincome, YearofPassing;
    string searchid, finalString, Images, Photo;
    string Visibility_Flag = "true";
    protected void Page_Load(object sender, EventArgs e)
    {
        //Wizard1.PreRender += new EventHandler(Wizard1_PreRender);
        //HttpCookie nameCookie = Request.Cookies["Name"];
        //HttpCookie idCookie = Request.Cookies["id"];
        //if (nameCookie != null)
        //{

        //    id = Convert.ToInt32(idCookie.Value);
        //    if (!IsPostBack)
        //    {
        //        Bindddl();
        //        binddropdownlist();
               
        //    }
        //    if (Request.QueryString["Biodata_id"] != null)
        //    {
        //        if (!IsPostBack)
        //        {
        //            loaddata();
                  
        //        }
        //    }
        //}
        //else if (Session["id"] != null)
        //{
        //    id = Convert.ToInt32(Session["id"].ToString());

           
        //    if (!IsPostBack)
        //    {
        //        binddropdownlist();
        //        Bindddl();
                
        //    }
        //    if (Request.QueryString["Biodata_id"] != null)
        //    {
        //        if (!IsPostBack)
        //        {
        //            loaddata();
                  
        //        }


        //    }

        //}
        //else
        //{
        //    Response.Redirect("Login.aspx");
        //}
    }
}