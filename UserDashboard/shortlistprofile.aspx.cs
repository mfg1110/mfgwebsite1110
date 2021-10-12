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
    public static int Biodata_id, regid, stepid, step, indexid;
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

            regid = Convert.ToInt32(idCookie.Value);

            if (!IsPostBack)
            {
                loaddata();

            }
        }
        else if (Session["id"] != null)
        {
            regid = Convert.ToInt32(Session["id"].ToString());
            if (!IsPostBack)
            {
                loaddata();

            }

        }
        else
        {

            Response.Redirect("../Login.aspx");
        }
    }
    public void loaddata()
    {
        ds = Registrationobj.Getshortlistbyregid(Convert.ToInt32(regid));
        //rptdata.DataSource = ds;
        //rptdata.DataBind();


        rptourdata.DataSource = ds;
        rptourdata.DataBind();
        //if (ds.Tables[0].Rows.Count == 0)
        //{
        //    Control FooterTemplate = rptourdata.Controls[rptourdata.Controls.Count - 1].Controls[0];
        //    FooterTemplate.FindControl("trEmpty").Visible = true;
        //}
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