using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forgotpassword : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    string regid;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnksend_Click(object sender, EventArgs e)
    {
        try
        {
            ds = Registrationobj.getregistrationdetailbyemail(txtemailid.Text);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                regid = ds.Tables[0].Rows[i]["id"].ToString();
            }

            string body = this.PopulateBody(txtemailid.Text, regid);

            SendEmail(txtemailid.Text, body);

        }
        catch (Exception ex)
        {
            lblmsgsucess.Visible = false;
            lblmsg1.Visible = true;
            lblmsg.Text = "Server Not Connected";
        }
    }

    private void SendEmail(string email, string body)
    {

        using (MailMessage mm = new MailMessage("support@matrimonyforgujarati.com", email))
        {
            try
            {
                mm.Subject = "Reset Password";
                //string body = "Hello " + Comment + ",";
                //body += "<br /><br />Email From: " + frommail ;

                //body += "<br /><br /><b>Thanks</b>";
                mm.Body = body;

                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "mail.matrimonyforgujarati.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential("support@matrimonyforgujarati.com", "oHm@1110");
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                lblmsgsucess.Visible = true;
                lblmsgsuccessspan.Visible = true;
                lblmsg1.Visible = false;
                lblmsgsucess.Text = "Sent Email To Your Email ID.Please Reset Your Password";
                txtemailid.Text = "";
                Registrationobj.ADD_Log(regid.ToString(), "Forgot Password", "Email Sent.Please Reset Your Password", regid.ToString(), regid.ToString(), DateTime.Now, DateTime.Now);
                txtemailid.Text = "";
            }
            catch (Exception ex)
            {
                lblmsgsucess.Visible = false;
                lblmsg1.Visible = true;
                lblmsg.Text = "Server Not Connected";
                txtemailid.Text = "";
            }

        }
    }


    public string PopulateBody(string email, string regid)
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/Html/forgotpassword.html")))
        {
            body = reader.ReadToEnd();
        }
        body = body.Replace("{email}", email);

        body = body.Replace("{id}", regid);
        return body;
    }
}