using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewProfile : System.Web.UI.Page
{
    Registration.Registration Registrationobj = new Registration.Registration();
    string Videostrname = "", Videoextension, videopath, postimage, filename;
    int id;
    DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie nameCookie = Request.Cookies["Name"];
        HttpCookie idCookie = Request.Cookies["id"];
        if (nameCookie != null)
        {
            id = Convert.ToInt32(idCookie.Value);
            if (!IsPostBack)
            {
               loaddata();
            }
        }
        else if (Session["id"] != null)
        {
            id = Convert.ToInt32(Session["id"].ToString());
            //txtpostedby.Text = Session["Fname"].ToString();
            if (!IsPostBack)
            {
                loaddata();
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    public void loaddata()
    {
        ds = Registrationobj.getregistrationbyid(id);
        //rptdata.DataSource = ds;
        //rptdata.DataBind();
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            txtfname.Text = ds.Tables[0].Rows[i]["fname"].ToString();
            txtlname.Text = ds.Tables[0].Rows[i]["lname"].ToString();
            txtUserID.Text = ds.Tables[0].Rows[i]["UserID"].ToString();
            txtPhoneno.Text = ds.Tables[0].Rows[i]["Phoneno"].ToString();
          
            btnsend.Text = "Update";
        }
            
    }
    protected void btnsend_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {

            foreach (HttpPostedFile uploadedFile in FileUpload1.PostedFiles)
            {
                //filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string storedb = "Images/" + filename + "";
                string targetPath = Server.MapPath("~/Picture/" + filename);

                string folderPath = Server.MapPath("~/Picture/");

                //Check whether Directory (Folder) exists.
                if (!Directory.Exists(folderPath))
                {
                    //If Directory (Folder) does not exists. Create it.
                    Directory.CreateDirectory(folderPath);
                }
                uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/Picture/"), uploadedFile.FileName));
                filename += String.Format("{0},", uploadedFile.FileName);
            }
            string s = filename;
            string[] values = s.Split(',');
            for (int i = 0; i < values.Length; i++)
            {
                values[i] = values[i].Trim();


            }

            string pic = values[0].ToString();
            string thumbnailpath = Server.MapPath("~/Picture/Thumbnail/" + pic);
            Stream strm = FileUpload1.PostedFile.InputStream;
            var targetFile = thumbnailpath;

            ReduceImageSize(0.2, strm, targetFile);
            Registrationobj.Updateprofile(id,
                                         txtfname.Text,
                                         txtlname.Text,
                                         txtUserID.Text,
                                         txtPhoneno.Text,
                                         FileUpload1.FileName,
                                         DateTime.Now
                                         );
            txtfname.Text = "";
            txtlname.Text = "";
            txtpassword.Text = "";
            txtPhoneno.Text = "";
            txtUserID.Text = "";
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
}