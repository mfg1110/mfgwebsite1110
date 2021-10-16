using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Registration
{
    /// <summary>
    /// Summary description for Registration
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Registration : System.Web.Services.WebService
    {
        int Biodata_id = 0;
        int indexid;
        int id, YearofPassing, randomdigit;
        string searchid, finalString, Images, Photo;
        DataSet ds;
        public Registration()
        {

            //Uncomment the following line if using designed components 
            //InitializeComponent(); 
        }
        [WebMethod]
        public int Register_Data(string fname, string lname, string UserID, string Phoneno, string password, string token, string ActivationCode,string status,string profilefor, DateTime CreatedByDateTime, DateTime ModifyByDateTime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Ranasamaj_Registration", conn);
            conn.Open();

            
            SqlDataReader dr = cmd1.ExecuteReader();
            int id = 0;
            
            while (dr.Read())
            {

                id = dr.GetInt32(0);

              
            }
            id = id + 1;
            dr.Close();
            SqlCommand cmdtoken1 = new SqlCommand("select * from Token_Service", conn);

            SqlDataReader drtoken = cmdtoken1.ExecuteReader();
            int UserId = 0;

            while (drtoken.Read())
            {

                UserId = drtoken.GetInt32(0);


            }
            UserId = UserId + 1;
            conn.Close();
            string message = string.Empty;

            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var stringChars = new char[16];
            var random = new Random();

            for (int j = 0; j < stringChars.Length; j++)
            {
                stringChars[j] = chars[random.Next(chars.Length)];
            }

            var finalString = new String(stringChars);
            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Ranasamaj_Registration(id,fname,lname,UserID,Phoneno,password,status,profilefor,CreatedByDateTime,ModifyByDateTime) VALUES (@id,@fname,@lname,@UserID,@Phoneno,@password,@status,@profilefor,@CreatedByDateTime,@ModifyByDateTime)"))
                {
                    SqlCommand cmdtoken = new SqlCommand("insert into UserActivation(UserId,id,ActivationCode) values(" + UserId + ",'" + id + "','" + ActivationCode + "')", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@fname", fname);
                    cmd.Parameters.AddWithValue("@lname", lname);
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    cmd.Parameters.AddWithValue("@Phoneno", Phoneno);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@status", status);
                    cmd.Parameters.AddWithValue("@profilefor", profilefor);
                    cmd.Parameters.AddWithValue("@CreatedByDateTime", CreatedByDateTime);
                    cmd.Parameters.AddWithValue("@ModifyByDateTime", ModifyByDateTime);

                    cmdtoken.Parameters.AddWithValue("@UserId", UserId);
                    cmdtoken.Parameters.AddWithValue("@id", id);
                    cmdtoken.Parameters.AddWithValue("@ActivationCode", ActivationCode);
                    cmd.Connection = con;
                    cmdtoken.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmdtoken.ExecuteNonQuery();
                    con.Close();
                }
            }
            return id;
        }

        [WebMethod]
        public void Changepassword(int ID, string password, DateTime ModifyByDateTime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Ranasamaj_Registration SET password=@password,ModifyByDateTime=@ModifyByDateTime WHERE id=@id"))
                {
                    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                    var stringChars = new char[16];
                    var random = new Random();

                    for (int j = 0; j < stringChars.Length; j++)
                    {
                        stringChars[j] = chars[random.Next(chars.Length)];
                    }

                    var finalString = new String(stringChars);
                    SqlCommand cmdtoken = new SqlCommand("UPDATE Token_Service SET Token=@Token WHERE id=@id", con);
                    cmdtoken.Parameters.AddWithValue("@id", ID);
                    cmdtoken.Parameters.AddWithValue("@Token", finalString);

                    cmd.Parameters.AddWithValue("@id", ID);
                    
                    cmd.Parameters.AddWithValue("@password", password);
                   
                    cmd.Parameters.AddWithValue("@ModifyByDateTime", ModifyByDateTime);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmdtoken.ExecuteNonQuery();
                    con.Close();
                }
            }
           
        }

        [WebMethod]
        public void deletesteptrack(int id)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("delete step_track_tb  WHERE id=@id"))
                {
                    cmd.Parameters.AddWithValue("@id", id);

                   
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                  
                    con.Close();
                }
            }

        }

        [WebMethod]
        public void Updatevisibilityflag(int id, string Visibility_Flag, DateTime ModifyByDateTime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Biodata SET Visibility_Flag=@Visibility_Flag,ModifyByDateTime=@ModifyByDateTime WHERE id=@id"))
                {
                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.Parameters.AddWithValue("@Visibility_Flag", Visibility_Flag);

                    cmd.Parameters.AddWithValue("@ModifyByDateTime", ModifyByDateTime);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            deletesteptrack(id);

        }


        [WebMethod]
        public void Updateprofile(int id,string fname, string lname, string UserID, string Phoneno, string Picture, DateTime ModifyByDateTime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Ranasamaj_Registration SET fname=@fname,lname=@lname,UserID=@UserID,Phoneno=@Phoneno,picture=@picture,ModifyByDateTime=@ModifyByDateTime WHERE id=@id"))
                {
                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.Parameters.AddWithValue("@fname", fname);
                    cmd.Parameters.AddWithValue("@lname", lname);
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    cmd.Parameters.AddWithValue("@Phoneno", Phoneno);
                    cmd.Parameters.AddWithValue("@picture", Picture);
                    cmd.Parameters.AddWithValue("@ModifyByDateTime", ModifyByDateTime);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

        }
        [WebMethod]
        public int PostBiodata(int id, string Name, DateTime Date_of_Birth, string Time_of_Birth, string Place_of_Birth, string Age, string Gender, string Religion, string Cast, string Subcast, string Zodiac_Sign, string Height, string Weight, string Blood_group, string Skin_complaction, string Maritial_Status, string No_of_child, string Language_Know, string Hobbies, string Nationality, string Current_Address, string Current_city, string Current_state, string Current_country, string Hightest_Education, string University, string Year_of_Passing, string Occupation, string Occupation_in_details, string Monthly_Income, string Father_Name, string Father_Occupation, string Mother_Name, string Mother_Occupation, string Brother, string Sister, string Family_Address, string Family_add_city, string Family_add_state, string Family_add_country, string Home_Mobile1, string Home_Mobile2, string Home_Mobile3, string Email_Address_1, string Email_Address_2, string Photo, string country, string Visibility_Flag, string images, int CreatedBy, int ModifyBy, DateTime CreatedByDateTime, DateTime ModifyByDateTime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Biodata", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
           

            while (dr.Read())
            {

                Biodata_id = dr.GetInt32(0);


            }
            Biodata_id = Biodata_id + 1;
            conn.Close();
            string s = images;
            string[] values = s.Split(',');
            for (int i = 0; i < values.Length; i++)
            {
                values[i] = values[i].Trim();

                if (values[i] != "")
                {

                    InsertImage(Biodata_id, values[i]);
                }
            }

            //generate searchid

            string name = Name;
            string[] valuesname = name.Split(' ');
            for (int i = 0; i < valuesname.Length; i++)
            {
                valuesname[i] = valuesname[i].Trim();


            }
            string regid = Biodata_id.ToString();
            int idcount = regid.ToString().Length;
            if (idcount > 0)
            {
                randomdigit = idcount - 7;

                finalString = RandomString(Math.Abs(randomdigit));
            }
            string searchid =  Biodata_id + "" + finalString;

            //string pic = values[0].ToString();
            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Biodata(Biodata_id,id,Search_ID,Name,Date_of_Birth,Time_of_Birth,Place_of_Birth,Age,Gender,Religion,Cast,Subcast,Zodiac_Sign,Height,Weight,Blood_group,Skin_complaction,Maritial_Status,No_of_child,Language_Know,Hobbies,Nationality,Current_Address,Current_city,Current_state,Current_country,Hightest_Education,University,Year_of_Passing,Occupation,Occupation_in_details,Monthly_Income,Father_Name,Father_Occupation,Mother_Name,Mother_Occupation,Brother,Sister,Family_Address,Family_add_city,Family_add_state,Family_add_country,Home_Mobile1,Home_Mobile2,Home_Mobile3,Email_Address_1,Email_Address_2,Photo,country,Visibility_Flag,Deactivate_flag,CreatedBy,ModifyBy,CreatedByDateTime,ModifyByDateTime) VALUES (@Biodata_id,@id,@Search_ID,@Name,@Date_of_Birth,@Time_of_Birth,@Place_of_Birth,@Age,@Gender,@Religion,@Cast,@Subcast,@Zodiac_Sign,@Height,@Weight,@Blood_group,@Skin_complaction,@Maritial_Status,@No_of_child,@Language_Know,@Hobbies,@Nationality,@Current_Address,@Current_city,@Current_state,@Current_country,@Hightest_Education,@University,@Year_of_Passing,@Occupation,@Occupation_in_details,@Monthly_Income,@Father_Name,@Father_Occupation,@Mother_Name,@Mother_Occupation,@Brother,@Sister,@Family_Address,@Family_add_city,@Family_add_state,@Family_add_country,@Home_Mobile1,@Home_Mobile2,@Home_Mobile3,@Email_Address_1,@Email_Address_2,@Photo,@country,@Visibility_Flag,@Deactivate_flag,@CreatedBy,@ModifyBy,@CreatedByDateTime,@ModifyByDateTime)"))
                {
                    cmd.Parameters.AddWithValue("@Biodata_id", Biodata_id);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@Search_ID", searchid);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Date_of_Birth", Date_of_Birth);
                    cmd.Parameters.AddWithValue("@Time_of_Birth", Time_of_Birth);
                    cmd.Parameters.AddWithValue("@Place_of_Birth", Place_of_Birth);
                    cmd.Parameters.AddWithValue("@Age", Age);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    cmd.Parameters.AddWithValue("@Religion", Religion);
                    cmd.Parameters.AddWithValue("@Cast", Cast);
                    cmd.Parameters.AddWithValue("@Subcast", Subcast);
                    cmd.Parameters.AddWithValue("@Zodiac_Sign", Zodiac_Sign);
                    cmd.Parameters.AddWithValue("@Height", Height);
                    cmd.Parameters.AddWithValue("@Weight", Weight);
                    cmd.Parameters.AddWithValue("@Blood_group", Blood_group);
                    cmd.Parameters.AddWithValue("@Skin_complaction", Skin_complaction);
                    cmd.Parameters.AddWithValue("@Maritial_Status", Maritial_Status);
                    cmd.Parameters.AddWithValue("@No_of_child", No_of_child);
                    cmd.Parameters.AddWithValue("@Language_Know", Language_Know);
                    cmd.Parameters.AddWithValue("@Hobbies", Hobbies);
                    cmd.Parameters.AddWithValue("@Nationality", Nationality);
                    cmd.Parameters.AddWithValue("@Current_Address", Current_Address);
                    cmd.Parameters.AddWithValue("@Current_city", Current_city);
                    cmd.Parameters.AddWithValue("@Current_state", Current_state);
                    cmd.Parameters.AddWithValue("@Current_country", Current_country);
                    cmd.Parameters.AddWithValue("@Hightest_Education", Hightest_Education);
                    cmd.Parameters.AddWithValue("@University", University);
                    cmd.Parameters.AddWithValue("@Year_of_Passing", Year_of_Passing);
                    cmd.Parameters.AddWithValue("@Occupation", Occupation);
                    cmd.Parameters.AddWithValue("@Occupation_in_details", Occupation_in_details);
                    cmd.Parameters.AddWithValue("@Monthly_Income", Monthly_Income);
                    cmd.Parameters.AddWithValue("@Father_Name", Father_Name);
                    cmd.Parameters.AddWithValue("@Father_Occupation", Father_Occupation);
                    cmd.Parameters.AddWithValue("@Mother_Name", Mother_Name);
                    cmd.Parameters.AddWithValue("@Mother_Occupation", Mother_Occupation);
                    cmd.Parameters.AddWithValue("@Brother", Brother);
                    cmd.Parameters.AddWithValue("@Sister", Sister);
                    cmd.Parameters.AddWithValue("@Family_Address", Family_Address);
                    cmd.Parameters.AddWithValue("@Family_add_city", Family_add_city);
                    cmd.Parameters.AddWithValue("@Family_add_state", Family_add_state);
                    cmd.Parameters.AddWithValue("@Family_add_country", Family_add_country);
                    cmd.Parameters.AddWithValue("@Home_Mobile1", Home_Mobile1);
                    cmd.Parameters.AddWithValue("@Home_Mobile2", Home_Mobile2);
                    cmd.Parameters.AddWithValue("@Home_Mobile3", Home_Mobile3);
                    cmd.Parameters.AddWithValue("@Email_Address_1", Email_Address_1);
                    cmd.Parameters.AddWithValue("@Email_Address_2", Email_Address_2);
                    cmd.Parameters.AddWithValue("@Photo", Photo);
                    cmd.Parameters.AddWithValue("@country", country);
                    cmd.Parameters.AddWithValue("@Visibility_Flag", Visibility_Flag);
                    cmd.Parameters.AddWithValue("@Deactivate_flag", "false");   
                    cmd.Parameters.AddWithValue("@CreatedBy", id);
                    cmd.Parameters.AddWithValue("@ModifyBy", ModifyBy);
                    cmd.Parameters.AddWithValue("@CreatedByDateTime", CreatedByDateTime);
                    cmd.Parameters.AddWithValue("@ModifyByDateTime", ModifyByDateTime);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return Biodata_id;
                }

            }
           
        }

        [WebMethod]
        public void UpdateBiodata(int Biodata_id, string Name, DateTime Date_of_Birth, string Time_of_Birth, string Place_of_Birth, string Age, string Gender, string Religion, string Cast, string Subcast, string Zodiac_Sign, string Height, string Weight, string Blood_group, string Skin_complaction, string Maritial_Status, string No_of_child, string Language_Know, string Hobbies, string Nationality, string Current_Address, string Current_city, string Current_state, string Current_country, string Hightest_Education, string University, string Year_of_Passing, string Occupation, string Occupation_in_details, string Monthly_Income, string Father_Name, string Father_Occupation, string Mother_Name, string Mother_Occupation, string Brother, string Sister, string Family_Address, string Family_add_city, string Family_add_state, string Family_add_country, string Home_Mobile1, string Home_Mobile2, string Email_Address_1, string Email_Address_2, string Photo, int ModifyBy, DateTime ModifyByDateTime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;


            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Biodata SET Name=@Name,Date_of_Birth=@Date_of_Birth,Time_of_Birth=@Time_of_Birth,Place_of_Birth=@Place_of_Birth,Age=@Age,Gender=@Gender,Religion=@Religion,Cast=@Cast,Subcast=@Subcast,Zodiac_Sign=@Zodiac_Sign,Height=@Height,Weight=@Weight,Blood_group=@Blood_group,Skin_complaction=@Skin_complaction,Maritial_Status=@Maritial_Status,No_of_child=@No_of_child,Language_Know=@Language_Know,Hobbies=@Hobbies,Nationality=@Nationality,Current_Address=@Current_Address,Current_city=@Current_city,Current_state=@Current_state,Current_country=@Current_country,Hightest_Education=@Hightest_Education,University=@University,Year_of_Passing=@Year_of_Passing,Occupation=@Occupation,Occupation_in_details=@Occupation_in_details,Monthly_Income=@Monthly_Income,Father_Name=@Father_Name,Father_Occupation=@Father_Occupation,Mother_Name=@Mother_Name,Mother_Occupation=@Mother_Occupation,Brother=@Brother,Sister=@Sister,Family_Address=@Family_Address,Family_add_city=@Family_add_city,Family_add_state=@Family_add_state,Family_add_country=@Family_add_country,Home_Mobile1=@Home_Mobile1,Home_Mobile2=@Home_Mobile2,Email_Address_1=@Email_Address_1,Email_Address_2=@Email_Address_2,Photo=@Photo,ModifyBy=@ModifyBy,ModifyByDateTime=@ModifyByDateTime WHERE Biodata_id=@Biodata_id"))
                {
           
                    cmd.Parameters.AddWithValue("@Biodata_id", Biodata_id);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Date_of_Birth", Date_of_Birth);
                    cmd.Parameters.AddWithValue("@Time_of_Birth", Time_of_Birth);
                    cmd.Parameters.AddWithValue("@Place_of_Birth", Place_of_Birth);
                    cmd.Parameters.AddWithValue("@Age", Age);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    cmd.Parameters.AddWithValue("@Religion", Religion);
                    cmd.Parameters.AddWithValue("@Cast", Cast);
                    cmd.Parameters.AddWithValue("@Subcast", Subcast);
                    cmd.Parameters.AddWithValue("@Zodiac_Sign", Zodiac_Sign);
                    cmd.Parameters.AddWithValue("@Height", Height);
                    cmd.Parameters.AddWithValue("@Weight", Weight);
                    cmd.Parameters.AddWithValue("@Blood_group", Blood_group);
                    cmd.Parameters.AddWithValue("@Skin_complaction", Skin_complaction);
                    cmd.Parameters.AddWithValue("@Maritial_Status", Maritial_Status);
                    cmd.Parameters.AddWithValue("@No_of_child", No_of_child);
                    cmd.Parameters.AddWithValue("@Language_Know", Language_Know);
                    cmd.Parameters.AddWithValue("@Hobbies", Hobbies);
                    cmd.Parameters.AddWithValue("@Nationality", Nationality);
                    cmd.Parameters.AddWithValue("@Current_Address", Current_Address);
                    cmd.Parameters.AddWithValue("@Current_city", Current_city);
                    cmd.Parameters.AddWithValue("@Current_state", Current_state);
                    cmd.Parameters.AddWithValue("@Current_country", Current_country);
                    cmd.Parameters.AddWithValue("@Hightest_Education", Hightest_Education);
                    cmd.Parameters.AddWithValue("@University", University);
                    cmd.Parameters.AddWithValue("@Year_of_Passing", Year_of_Passing);
                    cmd.Parameters.AddWithValue("@Occupation", Occupation);
                    cmd.Parameters.AddWithValue("@Occupation_in_details", Occupation_in_details);
                    cmd.Parameters.AddWithValue("@Monthly_Income", Monthly_Income);
                    cmd.Parameters.AddWithValue("@Father_Name", Father_Name);
                    cmd.Parameters.AddWithValue("@Father_Occupation", Father_Occupation);
                    cmd.Parameters.AddWithValue("@Mother_Name", Mother_Name);
                    cmd.Parameters.AddWithValue("@Mother_Occupation", Mother_Occupation);
                    cmd.Parameters.AddWithValue("@Brother", Brother);
                    cmd.Parameters.AddWithValue("@Sister", Sister);
                    cmd.Parameters.AddWithValue("@Family_Address", Family_Address);
                    cmd.Parameters.AddWithValue("@Family_add_city", Family_add_city);
                    cmd.Parameters.AddWithValue("@Family_add_state", Family_add_state);
                    cmd.Parameters.AddWithValue("@Family_add_country", Family_add_country);
                    cmd.Parameters.AddWithValue("@Home_Mobile1", Home_Mobile1);
                    cmd.Parameters.AddWithValue("@Home_Mobile2", Home_Mobile2);
    
                    cmd.Parameters.AddWithValue("@Email_Address_1", Email_Address_1);
                    cmd.Parameters.AddWithValue("@Email_Address_2", Email_Address_2);
                    cmd.Parameters.AddWithValue("@Photo", Photo);
                   
                    cmd.Parameters.AddWithValue("@ModifyBy", ModifyBy);
             
                    cmd.Parameters.AddWithValue("@ModifyByDateTime", ModifyByDateTime);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

        }

        [WebMethod]
        public void deactivate(string Deactivate_flag,int id)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;


            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Biodata SET Deactivate_flag=@Deactivate_flag WHERE id=@id"))
                {

                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.Parameters.AddWithValue("@Deactivate_flag", Deactivate_flag);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

        }

        private static Random random = new Random();
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }


        public void InsertImage(int Biodata_id, string image)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Image_tb", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int imageid = 0;

            while (dr.Read())
            {

                imageid = dr.GetInt32(0);


            }
            imageid = imageid + 1;
            dr.Close();
            
            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Image_tb(imageid,Biodata_id,image) VALUES (@imageid,@Biodata_id,@image)"))
                {
                    cmd.Parameters.AddWithValue("@imageid", imageid);
                    cmd.Parameters.AddWithValue("@Biodata_id", Biodata_id);
                    cmd.Parameters.AddWithValue("@image", image);
                   
                    cmd.Connection = con;
                 
                    con.Open();
                    cmd.ExecuteNonQuery();
                 
                    con.Close();
                }
            }
         
        }


        [WebMethod]
        public DataSet getimagesbybiodata_id(int Biodata_id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Image_tb where Biodata_id=@Biodata_id", con);
            cmd.Parameters.AddWithValue("@Biodata_id", Biodata_id);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getregistrationdetail()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Ranasamaj_Registration reg", con);
            //,Token_Service ts where reg.id=ts.id

            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getregistrationdetailbyemail(string email)
        {
            try { 
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Ranasamaj_Registration where UserID=@email", con);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;
            }
            catch (Exception ex)
            {
                DataSet dserror = new DataSet();
                dserror = error();
                return dserror;

            }

        }

        [WebMethod]
        public DataSet getbiodatadetail(int id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Biodata where Visibility_Flag='true' and Deactivate_flag='false' and id!=@id  ORDER BY CreatedByDateTime desc", con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getbiodatadetail()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Biodata where Visibility_Flag='true'", con);
         
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getbiodatadetailbysearch(string search)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Biodata where Visibility_Flag='True' and Name like '%" + search + "%' OR Visibility_Flag='True' and Search_ID LIKE '%" + search + "%' OR Visibility_Flag='True' and Current_city LIKE '%" + search + "%'", con);
         
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getbiodatadetailbysearchbygender(string search)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Biodata where Visibility_Flag='True' and Gender=@Gender", con);
            cmd.Parameters.AddWithValue("@Gender", search);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getbiodatadetailbySearch_ID(string Search_ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from [admin_matrimonyforgujarati].[db_matrimonyforgujarati].[Biodata] bd,[admin_matrimonyforgujarati].[db_matrimonyforgujarati].[Star_tb] st where bd.Visibility_Flag='True' and bd.Zodiac_Sign=st.Star_id and bd.Search_ID = @Search_ID", con);
            cmd.Parameters.AddWithValue("@Search_ID", Search_ID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getbiodatadetailbyBiodata_id(int Biodata_id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Biodata bio,Caste_tb ct,Subcaste_tb st where Visibility_Flag='True' and ct.Caste_name=bio.cast and st.Subcaste_name=bio.Subcast and ct.Caste_ID=st.Caste_ID and bio.Biodata_id=@Biodata_id", con);
            cmd.Parameters.AddWithValue("@Biodata_id", Biodata_id);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getregistrationbyid(int id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Ranasamaj_Registration where id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getregistrationbyname(int id,string name)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Ranasamaj_Registration where id=@id and fname like '%" + name + "%' and lname like '%" + name + "%'", con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }
        [WebMethod]
        public DataSet getbiodatabyregid(int id)
        {

           
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Biodata bio,Ranasamaj_Registration reg where Visibility_Flag='true' and reg.id=bio.id and reg.id=@id", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                con.Close();

                // Create an instance of DataSet.
                DataSet ds = new DataSet();
                da.Fill(ds);
           // Return the DataSet as an XmlElement.
                //XmlDataDocument xmldata = new XmlDataDocument(ds);
                //XmlElement xmlElement = xmldata.DocumentElement;
                return ds;
           
          

        }

        public DataSet error()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            DataColumn Coulumn = new DataColumn("Error", Type.GetType("System.String"));
            DataSet dserror = new DataSet();
            dt.Columns.Add(Coulumn);

            dr = dt.NewRow();
            dr["Error"] = "Error!!";
            dt.Rows.Add(dr);

            dserror.Tables.Add(dt);
            return dserror;
        }


        [WebMethod]
        public void Post_feedback(string email, string description)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from feedback_tb", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int feedbackid = 0;

            while (dr.Read())
            {

                feedbackid = dr.GetInt32(0);


            }
            feedbackid = feedbackid + 1;
            dr.Close();
          
            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO feedback_tb(feedbackid,email,description) VALUES (@feedbackid,@email,@description)"))
                {

                    cmd.Parameters.AddWithValue("@feedbackid", feedbackid);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@description", description);
               
                    cmd.Connection = con;
                   
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            
        }








        [WebMethod]
        public DataSet getMissingpeopledetailbypostid(int postid)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * From Registration Reg,Biodata mpd where reg.id=mpd.id and mpd.postid=@postid", con);
            cmd.Parameters.AddWithValue("@postid", postid);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet gettotalperson()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT RTRIM(gender) as gender,COUNT(*) As Totalperson FROM Biodata where Visibility_Flag='Active' GROUP BY gender", con);

            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public void Insert_Comment(int postid, string Name, string Email, string Comment, DateTime Date)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Comment_tbl", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int Comment_id = 0;

            while (dr.Read())
            {

                Comment_id = dr.GetInt32(0);


            }
            Comment_id = Comment_id + 1;
            conn.Close();


            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Comment_tbl(Comment_id,postid,Name,Email,Comment,Date) VALUES (@Comment_id,@postid,@Name,@Email,@Comment,@Date)"))
                {
                    cmd.Parameters.AddWithValue("@Comment_id", Comment_id);
                    cmd.Parameters.AddWithValue("@postid", postid);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Email", Email);
                    cmd.Parameters.AddWithValue("@Comment", Comment);

                    cmd.Parameters.AddWithValue("@Date", Date);
                  
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

        [WebMethod]
        public DataSet getcommentbypostid(int postid)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Comment_tbl where postid=@postid", con);
            cmd.Parameters.AddWithValue("@postid", postid);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public string GetVerificationCodeFromDatabase(string Userid)
        {
            string activationCode="";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from UserActivation WHERE Userid=@Userid", con);
            cmd.Parameters.AddWithValue("@Userid", Userid);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                activationCode = ds.Tables[0].Rows[i]["Activationcode"].ToString();
            }
           
               
            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return activationCode;

        }

        [WebMethod]
        public DataSet Getuserverifyornot(string id)
        {
            string activationCode = "";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from UserActivation WHERE id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);
          

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public string Userexistornot(string Userid)
        {
            string flag = "";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Ranasamaj_Registration WHERE Userid=@Userid", con);
            cmd.Parameters.AddWithValue("@Userid", Userid);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                flag = "true";
            }
            else
            {
                flag = "false";
            }


            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return flag;

        }

        [WebMethod]
        public DataSet getdetailsbytoken(string token)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Registration reg,Token_Service ts where reg.id=ts.id and ts.token", con);
            cmd.Parameters.AddWithValue("@token", token);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public int getstepindex(int id)
        {
            
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from step_track_tb where id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    indexid = Convert.ToInt32(ds.Tables[0].Rows[0]["step"].ToString());
                }
            }
            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return indexid;

        }

        [WebMethod]
        public int step_track(int id, string step)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from step_track_tb", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int stepid = 0;

            while (dr.Read())
            {

                stepid = dr.GetInt32(0);


            }
            stepid = stepid + 1;
            
            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO step_track_tb(stepid,id,step) VALUES (@stepid,@id,@step)"))
                {
                    cmd.Parameters.AddWithValue("@stepid", stepid);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@step", step);
                  
                    cmd.Connection = con;
                   
                    con.Open();
                    cmd.ExecuteNonQuery();
                   
                    con.Close();
                }
            }
            return stepid;
        }

        [WebMethod]
        public void update_step_track(int id, string step)
        {
             string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;


             using (SqlConnection con = new SqlConnection(dbconnection))
             {
                 using (SqlCommand cmd = new SqlCommand("UPDATE step_track_tb SET step=@step WHERE id=@id"))
                 {

                     cmd.Parameters.AddWithValue("@id", id);
                     cmd.Parameters.AddWithValue("@step", step);
                     cmd.Connection = con;

                     con.Open();
                     cmd.ExecuteNonQuery();

                     con.Close();
                 }
             }

           
            
        }

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }


        [WebMethod]
        public void ADD_caste(string Caste_name, DateTime createdbydatetime, DateTime modifybydatetime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Caste_tb", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int Caste_ID = 0;

            while (dr.Read())
            {

                Caste_ID = dr.GetInt32(0);


            }
            Caste_ID = Caste_ID + 1;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Caste_tb(Caste_ID,Caste_name,createdbydatetime,modifybydatetime) VALUES (@Caste_ID,@Caste_name,@createdbydatetime,@modifybydatetime)"))
                {
                    cmd.Parameters.AddWithValue("@Caste_ID", Caste_ID);
                    cmd.Parameters.AddWithValue("@Caste_name", Caste_name);
                    cmd.Parameters.AddWithValue("@createdbydatetime", createdbydatetime);
                    cmd.Parameters.AddWithValue("@modifybydatetime", modifybydatetime);
                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }
            
        }

        [WebMethod]
        public DataSet getreligion()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Caste_tb", con);
          
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }


        [WebMethod]
        public void ADD_subcaste(int Caste_ID, string Caste_name, string Subcaste_name, DateTime createdbydatetime, DateTime modifybydatetime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Subcaste_tb", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int Subcaste_ID = 0;

            while (dr.Read())
            {

                Subcaste_ID = dr.GetInt32(0);


            }
            Subcaste_ID = Subcaste_ID + 1;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Subcaste_tb(Subcaste_ID,Caste_ID,Caste_name,Subcaste_name,createdbydatetime,modifybydatetime) VALUES (@Subcaste_ID,@Caste_ID,@Caste_name,@Subcaste_name,@createdbydatetime,@modifybydatetime)"))
                {
                    cmd.Parameters.AddWithValue("@Subcaste_ID", Subcaste_ID);
                    cmd.Parameters.AddWithValue("@Caste_ID", Caste_ID);
                    cmd.Parameters.AddWithValue("@Caste_name", Caste_name);
                    cmd.Parameters.AddWithValue("@Subcaste_name", Subcaste_name);
                    cmd.Parameters.AddWithValue("@createdbydatetime", createdbydatetime);
                    cmd.Parameters.AddWithValue("@modifybydatetime", modifybydatetime);
                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }

        [WebMethod]
        public DataSet getsubcatbyCaste_ID(int Caste_ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Subcaste_tb WHERE Caste_ID=@Caste_ID", con);
            cmd.Parameters.AddWithValue("@Caste_ID", Caste_ID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }
        [WebMethod]
        public DataSet getsubcat()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Subcaste_tb", con);
          
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }
        [WebMethod]
        public DataSet getsubcatbyCaste_name(string Caste_name)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Subcaste_tb WHERE Caste_name=@Caste_name", con);
            cmd.Parameters.AddWithValue("@Caste_name", Caste_name);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public void ADD_castesuggestion( string Fname, string Lname, string Caste, string IDproof, DateTime createdbydatetime, DateTime modifybydatetime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Caste_Suggestion", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int Userid = 0;

            while (dr.Read())
            {

                Userid = dr.GetInt32(0);


            }
            Userid = Userid + 1;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Caste_Suggestion(Userid,Fname,Lname,Caste,IDproof,createdbydatetime,modifybydatetime) VALUES (@Userid,@Fname,@Lname,@Caste,@IDproof,@createdbydatetime,@modifybydatetime)"))
                {
                    cmd.Parameters.AddWithValue("@Userid", Userid);
                    cmd.Parameters.AddWithValue("@Fname", Fname);
                    cmd.Parameters.AddWithValue("@Lname", Lname);
                    cmd.Parameters.AddWithValue("@Caste", Caste);
                    cmd.Parameters.AddWithValue("@IDproof", IDproof);
                    cmd.Parameters.AddWithValue("@createdbydatetime", createdbydatetime);
                    cmd.Parameters.AddWithValue("@modifybydatetime", modifybydatetime);
                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }


        //search query

        [WebMethod]
        public DataSet getsearchdata(string gender,string age1,string age2,string religion,string caste)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            //SqlCommand cmd = new SqlCommand("select * from Biodata where gender=@gender,Religion=@religion,caste=@caste,Price BETWEEN" + age, con);
            SqlCommand cmd = new SqlCommand("select * from Biodata where gender=@gender and Cast=@religion and Subcast=@Subcast and Age BETWEEN "+ age1 + "AND "+ age2, con);
            cmd.Parameters.AddWithValue("@gender", gender);
            cmd.Parameters.AddWithValue("@Religion", religion);
            cmd.Parameters.AddWithValue("@Subcast", caste);
            cmd.Parameters.AddWithValue("@age1", age1);
            cmd.Parameters.AddWithValue("@age2", age2);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }



        //ADD PATNER PREFERENCE

        [WebMethod]
        public void patner_prefenrence_add(int Reg_ID, string Gender, string AgeFrom, string AgeTo, string HeightFrom, string HeightTo, string Marital_Status, string Mother_language, string Physical_Status, string Religion, string Caste, string Zoradic, string Skin_complaction, string Education, string Occupation, string Annual_Income, string Country, string Residing_City, string Residing_State, DateTime CreatedByDateTime, DateTime ModifyByDateTime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Preference_Details", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int Prefer_ID = 0;

            while (dr.Read())
            {

                Prefer_ID = dr.GetInt32(0);


            }
            Prefer_ID = Prefer_ID + 1;
            dr.Close();
           
            
            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Preference_Details(Prefer_ID,Reg_ID,Gender,AgeFrom,AgeTo,HeightFrom,HeightTo,Marital_Status,Mother_language,Physical_Status,Religion,Caste,Zoradic,Skin_complaction,Education,Occupation,Annual_Income,Country,Residing_City,Residing_State,CreatedByDateTime,ModifyByDateTime) VALUES (@Prefer_ID,@Reg_ID,@Gender,@AgeFrom,@AgeTo,@HeightFrom,@HeightTo,@Marital_Status,@Mother_language,@Physical_Status,@Religion,@Caste,@Zoradic,@Skin_complaction,@Education,@Occupation,@Annual_Income,@Country,@Residing_City,@Residing_State,@CreatedByDateTime,@ModifyByDateTime)"))
                {

                    cmd.Parameters.AddWithValue("@Prefer_ID", Prefer_ID);
                    cmd.Parameters.AddWithValue("@Reg_ID", Reg_ID);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    cmd.Parameters.AddWithValue("@AgeFrom", AgeFrom);
                    cmd.Parameters.AddWithValue("@AgeTo", AgeTo);
                    cmd.Parameters.AddWithValue("@HeightFrom", HeightFrom);
                    cmd.Parameters.AddWithValue("@HeightTo", HeightTo);
                    cmd.Parameters.AddWithValue("@Marital_Status", Marital_Status);
                    cmd.Parameters.AddWithValue("@Mother_language", Mother_language);
                    cmd.Parameters.AddWithValue("@Physical_Status", Physical_Status);
                    cmd.Parameters.AddWithValue("@Religion", Religion);
                    cmd.Parameters.AddWithValue("@Caste", Caste);
                    cmd.Parameters.AddWithValue("@Zoradic", Zoradic);
                    cmd.Parameters.AddWithValue("@Skin_complaction", Skin_complaction);
                    cmd.Parameters.AddWithValue("@Education", Education);
                    cmd.Parameters.AddWithValue("@Occupation", Occupation);
                    cmd.Parameters.AddWithValue("@Annual_Income", Annual_Income);
                    cmd.Parameters.AddWithValue("@Country", Country);
                    cmd.Parameters.AddWithValue("@Residing_City", Residing_City);
                    cmd.Parameters.AddWithValue("@Residing_State", Residing_State);
                    cmd.Parameters.AddWithValue("@CreatedByDateTime", CreatedByDateTime);
                    cmd.Parameters.AddWithValue("@ModifyByDateTime", ModifyByDateTime);

                    
                    cmd.Connection = con;
                   
                    con.Open();
                    cmd.ExecuteNonQuery();
                   
                    con.Close();
                }
            }
           
        }

        [WebMethod]
        public DataSet getpatnerpreference()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Preference_Details", con);

            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getpatnerpreferencebyid(int Reg_ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Preference_Details where Reg_ID=@Reg_ID", con);
            cmd.Parameters.AddWithValue("@Reg_ID", Reg_ID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public void patner_prefenrence_update(int Reg_ID, string Gender, string AgeFrom, string AgeTo, string HeightFrom, string HeightTo, string Marital_Status, string Mother_language, string Physical_Status, string Religion, string Caste, string Zoradic, string Skin_complaction, string Education, string Occupation, string Annual_Income, string Country, string Residing_City, string Residing_State, DateTime CreatedByDateTime, DateTime ModifyByDateTime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            
            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Preference_Details SET Gender=@Gender,AgeFrom=@AgeFrom,AgeTo=@AgeTo,HeightFrom=@HeightFrom,HeightTo=@HeightTo,Marital_Status=@Marital_Status,Mother_language=@Mother_language,Physical_Status=@Physical_Status,Religion=@Religion,Caste=@Caste,Zoradic=@Zoradic,Skin_complaction=@Skin_complaction,Education=@Education,Occupation=@Occupation,Annual_Income=@Annual_Income,Country=@Country,Residing_City=@Residing_City,Residing_State=@Residing_State,ModifyByDateTime=@ModifyByDateTime WHERE Reg_ID=@Reg_ID"))
                {

                   
                    cmd.Parameters.AddWithValue("@Reg_ID", Reg_ID);
                    cmd.Parameters.AddWithValue("@Gender", Gender);
                    cmd.Parameters.AddWithValue("@AgeFrom", AgeFrom);
                    cmd.Parameters.AddWithValue("@AgeTo", AgeTo);
                    cmd.Parameters.AddWithValue("@HeightFrom", HeightFrom);
                    cmd.Parameters.AddWithValue("@HeightTo", HeightTo);
                    cmd.Parameters.AddWithValue("@Marital_Status", Marital_Status);
                    cmd.Parameters.AddWithValue("@Mother_language", Mother_language);
                    cmd.Parameters.AddWithValue("@Physical_Status", Physical_Status);
                    cmd.Parameters.AddWithValue("@Religion", Religion);
                    cmd.Parameters.AddWithValue("@Caste", Caste);
                    cmd.Parameters.AddWithValue("@Zoradic", Zoradic);
                    cmd.Parameters.AddWithValue("@Skin_complaction", Skin_complaction);
                    cmd.Parameters.AddWithValue("@Education", Education);
                    cmd.Parameters.AddWithValue("@Occupation", Occupation);
                    cmd.Parameters.AddWithValue("@Annual_Income", Annual_Income);
                    cmd.Parameters.AddWithValue("@Country", Country);
                    cmd.Parameters.AddWithValue("@Residing_City", Residing_City);
                    cmd.Parameters.AddWithValue("@Residing_State", Residing_State);
                    cmd.Parameters.AddWithValue("@ModifyByDateTime", ModifyByDateTime);


                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }


        [WebMethod]
        public void ADD_Shortlist(int RegID, int ProfileID, string CreatedByID, string ModifyByID, DateTime CreatedByDateTime, DateTime ModifyByDateTime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Shortlist_tb", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int ShortlistID = 0;

            while (dr.Read())
            {

                ShortlistID = dr.GetInt32(0);


            }
            ShortlistID = ShortlistID + 1;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Shortlist_tb(ShortlistID,RegID,ProfileID,CreatedByID,ModifyByID,CreatedByDateTime,ModifyByDateTime) VALUES (@ShortlistID,@RegID,@ProfileID,@CreatedByID,@ModifyByID,@CreatedByDateTime,@ModifyByDateTime)"))
                {
                    cmd.Parameters.AddWithValue("@ShortlistID", ShortlistID);
                    cmd.Parameters.AddWithValue("@RegID", RegID);
                    cmd.Parameters.AddWithValue("@ProfileID", ProfileID);
                    cmd.Parameters.AddWithValue("@CreatedByID", CreatedByID);
                    cmd.Parameters.AddWithValue("@ModifyByID", ModifyByID);
                    cmd.Parameters.AddWithValue("@CreatedByDateTime", CreatedByDateTime);
                    cmd.Parameters.AddWithValue("@ModifyByDateTime", ModifyByDateTime);
                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }

        [WebMethod]
        public void Remove_Shortlist(int RegID, int ProfileID)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("delete Shortlist_tb  WHERE RegID=@RegID and ProfileID=@ProfileID"))
                {
                    cmd.Parameters.AddWithValue("@RegID", RegID);
                    cmd.Parameters.AddWithValue("@ProfileID", ProfileID);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }


        [WebMethod]
        public void ADD_assist_service(string Name, string Email, string Number, DateTime createdbydatetime, DateTime modifybydatetime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Assist_tb", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int Assist_ID = 0;

            while (dr.Read())
            {

                Assist_ID = dr.GetInt32(0);


            }
            Assist_ID = Assist_ID + 1;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Assist_tb(Assist_ID,Name,Email,Number,createdbydatetime,modifybydatetime) VALUES (@Assist_ID,@Name,@Email,@Number,@createdbydatetime,@modifybydatetime)"))
                {
                    cmd.Parameters.AddWithValue("@Assist_ID", Assist_ID);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@Email", Email);
                    cmd.Parameters.AddWithValue("@Number", Number);
                    cmd.Parameters.AddWithValue("@createdbydatetime", createdbydatetime);
                    cmd.Parameters.AddWithValue("@modifybydatetime", modifybydatetime);
                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }



        [WebMethod]
        public void ADD_INBOX(int Biodata_id, int id, string Name, string CreatedBy, string ModifyBy, DateTime createdbydatetime, DateTime modifybydatetime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Intrest_Inbox", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int Intrest_ID = 0;

            while (dr.Read())
            {

                Intrest_ID = dr.GetInt32(0);


            }
            Intrest_ID = Intrest_ID + 1;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Intrest_Inbox(Intrest_ID,Biodata_id,id,Name,CreatedBy,ModifyBy,createdbydatetime,modifybydatetime) VALUES (@Intrest_ID,@Biodata_id,@id,@Name,@CreatedBy,@ModifyBy,@createdbydatetime,@modifybydatetime)"))
                {
                    cmd.Parameters.AddWithValue("@Intrest_ID", Intrest_ID);
                    cmd.Parameters.AddWithValue("@Biodata_id", Biodata_id);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@Name", Name);
                    cmd.Parameters.AddWithValue("@CreatedBy", CreatedBy);
                    cmd.Parameters.AddWithValue("@ModifyBy", ModifyBy);
                    cmd.Parameters.AddWithValue("@createdbydatetime", createdbydatetime);
                    cmd.Parameters.AddWithValue("@modifybydatetime", modifybydatetime);
                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }

        [WebMethod]
        public DataSet Getinbox(int Reg_ID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Intrest_Inbox inbox,Biodata bio where inbox.id=bio.id and inbox.Biodata_id=@Biodata_id ORDER BY inbox.CreatedByDateTime DESC", con);
            cmd.Parameters.AddWithValue("@Biodata_id", Reg_ID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet Getinboxbyid(int id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Intrest_Inbox  where id=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet Getinboxbybiodataid(int Biodata_id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Intrest_Inbox  where Biodata_id=@Biodata_id", con);
            cmd.Parameters.AddWithValue("@Biodata_id", Biodata_id);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet Getshortlistbyregid(int RegID)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Shortlist_tb st,Biodata bt where st.ProfileID=bt.Biodata_id and st.RegID=@RegID", con);
            cmd.Parameters.AddWithValue("@RegID", RegID);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public void deleteprofile(int id)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("delete Biodata  WHERE id=@id"))
                {
                    cmd.Parameters.AddWithValue("@id", id);


                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }

     
        [WebMethod]
        public void deletereg(string status, int id)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Ranasamaj_Registration SET status=@status WHERE id=@id"))
                {

                    cmd.Parameters.AddWithValue("@id", id);

                    cmd.Parameters.AddWithValue("@status", status);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

        }

        [WebMethod]
        public DataSet getTotalpostsubcast()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Subcast,count( * ) as total_record FROM Biodata np where Deactivate_flag='false' GROUP BY Subcast;", con);
           
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getbiodatadetailbysubcat(string subcat,int id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Biodata np WHERE Visibility_Flag='true' and Deactivate_flag='true' and id!=@id and np.Subcast=@Subcast ORDER BY CreatedByDateTime desc;", con);
            cmd.Parameters.AddWithValue("@Subcast", subcat);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getshortlistbyprofileid(int biodata_id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Shortlist_tb np WHERE np.ProfileID=@ProfileID ORDER BY CreatedByDateTime desc;", con);
            cmd.Parameters.AddWithValue("@ProfileID", biodata_id);
           
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getTotalgender()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Gender,count( * ) as total_record FROM Biodata np where Deactivate_flag='false' GROUP BY Gender;", con);

            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getbiodatadetailbygender(string gender, int id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Biodata np WHERE Visibility_Flag='true' and Deactivate_flag='false' and id!=@id and np.Gender=@Gender ORDER BY CreatedByDateTime desc;", con);
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }


        [WebMethod]
        public void ADD_Log(string Reg_ID, string Page_name, string Action, string createdby, string modifyby, DateTime createdbydatetime, DateTime modifybydatetime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Log_table", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int Log_ID = 0;

            while (dr.Read())
            {

                Log_ID = dr.GetInt32(0);


            }
            Log_ID = Log_ID + 1;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Log_table(Log_ID,Reg_ID,Page_name,Action,createdby,modifyby,createdbydatetime,modifybydatetime) VALUES (@Log_ID,@Reg_ID,@Page_name,@Action,@createdby,@modifyby,@createdbydatetime,@modifybydatetime)"))
                {
                    cmd.Parameters.AddWithValue("@Log_ID", Log_ID);
                    cmd.Parameters.AddWithValue("@Reg_ID", Reg_ID);
                    cmd.Parameters.AddWithValue("@Page_name", Page_name);
                    cmd.Parameters.AddWithValue("@Action", Action);
                    cmd.Parameters.AddWithValue("@createdby", createdby);
                    cmd.Parameters.AddWithValue("@modifyby", modifyby);
                    cmd.Parameters.AddWithValue("@createdbydatetime", createdbydatetime);
                    cmd.Parameters.AddWithValue("@modifybydatetime", modifybydatetime);
                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }


        [WebMethod]
        public void ADD_Chat(string Sender, string Receiver, string Message, string Date, DateTime createdbydatetime, DateTime modifybydatetime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from chat", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int ID = 0;

            while (dr.Read())
            {

                ID = dr.GetInt32(0);


            }
            ID = ID + 1;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO chat(ID,Sender,Receiver,Message,Date1,createdbydatetime,modifybydatetime) VALUES (@ID,@Sender,@Receiver,@Message,@Date1,@createdbydatetime,@modifybydatetime)"))
                {
                    cmd.Parameters.AddWithValue("@ID", ID);
                    cmd.Parameters.AddWithValue("@Sender", Sender);
                    cmd.Parameters.AddWithValue("@Receiver", Receiver);
                    cmd.Parameters.AddWithValue("@Message", Message);
                    cmd.Parameters.AddWithValue("@Date1", Date);
                   
                    cmd.Parameters.AddWithValue("@createdbydatetime", createdbydatetime);
                    cmd.Parameters.AddWithValue("@modifybydatetime", modifybydatetime);
                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }


        [WebMethod]
        public DataSet getchatuser(string username)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Sender FROM chat where Sender!=@username group by Sender", con);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public DataSet getchatuserbysearch(string username,string search)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT Sender FROM chat where Sender!=@username and Sender like '"+ search +"%' group by Sender", con);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@search", search);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }


        [WebMethod]
        public void ADD_Star(string Starname, string Createdby, string Modifedby, DateTime Createdatetime, DateTime Modifieddatetime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Star_tb", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int Star_id = 0;

            while (dr.Read())
            {

                Star_id = dr.GetInt32(0);


            }
            Star_id = Star_id + 1;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Star_tb(Star_id,Starname,Createdby,Modifedby,Createdatetime,Modifieddatetime) VALUES (@Star_id,@Starname,@Createdby,@Modifedby,@Createdatetime,@Modifieddatetime)"))
                {
                    cmd.Parameters.AddWithValue("@Star_id", Star_id);
                    cmd.Parameters.AddWithValue("@Starname", Starname);
                    cmd.Parameters.AddWithValue("@Createdby", Createdby);
                    cmd.Parameters.AddWithValue("@Modifedby", Modifedby);
                   
                    cmd.Parameters.AddWithValue("@Createdatetime", Createdatetime);
                    cmd.Parameters.AddWithValue("@Modifieddatetime", Modifieddatetime);
                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }

        [WebMethod]
        public DataSet getstar_details()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Star_tb", con);
          
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Close();
            // Create an instance of DataSet.
            DataSet ds = new DataSet();
            da.Fill(ds);

            // Return the DataSet as an XmlElement.
            //XmlDataDocument xmldata = new XmlDataDocument(ds);
            //XmlElement xmlElement = xmldata.DocumentElement;
            return ds;

        }

        [WebMethod]
        public void deletestar(int Star_id)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("delete Star_tb  WHERE Star_id=@Star_id"))
                {
                    cmd.Parameters.AddWithValue("@Star_id", Star_id);


                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }
        [WebMethod]
        public DataSet getstarbyid(int Star_id)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Star_tb  WHERE Star_id=@Star_id",con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@Star_id", Star_id);
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    con.Close();
                    // Create an instance of DataSet.
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }

        }
        [WebMethod]
        public void Updatestar(int Star_id, string Starname, DateTime Modifieddatetime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Star_tb SET Starname=@Starname,Modifieddatetime=@Modifieddatetime WHERE Star_id=@Star_id"))
                {
                    cmd.Parameters.AddWithValue("@Star_id", Star_id);
                    cmd.Parameters.AddWithValue("@Starname", Starname);
                    cmd.Parameters.AddWithValue("@Modifieddatetime", Modifieddatetime);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
           
        }


        [WebMethod]
        public void deletecast(int Caste_ID)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("delete Caste_tb  WHERE Caste_ID=@Caste_ID"))
                {
                    cmd.Parameters.AddWithValue("@Caste_ID", Caste_ID);


                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }
        [WebMethod]
        public DataSet getcastbyid(int Caste_ID)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Caste_tb  WHERE Caste_ID=@Caste_ID", con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@Caste_ID", Caste_ID);
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    con.Close();
                    // Create an instance of DataSet.
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }

        }
        [WebMethod]
        public void Updatecast(int Caste_ID, string Caste_name, DateTime Modifieddatetime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Caste_tb SET Caste_name=@Caste_name,Modifieddatetime=@Modifieddatetime WHERE Caste_ID=@Caste_ID"))
                {
                    cmd.Parameters.AddWithValue("@Caste_ID", Caste_ID);
                    cmd.Parameters.AddWithValue("@Caste_name", Caste_name);
                    cmd.Parameters.AddWithValue("@Modifieddatetime", Modifieddatetime);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
          
        }



        [WebMethod]
        public void deletesubcast(int Subcaste_ID)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("delete Subcaste_tb  WHERE Subcaste_ID=@Subcaste_ID"))
                {
                    cmd.Parameters.AddWithValue("@Subcaste_ID", Subcaste_ID);


                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }
        [WebMethod]
        public DataSet getsubcastbyid(int Subcaste_ID)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Subcaste_tb  WHERE Subcaste_ID=@Subcaste_ID", con))
                {
                    con.Open();
                    cmd.Parameters.AddWithValue("@Subcaste_ID", Subcaste_ID);
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    con.Close();
                    // Create an instance of DataSet.
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }

        }
        [WebMethod]
        public void Updatesubcast(int Subcaste_ID, int Caste_ID, string Caste_name, string Subcaste_name, DateTime modifybydatetime)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE Subcaste_tb SET Caste_ID=@Caste_ID,Caste_name=@Caste_name,Subcaste_name=@Subcaste_name,modifybydatetime=@modifybydatetime WHERE Subcaste_ID=@Subcaste_ID"))
                {
                    cmd.Parameters.AddWithValue("@Subcaste_ID", Subcaste_ID);
                    cmd.Parameters.AddWithValue("@Caste_ID", Caste_ID);
                    cmd.Parameters.AddWithValue("@Caste_name", Caste_name);
                    cmd.Parameters.AddWithValue("@Subcaste_name", Subcaste_name);
                    cmd.Parameters.AddWithValue("@modifybydatetime", modifybydatetime);

                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            
        }

        public void Insert_Employee_Feedback(string Employee_Name, string Description, DateTime DATE1)
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            SqlConnection conn = new SqlConnection(dbconnection);
            SqlCommand cmd1 = new SqlCommand("select * from Employee_Feedback_tb", conn);
            conn.Open();


            SqlDataReader dr = cmd1.ExecuteReader();
            int Employee_Feedback_ID = 0;

            while (dr.Read())
            {

                Employee_Feedback_ID = dr.GetInt32(0);


            }
            Employee_Feedback_ID = Employee_Feedback_ID + 1;
            dr.Close();

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Employee_Feedback_tb(Employee_Feedback_ID,Employee_Name,Description,DATE1) VALUES (@Employee_Feedback_ID,@Employee_Name,@Description,@DATE1)"))
                {
                    cmd.Parameters.AddWithValue("@Employee_Feedback_ID", Employee_Feedback_ID);
                    cmd.Parameters.AddWithValue("@Employee_Name", Employee_Name);
                    cmd.Parameters.AddWithValue("@Description", Description);
                    cmd.Parameters.AddWithValue("@DATE1", DATE1);

                    cmd.Connection = con;

                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
            }

        }

        [WebMethod]
        public DataSet Get_Employee_Feedback()
        {
            string dbconnection = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(dbconnection))
            {
                using (SqlCommand cmd = new SqlCommand("select * from Employee_Feedback_tb", con))
                {
                    con.Open();
                  
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    con.Close();
                    // Create an instance of DataSet.
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }

        }

    }

}
