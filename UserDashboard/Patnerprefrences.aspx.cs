using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserDashboard_Patnerprefrences : System.Web.UI.Page
{

    Registration.Registration Registrationobj = new Registration.Registration();
    DataSet ds;
    int regid;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {

            regid = Convert.ToInt32(idCookie.Value);
            if (!IsPostBack)
            {
                binddropdownlist();
               // Bindddl();
                loaddata();
                editloaddata();
            }
            if (Request.QueryString["regid"] != null)
            {
                if (!IsPostBack)
                {

                    binddropdownlist();
                //    Bindddl();
                    loaddata();
                    editloaddata();
                    //  txtname.Text = Session["Fname"].ToString();
                }
            }
        }
        else if (Session["id"] != null)
        {
            regid = Convert.ToInt32(Session["id"].ToString());

            //txtpostedby.Text = Session["Fname"].ToString();
            if (!IsPostBack)
            {
                binddropdownlist();
           //     Bindddl();
                loaddata();

                //  txtname.Text = Session["Fname"].ToString();
            }
            if (Request.QueryString["regid"] != null)
            {
                if (!IsPostBack)
                {

                    binddropdownlist();
                  //  Bindddl();
                    loaddata();
                    editloaddata();
                    //  txtname.Text = Session["Fname"].ToString();
                }


            }

        }
        else
        {
            Response.Redirect("Login.aspx");
        }


    }

    protected void ddlreligion_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindsubcastpatner(ddlreligion.SelectedItem.ToString());
    }
    public void binddropdownlist()
    {
        DataSet ds = Registrationobj.getreligion();
        ddlreligion.DataSource = ds.Tables[0];
        ddlreligion.DataTextField = "Caste_name";
        ddlreligion.DataValueField = "Caste_ID";
        ddlreligion.DataBind();
        ddlreligion.Items.Insert(0, new ListItem("--Select--", "0"));

    }
    public void bindsubcastpatner(string caste_name)
    {
        DataSet ds = Registrationobj.getsubcatbyCaste_name(caste_name);
        ddlsubcaste.DataSource = ds.Tables[0];
        ddlsubcaste.DataTextField = "Subcaste_name";
        ddlsubcaste.DataValueField = "Subcaste_ID";
        ddlsubcaste.DataBind();
    }
    public void Bindddl()
    {
        string html = string.Empty;
        string url = "https://api.ohmsoftwaresinc.com/api/Blood/getstate";
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        request.AutomaticDecompression = DecompressionMethods.GZip;
        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        using (Stream stream = response.GetResponseStream())
        using (StreamReader reader = new StreamReader(stream))
        {
            html = reader.ReadToEnd();
        }
        DataTable dt = ConvertJsonToDatatable(html);
        //ddlstate.DataSource = dt;
        //ddlstate.DataTextField = "statename";
        //ddlstate.DataValueField = "statecode";
        //ddlstate.DataBind();
        //ddlstate.Items.Insert(0, new ListItem("--Select--", "0"));

    }
    public void editloaddata()
    {
        ds = Registrationobj.getpatnerpreferencebyid(Convert.ToInt32(Request.QueryString["regid"].ToString()));
        //rptdata.DataSource = ds;
        //rptdata.DataBind();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            regid = Convert.ToInt32(ds.Tables[0].Rows[i]["Reg_ID"].ToString());
            ddlage1.SelectedValue = ds.Tables[0].Rows[i]["AgeFrom"].ToString();
            ddlage2.SelectedValue = ds.Tables[0].Rows[i]["AgeTo"].ToString();
            string height1 = ds.Tables[0].Rows[i]["HeightFrom"].ToString();
            String[] spearatorh1 = { "'" };
            String[] strlisth1 = height1.Split(spearatorh1, StringSplitOptions.None);

            ddlfeet1.SelectedValue = strlisth1[0];
            ddlinch1.SelectedValue = strlisth1[1];

            string height2 = ds.Tables[0].Rows[i]["HeightTo"].ToString();
            String[] spearatorh2 = { "'" };
            String[] strlisth2 = height2.Split(spearatorh2, StringSplitOptions.None);

            ddlfeet2.SelectedValue = strlisth2[0];
            ddlinch2.SelectedValue = strlisth2[1];
            ddlreligion.SelectedItem.Text = ds.Tables[0].Rows[i]["Religion"].ToString();
            bindsubcastpatner(ddlreligion.SelectedItem.ToString());
            ddlsubcaste.SelectedItem.Text = ds.Tables[0].Rows[i]["Caste"].ToString();

            ddlgender.SelectedValue = ds.Tables[0].Rows[i]["Gender"].ToString();

            ddlmaritialstatus.SelectedValue = ds.Tables[0].Rows[i]["Marital_Status"].ToString();
            rdphysical.SelectedValue = ds.Tables[0].Rows[i]["Physical_Status"].ToString();

            txtHightestEducation.Text = ds.Tables[0].Rows[i]["Education"].ToString();

            txtOccupation.Text = ds.Tables[0].Rows[i]["Occupation"].ToString();
            txtcity.Text = ds.Tables[0].Rows[i]["Residing_City"].ToString();
            txtstate.Text = ds.Tables[0].Rows[i]["Residing_State"].ToString();

            String Zoradic = ds.Tables[0].Rows[i]["Zoradic"].ToString();

            string[] spearator = { " ," };
            Int32 count = 2;
            String[] strlist = Zoradic.Split(spearator, StringSplitOptions.None);



            for (int k = 0; k < chkzoradic.Items.Count; k++)
            {
                foreach (String s in strlist)
                {
                    if (chkzoradic.Items[k].Value == s)// getting selected value from CheckBox List  
                    {
                        chkzoradic.Items[k].Selected = true;

                    }
                }
            }


            String Skin_complaction = ds.Tables[0].Rows[i]["Skin_complaction"].ToString();

            string[] spearatorsc = { " ," };
            //Int32 count = 2;
            String[] strlistsc = Skin_complaction.Split(spearatorsc, StringSplitOptions.None);



            for (int k = 0; k < chkskincomplection.Items.Count; k++)
            {
                foreach (String ssc in strlistsc)
                {
                    if (chkskincomplection.Items[k].Value == ssc)// getting selected value from CheckBox List  
                    {
                        chkskincomplection.Items[k].Selected = true;

                    }
                }
            }

            // Using the Method

            //foreach (String s in strlist)
            //{
            //    if (s != "")
            //    {

            //        chkzoradic.Items[i].Selected = s;

            //    }
            //}


            txtcountry.Text = ds.Tables[0].Rows[i]["Country"].ToString();
            string Annual_Income = ds.Tables[0].Rows[i]["Annual_Income"].ToString();
            String[] spearatorai1 = { "-" };
            String[] strlistai1 = Annual_Income.Split(spearatorai1, StringSplitOptions.None);
            ddlannualincome.SelectedValue = strlistai1[0];
            ddlcurrency.SelectedValue = strlistai1[1];
            btnsubmit.Text = "Update";
        }

    }
    public void loaddata()
    {
        ds = Registrationobj.getpatnerpreference();
        //rptdata.DataSource = ds;
        //rptdata.DataBind();


        //rptdata.DataSource = ds;
        //rptdata.DataBind();
    }
    public static DataTable ConvertJsonToDatatable(string jsonString)
    {
        var jsonLinq = JObject.Parse(jsonString);

        // Find the first array using Linq
        var linqArray = jsonLinq.Descendants().Where(x => x is JArray).First();
        var jsonArray = new JArray();
        foreach (JObject row in linqArray.Children<JObject>())
        {
            var createRow = new JObject();
            foreach (JProperty column in row.Properties())
            {
                // Only include JValue types
                if (column.Value is JValue)
                {
                    createRow.Add(column.Name, column.Value);
                }
            }
            jsonArray.Add(createRow);
        }

        return JsonConvert.DeserializeObject<DataTable>(jsonArray.ToString());

    }

    protected void btnsublit_Click(object sender, EventArgs e)
    {
        if (btnsubmit.Text == "Submit")
        {
            string Age = ddlage1.SelectedValue.ToString() + "To " + ddlage2.SelectedValue.ToString();
            string Height1 = ddlfeet1.SelectedValue.ToString() + "'" + ddlinch1.SelectedValue.ToString();

            string Height2 = ddlfeet2.SelectedValue.ToString() + "'" + ddlinch2.SelectedValue.ToString();

            string zoradic = "";

            for (int i = 0; i < chkzoradic.Items.Count; i++)
            {
                if (chkzoradic.Items[i].Selected == true)// getting selected value from CheckBox List  
                {
                    zoradic += chkzoradic.Items[i].Text + " ," + ""; // add selected Item text to the String .  
                }


            }

            string Skin_complaction = "";

            for (int i = 0; i < chkskincomplection.Items.Count; i++)
            {
                if (chkskincomplection.Items[i].Selected == true)// getting selected value from CheckBox List  
                {
                    Skin_complaction += chkskincomplection.Items[i].Text + " ," + ""; // add selected Item text to the String .  
                }


            }
            Registrationobj.patner_prefenrence_add(regid,
                                              ddlgender.SelectedValue.ToString(),
                                             ddlage1.SelectedValue.ToString(),
                                             ddlage2.SelectedValue.ToString(),
                                             Height1,
                                             Height2,
                                             ddlmaritialstatus.SelectedValue.ToString(),
                                             "",
                                             rdphysical.SelectedValue.ToString(),
                                             ddlreligion.SelectedItem.ToString(),
                                             ddlsubcaste.SelectedItem.ToString(),
                                             zoradic,
                                             Skin_complaction,
                                             txtHightestEducation.Text,
                                             txtOccupation.Text,
                                             ddlannualincome.SelectedValue.ToString() + "-" + ddlcurrency.SelectedValue.ToString(),
                                             txtcountry.Text,
                                             txtcity.Text,
                                             txtstate.Text,
                                             DateTime.Now,
                                             DateTime.Now
                                             );
            txtcity.Text = "";
            txtcountry.Text = "";
            txtHightestEducation.Text = "";
            txtOccupation.Text = "";
            txtstate.Text = "";
            txtsubcaste.Text = "";

            loaddata();
            lblmsg.Visible = true;
            lblmsg.Text = "Data Added Successfully";

            Registrationobj.ADD_Log(regid.ToString(), "Partner_Prefrence", "Data Added Successfully", regid.ToString(), regid.ToString(), DateTime.Now, DateTime.Now);
        }
        else if (btnsubmit.Text == "Update")
        {
            string Age = ddlage1.SelectedValue.ToString() + "To " + ddlage2.SelectedValue.ToString();
            string Height1 = ddlfeet1.SelectedValue.ToString() + "'" + ddlinch1.SelectedValue.ToString();

            string Height2 = ddlfeet2.SelectedValue.ToString() + "'" + ddlinch2.SelectedValue.ToString();

            string zoradic = "";

            for (int i = 0; i < chkzoradic.Items.Count; i++)
            {
                if (chkzoradic.Items[i].Selected == true)// getting selected value from CheckBox List  
                {
                    zoradic += chkzoradic.Items[i].Text + " ," + ""; // add selected Item text to the String .  
                }


            }

            string Skin_complaction = "";

            for (int i = 0; i < chkskincomplection.Items.Count; i++)
            {
                if (chkskincomplection.Items[i].Selected == true)// getting selected value from CheckBox List  
                {
                    Skin_complaction += chkskincomplection.Items[i].Text + " ," + ""; // add selected Item text to the String .  
                }


            }
            Registrationobj.patner_prefenrence_update(regid,
                                              ddlgender.SelectedValue.ToString(),
                                             ddlage1.SelectedValue.ToString(),
                                             ddlage2.SelectedValue.ToString(),
                                             Height1,
                                             Height2,
                                             ddlmaritialstatus.SelectedValue.ToString(),
                                             "",
                                             rdphysical.SelectedValue.ToString(),
                                             ddlreligion.SelectedItem.ToString(),
                                             ddlsubcaste.SelectedItem.ToString(),
                                             zoradic,
                                             Skin_complaction,
                                             txtHightestEducation.Text,
                                             txtOccupation.Text,
                                             ddlannualincome.SelectedValue.ToString() + "-" + ddlcurrency.SelectedValue.ToString(),
                                             txtcountry.Text,
                                             txtcity.Text,
                                             txtstate.Text,
                                             DateTime.Now,
                                             DateTime.Now
                                             );
            txtcity.Text = "";
            txtcountry.Text = "";
            txtHightestEducation.Text = "";
            txtOccupation.Text = "";
            txtstate.Text = "";
            txtsubcaste.Text = "";

            loaddata();
            lblmsg.Visible = true;
            lblmsg.Text = "Data Updated Successfully";
            Registrationobj.ADD_Log(regid.ToString(), "Partner_Prefrence", "Updated Successfully", regid.ToString(), regid.ToString(), DateTime.Now, DateTime.Now);
        }



    }
}