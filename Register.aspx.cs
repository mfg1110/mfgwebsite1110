using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
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
    string activationCode;

    public static String Email_Sucessfully_Sent = "E-mail Successfully Sent";

    public static String Invalid_email_Pwd = "Invalid Email or Password";
    public static String Serer_Not_Connect = "Server Not Connected";
    protected void Page_Load(object sender, EventArgs e)
    {
       // lnkregisterme.Enabled = false;
        ddlprofilefor.Focus();
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
        if (Session["Email"] != null)
        {
            txtemail.Text = Session["Email"].ToString();
        }
       
    }
    protected void lnkregisterme_Click(object sender, EventArgs e)
    {
        int Userid = 0;
         activationCode = GenerateNewRandom().ToString();
         //if (chktermandcondition.Checked == true)
         //{
             
             //try
             //{
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
             //if (ValidatePage())
             //{

             Session["activationcode"] = activationCode;
             Session["fname"] = txtname.Text;

            
             Session["email"] = txtemail.Text;
             Session["password"] = txtpwd.Text;

             string body = this.PopulateBody(txtname.Text, "", activationCode);

           
             if (txtemail.Text != "")
             {

                 SendActivationEmail(txtemail.Text, body);
                 string message = string.Empty;

                 //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
             }
             txtname.Text = "";
             txtlname.Text = "";
             txtmobileno.Text = "";
             txtpwd.Text = "";
             txtcpwd.Text = "";
             //}
             //}
             //    catch (Exception ex)
             //{
             //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + ex.ToString() + "');", true);
             //}
             

             lbltermcondition.Visible = false;
        // }
        //else
        // {
            
        //     lbltermcondition.Visible = true;
        //     lbltermcondition.Text = "Please Read Terms and Condition And Checked Term and Condition";
        // }
    }

    #region Validation Function
    protected bool ValidatePage()
    {


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

        flag = true;
        flaguserexist = Registrationobj.Userexistornot(txtemail.Text);
        if (flaguserexist == "true")
        {
            lblerror.Visible = true;
            lblerror.Text =Globalvariable.Email_Exist;
          
            lnkregisterme.Enabled = false;
            flag = false;
        }
        else
        {
            lblerror.Visible = false;
            lnkregisterme.Enabled = true;
        }


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

        using (MailMessage mm = new MailMessage("mail@matrimonyforgujarati.com", email))
        {
            try
            {
                int i;

                // string theVerificationCode = Registrationobj.GetVerificationCodeFromDatabase(Userid.ToString());
                mm.Subject = "Account Activation";
              
                mm.Body = body;

                mm.IsBodyHtml = true;
                //SmtpClient smtp = new SmtpClient();
                //smtp.Host = "mail.matrimonyforgujarati.com";

                SmtpClient smtp = new SmtpClient("mail.matrimonyforgujarati.com");

                NetworkCredential Credentials = new NetworkCredential("mail@matrimonyforgujarati.com", "oHm@1110");
                smtp.Credentials = Credentials;
                smtp.Send(mm);
              
                //smtp.EnableSsl = true;
                //NetworkCredential NetworkCred = new NetworkCredential("mail@matrimonyforgujarati.com", "oHm@1110");
                //smtp.UseDefaultCredentials = false;
                //smtp.Credentials = NetworkCred;
                ////smtp.Port = 587;
                //smtp.Port = 25;
                //smtp.Send(mm);

                //smtp.Port = 587;
                //smtp.Host = "smtp.gmail.com"; //for gmail host  
                //smtp.EnableSsl = true;
                //smtp.UseDefaultCredentials = false;
                //smtp.Credentials = new NetworkCredential("matrimonyforgujarati@gmail.com", "oHm@1110");
                //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                //smtp.Send(mm);
                //Console.WriteLine(i);
                Registrationobj.Register_Data(txtname.Text, txtlname.Text, txtemail.Text,txtmobileno.Text, Encrypt(txtpwd.Text.Trim()), "", activationCode, "true", ddlprofilefor.SelectedValue.ToString(), DateTime.Now, DateTime.Now);
                // Response.Redirect("accountactivation.aspx");
                lblmsg.BackColor = System.Drawing.Color.Green;
                lblmsg.Visible = true;
                lblmsg.Text = Email_Sucessfully_Sent;
            }
            catch (Exception ex)
            {
                lblmsg.Visible = true;
                //lblmsg.Text = "Server not Connected";
                lblmsg.BackColor = System.Drawing.Color.Red;
                lblmsg.Text = "Failure sending mail";
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

    #region Validation Function
    //protected bool ValidatePage()
    //{
    //    bool flag = true;
    //    if ((txtname.Text == ""))
    //    {
    //        lblfname.Visible = true;
    //        lblfname.Text = "Please Enter First Name";
    //        txtname.Focus();
    //        flag = false;
    //    }
    //    else
    //    {
    //        lblfname.Visible = false;
    //    }

    //    if ((txtlname.Text == ""))
    //    {
    //        lbllname.Visible = true;
    //        lbllname.Text = "Please Enter Last Name";
    //        txtlname.Focus();
    //        flag = false;
    //    }
    //    else
    //    {
    //        lbllname.Visible = false;
    //    }

    //    if ((txtemail.Text == ""))
    //    {
    //        lblEmailIdErr.Visible = true;
    //        lblEmailIdErr.Text = "Please Enter Email ID";
    //        txtemail.Focus();
    //        flag = false;
    //    }
    //    else
    //    {
    //        lblEmailIdErr.Visible = false;
    //    }


    //    if ((txtmobileno.Text == ""))
    //    {
    //        lblmobilenoErr.Visible = true;
    //        lblmobilenoErr.Text = "Please Enter Mobile No";
    //        txtmobileno.Focus();
    //        flag = false;
    //    }
    //    else
    //    {
    //        lblmobilenoErr.Visible = false;
    //    }


    //    if ((txtpwd.Text == ""))
    //    {
    //        lblErrPwd.Visible = true;
    //        lblErrPwd.Text = "Please Enter Password";
    //        txtpwd.Focus();
    //        flag = false;
    //    }
    //    else
    //    {
    //        lblErrPwd.Visible = false;
    //    }

    //    if ((txtcpwd.Text == ""))
    //    {
    //        lblErrPWdConfirm.Visible = true;
    //        lblErrPWdConfirm.Text = "Please Enter Confirm Password";
    //        txtcpwd.Focus();
    //        flag = false;
    //    }
    //    else
    //    {
    //        if (txtpwd.Text != txtcpwd.Text)
    //        {
    //            lblErrPWdConfirm.Visible = true;
    //            lblErrPWdConfirm.Text = "Confirm Password Not Match With Password";
    //            txtcpwd.Text = "";
    //            txtcpwd.Focus();
    //            flag = false;
    //        }
    //        else
    //        {
    //            lblErrPWdConfirm.Visible = false;
    //        }
    //    }

    //    flag = true;
    //    flaguserexist = Registrationobj.Userexistornot(txtemail.Text);
    //    if (flaguserexist == "true")
    //    {
    //        lblerror.Visible = true;
    //        lblerror.Text = "Email ID already exist. Please Register With Another Email ID";

    //        lnkregisterme.Enabled = false;
    //        flag = false;
    //    }
    //    else
    //    {
    //        lblerror.Visible = false;
    //        lnkregisterme.Enabled = true;
    //    }


    //    if ((flag == false))
    //    {
    //        return false;
    //    }

    //    return true;
    //}
    #endregion

    protected void mySub(object sender, EventArgs e)
    {
        lnkregisterme.Enabled = true;
    }
    protected void chktermandcondition_CheckedChanged(object sender, EventArgs e)
    {
       // lnkregisterme.Enabled = chktermandcondition.Checked;
    }
    protected void chktermandcondition_CheckedChanged1(object sender, EventArgs e)
    {
         CheckBox linkedItem = sender as CheckBox;
    }
    protected void txtmobileno_TextChanged(object sender, EventArgs e)
    {
        string otp = Generate_otp();
        string mobileNo = txtmobileno.Text.Trim();
        string SMSContents = "", smsResult = "";
        SMSContents = otp + " is your One-Time Password, valid for 10 minutes only, Please do not share your OTP with anyone.";
        try
        {
            smsResult = SendSMS(otp, txtmobileno.Text);
            Session["OTP"] = otp;
            txtmobileno.Focus();
            lblmobilenoErr.Visible = true;
            lblmobilenoErr.Text = " OTP is sent to your registered mobile no.";
            lblmobilenoErr.CssClass = "green";
            mobileNo = string.Empty;
            txtmobileno.Focus();
            txtotp.Visible = true;

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "countdown()", true);
        }
        catch (Exception ex)
        {
            lblmobilenoErr.Text = " fail";
            lblmobilenoErr.CssClass = "red";
        }
    }

    protected string Generate_otp()
    {
        char[] charArr = "0123456789".ToCharArray();
        string strrandom = string.Empty;
        Random objran = new Random();
        for (int i = 0; i < 4; i++)
        {
            //It will not allow Repetation of Characters
            int pos = objran.Next(1, charArr.Length);
            if (!strrandom.Contains(charArr.GetValue(pos).ToString())) strrandom += charArr.GetValue(pos);
            else i--;
        }
        return strrandom;
    }

    public static string SendSMS(string otp, string mobileno)
    {
        string Username = "OHMSOL";
        string password = "OHMSOL";//This may vary api to api. like ite may be password, secrate key, hash etc
        string senderid = "MOTPMG";
        string Number = mobileno;
        string Message = "Dear User, Your OTP for Mobile Verification is " + otp + ".Please Use the Same to Verify Your Mobile number. Regards, Matrimony For Gujarati";
        string URL = "http://msg.balajitech.co.in/api/mt/SendSMS?user=" + Username + "&password=" + password + "&senderid=" + senderid + "&channel=Trans&DCS=0&flashsms=0&number=" + Number + "&text=" + HttpUtility.UrlEncode(Message).Trim();

        string strResponce = GetResponse(URL);
        string msg = "";
        if (strResponce.Equals("Fail"))
        {
            msg = "Fail";
        }
        else
        {
            msg = strResponce;
        }
        return msg;
    }
    // End SMS Sending function
    // Get Response function
    public static string GetResponse(string smsURL)
    {
        try
        {
            WebClient objWebClient = new WebClient();
            System.IO.StreamReader reader = new System.IO.StreamReader(objWebClient.OpenRead(smsURL));
            string ResultHTML = reader.ReadToEnd();
            return ResultHTML;
        }
        catch (Exception)
        {
            return "Fail";
        }
    }
    protected void txtotp_TextChanged(object sender, EventArgs e)
    {
        if(txtotp.Text==Session["OTP"].ToString())
        {

        }
        else
        {
            lblotp.Visible = true;
            lblotp.Text = " OTP Not match ";
            lblotp.CssClass = "badge badge-danger";
        }
    }


    private string Encrypt(string clearText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }

   
}