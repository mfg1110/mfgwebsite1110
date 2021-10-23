using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Masterpage_UserDashboardMasterPage : System.Web.UI.MasterPage
{
    Registration.Registration Registrationobj = new Registration.Registration();
    public static int id;
    DataSet ds, dspatnerprefrence;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (idCookie != null)
        {

            id = Convert.ToInt32(idCookie.Value);
            txtid.Text = id.ToString();
            lblusername.Text = nameCookie.Value;
            //   lblusername1.Text = nameCookie.Value;

        }
        else if (Session["id"] != null)
        {

            id = Convert.ToInt32(Session["id"].ToString());

            txtid.Text = id.ToString();
            lblusername.Text = Session["Fname"].ToString();
            // lblusername1.Text = Session["Fname"].ToString();
        }
        else
        {

            // Response.Redirect("Login.aspx");
        }
        ds = Registrationobj.getbiodatabyregid(id);
       dspatnerprefrence = Registrationobj.getpatnerpreferencebyid(id);
        if (ds != null)
        {
            if (dspatnerprefrence.Tables[0].Rows.Count > 0)
            {
                liupdatepatnerprefrences.Visible = true;
                //lideactivate.Visible = true;
                lipostpatnerpreferences.Visible = false;
            }
            else
            {
                 liupdatepatnerprefrences.Visible = false;
                lipostpatnerpreferences.Visible = true;
            }
            if (ds.Tables[0].Rows.Count > 0)
            {
                lipostbiodata.Visible = false;
                liupdatebiodata.Visible = true;
                liprofile.Visible = true;
                memberchat.Visible = true;
              //  lideactivate.Visible = true;
                if (ds.Tables[0].Rows[0]["Deactivate_flag"].ToString() == "true")
                {
                   // lbldeactive.Text = "Activated Profile";
                }
                else if (ds.Tables[0].Rows[0]["Deactivate_flag"].ToString() == "delete")
                {
                    lipostbiodata.Visible = true;
                    liupdatebiodata.Visible = false;
                }
                else
                {
                    //lbldeactive.Text = "Deactive Profile";
                }
                // lideletebio.Visible = true;
             //   lilogin.Visible = false;
             //   lisignup.Visible = false;
                txtbiodataid.Text = ds.Tables[0].Rows[0]["Biodata_id"].ToString();
            }
            else
            {
                liprofile.Visible = false;
                lipostbiodata.Visible = true;
                liupdatebiodata.Visible = false;
                // lideletebio.Visible = false;
            }
        }
        else
        {

        }
    }
}
