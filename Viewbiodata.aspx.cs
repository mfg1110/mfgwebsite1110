using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Viewbiodata : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    HtmlMeta title = new HtmlMeta();
    HtmlMeta description = new HtmlMeta();
    HtmlMeta url = new HtmlMeta();
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
    public void loaddata()
    {
        try
        {
            ds = Registrationobj.getbiodatadetailbySearch_ID(Request.QueryString["Search_ID"].ToString());
            //rptdata.DataSource = ds;
            //rptdata.DataBind();

            rptsingledata.DataSource = ds;
            rptsingledata.DataBind();
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
        catch(Exception ex)
        {
            ex.ToString();
        }
    }
    protected void rptsingledata_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //Reference the Repeater Item.
            RepeaterItem item = e.Item;

            //Reference the Controls.
            string maritialstatus = (item.FindControl("lblmaritialstatus") as Label).Text;
            Label noofchild=(item.FindControl("lblnoofchild") as Label);
            Label lblnochild = (item.FindControl("lblnochild") as Label);


           // GridView gdgallery = (item.FindControl("GridView1") as GridView);
           // DataList dtlist = (item.FindControl("dtlist") as DataList);

           //DataSet dsimage = new DataSet();
           //dsimage = Registrationobj.getimagesbybiodata_id(Convert.ToInt32(Request.QueryString["Biodata_id"].ToString()));

           //dtlist.DataSource = dsimage;
           //dtlist.DataBind();
           //rptthumb.DataSource = dsimage;
           //rptthumb.DataBind();
          if(maritialstatus=="Single")
          {
              noofchild.Visible=false;
              lblnochild.Visible = false;
          }
            else
          {
               noofchild.Visible=true;
               lblnochild.Visible = true;
          }
        }
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

}