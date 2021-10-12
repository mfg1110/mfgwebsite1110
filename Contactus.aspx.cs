using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contactus : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath, postimage, filename;
    int randomdigit;
    public static int Biodata_id, id;
    DataSet ds;
    string Mobileno1, Mobileno2, totnoofchild, monthlyincome, YearofPassing;
    string searchid, finalString, Images, Photo;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {

            id = Convert.ToInt32(idCookie.Value);

            txtemail.Text = email(id);
        }
        else if (Session["id"] != null)
        {
            id = Convert.ToInt32(Session["id"].ToString());

            //txtpostedby.Text = Session["Fname"].ToString();

            txtemail.Text = email(id);
        }
        else
        {

        }
    }
    protected void lnksend_Click(object sender, EventArgs e)
    {
        try
        {
            Registrationobj.Post_feedback(txtemail.Text,
                            txtdescription.Text);
            txtdescription.Text = "";
            txtemail.Text = "";
            lblmsg.Visible = true;
            lblmsg.Text = "Your Feedback Submiteed";

        }
        catch (Exception ex)
        {

        }

    }

    public string email(int id)
    {

        ds = Registrationobj.getregistrationbyid(id);
        //rptdata.DataSource = ds;
        //rptdata.DataBind();

        string s = ds.Tables[0].Rows[0]["UserID"].ToString();
        return s;

    }
}