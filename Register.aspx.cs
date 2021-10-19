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

public partial class Register : System.Web.UI.Page
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
    protected void Page_Load(object sender, EventArgs e)
    {
        image.HttpEquiv = "image";
        image.Name = "image";
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {


            //lbluname.Text = "ttkhj";
        }
        else if (Session["UserID"] != null)
        {

        }
        else
        {

        }
       
    }
    protected void lnkregisterme_Click(object sender, EventArgs e)
    {
        int Userid = 0;
        string activationCode = GenerateNewRandom().ToString();

        try
        {
            //HttpCookie cactivationcode = new HttpCookie("activationcode");
            //cactivationcode.Value = activationCode;
            //Response.Cookies.Add(cactivationcode);
            //DateTime dtExpiry = DateTime.Now.AddDays(365 * 60); //you can add years and months too here
            //Response.Cookies["cactivationcode"].Expires = dtExpiry;

            //HttpCookie cfname = new HttpCookie("fname");
            //cfname.Value = txtfname.Text;
            //Response.Cookies.Add(cfname);
            //Response.Cookies["cfname"].Expires = dtExpiry;

            //HttpCookie clname = new HttpCookie("lname");
            //clname.Value = txtlname.Text;
            //Response.Cookies.Add(clname);
            //Response.Cookies["clname"].Expires = dtExpiry;

            //HttpCookie cemail = new HttpCookie("email");
            //cemail.Value = txtuserid.Text;
            //Response.Cookies.Add(cemail);
            //Response.Cookies["cemail"].Expires = dtExpiry;

            //HttpCookie cpassword = new HttpCookie("password");
            //cpassword.Value = txtpwd.Text;
            //Response.Cookies.Add(cpassword);
            //Response.Cookies["cpassword"].Expires = dtExpiry;
            if (ValidatePage())
            {

                Session["activationcode"] = activationCode;
                Session["fname"] = txtname.Text;

                // Session["phoneno"] = txtphoneno.Text;
                Session["email"] = txtemail.Text;
                Session["password"] = txtpwd.Text;
                Registrationobj.Register_Data(txtname.Text, "", txtemail.Text, "", txtpwd.Text, "", activationCode, "true", ddlprofilefor.SelectedValue.ToString(), DateTime.Now, DateTime.Now);
                string body = this.PopulateBody(txtname.Text, "", activationCode);

                //SendActivationEmail(txtuserid.Text, body);

                SendActivationEmail(txtemail.Text, body);
                string message = string.Empty;

                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
                //txtfname.Text = "";
                //txtlname.Text = "";
                //txtuserid.Text = "";
                //txtpwd.Text = "";
                //txtcpwd.Text = "";
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + ex.ToString() + "');", true);
        }
    }

    #region Validation Function
    protected bool ValidatePage()
    {
        flag = true;
        flaguserexist = Registrationobj.Userexistornot(txtemail.Text);
        if (flaguserexist == "true")
        {
            lblerror.Visible = true;
            lblerror.Text = " Email ID already exist. Please Register With Another Email ID";

            lnkregisterme.Enabled = false;
            flag = false;
        }
        else
        {
            lblerror.Visible = false;
            lnkregisterme.Enabled = true;
        }

        //if ((txtemail.Text == ""))
        //{
        //    lblemail.Visible = true;
        //    lblemail.Text = "Please Enter Email ID";
        //    txtemail.Focus();
        //    flag = false;
        //}
        //else
        //{
        //    lblemail.Visible = false;
        //}



        if ((flag == false))
        {
            return false;
        }

        return true;
    }

    #endregion

    private static string GenerateNewRandom()
    {
        Random generator = new Random();
        String r = generator.Next(0, 1000000).ToString("D6");
        if (r.Distinct().Count() == 1)
        {
            r = GenerateNewRandom();
        }
        return r;
    }

    private void SendActivationEmail(string email, string body)
    {

        using (MailMessage mm = new MailMessage("support@matrimonyforgujarati.com", email))
        {
            try
            {
                int i;

                // string theVerificationCode = Registrationobj.GetVerificationCodeFromDatabase(Userid.ToString());
                mm.Subject = "Account Activation";
              
                mm.Body = body;

                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("matrimonyforgujarati@gmail.com", "oHm@1110");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 625;
                smtp.Send(mm);
                //Console.WriteLine(i);

                // Response.Redirect("accountactivation.aspx");
                lblmsg.BackColor = System.Drawing.Color.Green;
                lblmsg.Visible = true;
                lblmsg.Text = "E-mail Successfully Sent";
            }
            catch (Exception ex)
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Invalid E-mail";
            }
        }
    }

    public string PopulateBody(string fname, string lname, string otp)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/Html/EmailVerification2.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{otp}", otp);
        body = body.Replace("{fname}", fname);
        body = body.Replace("{lname}", lname);

        return body;
    }

    protected void lnkexpressintrest_Click(object sender, EventArgs e)
    {
        //LinkButton btn = (LinkButton)(sender);
        //string[] commandArguments = btn.CommandArgument.Split(',');
        //string Biodata_id = commandArguments[0];

        //DataSet dsname = Registrationobj.getbiodatabyregid(regid);

        //if (dsname.Tables[0].Rows.Count == 0)
        //{
        //    Registrationobj.ADD_INBOX(Convert.ToInt32(Biodata_id), regid, "", regid.ToString(), regid.ToString(), DateTime.Now, DateTime.Now);
        //    btn.Text = "Intrested";
        //    btn.BackColor = Color.Green;
        //}
        //else
        //{
        //    string name = dsname.Tables[0].Rows[0]["name"].ToString();
        //    Registrationobj.ADD_INBOX(Convert.ToInt32(Biodata_id), regid, name, regid.ToString(), regid.ToString(), DateTime.Now, DateTime.Now);
        //    btn.Text = "Intrested";
        //    btn.BackColor = Color.Green;
        //}
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string Search_ID = btn.CommandArgument;
        Response.Redirect("Profile1.aspx?Search_ID=" + Search_ID);
    }
    protected void lnklogin_Click(object sender, EventArgs e)
    {

    }
}