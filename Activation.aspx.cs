using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Activation : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath;
    DataSet ds;
    int Userid;
    HttpCookie cfname;
    HttpCookie clname;
    HttpCookie cemail;
    HttpCookie cpassword;
    HttpCookie cactivationcode;
    protected void Page_Load(object sender, EventArgs e)
    {
        cfname = Request.Cookies["fname"];
         clname = Request.Cookies["lname"];
         cemail = Request.Cookies["email"];
         cpassword = Request.Cookies["password"];
         cactivationcode = Request.Cookies["activationcode"];

         txtotp.Focus();
        if (!this.IsPostBack)
        {
            lblmsg.Text = "Check Your Email Address. OTP Sent to Your Email Address.";
        }
        //if (!Page.IsPostBack || Session["end_t"] == null)
        //{
        //    DateTime start_time = DateTime.Now;
        //    DateTime end_time = start_time.AddMinutes(3);
        //    Session["end_t"] = end_time;
        //}
        //lblTimer.Text = DateTime.Now.ToLongTimeString();

        if (Session["CountdownTimer"] == null)
        {
            Session["CountdownTimer"] = new CountDownTimer(TimeSpan.Parse("00:09"));
            (Session["CountdownTimer"] as CountDownTimer).Start();
           // Label1.Text = (Session["CountdownTimer"] as CountDownTimer).TimeLeft.ToString();
        }
        //DataTable dt = new DataTable();
        //dt.Columns.Add("EndDate", typeof(DateTime));
        //dt.Rows.Add("2017-03-08 17:00:34.943");
        //DateTime startDate = DateTime.Now;
        //DateTime endDate = Convert.ToDateTime(dt.Rows[0]["EndDate"].ToString());
        //lblTime.Text = CalculateTimeDifference(startDate, endDate);
    }
    protected void btnerify_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["activationcode"] != null)
            {

                if (txtotp.Text == Session["activationcode"].ToString())
                {
                    //cactivationcode.Value
                    //Random RNG = new Random();
                    //int length = 16;
                    //var rString = "";
                    //for (var i = 0; i < length; i++)
                    //{
                    //    rString += ((char)(RNG.Next(1, 26) + 64)).ToString().ToLower();
                    //}
                    string message = string.Empty;

                    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                    var stringChars = new char[16];
                    var random = new Random();

                    for (int i = 0; i < stringChars.Length; i++)
                    {
                        stringChars[i] = chars[random.Next(chars.Length)];
                    }

                    var finalString = new String(stringChars);

                    Userid = Registrationobj.Register_Data(Session["fname"].ToString(),
                                                     Session["lname"].ToString(),
                                                     Session["email"].ToString(),
                                                     "",
                                                     Session["password"].ToString(),
                                                     finalString,
                                                     DateTime.Now,
                                                     DateTime.Now
                                                      );

                    //Userid = Registrationobj.Register_Data(cfname.Value,
                    //                                clname.Value,
                    //                                cemail.Value,
                    //                                "",
                    //                                cpassword.Value,
                    //                                finalString,
                    //                                DateTime.Now,
                    //                                DateTime.Now
                    //                                 );

                    switch (Userid)
                    {
                        case -1:
                            ltMessage.Text = "Invalid Activation code.";
                            break;
                        case -2:
                            message = "Supplied email address has already been used.";
                            break;
                        default:
                            Session.Clear();
                            txtotp.Text = "";
                            ltMessage.Text = "Activation successful.";
                            Session["CountdownTimer"] = null;
                            Response.Redirect("~/Login.aspx");
                            break;
                    }

                }
                else
                {
                    ltMessage.Text = "Invalid Activation code.";
                }
            }
        }
        catch (Exception ex)
        {
            txtotp.Enabled = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Server Error : Connection Timeout.Please Register Again');", true);
            ltMessage.Text = "404 Error";
        }
        
    }

    public string CalculateTimeDifference(DateTime startDate, DateTime endDate)
    {
        int days = 0; int hours = 0; int mins = 0; int secs = 0;
        string final = string.Empty;
        if (endDate > startDate)
        {
            days = (endDate - startDate).Days;
            hours = (endDate - startDate).Hours;
            mins = (endDate - startDate).Minutes;
            secs = (endDate - startDate).Seconds;
            final = string.Format("{0} days {1} hours {2} mins {3} secs", days, hours, mins, secs);
        }
        return final;
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        //if (Session["activationcode"] != null)
        //{
        //    DateTime dt = (DateTime)Session["end_t"];
        //    DateTime dt_curr = DateTime.Now;
        //    TimeSpan ts = dt - dt_curr;

        //    //Label1.Text = DateTime.Now.Minute.ToString() + ":" + DateTime.Now.Second.ToString();
        //    lblTimer.Text = DateTime.Now.ToLongTimeString();
        //    if (ts.Minutes == 0)
        //    {
        //        lblTimer.Enabled = false;
        //        Response.Redirect("Login.aspx");
        //    }
        //}
        if (Session["activationcode"] != null)
        {
            if (Session["CountdownTimer"] != null)
            {
                try
                {

                    Label1.Text = (Session["CountdownTimer"] as CountDownTimer).TimeLeft.ToString();
                    if ((Session["CountdownTimer"] as CountDownTimer).TimeLeft.ToString() == "-00:00:00" || (Session["CountdownTimer"] as CountDownTimer).TimeLeft.ToString() == "-00:00:01" || (Session["CountdownTimer"] as CountDownTimer).TimeLeft.ToString() == "-00:00:02")
                    {
                        Timer1.Enabled = false;
                       Label1.Visible = false;
                        
                         Session["CountdownTimer"] = null;
                         Response.Redirect("Login.aspx");
                    }

                }
                catch(Exception ex)
                {
                    Session["CountdownTimer"] = null;
                    // Timer1.Enabled = false;
                    txtotp.Enabled = false;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Server Error : Connection Timeout.Please Register Again');", true);
                   
                }
               
            }
            else if (Session["CountdownTimer"] == null)
            {
                Timer1.Enabled = false;
                Session["CountdownTimer"] = null;
                  Response.Redirect("Login.aspx");
            }
        }
    }
    protected void lnkresend_Click(object sender, EventArgs e)
    {
        try
        {
            string body = this.PopulateBody(Session["fname"].ToString(), Session["lname"].ToString(), Session["activationcode"].ToString());
            SendActivationEmail(Session["email"].ToString(), body);
            string message = string.Empty;

          
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
        }  
        catch (Exception ex)
        {

            ltMessage.Text = "404 Error";
        }
    }

    private void SendActivationEmail(string email, string body)
    {

        using (MailMessage mm = new MailMessage("no-reply@rana-samaj.com", email))
        {
            try
            {
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
                smtp.Port = 25;
                smtp.Send(mm);

                Response.Redirect("Activation.aspx");
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
        using (StreamReader reader = new StreamReader(Server.MapPath("~/Html/EmailVerification.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{otp}", otp);
        body = body.Replace("{fname}", fname);
        body = body.Replace("{lname}", lname);

        return body;
    }

    public class CountDownTimer
    {
        public TimeSpan TimeLeft;
        System.Threading.Thread thread;
        public CountDownTimer(TimeSpan original)
        {
            this.TimeLeft = original;
        }
        public void Start()
        {
            // Start a background thread to count down time
            thread = new System.Threading.Thread(() =>
            {
                while (true)
                {
                    System.Threading.Thread.Sleep(1000);
                    TimeLeft = TimeLeft.Subtract(TimeSpan.Parse("00:00:01"));
                }
            });
            thread.Start();
        }
    }
}