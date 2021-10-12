using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Post : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath, postimage, filename;
    int  randomdigit;
    public static int Biodata_id, id;
    DataSet ds;
    string Mobileno1, Mobileno2, totnoofchild, monthlyincome, YearofPassing;
    string searchid, finalString, Images, Photo;

    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {

            id = Convert.ToInt32(idCookie.Value);
            if (!IsPostBack)
            {
                Bindddl();
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
            ddlgender.SelectedValue = ds.Tables[0].Rows[i]["Gender"].ToString();
            txtdob.Text = Convert.ToDateTime(ds.Tables[0].Rows[i]["Date_of_Birth"]).ToString("yyyy-MM-dd");
            txtpob.Text = ds.Tables[0].Rows[i]["Place_of_Birth"].ToString();
            txtreligion.Text = ds.Tables[0].Rows[i]["Religion"].ToString();
            ddlzoradicsign.SelectedValue = ds.Tables[0].Rows[i]["Zodiac_Sign"].ToString();
            txtweight.Text = ds.Tables[0].Rows[i]["Weight"].ToString();
            ddlbloodgroup.SelectedValue = ds.Tables[0].Rows[i]["Blood_group"].ToString();
            txtskincomplaction.Text = ds.Tables[0].Rows[i]["Skin_complaction"].ToString();
            ddlmaritialstatus.SelectedValue = ds.Tables[0].Rows[i]["Maritial_Status"].ToString();
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
            btnsubmit.Text = "Update";
        }

    }

    private static Random random = new Random();
    public static string RandomString(int length)
    {
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
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
        try
        {

            if (FileUpload1.HasFile)
            {
                //if (FileUpload2.HasFile)
                //{

                //    foreach (HttpPostedFile uploadedFile in FileUpload2.PostedFiles)
                //    {
                //        //filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                //        string storedb = "Images/" + filename + "";
                //        string targetPath = Server.MapPath("~/Picture/" + filename);

                //        string folderPath = Server.MapPath("~/Picture/");

                //        //Check whether Directory (Folder) exists.
                //        if (!Directory.Exists(folderPath))
                //        {
                //            //If Directory (Folder) does not exists. Create it.
                //            Directory.CreateDirectory(folderPath);
                //        }

                //        string ext = Path.GetExtension(targetPath).ToLower();
                //        // if(ext != "png" && ext != "jpg")
                //        // {
                //        //    ltStatusText.Text += "File-<b>" + uploadedFile.FileName + "</b> wrong file type, not uploaded.<br>";
                //        // }
                //        // else
                //        //{ 
                //        uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Picture/"), uploadedFile.FileName));
                //        filename += String.Format("{0},", uploadedFile.FileName);
                //        //}

                //    }
                //   Images = filename;
                //   string[] values = Images.Split(',');
                //    for (int i = 0; i < values.Length; i++)
                //    {
                //        values[i] = values[i].Trim();


                //    }

                //     //  DateTime missingsince = DateTime.ParseExact(txtmissing_since.Text, "dd/MM/yyyy", null);
                //}


                postimage = FileUpload1.FileName;
                FileUpload1.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Picture/"), FileUpload1.FileName));
                string thumbnailpath = Server.MapPath("~/Picture/Thumbnail/" + postimage);
               
                if (btnsubmit.Text == "Update")
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
        catch(Exception ex)
        {
            ex.ToString();
        }
        if (ddlmaritialstatus.SelectedValue.ToString() != "Single")
        {
            totnoofchild = "";
        }
        else
        {
            totnoofchild = ddlnoofchild.SelectedValue.ToString();
        }
        string Visibility_Flag = "True";
        if (btnsubmit.Text == "Submit")
        {
            try
            {
                Registrationobj.PostBiodata(id,
                                            txtname.Text,
                                            DateTime.Parse(txtdob.Text),
                                            timeofbirth,
                                            txtpob.Text,
                                            ddlgender.SelectedValue.ToString(),
                                            txtreligion.Text,
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
                txtname.Text = "";

                txtweight.Text = "";
                txtdob.Text = "";

                txtreligion.Text = "";

                txtskincomplaction.Text = "";
                txtlanguageknow.Text = "";
                txtHobbies.Text = "";

                txtNationality.Text = "";
                txtcurrentaddress.Text = "";
                txtCity.Text = "";
                txtState.Text = "";
                txtCountry.Text = "";
                txtHightestEducation.Text = "";
                txtUniversity.Text = "";
                txtOccupation.Text = "";
                txtOccupationindetails.Text = "";

                txtfathername.Text = "";
                txtmothername.Text = "";

                txtfamilyaddress.Text = "";
                txtfamilycity.Text = "";
                txtfamilystate.Text = "";
                txtfamilycountry.Text = "";

                txtMobile2.Text = "";
                txtMobile1.Text = "";

                txtemailaddress1.Text = "";
                txtemailaddress2.Text = "";
                lblmsg.Visible = true;
                lblmsg.Text = "Data Submited Successfully";



            }
            catch (Exception ex)
            {
                lblmsg.Visible = true;
                lblmsg.Text = ex.ToString();
            }
            Response.Redirect("Default.aspx");

        }
        else if (btnsubmit.Text == "Update")
        {
            try
            {
                Registrationobj.UpdateBiodata(Biodata_id,
                                            txtname.Text,
                                            DateTime.Parse(txtdob.Text),
                                            timeofbirth,
                                            txtpob.Text,
                                            ddlgender.SelectedValue.ToString(),
                                            txtreligion.Text,
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
                lblmsg.Visible = true;
                lblmsg.Text = "Data Updated Successfully";

                Response.Redirect("Default.aspx");

            }
            catch (Exception ex)
            {
                lblmsg.Visible = true;
                lblmsg.Text = ex.ToString();
            }
        }

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
    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Bindcityddl(ddlstate.SelectedValue.ToString());
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        string name = txtname.Text;
        string[] valuesname = name.Split(' ');
        for (int i = 0; i < valuesname.Length; i++)
        {
            valuesname[i] = valuesname[i].Trim();


        }
        string id = "6000";
        int idcount = id.ToString().Length;
        if (idcount > 0)
        {
            randomdigit = idcount - 7;

            finalString = RandomString(Math.Abs(randomdigit));
        }
        string searchid = valuesname[0].ToString() + "" + id + "" + finalString;

    }
}