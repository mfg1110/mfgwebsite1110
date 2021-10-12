using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserDashboard_Changepassword : System.Web.UI.Page
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
                email.Visible = false;
                oldpwd.Visible = true;
            }
        }
        else if (Session["id"] != null)
        {
            if (Request.QueryString["regid"] != null)
            {

                regid = Convert.ToInt32(Request.QueryString["regid"].ToString());
                txtoldpwd.Visible = true;
                txtemail.Visible = false;
                email.Visible = false;
                oldpwd.Visible = true;
            }


        }
        else if (Request.QueryString["regidreset"] != null)
        {
            regid = Convert.ToInt32(Request.QueryString["regidreset"].ToString());
            DataSet dsemail = Registrationobj.getregistrationbyid(regid);
            txtemail.Text = dsemail.Tables[0].Rows[0]["UserID"].ToString();
            email.Visible = true;
            oldpwd.Visible = false;
            txtemail.Visible = true;
            txtoldpwd.Visible = false;
        }

        else
        {
            Response.Redirect("Login.aspx");
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

            Registrationobj.ADD_Log(regid.ToString(), "Change Password", "Password Changed Successfully", regid.ToString(), regid.ToString(), DateTime.Now, DateTime.Now);
            Response.Redirect("Logout.aspx");
        }
        catch (Exception ex)
        {
            Response.Redirect("login.aspx");
        }
    }
}