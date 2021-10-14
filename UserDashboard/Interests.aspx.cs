using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
public partial class UserDashboard_Interests : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    public static int Biodata_id, regid, stepid, step, indexid;
    int profileid;
    DataSet ds, dspatnerpreference, dsownpatnerpreference;
    HtmlMeta title = new HtmlMeta();
    HtmlMeta description = new HtmlMeta();
    HtmlMeta url = new HtmlMeta();
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
        try
        {
            DataSet dsbiodata = Registrationobj.getbiodatabyregid(regid);
            int bioid = Convert.ToInt32(dsbiodata.Tables[0].Rows[0]["Biodata_id"].ToString());
            ds = Registrationobj.Getinbox(bioid);
            //rptdata.DataSource = ds;
            //rptdata.DataBind();

            rptinbox.DataSource = ds;
            rptinbox.DataBind();
            if (ds.Tables[0].Rows.Count == 0)
            {
                Control FooterTemplate = rptinbox.Controls[rptinbox.Controls.Count - 1].Controls[0];
                FooterTemplate.FindControl("trEmpty").Visible = true;
            }

        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string Search_ID = btn.CommandArgument;
        Response.Redirect("../Profiledetails.aspx?Search_ID=" + Search_ID);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string Search_ID = btn.CommandArgument;
        Response.Redirect("../Profiledetails.aspx?Search_ID=" + Search_ID);
    }
}