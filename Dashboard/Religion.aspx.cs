using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Religion : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath;
    DataSet ds,dssubcast;
    string flaguserexist = "";
    public string theVerificationCode;
    Boolean flag;
    public static string Caste_ID, Subcaste_ID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            religion();
        }
    }

    public void religion()
    {
        ds = Registrationobj.getreligion();
       
        rptreligion.DataSource = ds;
        rptreligion.DataBind();
       
        ddlreligion.DataSource = ds.Tables[0];
        ddlreligion.DataTextField = "Caste_name";
        ddlreligion.DataValueField = "Caste_ID";
        ddlreligion.DataBind();
        ddlreligion.Items.Insert(0, new ListItem("--Select--", "0"));


        dssubcast = Registrationobj.getsubcat();

        rptsubcast.DataSource = dssubcast;
        rptsubcast.DataBind();
    }


    protected void lnksubmit_Click(object sender, EventArgs e)
    {
        if (lnksubmit.Text == "ADD")
        {
            Registrationobj.ADD_caste(txtreligion.Text,
                                      DateTime.Now,
                                      DateTime.Now
                                      );
        }
        else if (lnksubmit.Text == "Update")
        {
            Registrationobj.Updatecast(Convert.ToInt32(Caste_ID),
                                    txtreligion.Text,                                  
                                     DateTime.Now
                                     );
        }
        txtreligion.Text = "";
        religion();
    }
    protected void lnkCaste_Click(object sender, EventArgs e)
    {
        if (lnkCaste.Text == "ADD")
        {
            Registrationobj.ADD_subcaste(Convert.ToInt32(ddlreligion.SelectedValue),
                                        ddlreligion.SelectedItem.ToString(),
                                       txtCaste.Text,
                                      DateTime.Now,
                                      DateTime.Now
                                      );
        }
        else if (lnkCaste.Text == "Update")
        {
            Registrationobj.Updatesubcast(Convert.ToInt32(Subcaste_ID),
                                        Convert.ToInt32(ddlreligion.SelectedValue),
                                        ddlreligion.SelectedItem.ToString(),
                                        txtCaste.Text,
                                        DateTime.Now
                                     );
            txtreligion.Text = "";
            txtCaste.Text = "";
            religion();
        }
    }
    protected void lnkedit_Command(object sender, CommandEventArgs e)
    {
        LinkButton b = (LinkButton)sender;

        string arguments = b.CommandArgument;
        string[] args = arguments.Split(';');

        Caste_ID = args[0];

        ds = Registrationobj.getcastbyid(Convert.ToInt32(Caste_ID));

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            txtreligion.Text = ds.Tables[0].Rows[i]["Caste_name"].ToString();
        lnksubmit.Text = "Update";
            religion();
    }
    protected void lnkdelete_Command(object sender, CommandEventArgs e)
    {
        LinkButton b = (LinkButton)sender;

        string arguments = b.CommandArgument;
        string[] args = arguments.Split(';');

        string id = args[0];

        Registrationobj.deletecast(Convert.ToInt32(id));
        religion();
       
    }
    protected void lnksubcatedit_Command(object sender, CommandEventArgs e)
    {
        LinkButton b = (LinkButton)sender;

        string arguments = b.CommandArgument;
        string[] args = arguments.Split(';');

        Subcaste_ID = args[0];

        ds = Registrationobj.getsubcastbyid(Convert.ToInt32(Subcaste_ID));

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ddlreligion.SelectedValue = ds.Tables[0].Rows[i]["Caste_ID"].ToString();
            txtCaste.Text = ds.Tables[0].Rows[i]["Subcaste_name"].ToString();
        }
        lnkCaste.Text = "Update";
        religion();
    }
    protected void lnksubcatdelete_Command(object sender, CommandEventArgs e)
    {
        LinkButton b = (LinkButton)sender;

        string arguments = b.CommandArgument;
        string[] args = arguments.Split(';');

        string id = args[0];

        Registrationobj.deletesubcast(Convert.ToInt32(id));
        religion();
    }
}