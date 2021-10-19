using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Viewlist : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    HtmlMeta title = new HtmlMeta();
    HtmlMeta image = new HtmlMeta();
    HtmlMeta image1 = new HtmlMeta();
    public static int Biodata_id, regid, stepid, step, indexid;
    string Videostrname = "", Videoextension, videopath;
    DataSet ds;
    string flaguserexist = "";
    public string theVerificationCode;
    Boolean flag;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {

            regid = Convert.ToInt32(idCookie.Value);
            sidebar.Visible = true;
            if (Request.QueryString["regid"] != null)
            {

            }
        }
        else if (Session["id"] != null)
        {
            regid = Convert.ToInt32(Session["id"].ToString());

            //txtpostedby.Text = Session["Fname"].ToString();
            sidebar.Visible = true;
            if (Request.QueryString["regid"] != null)
            {


            }

        }
        else
        {

        }
        if (!IsPostBack)
        {

            loaddata();
            Bindtotalgenderview();
            Bindtotalsubcategoryview();
            binddropdownlist();
        }
    }
    public void bindsubcast(int caste_ID)
    {
        DataSet ds1 = Registrationobj.getsubcatbyCaste_ID(caste_ID);
        ddlsubcaste.DataSource = ds1.Tables[0];
        ddlsubcaste.DataTextField = "Subcaste_name";
        ddlsubcaste.DataValueField = "Subcaste_ID";
        ddlsubcaste.DataBind();
    }
    public void binddropdownlist()
    {
        DataSet ds = Registrationobj.getreligion();
        ddlreligion.DataSource = ds.Tables[0];
        ddlreligion.DataTextField = "Caste_name";
        ddlreligion.DataValueField = "Caste_ID";
        ddlreligion.DataBind();
        ddlreligion.Items.Insert(0, new ListItem("--Select--", "0"));

    }
    public void Bindtotalsubcategoryview()
    {
        ds = Registrationobj.getTotalpostsubcast();
        rptmenu.DataSource = ds;

        rptmenu.DataBind();


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
        rptourdata.DataSource = ds;
        rptourdata.DataBind();
    }
    protected void lnkgender_Command(object sender, CommandEventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string[] commandArguments = btn.CommandArgument.Split(',');
        string gender = commandArguments[0];
        ds = Registrationobj.getbiodatadetailbygender(gender, regid);
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
    public void loaddata()
    {
        ds = Registrationobj.getbiodatadetailbyid(Convert.ToInt32(regid));
        //rptdata.DataSource = ds;
        //rptdata.DataBind();


        rptourdata.DataSource = ds;
        rptourdata.DataBind();
    }
    protected void lnkexpressintrest_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string[] commandArguments = btn.CommandArgument.Split(',');
        string Biodata_id = commandArguments[0];

        DataSet dsname = Registrationobj.getbiodatabyregid(regid);

        if (dsname.Tables[0].Rows.Count == 0)
        {
            Registrationobj.ADD_INBOX(Convert.ToInt32(Biodata_id), regid, "", regid.ToString(), regid.ToString(), DateTime.Now, DateTime.Now);
            btn.Text = "Intrested";
            btn.BackColor = Color.Green;
        }
        else
        {
            string name = dsname.Tables[0].Rows[0]["name"].ToString();
            Registrationobj.ADD_INBOX(Convert.ToInt32(Biodata_id), regid, name, regid.ToString(), regid.ToString(), DateTime.Now, DateTime.Now);
            btn.Text = "Intrested";
            btn.BackColor = Color.Green;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string Search_ID = btn.CommandArgument;
        Response.Redirect("Profiledetails.aspx?Search_ID=" + Search_ID);
    }

    protected void ddlreligion_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindsubcast(Convert.ToInt32(ddlreligion.SelectedValue.ToString()));
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        DataSet dssearch = Registrationobj.getsearchdata(ddllookingfor.SelectedValue.ToString(), ddlage1.SelectedValue.ToString(), ddlage2.SelectedValue.ToString(), ddlreligion.SelectedItem.ToString(), ddlsubcaste.SelectedItem.ToString());
        //rptdata.DataSource = ds;
        //rptdata.DataBind();


        rptourdata.DataSource = dssearch;
        rptourdata.DataBind();
        if (dssearch.Tables[0].Rows.Count == 0)
        {
            Control FooterTemplate = rptourdata.Controls[rptourdata.Controls.Count - 1].Controls[0];
            FooterTemplate.FindControl("trEmpty").Visible = true;
        }
    }

    protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        ViewState["PageNumber"] = Convert.ToInt32(e.CommandArgument) - 1;
        loaddata();
    }

    protected void rptourdata_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //Reference the Repeater Item.
            RepeaterItem item = e.Item;
            LinkButton lnkexpressintrest = (item.FindControl("lnkexpressintrest") as LinkButton);
            Label lblbiodataid = (item.FindControl("lblbiodataid") as Label);
            DataSet dsname = Registrationobj.getbiodatabyregid(regid);

            if (dsname.Tables[0].Rows.Count == 0)
            {
                lnkexpressintrest.Visible = false;
            }
            else
            {
                lnkexpressintrest.Visible = true;
                DataSet dsexpressintrest = Registrationobj.Getinboxbyid(regid);
                for (int i = 0; i < dsexpressintrest.Tables[0].Rows.Count; i++)
                {
                    if (dsexpressintrest.Tables[0].Rows[i]["Biodata_id"].ToString() == lblbiodataid.Text)
                    {
                        lnkexpressintrest.Text = "Intrested";
                        lnkexpressintrest.BackColor = Color.Green;
                    }
                    else
                    {
                        lnkexpressintrest.Text = "Express Intrest";
                        lnkexpressintrest.BackColor = Color.Blue;
                    }
                }
            }


        }
    }
}