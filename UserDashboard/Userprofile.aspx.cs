using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class UserDashboard_Userprofile : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    public static int Biodata_id, regid, stepid, step, indexid,id;
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

            id = Convert.ToInt32(idCookie.Value);
           
            if (Request.QueryString["Biodata_id"] != null)
            {
                if (!IsPostBack)
                {
                    loaddata();
                    //  txtname.Text = Session["Fname"].ToString();
                }
            }
        }
        else if (Session["id"] != null)
        {
            id = Convert.ToInt32(Session["id"].ToString());

           
            if (Request.QueryString["Biodata_id"] != null)
            {
                if (!IsPostBack)
                {
                    loaddata();
                   
                }


            }

        }
        else
        {
            Response.Redirect("../Login.aspx");
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
            ds = Registrationobj.getbiodatadetailbyBiodata_id(Convert.ToInt32(Request.QueryString["Biodata_id"].ToString()));
            //rptdata.DataSource = ds;
            //rptdata.DataBind();

            rptuserprofile.DataSource = ds;
            rptuserprofile.DataBind();
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
    protected void linkedit_Command(object sender, CommandEventArgs e)
    {

    }
    protected void rptuserprofile_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Write("<script>alert('" + e.CommandArgument.ToString() + "');</script>");
            Response.Redirect("../UserDashboard/Profile.aspx?Biodata_id=" + e.CommandArgument.ToString());
        }
        else if (e.CommandName == "DeactivateProfile")
        {
            Response.Write("<script>alert('" + e.CommandArgument.ToString() + "');</script>");
            Response.Redirect("../UserDashboard/Profile.aspx?Biodata_id=" + e.CommandArgument.ToString());
        }
        else if (e.CommandName == "Delete")
        {
            Response.Write("<script>alert('" + e.CommandArgument.ToString() + "');</script>");
            Response.Redirect("../UserDashboard/Delete.aspx?regid=" + e.CommandArgument.ToString());
        }
           
    }
}