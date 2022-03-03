using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
public partial class validregistration : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    HtmlMeta title = new HtmlMeta();
    HtmlMeta image = new HtmlMeta();
    HtmlMeta image1 = new HtmlMeta();
    string Videostrname = "", Videoextension, videopath;
    DataSet ds;
    string flaguserexist = "";
    public string theVerificationCode;
    Boolean flag;
    string activationCode;
    public static String Email_Exist = "Email ID already exist. Please Register With Another Email ID";
    protected void Page_Load(object sender, EventArgs e)
    {
        txtemail.Focus();
    }
    
  
   
    protected void lnkregisterme_Click(object sender, EventArgs e)
    {
    }
    protected void lnkregister_Click(object sender, EventArgs e)
    {

        flag = true;
        flaguserexist = Registrationobj.Userexistornot(txtemail.Text);
        if (flaguserexist == "true")
        {
            lblerror.Visible = true;
            lblerror.Text = "Email ID already exist. Please Register With Another Email ID";
            txtemail.Text = "";
            //lnkregisterme.Enabled = false;
            flag = false;
        }
        else
        {
            lblerror.Visible = false;

            Session["Email"] = txtemail.Text;
              Response.Redirect("Register.aspx");
        }
    }
    
   
    protected void LNKREGISTERME_Click(object sender, EventArgs e)
    {
        //lblerror.Visible = true;
        //lblerror.Text = "rEGISTER ME";
    }
    protected void txtemail_TextChanged1(object sender, EventArgs e)
    {
        //lblerror.Visible = true;
        //lblerror.Text = "EMAIL CLICK EVENT";
    }
}