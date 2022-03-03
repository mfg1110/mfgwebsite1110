using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserDashboard_Changepassword : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    int regid;
    public static String Pwd_Changed = "Password Changed Successfully";
    protected void Page_Load(object sender, EventArgs e)
    {
        txtemail.Focus();
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {
            if (Request.QueryString["regid"] != null)
            {

                string regid = Request.QueryString["regid"].ToString();
                txtoldpwd.Visible = true;
                txtemail.Visible = false;
                email.Visible = false;
                oldpwd.Visible = true;
            }
        }
        else if (Session["id"] != null)
        {
            if (Request.QueryString["regid"] != null)
            {

                regid = Convert.ToInt32(Request.QueryString["regid"].ToString());
                txtoldpwd.Visible = true;
                txtemail.Visible = false;
                email.Visible = false;
                oldpwd.Visible = true;
            }


        }
        else if (Request.QueryString["regidreset"] != null)
        {
            regid = Convert.ToInt32(Request.QueryString["regidreset"].ToString());
            DataSet dsemail = Registrationobj.getregistration(regid);
            txtemail.Text = dsemail.Tables[0].Rows[0]["UserID"].ToString();
            email.Visible = true;
            oldpwd.Visible = false;
            txtemail.Visible = true;
            txtoldpwd.Visible = false;
        }
        else
        {
            Response.Redirect("../Login.aspx");
        }

    }

    protected void btnchangepwd_Click(object sender, EventArgs e)
    {
        try
        {
            Registrationobj.Changepassword(regid,
                                            Encrypt(txtnewpwd.Text),
                                            DateTime.Now
                                            );

            lblmsg1.Text = Pwd_Changed;
            lblmsg1.Visible = false;

            Registrationobj.ADD_Log(regid.ToString(), "Change Password", "Password Changed Successfully", regid.ToString(), regid.ToString(), DateTime.Now, DateTime.Now);
            Response.Redirect("../Logout.aspx");
        }
        catch (Exception ex)
        {
            Response.Redirect("../login.aspx");
        }
    }

    private string Decrypt(string cipherText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
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
    protected void txtoldpwd_TextChanged(object sender, EventArgs e)
    {
        DataSet ds = Registrationobj.Getpasswordbyid(regid);
        string password = ds.Tables[0].Rows[0]["password"].ToString();
        if (txtoldpwd.Text == Decrypt(password))
        {
            lbloldpwd.Visible = false;
        }
        else
        {
            lbloldpwd.Visible = true;
            lbloldpwd.Text = "Invalid Password";
        }
    }
}