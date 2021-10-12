using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class deletebiodata : System.Web.UI.Page
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
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {

            id = Convert.ToInt32(idCookie.Value);
            if (!IsPostBack)
            {
                
                // txtname.Text = nameCookie.Value;
            }
            if (Request.QueryString["Biodata_id"] != null)
            {
               
                    Biodata_id = Convert.ToInt32(Request.QueryString["Biodata_id"].ToString());
                    //  txtname.Text = Session["Fname"].ToString();
                  
                    Registrationobj.Updatevisibilityflag(Biodata_id, "false", DateTime.Now);

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Server Error : Connection Timeout.');", true);
                    Response.Redirect("Default.aspx");
               
            }
        }
        else if (Session["id"] != null)
        {
            id = Convert.ToInt32(Session["id"].ToString());

            //txtpostedby.Text = Session["Fname"].ToString();
            if (!IsPostBack)
            {
                
                //  txtname.Text = Session["Fname"].ToString();
            }
            if (Request.QueryString["Biodata_id"] != null)
            {
               
                  
                    Registrationobj.Updatevisibilityflag(id, "false", DateTime.Now);
                    //  txtname.Text = Session["Fname"].ToString();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Server Error : Connection Timeout.');", true);
                    Response.Redirect("Default.aspx");
               

            }

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
}