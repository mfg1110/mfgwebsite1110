using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_Pages_FrontMasterPage : System.Web.UI.MasterPage
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
            profile.Visible = true;
            id = Convert.ToInt32(idCookie.Value);
            txtid.Text = id.ToString();
            lbluname.Text = nameCookie.Value;
            liregister.Visible = false;
            lisigin.Visible = false;
          
            lipost.Visible = true;
        }
        else if (Session["id"] != null)
        {
            profile.Visible = true;
            id = Convert.ToInt32(Session["id"].ToString());
            txtid.Text = id.ToString();
         
            lbluname.Text = Session["Fname"].ToString();
            liregister.Visible = false;
            lisigin.Visible = false;
           
            lipost.Visible = true;
        }
        else
        {
            profile.Visible = false;
            lipost.Visible = false;
            // Response.Redirect("Login.aspx");
        }
        ds = Registrationobj.getbiodatabyregid(id);
        if (ds != null)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                lipost.Visible = false;
                liupdatebio.Visible = true;
             //   lideletebio.Visible = true;
                lisigin.Visible = false;
                liregister.Visible = false;
                txtbiodataid.Text = ds.Tables[0].Rows[0]["Biodata_id"].ToString();
            }
            else
            {

                lipost.Visible = true;
                liupdatebio.Visible = false;
               // lideletebio.Visible = false;
            }
        }
        else
        {

        }
    }
}
