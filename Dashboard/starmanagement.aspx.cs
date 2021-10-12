using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_starmanagement : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath;
    DataSet ds, dssubcast;
    string flaguserexist = "";
    public string theVerificationCode;
    Boolean flag;
    public static string id;
    protected void Page_Load(object sender, EventArgs e)
    {
      
            loadstar_details();
       
    }
    protected void lnkstarsubmit_Click(object sender, EventArgs e)
    {
        if (lnkstarsubmit.Text == "ADD")
        {
            Registrationobj.ADD_Star(txtstar.Text,
                                    "Admin",
                                    "Admin",
                                     DateTime.Now,
                                     DateTime.Now
                                     );
            loadstar_details();
        }
        else if (lnkstarsubmit.Text == "Update")
        {
            Registrationobj.Updatestar(Convert.ToInt32(id),
                                    txtstar.Text,
                                    DateTime.Now
                                    );
            loadstar_details();
        }
    }

    public void loadstar_details()
    {
        ds = Registrationobj.getstar_details();

        rptstardetails.DataSource = ds;
        rptstardetails.DataBind();
    }
    protected void lnkdelete_Command(object sender, CommandEventArgs e)
    {
        LinkButton b = (LinkButton)sender;

        string arguments = b.CommandArgument;
        string[] args = arguments.Split(';');

        string id = args[0];

        Registrationobj.deletestar(Convert.ToInt32(id));

        loadstar_details();
    }
    protected void lnkedit_Command(object sender, CommandEventArgs e)
    {
        LinkButton b = (LinkButton)sender;

        string arguments = b.CommandArgument;
        string[] args = arguments.Split(';');

        id = args[0];

        ds=Registrationobj.getstarbyid(Convert.ToInt32(id));

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            txtstar.Text = ds.Tables[0].Rows[i]["Starname"].ToString();
        lnkstarsubmit.Text = "Update";
    }
}