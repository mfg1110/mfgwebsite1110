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

public partial class _Default : System.Web.UI.Page
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
        Response.Redirect("main.aspx");
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
        if (!IsPostBack)
        {
            //try
            //{
            loaddata();
            //}
            //catch(Exception ex)
            //{
            //    Response.Redirect("login.aspx");
            //}
        }
    }
    public string ProcessDataItem(object myDataItemValue)
    {

        if (myDataItemValue == "")
        {

            return "image_not_found.png";
        }


        return myDataItemValue.ToString();

    }

    public void loaddata()
    {
        ds = Registrationobj.getbiodatadetail();
        //rptdata.DataSource = ds;
        //rptdata.DataBind();


        rptlatestprofile.DataSource = ds;
        rptlatestprofile.DataBind();
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
              Registrationobj.Register_Data(txtname.Text,"", txtemail.Text, "", txtpwd.Text,"",activationCode, "true",ddlprofilefor.SelectedValue.ToString(), DateTime.Now, DateTime.Now);
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

        using (MailMessage mm = new MailMessage("no-reply@rana-samaj.com", email))
        {
            try
            {
                int i;

                // string theVerificationCode = Registrationobj.GetVerificationCodeFromDatabase(Userid.ToString());
                mm.Subject = "Account Activation";
                //string body = "Hello " + txtfname.Text.Trim() +" "+ txtlname.Text.Trim() + ",";
                //body += "<br /><br />Please click the following link to activate your account";
                //body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("Login.aspx", "Activation.aspx?ActivationCode=" + theVerificationCode) + "'>Click here to activate your account.</a>";
                //body += "<br /><br />Thanks";
                mm.Body = body;

                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.ionos.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("no-reply@rana-samaj.com", "oHm@1110");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
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
    protected void lnklogin_Click(object sender, EventArgs e)
    {
       
    }
}