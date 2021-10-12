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

public partial class login : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath;
    DataSet ds;
    string flaguserexist = "";
    public string theVerificationCode;
    Boolean flag;
    protected void Page_Load(object sender, EventArgs e)
    {

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
                string namevar = ds.Tables[0].Rows[i]["Fname"].ToString();
                string User_ID = ds.Tables[0].Rows[i]["id"].ToString();
                //string Token = ds.Tables[0].Rows[i]["Token"].ToString();
                if (txtuname.Text == email && txtpassword.Text == passwordvar)
                {

                    //DataSet dsdata = Registrationobj.Getuserverifyornot(Session["id"].ToString());
                    //if (dsdata.Tables[0].Rows.Count <= 0)
                    //{

                    //    }
                    //     else
                    //     {
                    //lblmsg.Visible = true;
                    //lblmsg.Text = "You Are Not Valid User";

                    //    }




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




                    //HttpCookie ExampleCookie = Request.Cookies["ExampleCookie"];
                    //ExampleCookie["Name"] = namevar;
                    //ExampleCookie["id"] = User_ID;
                    //Response.Cookies.Add(ExampleCookie);
                    Response.Redirect("UserDashboard/Dashboard.aspx", true);
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

                    Response.Redirect("Dashboard/CMS.aspx", true);
                }
                else
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Invalid E-mail Password";
                }


                //if (txtemail.Text == "Admin" && txtpassword.Text == "bmw88")
                //{
                //    Session["EmailID"] = "Admin";
                //    Session["Fname"] = "Admin";
                //    Session["User_ID"] = "1";
                //    Response.Redirect("~/AdminPanel/Default.aspx");
                //}
            }
        }

        }
        catch (Exception ex)
        {

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Server Error : Connection Timeout.');", true);
        }

    }
}