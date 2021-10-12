using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Change_Password : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    int regid;

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {
            if (Request.QueryString["regid"] != null)
            {

                string regid = Request.QueryString["regid"].ToString();
                txtoldpwd.Visible = true;
                txtemail.Visible = false;
            }
        }
        else if (Session["id"] != null)
        {
            if (Request.QueryString["regid"] != null)
            {
                
                    regid = Convert.ToInt32(Request.QueryString["regid"].ToString());
                    txtoldpwd.Visible = true;
                    txtemail.Visible = false;
            }
          
           
        }
        else
        {
            if (Request.QueryString["regidreset"] != null)
            {
                regid = Convert.ToInt32(Request.QueryString["regidreset"].ToString());
                txtemail.Visible = true;
                txtoldpwd.Visible = false;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        
    }
   
    protected void btnchangepwd_Click(object sender, EventArgs e)
    {
        try
        {
            Registrationobj.Changepassword(regid,
                                            txtnewpwd.Text,
                                            DateTime.Now
                                            );

            lblmsg1.Text = "Password Changed Successfully";
            lblmsg1.Visible = false;
            Response.Redirect("Logout.aspx");
        }
        catch(Exception ex)
        {
            Response.Redirect("login.aspx");
        }
    }
}