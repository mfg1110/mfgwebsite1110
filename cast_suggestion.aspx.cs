using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cast_suggestion : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    string regid;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnaddcaste_Click(object sender, EventArgs e)
    {
        Registrationobj.ADD_castesuggestion(txtfname.Text,
                                        txtlname.Text,
                                        txtcaste.Text,
                                        "",
                                        DateTime.Now,
                                        DateTime.Now
                                        );
        txtcaste.Text = "";
        txtfname.Text = "";
        txtlname.Text = "";
        lblmsg.Visible = true;
        lblmsg.ForeColor =Color.Green;
        lblmsg.Text = "Submitted !!!";
    }
}