using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_RegistereduserList : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath;
    DataSet ds;
    string flaguserexist = "";
    public string theVerificationCode;
    Boolean flag;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["gender"] != null)
        {
            if (!IsPostBack)
            {
                userlistgender(Request.QueryString["gender"].ToString());
            }

        }
        else
        {
            if (!IsPostBack)
            {
                userlist();
            }
        }
       
    }
    public void userlist()
    {
        ds = Registrationobj.getregistrationdetail();
        rptuserlist.DataSource = ds;
        rptuserlist.DataBind();
    }

    public void userlistgender(string Gender)
    {
        ds = Registrationobj.getregistrationdetailbygender(Gender);
        rptuserlist.DataSource = ds;
        rptuserlist.DataBind();
    }
}