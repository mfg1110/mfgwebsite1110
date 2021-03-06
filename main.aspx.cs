using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class main : System.Web.UI.Page
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
           
            if (Request.QueryString["regid"] != null)
            {
               
            }
        }
        else if (Session["id"] != null)
        {
            regid = Convert.ToInt32(Session["id"].ToString());

            //txtpostedby.Text = Session["Fname"].ToString();
          
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
        ds = Registrationobj.getbiodatadetailbyid(Convert.ToInt32(regid));
        //rptdata.DataSource = ds;
        //rptdata.DataBind();


        rptlatestprofile.DataSource = ds;
        rptlatestprofile.DataBind();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string Search_ID = btn.CommandArgument;
        Response.Redirect("Profiledetails.aspx?Search_ID=" + Search_ID);
    }

    protected void lnkexpressintrest_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string[] commandArguments = btn.CommandArgument.Split(',');
        string Biodata_id = commandArguments[0];
        if (btn.Text == "Express Intrest")
        {
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
        else
        {

        }
        
    }
    protected void rptlatestprofile_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
      
    }
    protected void rptlatestprofile_ItemDataBound1(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            bool colorflag = false;
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
                DataSet dsexpressintrest = Registrationobj.Getpasswordbyid(regid);
                for (int i = 0; i < dsexpressintrest.Tables[0].Rows.Count; i++)
                {
                    if (dsexpressintrest.Tables[0].Rows[i]["Biodata_id"].ToString() == lblbiodataid.Text)
                    {
                        lnkexpressintrest.ForeColor = Color.White;
                        lnkexpressintrest.BackColor = Color.Green;
                        lnkexpressintrest.BorderColor = Color.Green;
                        lnkexpressintrest.Text = "Intrested";
                        colorflag = true;

                        //lnkexpressintrest.BackColor = Color.Green;
                    }
                    else
                    {
                        lnkexpressintrest.Text = "Express Intrest";
                        colorflag = false;

                    }
                }


                if (colorflag == true)
                {
                    lnkexpressintrest.CssClass = "btn btn-primary btn-sm";
                }
                else
                {
                    lnkexpressintrest.CssClass = "btn btn-success btn-sm";
                }
            }


        }
    }
    protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}