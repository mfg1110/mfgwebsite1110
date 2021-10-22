using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserDashboard_Deactive_Profile : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    string regid;
    public static int i;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            Literal lbldeactive = (Literal)this.Master.FindControl("lbldeactive");
            string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            string regid = !string.IsNullOrEmpty(Request.QueryString["regid"]) ? Request.QueryString["regid"] : Guid.Empty.ToString();
            ds = Registrationobj.getbiodatabyregid(Convert.ToInt32(regid));
            try
            {
                if (ds.Tables[0].Rows[0]["Deactivate_flag"].ToString() == "false")
                {
                    Registrationobj.deactivate("true", Convert.ToInt32(regid));
                    lblmsg1.Visible = false;
                    lblmsgsuccessspan.Visible = true;
                    lblmsgsucess.Text = "Your Profile Successfully Deactivated";
                   
                }
                else if (ds.Tables[0].Rows[0]["Deactivate_flag"].ToString() == "true")
                {
                    Registrationobj.deactivate("false", Convert.ToInt32(regid));
                    lblmsg1.Visible = false;
                    lblmsgsuccessspan.Visible = true;
                    lblmsgsucess.Text = "Your Profile Successfully activated";
                }
                Response.Redirect("../UserDashboard/Dashboard.aspx");
            }
            catch (SqlException ex)
            {
                lblmsg1.Visible = true;
                lblmsgsucess.Visible = false;
                lblmsg.Text = "Error";
            }

        }
    }
}