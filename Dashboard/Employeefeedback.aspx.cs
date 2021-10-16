using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Employeefeedback : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            loaddata();
        }
    }
    public void loaddata()
    {
        ds=Registrationobj.Get_Employee_Feedback();
        rptemployeedata.DataSource = ds;
        rptemployeedata.DataBind();
    }
}