using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cast : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    string regid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            binddropdownlist();
        }
    }
    protected void btnaddcaste_Click(object sender, EventArgs e)
    {
        try
        {
            Registrationobj.ADD_caste(txtcaste.Text,DateTime.Now,DateTime.Now);
            txtcaste.Text = "";
           
        }
        catch (Exception ex)
        {

        }
    }

    public void binddropdownlist()
    {
       DataSet ds= Registrationobj.getreligion();
       ddlreligion.DataSource = ds.Tables[0];
       ddlreligion.DataTextField = "Caste_name";
       ddlreligion.DataValueField = "Caste_ID";
       ddlreligion.DataBind();

    }
    protected void btnsubcast_Click(object sender, EventArgs e)
    {
        //try
        //{
            Registrationobj.ADD_subcaste(Convert.ToInt32(ddlreligion.SelectedValue),
                                         ddlreligion.SelectedItem.ToString(),
                                         txtsubcast.Text,
                                         DateTime.Now,
                                         DateTime.Now
                                         );
            txtcaste.Text = "";

        //}
        //catch (Exception ex)
        //{
           
        //}
    }
}