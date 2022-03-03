using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Globalvariable
/// </summary>
public  class Globalvariable
{
    public static String FILE_NAME;

    public static String Email_Sucessfully_Sent;
    public static String Email_Exist;
    public static String Invalid_email_Pwd;
    public static String Account_Deleted;
    public static String Serer_Not_Connect;
    public static String Data_Added;
    public static String Data_Updated;
    public static String Error;
    public static String Pwd_Changed;
    public Globalvariable()
    {
        //
        // TODO: Add constructor logic here
        //


        Email_Sucessfully_Sent = "E-mail Successfully Sent";
      
        Invalid_email_Pwd = "Invalid Email or Password";
        Account_Deleted = "Your Account Deleted";
        Serer_Not_Connect = "Server Not Connected";
        Data_Added = "Data Added Successfully";
        Data_Updated = "Data Updated Successfully";
        Error = "Error";

    }


    static string _Email_Exist;
    public static string getEmail_Exist
    {
        
        set { _Email_Exist = "Email ID already exist. Please Register With Another Email ID"; }
        get { return _Email_Exist; }
    }

}