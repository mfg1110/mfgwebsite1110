using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing.Imaging;

public partial class _Default : System.Web.UI.Page
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
    protected void lnkview_Command(object sender, CommandEventArgs e)
    {

    }
    protected void lnkview_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string Search_ID = btn.CommandArgument;
        Response.Redirect("Viewbiodetail.aspx?Search_ID=" + Search_ID);
    }
    protected void rptourdata_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

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
 
    protected void btnsearchid_Click(object sender, EventArgs e)
    {
        string search;
        search = txtsearch.Text;
        ds = Registrationobj.getbiodatadetailbysearch(search);
        //rptdata.DataSource = ds;
        //rptdata.DataBind();


        rptourdata.DataSource = ds;
        rptourdata.DataBind();

        if (ds.Tables[0].Rows.Count == 0)
        {
            Control FooterTemplate = rptourdata.Controls[rptourdata.Controls.Count - 1].Controls[0];
            FooterTemplate.FindControl("trEmpty").Visible = true;
        }
    }
    protected void btnsearchname_Click(object sender, EventArgs e)
    {
        
    }
    protected void txtsearch_TextChanged(object sender, EventArgs e)
    {
        string search;
        search = txtsearch.Text;
        ds = Registrationobj.getbiodatadetailbysearch(search);
        //rptdata.DataSource = ds;
        //rptdata.DataBind();


        rptourdata.DataSource = ds;
        rptourdata.DataBind();
        if (ds.Tables[0].Rows.Count == 0)
        {
            Control FooterTemplate = rptourdata.Controls[rptourdata.Controls.Count - 1].Controls[0];
            FooterTemplate.FindControl("trEmpty").Visible = true;
        }
        if(txtsearch.Text=="")
        {
            loaddata();
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
    protected void ddlgender_SelectedIndexChanged(object sender, EventArgs e)
    {
        string search;
        search = ddlgender.SelectedValue.ToString();
        if (search=="All")
        {
            loaddata();
        }
        else
        {
            ds = Registrationobj.getbiodatadetailbysearchbygender(search);
            //rptdata.DataSource = ds;
            //rptdata.DataBind();


            rptourdata.DataSource = ds;
            rptourdata.DataBind();
        }
       
    }
}