using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Messenger : System.Web.UI.Page
{
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath;
    DataSet ds;
    string flaguserexist = "";
    public string theVerificationCode;
    Boolean flag;
    int regid;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {

            regid = Convert.ToInt32(idCookie.Value);
           
            if (Request.QueryString["id"] != null)
            {
                if (!IsPostBack)
                {
                    LoadChatbox();
                 //   chatsearch.Visible = false;
                }
            }
            else
            {
                if (!IsPostBack)
                {
                    loaddata();
                }
            }
        }
        else if (Session["id"] != null)
        {
            regid = Convert.ToInt32(Session["id"].ToString());

            //txtpostedby.Text = Session["Fname"].ToString();
         
            if (Request.QueryString["id"] != null)
            {
                if (!IsPostBack)
                {
                    LoadChatbox();
                   // chatsearch.Visible = false;
                }


            }
            else
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
    public void loaddata()
    {
        DataSet dsusername = Registrationobj.getregistrationbyid(Convert.ToInt32(regid));
        string Username = dsusername.Tables[0].Rows[0]["fname"].ToString() + " " + dsusername.Tables[0].Rows[0]["lname"].ToString();
        ds = Registrationobj.getchatuser(Username);
        //rptdata.DataSource = ds;
        //rptdata.DataBind();


        rptusers.DataSource = ds;
        rptusers.DataBind();
       
        if (ds.Tables[0].Rows.Count == 0)
        {
            Control FooterTemplate = rptusers.Controls[rptusers.Controls.Count - 1].Controls[0];
            FooterTemplate.FindControl("trEmpty").Visible = true;
        }
    }
    protected void lnksender_Click(object sender, EventArgs e)
    {
     
        //LoadChatbox();
    }

    protected string GetWelcomeBanner(string str)
    {
        if (String.IsNullOrWhiteSpace(Server.HtmlEncode(str)))
            return "Hi, lets start chatting...";

        return str;
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {

    }
    public void LoadChatbox()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
        string date = DateTime.Now.ToString("MM-dd-yyyy");
        if (Request.QueryString["id"] != null)
        {
            string profileid = Request.QueryString["id"].ToString();

            string date3 = DateTime.Now.ToString("MM-dd-yyyy");
            DataSet dsreceiver = Registrationobj.getregistrationbyid(Convert.ToInt32(profileid));
            CurrentRecevier.Text = dsreceiver.Tables[0].Rows[0]["fname"].ToString() + " " + dsreceiver.Tables[0].Rows[0]["lname"].ToString();
        }
      

        DataSet dsusername = Registrationobj.getregistrationbyid(Convert.ToInt32(regid));
        string Username = dsusername.Tables[0].Rows[0]["fname"].ToString() + " " + dsusername.Tables[0].Rows[0]["lname"].ToString();
        CurrentSender.Text = Username;
        con.Open();
        string strQuery = "select * from Chat where Sender ='" + CurrentRecevier.Text + "' and Receiver ='" + Username + "' OR Sender ='" + Username + "' and Receiver ='" + CurrentRecevier.Text + "' ORDER BY Date1";
        SqlCommand cmd = new SqlCommand(strQuery, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        DataList2.DataSource = ds.Tables[0];
        DataList2.DataBind();
        con.Close();
    }
    protected string GetStyleForMsgList(string str)
    {
        if (string.Equals(Server.HtmlEncode(str), Server.HtmlEncode(CurrentSender.Text), StringComparison.OrdinalIgnoreCase))
        {
            return "SenderClass";
        }
        return "ReceiverClass";
    }
    protected string GetPerfactName(string str)
    {
        if (string.Equals(Server.HtmlEncode(str), Server.HtmlEncode(CurrentSender.Text), StringComparison.OrdinalIgnoreCase))
        {
            return "<span style='color:#efdab5'>You :</sapn>";
        }
        return "<span style='color:#efdab5'>" + Server.HtmlEncode(str) + " : </span>";
    }
    protected void lnksender_Command(object sender, CommandEventArgs e)
    {
        LinkButton lnkUser = sender as LinkButton;
        string id = ((LinkButton)sender).CommandArgument.ToString();
        CurrentRecevier.Text = id;
        lnkUser.Text = id;
        LoadChatbox();
    }
  
    protected void btnRandom_Click1(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
        string date = DateTime.Now.ToString("MM-dd-yyyy");
     
    
        DataSet dsusername = Registrationobj.getregistrationbyid(Convert.ToInt32(regid));
        string Username = dsusername.Tables[0].Rows[0]["fname"].ToString() + " " + dsusername.Tables[0].Rows[0]["lname"].ToString();
        CurrentSender.Text = Username;
        //SqlCommand cmd = new SqlCommand("Insert into Chat values('" + Username + "','" + Label1.Text + "','" + txtMessage.Text + "','" + date + "')", con);
        //con.Open();
        //int i = cmd.ExecuteNonQuery();
        try
        {
            Registrationobj.ADD_Chat(CurrentSender.Text, CurrentRecevier.Text, MSGTextBox.Text, TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE).ToString(), TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE), TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE));
            MSGTextBox.Text = "";
            LoadChatbox();
        }
        catch (SqlException ex)
        {

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        DataSet dsusername = Registrationobj.getregistrationbyid(Convert.ToInt32(regid));
        string Username = dsusername.Tables[0].Rows[0]["fname"].ToString() + " " + dsusername.Tables[0].Rows[0]["lname"].ToString();
        ds = Registrationobj.getchatuserbysearch(Username,txtsearch.Text);
        //rptdata.DataSource = ds;
        //rptdata.DataBind();


        rptusers.DataSource = ds;
        rptusers.DataBind();
     
       
    }
    protected void txtsearch_TextChanged(object sender, EventArgs e)
    {
        DataSet dsusername = Registrationobj.getregistrationbyid(Convert.ToInt32(regid));
        string Username = dsusername.Tables[0].Rows[0]["fname"].ToString() + " " + dsusername.Tables[0].Rows[0]["lname"].ToString();
        ds = Registrationobj.getchatuserbysearch(Username,txtsearch.Text);
        //rptdata.DataSource = ds;
        //rptdata.DataBind();


        rptusers.DataSource = ds;
        rptusers.DataBind();

        if (ds.Tables[0].Rows.Count == 0)
        {
            Control FooterTemplate = rptusers.Controls[rptusers.Controls.Count - 1].Controls[0];
            FooterTemplate.FindControl("trEmpty").Visible = true;
        }
    }
    protected void lnkdelete_Command(object sender, CommandEventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string ID = btn.CommandArgument;
        Registrationobj.deletechat(Convert.ToInt32(ID));
        LoadChatbox();
    }
    protected void linkdeleteall_Command(object sender, CommandEventArgs e)
    {
        LinkButton btn = (LinkButton)(sender);
        string Sender = btn.CommandArgument;
        Registrationobj.clearchat(Sender);
        LoadChatbox();
        loaddata();
    }
}