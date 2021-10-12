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

public partial class forgotpassword : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    string  regid;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btngetpassord_Click(object sender, EventArgs e)
    {
        try
        {
            ds = Registrationobj.getregistrationdetailbyemail(txtemail.Text);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                regid = ds.Tables[0].Rows[i]["id"].ToString();
            }

            string body = this.PopulateBody(txtemail.Text, regid);

            SendEmail(txtemail.Text, body);
            lblmsg.CssClass = "alert alert-success";
            lblmsg.Visible = true;
            lblmsg.Text = "Sent Email To Your Email ID.Please Reset Your Password";
        }
        catch(Exception ex)
        {
            Response.Redirect("login.aspx");
        }
    }

    private void SendEmail(string email, string body)
    {

        using (MailMessage mm = new MailMessage("no-reply@rana-samaj.com", email))
        {

            mm.Subject = "Reset Password";
            //string body = "Hello " + Comment + ",";
            //body += "<br /><br />Email From: " + frommail ;

            //body += "<br /><br /><b>Thanks</b>";
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