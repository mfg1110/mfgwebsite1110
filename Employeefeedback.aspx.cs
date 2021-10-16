using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employeefeedback : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnksubmit_Click(object sender, EventArgs e)
    {
        try
        {
            Registrationobj.Insert_Employee_Feedback(ddlemployee.SelectedValue.ToString(),txtdescription.Text, DateTime.Now);
            txtdescription.Text = "";
        }
        catch(Exception ex)
        {

        }
    }
}