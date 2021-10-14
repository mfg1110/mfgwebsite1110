using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class UserDashboard_Delete : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    int regid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            string regid = !string.IsNullOrEmpty(Request.QueryString["regid"]) ? Request.QueryString["regid"] : Guid.Empty.ToString();
            try
            {
                Registrationobj.deactivate("delete", Convert.ToInt32(regid));
                Registrationobj.deletereg("delete", Convert.ToInt32(regid));
                string msg = string.Empty;
                msg = "Delete Your Account Successfully";
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + msg + "');", true);
                Response.Redirect("../Logout.aspx");
            }
            catch (Exception ex)
            {
                Response.Redirect("../Logout.aspx");
            }
        }

    }
}