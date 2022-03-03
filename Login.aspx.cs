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

public partial class Login : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath;
    DataSet ds, dsuseractivation;
    string flaguserexist = "", status;
    public string theVerificationCode;
    Boolean flag = false, flagdelete = false;
    public static String Invalid_email_Pwd = "Invalid Email or Password";

    public static String Account_Deleted = "Your Account Deleted";
    protected void Page_Load(object sender, EventArgs e)
    {
        txtuname.Focus();
    }
    protected void lnklogin_Click(object sender, EventArgs e)
    {
        try
        {
            ds = Registrationobj.getregistrationdetail();
            if (ds != null)
            {
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    string email = ds.Tables[0].Rows[i]["UserID"].ToString();
                    string passwordvar = ds.Tables[0].Rows[i]["password"].ToString();
                    status = ds.Tables[0].Rows[i]["status"].ToString();
                    string namevar = ds.Tables[0].Rows[i]["Fname"].ToString();
                    string User_ID = ds.Tables[0].Rows[i]["id"].ToString();
                    //string Token = ds.Tables[0].Rows[i]["Token"].ToString();


                    if (txtuname.Text == email && txtpassword.Text == Decrypt(passwordvar))
                    {
                        dsuseractivation = Registrationobj.Getuserverifyornot(User_ID);
                        if (dsuseractivation.Tables[0].Rows.Count > 0)
                        {
                            flag = true;
                        }

                        if (status == "delete")
                        {
                            flagdelete = true;

                        }
                        else if (status == "Active")
                        {
                            if (chkRememberMe.Checked)
                            {
                                //Response.Cookies["myCookie"].Value = Token.ToString();
                                HttpCookie cName = new HttpCookie("Name");
                                cName.Value = namevar;

                                HttpCookie cid = new HttpCookie("id");
                                cid.Value = User_ID;
                                //Response.Cookies["Token"].Expires = DateTime.Now.AddYears(365);
                                HttpCookie myCookie = new HttpCookie("myCookie");
                                Response.Cookies.Remove("myCookie");
                                Response.Cookies.Add(myCookie);
                                //myCookie.Values.Add("Token", Token);
                                DateTime dtExpiry = DateTime.Now.AddDays(365 * 60); //you can add years and months too here
                                Response.Cookies["myCookie"].Expires = dtExpiry;

                                Response.Cookies["Name"].Expires = dtExpiry;
                                Response.Cookies["id"].Expires = dtExpiry;
                                HttpContext.Current.Response.SetCookie(myCookie);
                                HttpContext.Current.Response.SetCookie(cName);
                                HttpContext.Current.Response.SetCookie(cid);
                                Response.Cookies.Add(cName);
                                Response.Cookies.Add(cid);
                            }
                            else
                            {
                                //Response.Cookies["Token"].Expires = DateTime.Now.AddDays(-1);
                                HttpCookie myCookie = new HttpCookie("myCookie");
                                Response.Cookies.Remove("myCookie");
                                Response.Cookies.Add(myCookie);
                                //myCookie.Values.Add("Token", Token);
                                DateTime dtExpiry = DateTime.Now.AddDays(-1); //you can add years and months too here
                                Response.Cookies["myCookie"].Expires = dtExpiry;

                                Response.Cookies["Name"].Expires = dtExpiry;
                                Response.Cookies["id"].Expires = dtExpiry;
                                HttpContext.Current.Response.SetCookie(myCookie);

                                Session.Clear();
                                Session["UserID"] = txtuname.Text;
                                Session["Fname"] = namevar;
                                Session["id"] = User_ID;
                                Session.Timeout = 525600;
                            }
                            Response.Redirect("UserDashboard/Dashboard.aspx", true);
                        }
                        //else
                        //{

                        //    lblmsg.Visible = true;
                        //    lblmsg.Text = "Invalid Email or Password";
                        //}
                        //HttpCookie ExampleCookie = Request.Cookies["ExampleCookie"];
                        //ExampleCookie["Name"] = namevar;
                        //ExampleCookie["id"] = User_ID;
                        //Response.Cookies.Add(ExampleCookie);
                        if (flag == true)
                        {

                            lblmsg.Visible = true;
                            lblmsg.Text = "Please, Check Your Email Acoount And Active Your Account.";
                        }

                    }
                    else if (txtuname.Text == "Admin" && txtpassword.Text == "oHm@1110")
                    {
                        if (chkRememberMe.Checked)
                        {
                            //Response.Cookies["myCookie"].Value = Token.ToString();
                            HttpCookie cName = new HttpCookie("Name");
                            cName.Value = namevar;

                            HttpCookie cid = new HttpCookie("id");
                            cid.Value = User_ID;
                            //Response.Cookies["Token"].Expires = DateTime.Now.AddYears(365);
                            HttpCookie myCookie = new HttpCookie("myCookie");
                            Response.Cookies.Remove("myCookie");
                            Response.Cookies.Add(myCookie);
                            //myCookie.Values.Add("Token", Token);
                            DateTime dtExpiry = DateTime.Now.AddDays(365 * 60); //you can add years and months too here
                            Response.Cookies["myCookie"].Expires = dtExpiry;

                            Response.Cookies["Name"].Expires = dtExpiry;
                            Response.Cookies["id"].Expires = dtExpiry;
                            HttpContext.Current.Response.SetCookie(myCookie);
                            HttpContext.Current.Response.SetCookie(cName);
                            HttpContext.Current.Response.SetCookie(cid);
                            Response.Cookies.Add(cName);
                            Response.Cookies.Add(cid);
                        }
                        else
                        {
                            //Response.Cookies["Token"].Expires = DateTime.Now.AddDays(-1);
                            HttpCookie myCookie = new HttpCookie("myCookie");
                            Response.Cookies.Remove("myCookie");
                            Response.Cookies.Add(myCookie);
                            //myCookie.Values.Add("Token", Token);
                            DateTime dtExpiry = DateTime.Now.AddDays(-1); //you can add years and months too here
                            Response.Cookies["myCookie"].Expires = dtExpiry;

                            Response.Cookies["Name"].Expires = dtExpiry;
                            Response.Cookies["id"].Expires = dtExpiry;
                            HttpContext.Current.Response.SetCookie(myCookie);

                            Session.Clear();
                            Session["UserID"] = txtuname.Text;
                            Session["Fname"] = namevar;
                            Session["id"] = User_ID;
                            Session.Timeout = 525600;
                        }

                        Response.Redirect("Dashboard/Default.aspx", true);
                    }
                    else if (txtuname.Text != email && txtpassword.Text != passwordvar && txtuname.Text != "" && txtpassword.Text != "")
                    {

                        lblmsg.Visible = true;
                        lblmsg.Text = Invalid_email_Pwd;
                    }
                }
                if (flagdelete == true)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = Account_Deleted;
                }


            }


        }
        catch (Exception ex)
        {

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Server Error : Connection Timeout.');", true);
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
}
