using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Profiledetails : System.Web.UI.Page
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
        if (Request.QueryString["Search_ID"] != null)
        {
            image.HttpEquiv = "image";
            image.Name = "image";
            if (!IsPostBack)
            {
                loaddata();
            }

            //if(Session["UserID"]!=null)
            //{

            //}
        }

    }
    public string ProcessDataItem(object myDataItemValue)
    {

        if (myDataItemValue == "")
        {

            return "image_not_found.png";
        }


        return myDataItemValue.ToString();

    }
    public void loaddata()
    {
        try
        {
            ds = Registrationobj.getbiodatadetailbySearch_ID(Request.QueryString["Search_ID"].ToString());
            //rptdata.DataSource = ds;
            //rptdata.DataBind();

            rptprofile.DataSource = ds;
            rptprofile.DataBind();
            string s = ds.Tables[0].Rows[0]["Photo"].ToString();

            Page.Title = "Rana Samaj Matrimony";
            image.Content = "https://rana-samaj.com/Picture/" + s;
            this.Page.Header.Controls.Add(image);

            title.Attributes.Add("property", "og:title");
            title.Content = ds.Tables[0].Rows[0]["Name"].ToString();
            Page.Header.Controls.Add(title);

            // Page.MetaDescription = ds.Tables[0].Rows[0]["Date_of_Birth"].ToString();
            //description.Attributes.Add("property", "og:description");
            //description.Content = ds.Tables[0].Rows[0]["Date_of_Birth"].ToString();
            //this.Page.Header.Controls.Add(description);



            image1.Attributes.Add("property", "og:image");
            image1.Content = "https://rana-samaj.com/Picture/" + s;
            Page.Header.Controls.Add(image1);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }

    protected void rptprofile_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            Repeater rptfeacheredprofile = (Repeater)e.Item.FindControl("rptfeacheredprofile");

            ds = Registrationobj.getbiodatadetail();

            rptfeacheredprofile.DataSource = ds;
            rptfeacheredprofile.DataBind();
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string Search_ID = btn.CommandArgument;
        ds = Registrationobj.getbiodatadetailbySearch_ID(Search_ID);
        //rptdata.DataSource = ds;
        //rptdata.DataBind();

        rptprofile.DataSource = ds;
        rptprofile.DataBind();
    }

}