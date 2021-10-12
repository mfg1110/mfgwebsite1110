using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_Pages_AdminMasterPage : System.Web.UI.MasterPage
{
    Registration.Registration Registrationobj = new Registration.Registration();
    blog.blog blogobj = new blog.blog();
    int id;
    DataSet ds;
    string Access_type;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        HttpCookie cAccess_type = Request.Cookies["Access_type"];
        HttpCookie cdomain_location = Request.Cookies["domain_location"];
        if (nameCookie != null)
        {

            id = Convert.ToInt32(idCookie.Value);
            txtid.Text = id.ToString();
            //reg.Visible = false;
            //Divuname.Visible = true;
            //lipost.Visible = true;
            lbluname.Text = nameCookie.Value;
            lbllocation.Text = cdomain_location.Value;
            if (lbluname.Text == "Super Admin")
            {
                liaddcomittee.Visible = true;
            }
            //lilogin.Visible = false;
            //lisignup.Visible = false;
            //lbluname.Text = "ttkhj";
        }
        else if (Session["id"] != null)
        {
            id = Convert.ToInt32(Session["id"].ToString());
            txtid.Text = id.ToString();
            //reg.Visible = false;
            //Divuname.Visible = true;
            //lipost.Visible = true;
            lbluname.Text = Session["Fname"].ToString();
            lbllocation.Text = Session["domain_location"].ToString();
            if (lbluname.Text == "Super Admin")
            {
                liaddcomittee.Visible = true;
            }
            //lilogin.Visible = false;
            //lisignup.Visible = false;
        }
        else
        {
            //lilogin.Visible = true;
            //lisignup.Visible = true;
            //lipost.Visible = false;
            // Response.Redirect("Login.aspx");
        }
        string gender, totalperson;

     
    }
}
