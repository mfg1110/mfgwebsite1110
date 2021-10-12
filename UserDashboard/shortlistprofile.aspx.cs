using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class UserDashboard_shortlistprofile : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    HtmlMeta title = new HtmlMeta();
    HtmlMeta image = new HtmlMeta();
    HtmlMeta image1 = new HtmlMeta();
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
    public void loaddata()
    {
        ds = Registrationobj.getbiodatadetail();
        //rptdata.DataSource = ds;
        //rptdata.DataBind();


        rptourdata.DataSource = ds;
        rptourdata.DataBind();
    }

    public string ProcessDataItem(object myDataItemValue)
    {

        if (myDataItemValue == "")
        {

            return "image_not_found.png";
        }


        return myDataItemValue.ToString();

    }
    public bool ThumbnailCallback()
    {
        return false;
    }

    protected void rptourdata_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }
}