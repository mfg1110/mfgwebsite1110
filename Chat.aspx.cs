using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Chat : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["name"] != null)
        {
            get_User();
            Load_Frends();

            //if(Session["UserID"]!=null)
            //{

            //}
        }
        //LoadChatbox();
      
    }
    public void LoadChatbox()
    {
       
        DateTime date = DateTime.Now;
        string date3 = date.ToString("dd-MM-yyyy");
        //string agent = Session["Admin"].ToString();
        conn.Open();
        string str = "select * from chat where Sender='" + Label1.Text + "' and Receiver='" + Label2.Text + "'   ORDER BY ID";
        SqlCommand cmd = new SqlCommand(str, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataList2.DataSource = ds;
        DataList2.DataBind();

        string str1 = "select * from chat where  Sender='" + Label2.Text + "' and Receiver='" + Label1.Text + "'  ORDER BY ID";
        SqlCommand cmd1 = new SqlCommand(str1, conn);
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);
        DataList3.DataSource = ds1;
        DataList3.DataBind();
        conn.Close();
        //ScriptManager.RegisterStartupScript(this.Page, typeof(Panel), "PanelChatContent", ";ScrollToBottom();", true);
    }
    public void get_User()
    {
        //Image1.ImageUrl = "images/" + Session["Image"].ToString();
        Label1.Text = Request.QueryString["name"];
    }
    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        DateTime date = DateTime.Now;
        string date3 = date.ToString("dd-MM-yyyy");
        string time = date.ToString("HH:mm:ss");
        conn.Open();
        string query = "insert into chat values('1','" + Label1.Text + "','" + Label2.Text + "','" + TextBox1.Text + "','" + Convert.ToDateTime(date) + "')";
        SqlCommand cmd = new SqlCommand(query,conn);
        int i=cmd.ExecuteNonQuery();
        conn.Close();
        if(i>=1)
        {
            TextBox1.Text = "";
            LoadChatbox();
        }
    }
    public void Load_Frends()
    {
        conn.Open();
        string str = "select DISTINCT fname,picture from [Ranasamaj_Registration] where UserID!='" + Label1.Text + "'";
        SqlCommand cmd = new SqlCommand(str, conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        //DataList2.DataSource = ds;
        //DataList2.DataBind();
        DataList1.DataSource = ds;
        DataList1.DataBind();
        conn.Close();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton lBtn = sender as LinkButton;
        string id = ((LinkButton)sender).CommandArgument.ToString();
        //Label1.Text = id;
        Label2.Text = lBtn.Text;
       
        
        DataListItem item = (DataListItem)lBtn.NamingContainer;
        Image NameLabel = (Image)item.FindControl("Image2");
        //string url = NameLabel.ImageUrl.ToString();
        //Image3.ImageUrl = url;
        LoadChatbox();
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        LoadChatbox();
    }
   
}