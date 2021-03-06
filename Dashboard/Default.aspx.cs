using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Dashboard_Default : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    public static int Biodata_id, regid, stepid, step, indexid;
    int profileid;
    HtmlMeta title = new HtmlMeta();
    HtmlMeta image = new HtmlMeta();
    HtmlMeta image1 = new HtmlMeta();
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {

            regid = Convert.ToInt32(idCookie.Value);

            if (!IsPostBack)
            {
                Bindtotalgenderview();
                Bindtotalsubcategoryview();
               
                Bindtotalprofile();

            }
        }
        else if (Session["id"] != null)
        {
            regid = Convert.ToInt32(Session["id"].ToString());
            if (!IsPostBack)
            {

                Bindtotalsubcategoryview();
                Bindtotalgenderview();
               
                Bindtotalprofile();
            }

        }
        else
        {

            Response.Redirect("../Login.aspx");
        }
    }
    public void Bindtotalsubcategoryview()
    {
        ds = Registrationobj.getTotalpostsubcast();
        rptmenu.DataSource = ds;

        rptmenu.DataBind();


    }
    public void Bindtotalprofile()
    {
        ds = Registrationobj.getTotalprofile();
        rpttotalprofile.DataSource = ds;

        rpttotalprofile.DataBind();


    }
    public void Bindtotalgenderview()
    {
        ds = Registrationobj.getTotalgender();
        rptgender.DataSource = ds;

        rptgender.DataBind();


    }

    protected void lnksubcast_Command(object sender, CommandEventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string[] commandArguments = btn.CommandArgument.Split(',');
        string Subcast = commandArguments[0];
        ds = Registrationobj.getbiodatadetailbysubcat(Subcast, regid);
      
    }
    protected void rptourdata_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string Search_ID = btn.CommandArgument;
        Response.Redirect("../Profiledetails.aspx?Search_ID=" + Search_ID);
    }

    protected void lnkgender_Command(object sender, CommandEventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string[] commandArguments = btn.CommandArgument.Split(',');
        string gender = commandArguments[0];
        Response.Redirect("RegistereduserList.aspx?gender=" + gender);
        //ds = Registrationobj.getbiodatadetailbygender(gender, regid);
        //rptourdata.DataSource = ds;
        //rptourdata.DataBind();
    }
}