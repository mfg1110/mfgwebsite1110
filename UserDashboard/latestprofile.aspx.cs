using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class UserDashboard_latestprofile : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    HtmlMeta title = new HtmlMeta();
    HtmlMeta image = new HtmlMeta();
    HtmlMeta image1 = new HtmlMeta();
    int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {

            id = Convert.ToInt32(idCookie.Value);

            if (Request.QueryString["Biodata_id"] != null)
            {
               
            }
            if (!IsPostBack)
            {
                loaddata();
                //  txtname.Text = Session["Fname"].ToString();
            }
        }
        else if (Session["id"] != null)
        {
            id = Convert.ToInt32(Session["id"].ToString());


            if (Request.QueryString["Biodata_id"] != null)
            {
               


            }
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
    protected void rptourdata_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

    }

    public void loaddata()
    {
        ds = Registrationobj.getbiodatadetailbyid(id);
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
    protected void lnkexpressintrest_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string[] commandArguments = btn.CommandArgument.Split(',');
        string Biodata_id = commandArguments[0];

        DataSet dsname = Registrationobj.getbiodatabyregid(id);

        if (dsname.Tables[0].Rows.Count == 0)
        {
            Registrationobj.ADD_INBOX(Convert.ToInt32(Biodata_id), id, "", id.ToString(), id.ToString(), DateTime.Now, DateTime.Now);
            btn.Text = "Intrested";
            btn.BackColor = Color.Green;
        }
        else
        {
            string name = dsname.Tables[0].Rows[0]["name"].ToString();
            Registrationobj.ADD_INBOX(Convert.ToInt32(Biodata_id), id, name, id.ToString(), id.ToString(), DateTime.Now, DateTime.Now);
            btn.Text = "Intrested";
            btn.BackColor = Color.Green;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string Search_ID = btn.CommandArgument;
        Response.Redirect("../Profiledetails.aspx?Search_ID=" + Search_ID);
    }
}