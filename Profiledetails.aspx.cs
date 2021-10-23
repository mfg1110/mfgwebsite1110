using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
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
  
    public void loaddata()
    {
        //try
        //{
            ds = Registrationobj.getbiodatadetailbySearch_ID(Request.QueryString["Search_ID"].ToString());
            //rptdata.DataSource = ds;
            //rptdata.DataBind();

            rptprofile.DataSource = ds;
            rptprofile.DataBind();
            if(ds.Tables[0].Rows.Count>0)
            {
                string s = ds.Tables[0].Rows[0]["Photo"].ToString();
                Page.Title = "Rana Samaj Matrimony";
                //image.Content = "https://rana-samaj.com/Picture/" + s;
                //this.Page.Header.Controls.Add(image);

                //title.Attributes.Add("property", "og:title");
                //title.Content = ds.Tables[0].Rows[0]["Name"].ToString();
                //Page.Header.Controls.Add(title);
            }
          

           

            // Page.MetaDescription = ds.Tables[0].Rows[0]["Date_of_Birth"].ToString();
            //description.Attributes.Add("property", "og:description");
            //description.Content = ds.Tables[0].Rows[0]["Date_of_Birth"].ToString();
            //this.Page.Header.Controls.Add(description);



            //image1.Attributes.Add("property", "og:image");
            //image1.Content = "https://rana-samaj.com/Picture/" + s;
            //Page.Header.Controls.Add(image1);
        //}
        //catch (Exception ex)
        //{
        //    ex.ToString();
        //}
    }

    protected void rptprofile_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            Repeater rptfeacheredprofile = (Repeater)e.Item.FindControl("rptfeacheredprofile");
            if (Request.QueryString["Search_ID"] != null)
            {
                if (regid != null)
                {
                    ds = Registrationobj.getbiodatadetailnotbyidSearch_ID(Convert.ToInt32(regid), Request.QueryString["Search_ID"].ToString());
                }
                else
                {
                    ds = Registrationobj.getbiodatadetailbynotsearchid(Request.QueryString["Search_ID"].ToString());
                }
               
            }
            

            rptfeacheredprofile.DataSource = ds;
            rptfeacheredprofile.DataBind();


            RepeaterItem item = e.Item;
            //string maritialstatus = (item.FindControl("lblmaritialstatus") as Label).Text;
            //Label noofchild = (item.FindControl("lblnoofchild") as Label);
            Label lblbiodata = (item.FindControl("lblbiodata") as Label);
            Label lblgender = (item.FindControl("lblgender") as Label);
            Label lblg = (item.FindControl("lblg") as Label);
            Label lblg1 = (item.FindControl("lblg1") as Label);
            if (lblgender.Text == "Male")
            {
                lblg.Text = "His";
                lblg1.Text = "His";
            }
            else if (lblgender.Text == "Female")
            {
                lblg.Text = "Her";
                lblg1.Text = "Her";
            }
            Repeater rptbasicpreference =  (Repeater)e.Item.FindControl("rptbasicpreference");
            HttpCookie nameCookie = Request.Cookies["Name"];
            HttpCookie idCookie = Request.Cookies["id"];
            LinkButton lnkchat = (item.FindControl("lnkchat") as LinkButton);
            LinkButton lnkshortlist = (item.FindControl("lnkshortlist") as LinkButton);
            HtmlGenericControl lipatner = e.Item.FindControl("lipatner") as HtmlGenericControl;
            HtmlGenericControl lipreference = e.Item.FindControl("lipreference") as HtmlGenericControl;
            if (nameCookie != null)
            {
                
                lnkshortlist.Visible = true;
             
                DataSet dsbiodata = Registrationobj.getbiodatabyregid(regid);
                if(dsbiodata.Tables[0].Rows.Count>0)
                {
                    lnkchat.Visible = true;
                }
                else
                {
                    lnkchat.Visible = false;
                }
            }
            else if (Session["id"] != null)
            {
             
                lnkshortlist.Visible = true;
               
                DataSet dsbiodata = Registrationobj.getbiodatabyregid(regid);
                if (dsbiodata.Tables[0].Rows.Count > 0)
                {
                    lnkchat.Visible = true;
                }
                else
                {
                    lnkchat.Visible = false;
                }
            }
            else
            {
               
                lnkshortlist.Visible = false;
                lnkchat.Visible = false;
            }
            DataSet dspatnerpreference;
            dspatnerpreference = Registrationobj.getpatnerpreferencebyid(Convert.ToInt32(lblbiodata.Text));
            if (dspatnerpreference.Tables[0].Rows.Count == 0)
            {
                lipatner.Visible = false;
            }
            else
            {
                lipreference.Visible = true;
                lipatner.Visible = true;
                rptbasicpreference.DataSource = dspatnerpreference;
                rptbasicpreference.DataBind();
            }

            DataSet dsshortlisted = Registrationobj.getshortlistbyprofileid(Convert.ToInt32(lblbiodata.Text));
            if (dsshortlisted.Tables[0].Rows.Count > 0)
            {
                lnkshortlist.ForeColor = Color.White;
                lnkshortlist.BackColor = Color.Green;
                lnkshortlist.BorderColor = Color.Green;
                lnkshortlist.Text = "Shortlisted";
            }
            else
            {
                lnkshortlist.Text = "Shortlist";
            }
         
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
    public string ProcessMyDataItem(object myValue)
    {
        if (myValue == "")
        {
            return "Data Not Added";
        }
        if (String.Equals(myValue, "0"))
        {
            return "Data Not Added";
        }
        return myValue.ToString();
    }



    public string ProcessDataItem(object myDataItemValue)
    {
        if (myDataItemValue == "")
        {

            return "image_not_found.png";
        }

        return myDataItemValue.ToString();

    }
    protected void lnkshortlist_Command(object sender, CommandEventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        profileid = Convert.ToInt32(e.CommandArgument.ToString());
        try
        {
            if (btn.Text == "Shortlist")
            {
                Registrationobj.ADD_Shortlist(regid,
                                              profileid,
                                              regid.ToString(),
                                              regid.ToString(),
                                              DateTime.Now,
                                              DateTime.Now
                                              );
                btn.Text = "Shortlisted";
            }
            else if (btn.Text == "Shortlisted")
            {
                Registrationobj.Remove_Shortlist(regid,
                                             profileid
                                             );
                btn.Text = "Shortlist";
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(typeof(Page), "SomeError", "<script type='text/javascript'>alert('Error!');</script>");

        }
    }


    protected void lnkchat_Command(object sender, CommandEventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        profileid = Convert.ToInt32(e.CommandArgument.ToString());
        Response.Redirect("UserDashboard/Messenger.aspx?id=" + profileid);
    }
}