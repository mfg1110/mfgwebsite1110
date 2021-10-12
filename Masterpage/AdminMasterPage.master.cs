using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Masterpage_AdminMasterPage : System.Web.UI.MasterPage
{
    Registration.Registration Registrationobj = new Registration.Registration();
    public static int id;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (idCookie != null)
        {

            id = Convert.ToInt32(idCookie.Value);

          
        }
        else if (Session["id"] != null)
        {

            id = Convert.ToInt32(Session["id"].ToString());

        }
        else
        {

            // Response.Redirect("Login.aspx");
        }
        ds = Registrationobj.getbiodatabyregid(id);
        if (ds != null)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {

                //txtbiodataid.Text = ds.Tables[0].Rows[0]["Biodata_id"].ToString();
            }
            else
            {


                // lideletebio.Visible = false;
            }
        }
        else
        {

        }
    }
}
