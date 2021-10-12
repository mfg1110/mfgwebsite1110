using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_Pages_MasterPage : System.Web.UI.MasterPage
{
    Registration.Registration Registrationobj = new Registration.Registration();
    int id;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null) 
            {
            
                id = Convert.ToInt32(idCookie.Value);
                txtid.Text = id.ToString();
                reg.Visible = false;
                Divuname.Visible = true;
                lipost.Visible = true;
                lbluname.Text = nameCookie.Value;
                lilogin.Visible = false;
                lisignup.Visible = false;
                //lbluname.Text = "ttkhj";
            }
            else if (Session["UserID"]!=null)
            {
                id = Convert.ToInt32(Session["id"].ToString());
                txtid.Text = id.ToString();
                reg.Visible = false;
                Divuname.Visible = true;
                lipost.Visible = true;
                lbluname.Text = Session["Fname"].ToString();
                lilogin.Visible = false;
                lisignup.Visible = false;
            }
            else
            {
                lilogin.Visible = true;
                lisignup.Visible = true;
                lipost.Visible = false;
               // Response.Redirect("Login.aspx");
            }
            string gender, totalperson;

            ds = Registrationobj.getbiodatabyregid(id);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lipost.Visible = false;
                    liupdatebio.Visible = true;
                    lideletebio.Visible = true;
                    lilogin.Visible = false;
                    lisignup.Visible = false;
                    txtid.Text = ds.Tables[0].Rows[0]["Biodata_id"].ToString();
                }
                else
                {
                  
                    lipost.Visible = true;
                    liupdatebio.Visible = false;
                    lideletebio.Visible = false;
                }
            }
            else
            {

            }
            //ds = Registrationobj.gettotalperson();
            //for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            //{
            //    gender = ds.Tables[0].Rows[i]["gender"].ToString();
            //    totalperson = ds.Tables[0].Rows[i]["Totalperson"].ToString();
            //    if (gender == "Female")
            //    {
            //        lblfemale.Text = totalperson;
            //    }
            //    else if (gender == "Male")
            //    {
            //        lblmale.Text = totalperson;
            //    }
            //}

        }

    public void loaddata()
    {
        
       
    }
    protected void lnkdelete_Command(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Server Error : Connection Timeout.');", true);
    }
}
