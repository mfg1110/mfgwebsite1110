using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class postbiodata : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath, postimage, filename;
    int randomdigit;
    public static int Biodata_id, id, stepid,step,indexid;
    public static int flagprev = 0;
    DataSet ds;
    string Mobileno1, Mobileno2, totnoofchild, monthlyincome, YearofPassing;
    string searchid, finalString, Images, Photo;
    string Visibility_Flag = "true";
    protected void Page_Load(object sender, EventArgs e)
    {
        Wizard1.PreRender += new EventHandler(Wizard1_PreRender);
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {

            id = Convert.ToInt32(idCookie.Value);
            if (!IsPostBack)
            {
                Bindddl();
                binddropdownlist();
                // txtname.Text = nameCookie.Value;
            }
            if (Request.QueryString["Biodata_id"] != null)
            {
                if (!IsPostBack)
                {
                    loaddata();
                    //  txtname.Text = Session["Fname"].ToString();
                }
            }
        }
        else if (Session["id"] != null)
        {
            id = Convert.ToInt32(Session["id"].ToString());

            //txtpostedby.Text = Session["Fname"].ToString();
            if (!IsPostBack)
            {
                binddropdownlist();
                Bindddl();
                //  txtname.Text = Session["Fname"].ToString();
            }
            if (Request.QueryString["Biodata_id"] != null)
            {
                if (!IsPostBack)
                {
                    loaddata();
                    //  txtname.Text = Session["Fname"].ToString();
                }


            }
           
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }


    [WebMethod]
    public static string[] GetCustomers(string prefix)
    {
        List<string> customers = new List<string>();
        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select ContactName, CustomerId from Customers where ContactName like @SearchText + '%'";
                cmd.Parameters.AddWithValue("@SearchText", prefix);
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        customers.Add(string.Format("{0}-{1}", sdr["ContactName"], sdr["CustomerId"]));
                    }
                }
                conn.Close();
            }
        }
        return customers.ToArray();
    }
    public void loaddata()
    {
        ds = Registrationobj.getbiodatadetailbyBiodata_id(Convert.ToInt32(Request.QueryString["Biodata_id"].ToString()));
        //rptdata.DataSource = ds;
        //rptdata.DataBind();

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            Biodata_id = Convert.ToInt32(ds.Tables[0].Rows[i]["Biodata_id"].ToString());
            txtname.Text = ds.Tables[0].Rows[i]["Name"].ToString();
            txtNationality.Text = ds.Tables[0].Rows[i]["Nationality"].ToString();
            ddlreligion.SelectedValue = ds.Tables[0].Rows[i]["Caste_ID"].ToString();
            bindsubcast(Convert.ToInt32(ddlreligion.SelectedValue.ToString()));
            ddlsubcaste.SelectedValue = ds.Tables[0].Rows[i]["Subcaste_ID"].ToString();
           
            ddlgender.SelectedValue = ds.Tables[0].Rows[i]["Gender"].ToString();
            txtdob.Text = Convert.ToDateTime(ds.Tables[0].Rows[i]["Date_of_Birth"]).ToString("yyyy-MM-dd");
            txtpob.Text = ds.Tables[0].Rows[i]["Place_of_Birth"].ToString();
            txtreligion.Text = ds.Tables[0].Rows[i]["Religion"].ToString();
            ddlzoradicsign.SelectedValue = ds.Tables[0].Rows[i]["Zodiac_Sign"].ToString();
            txtweight.Text = ds.Tables[0].Rows[i]["Weight"].ToString();
            ddlbloodgroup.SelectedValue = ds.Tables[0].Rows[i]["Blood_group"].ToString();
            txtskincomplaction.Text = ds.Tables[0].Rows[i]["Skin_complaction"].ToString();
            ddlmaritialstatus.SelectedValue = ds.Tables[0].Rows[i]["Maritial_Status"].ToString();

            if (ddlmaritialstatus.SelectedValue.ToString() == "Single")
            {
                noofchild.Visible = false;
            }
            else
            {
                noofchild.Visible = true;
            }
            ddlnoofchild.SelectedValue = ds.Tables[0].Rows[i]["No_of_child"].ToString();
            txtlanguageknow.Text = ds.Tables[0].Rows[i]["Language_Know"].ToString();
            txtHobbies.Text = ds.Tables[0].Rows[i]["Hobbies"].ToString();
            txtcurrentaddress.Text = ds.Tables[0].Rows[i]["Current_Address"].ToString();
            txtCity.Text = ds.Tables[0].Rows[i]["Current_city"].ToString();
            txtState.Text = ds.Tables[0].Rows[i]["Current_state"].ToString();
            txtCountry.Text = ds.Tables[0].Rows[i]["Current_country"].ToString();
            txtHightestEducation.Text = ds.Tables[0].Rows[i]["Hightest_Education"].ToString();
            txtUniversity.Text = ds.Tables[0].Rows[i]["University"].ToString();
            txtYearofPassing.Text = ds.Tables[0].Rows[i]["Year_of_Passing"].ToString();
            txtOccupation.Text = ds.Tables[0].Rows[i]["Occupation"].ToString();
            txtOccupationindetails.Text = ds.Tables[0].Rows[i]["Occupation_in_details"].ToString();
            txtmonthlyincome.Text = ds.Tables[0].Rows[i]["Monthly_Income"].ToString();

            txtfathername.Text = ds.Tables[0].Rows[i]["Father_Name"].ToString();
            txtmothername.Text = ds.Tables[0].Rows[i]["Mother_Name"].ToString();
            ddlbrother.SelectedValue = ds.Tables[0].Rows[i]["Brother"].ToString();
            ddlsister.SelectedValue = ds.Tables[0].Rows[i]["Sister"].ToString();
            txtfamilyaddress.Text = ds.Tables[0].Rows[i]["Family_Address"].ToString();
            txtfamilycity.Text = ds.Tables[0].Rows[i]["Family_add_city"].ToString();
            txtfamilystate.Text = ds.Tables[0].Rows[i]["Family_add_state"].ToString();
            txtfamilycountry.Text = ds.Tables[0].Rows[i]["Family_add_country"].ToString();
            txtMobile1.Text = ds.Tables[0].Rows[i]["Home_Mobile1"].ToString();
            txtMobile2.Text = ds.Tables[0].Rows[i]["Home_Mobile2"].ToString();
            txtemailaddress1.Text = ds.Tables[0].Rows[i]["Email_Address_1"].ToString();
            txtemailaddress2.Text = ds.Tables[0].Rows[i]["Email_Address_2"].ToString();
            profilephoto.Visible = true;
            profilephoto.ImageUrl = "~/Picture/" + ds.Tables[0].Rows[i]["Photo"].ToString();

            lblimage.Text = ds.Tables[0].Rows[i]["Photo"].ToString();
            string Monthly_Income = ds.Tables[0].Rows[i]["Monthly_Income"].ToString();
            if (Monthly_Income != "")
            {
                string[] Monthly_Incomevalues = Monthly_Income.Split(' ');
                for (int j = 0; j < Monthly_Incomevalues.Length; j++)
                {
                    Monthly_Incomevalues[i] = Monthly_Incomevalues[i].Trim();


                }
                txtmonthlyincome.Text = Monthly_Incomevalues[0];
                ddlcurrency.SelectedValue = Monthly_Incomevalues[1];
            }
            string Home_Mobile1 = ds.Tables[0].Rows[i]["Home_Mobile1"].ToString();
            if (Home_Mobile1 != "")
            {
                string[] Home_Mobile1values = Home_Mobile1.Split(' ');
                for (int j = 0; j < Home_Mobile1values.Length; j++)
                {
                    Home_Mobile1values[i] = Home_Mobile1values[i].Trim();


                }
                ddlcountrycode1.SelectedValue = Home_Mobile1values[1];
                txtMobile1.Text = Home_Mobile1values[2];
            }
            string Home_Mobile2 = ds.Tables[0].Rows[i]["Home_Mobile2"].ToString();
            if (Home_Mobile2 == "")
            {

            }
            else
            {
                string[] Home_Mobile2values = Home_Mobile2.Split(' ');
                if (Home_Mobile2values[0] == "")
                {

                }
                else
                {
                    for (int j = 0; j < Home_Mobile2values.Length; j++)
                    {
                        Home_Mobile2values[i] = Home_Mobile2values[i].Trim();


                    }
                    ddlcountrycode2.SelectedValue = Home_Mobile2values[1];
                    txtMobile2.Text = Home_Mobile2values[2];
                }
            }

            string Time_of_Birth = ds.Tables[0].Rows[i]["Time_of_Birth"].ToString();
            if (Time_of_Birth != "")
            {
                string[] Time_of_Birthvalues = Time_of_Birth.Split(':');
                for (int j = 0; j < Time_of_Birthvalues.Length; j++)
                {
                    Time_of_Birthvalues[i] = Time_of_Birthvalues[i].Trim();


                }
                ddlhours.SelectedValue = Time_of_Birthvalues[0];
                ddlminut.SelectedValue = Time_of_Birthvalues[1];
                string[] Tobof12hours = Time_of_Birthvalues[2].Split(' ');
                for (int k = 0; k < Tobof12hours.Length; k++)
                {
                    Tobof12hours[k] = Tobof12hours[k].Trim();


                }
                ddlsecond.SelectedValue = Tobof12hours[0];
                ddl12hour.SelectedValue = Tobof12hours[1];

            }

            string Height = ds.Tables[0].Rows[i]["Height"].ToString();
            if (Height != "")
            {
                string[] Heightvalues = Height.Split(' ');
                for (int j = 0; j < Heightvalues.Length; j++)
                {
                    Heightvalues[i] = Heightvalues[i].Trim();


                }


                ddlfeet.SelectedValue = Heightvalues[0];
                ddlinch.SelectedValue = Heightvalues[2];


            }
            RequiredFieldValidator15.Enabled = false;
            // StartNextButton.Text = "Update Next";
            Wizard1.StartNextButtonText = "Update & Next";
        }

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
    protected void Wizard1_PreRender(object sender, EventArgs e)
    {
        Repeater SideBarList = Wizard1.FindControl("HeaderContainer").FindControl("SideBarList") as Repeater;
        SideBarList.DataSource = Wizard1.WizardSteps;
        SideBarList.DataBind();
        try
        {
            indexid = Registrationobj.getstepindex(id);
            Wizard1.ActiveStepIndex = indexid;
        }
        catch(Exception ex)
        {

        }
        //if (indexid == 0)
        //{
        //    Wizard1.ActiveStepIndex = 0;
        //}
        //int stepIndex = indexid;

        //if (stepIndex < Wizard1.ActiveStepIndex)
        //{
        //    Wizard1.ActiveStepIndex = Wizard1.ActiveStepIndex + 1;
        //}
        //else if (stepIndex > Wizard1.ActiveStepIndex)
        //{
        //    Wizard1.ActiveStepIndex = Wizard1.ActiveStepIndex - 1;
        //}
        //else
        //{
        //    Wizard1.ActiveStepIndex = Wizard1.ActiveStepIndex;
        //}
       
    }
    protected string GetClassForWizardStep(object wizardStep)
    {
        WizardStep step = wizardStep as WizardStep;

        if (step == null)
        {
            return "";
        }
        int stepIndex = Wizard1.WizardSteps.IndexOf(step);

        if (stepIndex < Wizard1.ActiveStepIndex)
        {
            return "prevStep";
        }
        else if (stepIndex > Wizard1.ActiveStepIndex)
        {
            return "nextStep";
        }
        else
        {
            return "currentStep";
        }
    }
    protected int GetIndexForWizardStep(object wizardStep)
    {
        WizardStep step = wizardStep as WizardStep;

        int stepIndex = Wizard1.WizardSteps.IndexOf(step);

        return (stepIndex);
    }
    protected void ddlmaritialstatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlmaritialstatus.SelectedValue.ToString() != "Single")
        {
            noofchild.Visible = true;
        }
        else
        {
            noofchild.Visible = false;
        }
    }

    public void Bindcityddl(string statecode)
    {
        string html = string.Empty;
        string url = "http://api.ohmsoftwaresinc.com/api/Blood/getdistrictbystate?statecode=" + statecode;
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        request.AutomaticDecompression = DecompressionMethods.GZip;
        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        using (Stream stream = response.GetResponseStream())
        using (StreamReader reader = new StreamReader(stream))
        {
            html = reader.ReadToEnd();
        }
        DataTable dt = ConvertJsonToDatatable(html);
        //ddlcity.DataSource = dt;
        //ddlcity.DataTextField = "district";
        //ddlcity.DataValueField = "districtsortcode";
        //ddlcity.DataBind();
        //ddlcity.Items.Insert(0, new ListItem("--Select--", "0"));

    }
    public void Bindddl()
    {
        string html = string.Empty;
        string url = "http://api.ohmsoftwaresinc.com/api/Blood/getstate";
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
    protected void Wizard1_ActiveStepChanged(object sender, EventArgs e)
    {
        step = this.Wizard1.ActiveStepIndex;
       
        switch (this.Wizard1.ActiveStepIndex)
        {
            case 0: // Firt step
                if (Request.QueryString["Biodata_id"] != null)
                {
                    Wizard1.StartNextButtonText = "Update & Next";
                }
                // Wizard1.StartNextButtonText = "Goto Second Step";
                break;
            case 1: // Second step
                Wizard1.StepPreviousButtonText = "Goto First Step";
                Wizard1.StepNextButtonText = "Goto Finish Step";
                break;
            case 2: // Finish step
                Wizard1.FinishPreviousButtonText = "Goto Step 2";
                Wizard1.FinishCompleteButtonText = "Complete It!";
                break;
        }

    }
    protected void StartNextButton_Click(object sender, EventArgs e)
    {
       

        string timeofbirth = ddlhours.SelectedValue.ToString() + ":" + ddlminut.SelectedValue.ToString() + ":" + ddlsecond.SelectedValue.ToString() + " " + ddl12hour.SelectedValue.ToString();
        string height = ddlfeet.SelectedValue.ToString() + " Feet " + ddlinch.SelectedValue.ToString() + " Inches";
        if (txtMobile1.Text == "")
        {
            Mobileno1 = "";
        }
        else
        {

            Mobileno1 = "+ " + ddlcountrycode1.SelectedValue.ToString() + " " + txtMobile1.Text;

        }
        if (txtMobile2.Text == "")
        {
            Mobileno2 = "";
        }
        else
        {

            Mobileno2 = "+ " + ddlcountrycode2.SelectedValue.ToString() + " " + txtMobile2.Text;
        }

        if (txtmonthlyincome.Text == "")
        {
            monthlyincome = "";
        }
        else
        {

            monthlyincome = txtmonthlyincome.Text + " " + ddlcurrency.SelectedValue.ToString();
        }

        if (ddlmaritialstatus.SelectedValue.ToString() == "Single")
        {
            totnoofchild = "";
        }
        else
        {
            totnoofchild = ddlnoofchild.SelectedValue.ToString();
        }

        try
        {
            if (FileUpload1.HasFile)
            {


                postimage = FileUpload1.FileName;
                FileUpload1.SaveAs(System.IO.Path.Combine(Server.MapPath("../Picture/"), FileUpload1.FileName));
                string thumbnailpath = Server.MapPath("../Picture/Thumbnail/" + postimage);
                //Create thumbnail for uploaded file and save thumbnail on disk
                Bitmap Thumbnail = CreateThumbnail(thumbnailpath, 200, 200);
                string SaveAsThumbnail = System.IO.Path.Combine(Server.MapPath(thumbnailpath + "/"), FileUpload1.FileName);
                Thumbnail.Save(SaveAsThumbnail);

                if (Request.QueryString["Biodata_id"] != null)
                {

                    string imagepath = Server.MapPath("../Picture/" + lblimage.Text);
                    string path = Server.MapPath("../Picture/Thumbnail/" + lblimage.Text);
                    if (File.Exists(imagepath))
                    {
                        if (File.Exists(path))
                        {
                            File.Delete(path);
                        }

                        File.Delete(imagepath);

                    }
                }
                else
                {
                    postimage = lblimage.Text;
                }

                Stream strm = FileUpload1.PostedFile.InputStream;
                var targetFile = thumbnailpath;

                ReduceImageSize(0.2, strm, targetFile);
            }
            else
            {
                postimage = lblimage.Text;
            }
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
        try
        {
        if (Request.QueryString["Biodata_id"] != null)
            {
                Registrationobj.UpdateBiodata(Biodata_id,
                                      txtname.Text,
                                      DateTime.Parse(txtdob.Text),
                                      timeofbirth,
                                      txtpob.Text,
                                      ddlgender.SelectedValue.ToString(),
                                      txtreligion.Text,
                                      ddlreligion.SelectedItem.ToString(),
                                      ddlsubcaste.SelectedItem.ToString(),
                                      ddlzoradicsign.SelectedValue.ToString(),
                                      height,
                                      txtweight.Text,
                                      ddlbloodgroup.SelectedValue.ToString(),
                                      txtskincomplaction.Text,
                                      ddlmaritialstatus.SelectedValue.ToString(),
                                      totnoofchild,
                                      txtlanguageknow.Text,
                                      txtHobbies.Text,
                                      txtNationality.Text,
                                      txtcurrentaddress.Text,
                                      txtCity.Text,
                                      txtState.Text,
                                      txtCountry.Text,
                                      txtHightestEducation.Text,
                                      txtUniversity.Text,
                                     txtYearofPassing.Text,
                                      txtOccupation.Text,
                                      txtOccupationindetails.Text,
                                     monthlyincome,
                                      txtfathername.Text,
                                      txtmothername.Text,
                                      ddlbrother.Text,
                                      ddlsister.Text,
                                      txtfamilyaddress.Text,
                                      txtfamilycity.Text,
                                      txtfamilystate.Text,
                                     txtfamilycountry.Text,
                                     Mobileno1,
                                     Mobileno2,
                                     txtemailaddress1.Text,
                                     txtemailaddress2.Text,
                                     postimage,
                                     id,
                                     DateTime.Now
                                    );
              
                int stepIndex = Wizard1.ActiveStepIndex+1;
                Registrationobj.update_step_track(id, stepIndex.ToString());
               
            }
            else
            {
                if (flagprev == 1)
                {
                    Registrationobj.UpdateBiodata(Biodata_id,
                                   txtname.Text,
                                   DateTime.Parse(txtdob.Text),
                                   timeofbirth,
                                   txtpob.Text,
                                   ddlgender.SelectedValue.ToString(),
                                   txtreligion.Text,
                                   ddlreligion.SelectedItem.ToString(),
                                   ddlsubcaste.SelectedItem.ToString(),
                                   ddlzoradicsign.SelectedValue.ToString(),
                                   height,
                                   txtweight.Text,
                                   ddlbloodgroup.SelectedValue.ToString(),
                                   txtskincomplaction.Text,
                                   ddlmaritialstatus.SelectedValue.ToString(),
                                   totnoofchild,
                                   txtlanguageknow.Text,
                                   txtHobbies.Text,
                                   txtNationality.Text,
                                   txtcurrentaddress.Text,
                                   txtCity.Text,
                                   txtState.Text,
                                   txtCountry.Text,
                                   txtHightestEducation.Text,
                                   txtUniversity.Text,
                                  txtYearofPassing.Text,
                                   txtOccupation.Text,
                                   txtOccupationindetails.Text,
                                  monthlyincome,
                                   txtfathername.Text,
                                   txtmothername.Text,
                                   ddlbrother.Text,
                                   ddlsister.Text,
                                   txtfamilyaddress.Text,
                                   txtfamilycity.Text,
                                   txtfamilystate.Text,
                                  txtfamilycountry.Text,
                                  Mobileno1,
                                  Mobileno2,
                                  txtemailaddress1.Text,
                                  txtemailaddress2.Text,
                                  postimage,
                                  id,
                                  DateTime.Now
                                 );

                    int stepIndex = Wizard1.ActiveStepIndex + 1;
                    Registrationobj.update_step_track(id, stepIndex.ToString());
                }
                else
                {
                    Biodata_id = Registrationobj.PostBiodata(id,
                                              txtname.Text,
                                              DateTime.Parse(txtdob.Text),
                                              timeofbirth,
                                              txtpob.Text,
                                              ddlgender.SelectedValue.ToString(),
                                              txtreligion.Text,
                                              ddlreligion.SelectedItem.ToString(),
                                              ddlsubcaste.SelectedItem.ToString(),
                                              ddlzoradicsign.SelectedValue.ToString(),
                                              height,
                                              txtweight.Text,
                                              ddlbloodgroup.SelectedValue.ToString(),
                                              txtskincomplaction.Text,
                                              ddlmaritialstatus.SelectedValue.ToString(),
                                              totnoofchild,
                                              txtlanguageknow.Text,
                                              txtHobbies.Text,
                                              txtNationality.Text,
                                              txtcurrentaddress.Text,
                                              txtCity.Text,
                                              txtState.Text,
                                              txtCountry.Text,
                                              txtHightestEducation.Text,
                                              txtUniversity.Text,
                                              txtYearofPassing.Text,
                                              txtOccupation.Text,
                                              txtOccupationindetails.Text,
                                             monthlyincome,
                                              txtfathername.Text,
                                              txtmothername.Text,
                                              ddlbrother.Text,
                                              ddlsister.Text,
                                              txtfamilyaddress.Text,
                                              txtfamilycity.Text,
                                              txtfamilystate.Text,
                                             txtfamilycountry.Text,
                                             Mobileno1,
                                             Mobileno2,
                                               "",
                                             txtemailaddress1.Text,
                                             txtemailaddress2.Text,
                                             postimage,
                                              "India",
                                             Visibility_Flag,
                                              "",
                                             id,
                                             id,
                                             DateTime.Now,
                                             DateTime.Now
                                            );
                    int stepIndex = Wizard1.ActiveStepIndex + 1;
                    Registrationobj.step_track(id, stepIndex.ToString());
                    indexid = Registrationobj.getstepindex(id);
                    Wizard1.ActiveStepIndex = indexid;


                }
              
                //lblmsg.Visible = true;
                //lblmsg.Text = "Data Submited Successfully";

               
            }

        }
        catch (Exception ex)
        {
            //lblmsg.Visible = true;
            //lblmsg.Text = ex.ToString();
            Response.Redirect("Default.aspx");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Server Error : Connection Timeout.');", true);
        }
       

    }

    public Bitmap CreateThumbnail(string ImagePath, int ThumbnailWidth, int ThumbnailHeight)
    {
        System.Drawing.Bitmap Thumbnail = null;
        try
        {
            Bitmap ImageBMP = new Bitmap(ImagePath);
            ImageFormat loFormat = ImageBMP.RawFormat;

            decimal lengthRatio;
            int ThumbnailNewWidth = 0;
            int ThumbnailNewHeight = 0;
            decimal ThumbnailRatioWidth;
            decimal ThumbnailRatioHeight;

            // If the uploaded image is smaller than a thumbnail size the just return it
            if (ImageBMP.Width <= ThumbnailWidth && ImageBMP.Height <= ThumbnailHeight)
                return ImageBMP;

            // Compute best ratio to scale entire image based on larger dimension.
            if (ImageBMP.Width > ImageBMP.Height)
            {
                ThumbnailRatioWidth = (decimal)ThumbnailWidth / ImageBMP.Width;
                ThumbnailRatioHeight = (decimal)ThumbnailHeight / ImageBMP.Height;
                lengthRatio = Math.Min(ThumbnailRatioWidth, ThumbnailRatioHeight);
                ThumbnailNewWidth = ThumbnailWidth;
                decimal lengthTemp = ImageBMP.Height * lengthRatio;
                ThumbnailNewHeight = (int)lengthTemp;
            }
            else
            {
                ThumbnailRatioWidth = (decimal)ThumbnailWidth / ImageBMP.Width;
                ThumbnailRatioHeight = (decimal)ThumbnailHeight / ImageBMP.Height;
                lengthRatio = Math.Min(ThumbnailRatioWidth, ThumbnailRatioHeight);
                ThumbnailNewHeight = ThumbnailHeight;
                decimal lengthTemp = ImageBMP.Width * lengthRatio;
                ThumbnailNewWidth = (int)lengthTemp;
            }
            Thumbnail = new Bitmap(ThumbnailNewWidth, ThumbnailNewHeight);
            Graphics g = Graphics.FromImage(Thumbnail);
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
            g.FillRectangle(Brushes.White, 0, 0, ThumbnailNewWidth, ThumbnailNewHeight);
            g.DrawImage(ImageBMP, 0, 0, ThumbnailNewWidth, ThumbnailNewHeight);

            ImageBMP.Dispose();
        }
        catch
        {
            return null;
        }

        return Thumbnail;
    }
    protected void StepNextButton_Click(object sender, EventArgs e)
    {
        try
        {
            string timeofbirth = ddlhours.SelectedValue.ToString() + ":" + ddlminut.SelectedValue.ToString() + ":" + ddlsecond.SelectedValue.ToString() + " " + ddl12hour.SelectedValue.ToString();
            string height = ddlfeet.SelectedValue.ToString() + " Feet " + ddlinch.SelectedValue.ToString() + " Inches";
            if (txtMobile1.Text == "")
            {
                Mobileno1 = "";
            }
            else
            {

                Mobileno1 = "+ " + ddlcountrycode1.SelectedValue.ToString() + " " + txtMobile1.Text;

            }
            if (txtMobile2.Text == "")
            {
                Mobileno2 = "";
            }
            else
            {

                Mobileno2 = "+ " + ddlcountrycode2.SelectedValue.ToString() + " " + txtMobile2.Text;
            }

            if (txtmonthlyincome.Text == "")
            {
                monthlyincome = "";
            }
            else
            {

                monthlyincome = txtmonthlyincome.Text + " " + ddlcurrency.SelectedValue.ToString();
            }

            if (ddlmaritialstatus.SelectedValue.ToString() != "Single")
            {
                totnoofchild = "";
            }
            else
            {
                totnoofchild = ddlnoofchild.SelectedValue.ToString();
            }
            try
            {
                if (FileUpload1.HasFile)
                {


                    postimage = FileUpload1.FileName;
                    FileUpload1.SaveAs(System.IO.Path.Combine(Server.MapPath("../Picture/"), FileUpload1.FileName));
                    string thumbnailpath = Server.MapPath("../Picture/Thumbnail/" + postimage);

                    if (Request.QueryString["Biodata_id"] != null)
                    {

                        string imagepath = Server.MapPath("../Picture/" + lblimage.Text);
                        string path = Server.MapPath("../Picture/Thumbnail/" + lblimage.Text);
                        if (File.Exists(imagepath))
                        {
                            if (File.Exists(path))
                            {
                                File.Delete(path);
                            }

                            File.Delete(imagepath);

                        }
                        //Stream strm = FileUpload1.PostedFile.InputStream;
                        //var targetFile = thumbnailpath;

                        //ReduceImageSize(0.2, strm, targetFile);
                    }
                    else
                    {
                        postimage = lblimage.Text;
                    }
                }
                else
                {
                    postimage = "";
                }
            }
            catch (Exception ex)
            {
                ex.ToString();
            }
           
                Registrationobj.UpdateBiodata(Biodata_id,
                                            txtname.Text,
                                            DateTime.Parse(txtdob.Text),
                                            timeofbirth,
                                            txtpob.Text,
                                            ddlgender.SelectedValue.ToString(),
                                            txtreligion.Text,
                                            ddlreligion.SelectedItem.ToString(),
                                            ddlsubcaste.SelectedItem.ToString(),
                                            ddlzoradicsign.SelectedValue.ToString(),
                                            height,
                                            txtweight.Text,
                                            ddlbloodgroup.SelectedValue.ToString(),
                                            txtskincomplaction.Text,
                                            ddlmaritialstatus.SelectedValue.ToString(),
                                            totnoofchild,
                                            txtlanguageknow.Text,
                                            txtHobbies.Text,
                                            txtNationality.Text,
                                            txtcurrentaddress.Text,
                                            txtCity.Text,
                                            txtState.Text,
                                            txtCountry.Text,
                                            txtHightestEducation.Text,
                                            txtUniversity.Text,
                                           txtYearofPassing.Text,
                                            txtOccupation.Text,
                                            txtOccupationindetails.Text,
                                           monthlyincome,
                                            txtfathername.Text,
                                            txtmothername.Text,
                                            ddlbrother.Text,
                                            ddlsister.Text,
                                            txtfamilyaddress.Text,
                                            txtfamilycity.Text,
                                            txtfamilystate.Text,
                                           txtfamilycountry.Text,
                                           Mobileno1,
                                           Mobileno2,
                                           txtemailaddress1.Text,
                                           txtemailaddress2.Text,
                                           postimage,
                                           id,
                                           DateTime.Now
                                          );

                int stepIndex = Wizard1.ActiveStepIndex + 1;
                Registrationobj.update_step_track(id, stepIndex.ToString());
                //txtname.Text = "";

                //txtweight.Text = "";
                //txtdob.Text = "";

                //txtreligion.Text = "";

                //txtskincomplaction.Text = "";
                //txtlanguageknow.Text = "";
                //txtHobbies.Text = "";

                //txtNationality.Text = "";
                //txtcurrentaddress.Text = "";
                //txtCity.Text = "";
                //txtState.Text = "";
                //txtCountry.Text = "";
                //txtHightestEducation.Text = "";
                //txtUniversity.Text = "";
                //txtOccupation.Text = "";
                //txtOccupationindetails.Text = "";

                //txtfathername.Text = "";
                //txtmothername.Text = "";

                //txtfamilyaddress.Text = "";
                //txtfamilycity.Text = "";
                //txtfamilystate.Text = "";
                //txtfamilycountry.Text = "";

                //txtMobile2.Text = "";
                //txtMobile1.Text = "";

                //txtemailaddress1.Text = "";
                //txtemailaddress2.Text = "";
                //lblmsg.Visible = true;
                //lblmsg.Text = "Data Updated Successfully";

                // Response.Redirect("Default.aspx");
            }

        catch (Exception ex)
        {
            //lblmsg.Visible = true;
            //lblmsg.Text = ex.ToString();
           Response.Redirect("Default.aspx");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Server Error : Connection Timeout.');", true);
        }
    }
    protected void FinishButton_Click(object sender, EventArgs e)
    {
        //try
        //{
            string timeofbirth = ddlhours.SelectedValue.ToString() + ":" + ddlminut.SelectedValue.ToString() + ":" + ddlsecond.SelectedValue.ToString() + " " + ddl12hour.SelectedValue.ToString();
            string height = ddlfeet.SelectedValue.ToString() + " Feet " + ddlinch.SelectedValue.ToString() + " Inches";
            if (txtMobile1.Text == "")
            {
                Mobileno1 = "";
            }
            else
            {

                Mobileno1 = "+ " + ddlcountrycode1.SelectedValue.ToString() + " " + txtMobile1.Text;

            }
            if (txtMobile2.Text == "")
            {
                Mobileno2 = "";
            }
            else
            {

                Mobileno2 = "+ " + ddlcountrycode2.SelectedValue.ToString() + " " + txtMobile2.Text;
            }

            if (txtmonthlyincome.Text == "")
            {
                monthlyincome = "";
            }
            else
            {

                monthlyincome = txtmonthlyincome.Text + " " + ddlcurrency.SelectedValue.ToString();
            }

            if (ddlmaritialstatus.SelectedValue.ToString() != "Single")
            {
                totnoofchild = "";
            }
            else
            {
                totnoofchild = ddlnoofchild.SelectedValue.ToString();
            }
            //try
            //{
                if (FileUpload1.HasFile)
                {


                    postimage = FileUpload1.FileName;
                   // lblimage.Text = FileUpload1.FileName;
                    FileUpload1.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Picture/"), FileUpload1.FileName));
                    string thumbnailpath = Server.MapPath("~/Picture/Thumbnail/" + postimage);
                    //Create thumbnail for uploaded file and save thumbnail on disk
                    Bitmap Thumbnail = CreateThumbnail(thumbnailpath, 200, 200);
                   // string SaveAsThumbnail = System.IO.Path.Combine(Server.MapPath("~/Picture/Thumbnail/"), FileUpload1.FileName);
                //    Thumbnail.Save(System.IO.Path.Combine(Server.MapPath("~/Picture/Thumbnail/"), postimage));

                    if (Request.QueryString["Biodata_id"] != null)
                    {

                        string imagepath = Server.MapPath("~/Picture/" + lblimage.Text);
                        string path = Server.MapPath("~/Picture/Thumbnail/" + lblimage.Text);
                        if (File.Exists(imagepath))
                        {
                            if (File.Exists(path))
                            {
                                File.Delete(path);
                            }

                            File.Delete(imagepath);

                        }
                        //Stream strm = FileUpload1.PostedFile.InputStream;
                        //var targetFile = thumbnailpath;

                        //ReduceImageSize(0.2, strm, targetFile);
                    }
                    else
                    {
                        postimage = lblimage.Text;
                    }
                }
                else
                {
                    postimage = lblimage.Text;
                }
            //}
            //catch (Exception ex)
            //{
            //    ex.ToString();
            //}
            Registrationobj.UpdateBiodata(Biodata_id,
                                        txtname.Text,
                                        DateTime.Parse(txtdob.Text),
                                        timeofbirth,
                                        txtpob.Text,
                                        ddlgender.SelectedValue.ToString(),
                                        txtreligion.Text,
                                        ddlreligion.SelectedItem.ToString(),
                                      ddlsubcaste.SelectedItem.ToString(),
                                        ddlzoradicsign.SelectedValue.ToString(),
                                        height,
                                        txtweight.Text,
                                        ddlbloodgroup.SelectedValue.ToString(),
                                        txtskincomplaction.Text,
                                        ddlmaritialstatus.SelectedValue.ToString(),
                                        totnoofchild,
                                        txtlanguageknow.Text,
                                        txtHobbies.Text,
                                        txtNationality.Text,
                                        txtcurrentaddress.Text,
                                        txtCity.Text,
                                        txtState.Text,
                                        txtCountry.Text,
                                        txtHightestEducation.Text,
                                        txtUniversity.Text,
                                       txtYearofPassing.Text,
                                        txtOccupation.Text,
                                        txtOccupationindetails.Text,
                                       monthlyincome,
                                        txtfathername.Text,
                                        txtmothername.Text,
                                        ddlbrother.Text,
                                        ddlsister.Text,
                                        txtfamilyaddress.Text,
                                        txtfamilycity.Text,
                                        txtfamilystate.Text,
                                       txtfamilycountry.Text,
                                       Mobileno1,
                                       Mobileno2,
                                       txtemailaddress1.Text,
                                       txtemailaddress2.Text,
                                       postimage,
                                       id,
                                       DateTime.Now
                                      );
            int stepIndex = Wizard1.ActiveStepIndex + 1;
            Registrationobj.update_step_track(id, stepIndex.ToString());
            //txtname.Text = "";

            //txtweight.Text = "";
            //txtdob.Text = "";

            //txtreligion.Text = "";

            //txtskincomplaction.Text = "";
            //txtlanguageknow.Text = "";
            //txtHobbies.Text = "";

            //txtNationality.Text = "";
            //txtcurrentaddress.Text = "";
            //txtCity.Text = "";
            //txtState.Text = "";
            //txtCountry.Text = "";
            //txtHightestEducation.Text = "";
            //txtUniversity.Text = "";
            //txtOccupation.Text = "";
            //txtOccupationindetails.Text = "";

            //txtfathername.Text = "";
            //txtmothername.Text = "";

            //txtfamilyaddress.Text = "";
            //txtfamilycity.Text = "";
            //txtfamilystate.Text = "";
            //txtfamilycountry.Text = "";

            //txtMobile2.Text = "";
            //txtMobile1.Text = "";

            //txtemailaddress1.Text = "";
            //txtemailaddress2.Text = "";
            //lblmsg.Visible = true;
            //lblmsg.Text = "Data Updated Successfully";

             Response.Redirect("Default.aspx");

        //}
        //catch (Exception ex)
        //{
        //    //lblmsg.Visible = true;
        //    //lblmsg.Text = ex.ToString();
        //    Response.Redirect("Default.aspx");
        //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Notify", "alert('Server Error : Connection Timeout.');", true);
        //}
    }
    private void ReduceImageSize(double scaleFactor, Stream sourcePath, string targetPath)
    {
        using (var image = System.Drawing.Image.FromStream(sourcePath))
        {
            var newWidth = (int)(image.Width * scaleFactor);
            var newHeight = (int)(image.Height * scaleFactor);
            var thumbnailImg = new Bitmap(newWidth, newHeight);
            var thumbGraph = Graphics.FromImage(thumbnailImg);
            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
            var imageRectangle = new Rectangle(0, 0, newWidth, newHeight);
            thumbGraph.DrawImage(image, imageRectangle);
            thumbnailImg.Save(targetPath, image.RawFormat);
        }
    }
    protected void Wizard1_Load(object sender, EventArgs e)
    {

    }
    protected void Wizard1_ActiveStepChanged1(object sender, EventArgs e)
    {

        
    }
    protected void SideBarList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            indexid = Registrationobj.getstepindex(id);
            Wizard1.ActiveStepIndex = indexid;
        }
        catch(Exception ex)
        {

        }
    }
    protected void FinishPreviousButton_Click(object sender, EventArgs e)
    {
        //Wizard1.ActiveStepIndex = indexid - 1;
    }
    protected void Wizard1_PreviousButtonClick(object sender, WizardNavigationEventArgs e)
    {
        flagprev = 1;
        int stepIndex = Wizard1.ActiveStepIndex - 1;
        Registrationobj.update_step_track(id, stepIndex.ToString());
    }
    protected void ddlreligion_SelectedIndexChanged(object sender, EventArgs e)
    {

        bindsubcast(Convert.ToInt32(ddlreligion.SelectedValue.ToString()));
    }

    public void bindsubcast(int caste_ID)
    {
        DataSet ds = Registrationobj.getsubcatbyCaste_ID(caste_ID);
        ddlsubcaste.DataSource = ds.Tables[0];
        ddlsubcaste.DataTextField = "Subcaste_name";
        ddlsubcaste.DataValueField = "Subcaste_ID";
        ddlsubcaste.DataBind();
    }
}