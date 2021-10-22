using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class accountactivation : System.Web.UI.Page
{
    public static int i;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            string constr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            string activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"]) ? Request.QueryString["ActivationCode"] : Guid.Empty.ToString();

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM UserActivation WHERE ActivationCode = @ActivationCode"))
                {
                  
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                        cmd.Connection = con;
                        con.Open();
                        try
                        {
                            i = cmd.ExecuteNonQuery();
                            con.Close();

                            lblmsg.Text = "Activation successfull.";
                            SqlCommand cmdinsert = new SqlCommand("Update Ranasamaj_Registration SET status='Active'");
                            cmdinsert.CommandType = CommandType.Text;

                            cmdinsert.Connection = con;
                            con.Open();
                            cmdinsert.ExecuteNonQuery();
                            con.Close();
                        }
                        catch (SqlException ex)
                        {
                            lblmsg.Text = "Invalid Activation code.";
                        }
                       


                    }
                
            }

        }
    }

}