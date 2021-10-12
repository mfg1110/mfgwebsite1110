<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" enableEventValidation="false" EnableViewStateMac="false" CodeFile="Viewbiodata.aspx.cs" Inherits="Viewbiodata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
<%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>--%>
   <%-- <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>--%>
 
    <!------ Include the above in your HEAD tag ---------->
    <link href="App_Themes/profilecss.css" rel="stylesheet">
   
<script type="text/javascript">
    function LoadDiv(url) {
        var img = new Image();
        var bcgDiv = document.getElementById("divBackground");
        var imgDiv = document.getElementById("divImage");
        var imgFull = document.getElementById("ContentPlaceHolder1_imgFull");
        var imgLoader = document.getElementById("imgLoader");

        imgLoader.style.display = "block";
        img.onload = function () {
            imgFull.src = img.src;
            imgFull.style.display = "block";
            imgLoader.style.display = "none";
        };
        img.src = url;
        var width = document.body.clientWidth;
        if (document.body.clientHeight > document.body.scrollHeight) {
            bcgDiv.style.height = document.body.clientHeight + "px";
        }
        else {
            bcgDiv.style.height = document.body.scrollHeight + "px";
        }

        imgDiv.style.left = (width - 650) / 2 + "px";
        imgDiv.style.top = "20px";
        bcgDiv.style.width = "100%";

        bcgDiv.style.display = "none";
        imgDiv.style.display = "block";
        return false;
    }
    function HideDiv() {
        var bcgDiv = document.getElementById("divBackground");
        var imgDiv = document.getElementById("divImage");
        var imgFull = document.getElementById("ContentPlaceHolder1_imgFull");
        if (bcgDiv != null) {
            bcgDiv.style.display = "none";
            imgDiv.style.display = "none";
            imgFull.style.display = "none";
        }
    }
</script>

<style type="text/css">
     body 
     {
        margin:0;
        padding:0;
        height:100%; 
        overflow-y:auto;  
     }
     .table {
    width: 60%;
    max-width: 60%;
    min-width: 10%;
    margin-bottom: 1rem;
    background-color: transparent;
    }
     .modal
     {
        display: none; 
        position: absolute;
        top: 0px; 
        left: 0px;
        background-color:black;
        z-index:100;
        opacity: 0.8;
        filter: alpha(opacity=60);
        -moz-opacity:0.8;
        min-height: 100%;
     }
     #divImage
     {
        display: none;
        z-index: 1000;
        position: fixed;
        top: 0;
        left: 0;
        background-color:White;
        height: 550px;
        width: 600px;
        padding: 3px;
        border: solid 1px black;
     }
     * html #divImage {position:absolute;}

     .Content
{
  height:224px;
   overflow:auto;
    background:#fff;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <asp:Repeater ID="rptsingledata" runat="server" OnItemDataBound="rptsingledata_ItemDataBound">
        <ItemTemplate>
            <div class="content-wrapper pb-0">
            <section class="single-post-area section-padding" style="font-size: medium;font-family:'Bookman Old Style'">


                <div class="container" style="margin-top: -10px;">
                    <div class="profile-head">
                        <!--col-md-4 col-sm-4 col-xs-12 close-->
                        <div class="col-md- col-sm-4 col-xs-12">
                           <%--   <asp:image id="Image1" runat="server" onclick="ShowFull(this)" ImageUrl='Picture/<%# ProcessDataItem(Eval("Photo")) %>' class="img img-responsive" style="background-color:#ffffff"/>--%>
                            
                              <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "Photo","Picture/{0}")%>' ToolTip="View Picture"  class="profile-head img img-responsive" Height="150" Width="150" style="background-color:#ffffff;cursor: pointer;margin-left: 80px;padding: 7px 5px;object-fit: contain;background-color:white"  OnClientClick = "return LoadDiv(this.src);"/>
                      
                          <%--  <div class="container" style="margin-left: 90px;">
                                <span class="btn btn-default uplod-file">Upload Photo
                                    <input type="file" />
                                </span>
                            </div>--%>
                        </div>
                        <!--col-md-4 col-sm-4 col-xs-12 close-->

                        <div class="col-md-5 col-sm-5 col-xs-12">
                            <h5 style="letter-spacing: 5px;"><%# Eval("Name") %></h5>


                            <ul>
                                <li><span class="glyphicon glyphicon-briefcase"></span><%#ProcessMyDataItem( Eval("Occupation") )%></li>
                                <li><span class="glyphicon glyphicon-map-marker"></span><%# ProcessMyDataItem(Eval("Current_country")) %></li>
                                <li><span class="glyphicon glyphicon-home"></span><%# ProcessMyDataItem(Eval("Current_Address")) %></li>
                             <%--   <li><span class="glyphicon glyphicon-phone"></span>
                                    <a href="#" title="call"><%# ProcessMyDataItem(Eval("Home_Mobile1")) %></a>
                                   
                                </li>
                                <li><span class="glyphicon glyphicon-envelope"></span>
                                     <asp:Label ID="lblemail" runat="server" Text=""></asp:Label>
                                    <a href="#" title="mail"><%# ProcessMyDataItem(Eval("Email_Address_1") )%></a>

                                </li>--%>

                            </ul>

                        </div>
                    </div>
                    <br />

                    <!--profile-head close-->
                </div>
                <!--container close-->

                <div class="container">

                    <script async src="https://static.addtoany.com/menu/page.js"></script>
                    <div class="col-sm-12">

                        <div data-spy="scroll" class="tabbable-panel">
                            <div class="tabbable-line">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#tab_default_1" data-toggle="tab">Personal Info </a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_2" data-toggle="tab">Education</a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_3" data-toggle="tab">Occupation Info</a>
                                    </li>

                                    <li>
                                        <a href="#tab_default_4" data-toggle="tab">Family Details</a>
                                    </li>
                                    <li>
                                        <a href="#tab_default_5" data-toggle="tab">Contact Details</a>
                                    </li>
                                  <%--  <li><a href="#tab_default_6" data-toggle="tab">Photos</a></li>
                                    <li>--%>
                                        <div>
                                            <div class="a2a_kit a2a_kit_size_32 a2a_default_style" style="line-height: 32px;">


                                                <a class="a2a_button_facebook" target="_blank" href="/#facebook" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_facebook" style="background-color: rgb(24, 119, 242);">
                                                    <svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
                                                        <path fill="#FFF" d="M17.78 27.5V17.008h3.522l.527-4.09h-4.05v-2.61c0-1.182.33-1.99 2.023-1.99h2.166V4.66c-.375-.05-1.66-.16-3.155-.16-3.123 0-5.26 1.905-5.26 5.405v3.016h-3.53v4.09h3.53V27.5h4.223z"></path></svg></span><span class="a2a_label">Facebook</span></a>




                                                <a class="a2a_button_facebook_messenger" target="_blank" href="/#facebook_messenger" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_facebook_messenger" style="background-color: rgb(0, 132, 255);">
                                                    <svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
                                                        <path fill="#FFF" d="M16 5C9.986 5 5.11 9.56 5.11 15.182c0 3.2 1.58 6.054 4.046 7.92V27l3.716-2.06c.99.276 2.04.425 3.128.425 6.014 0 10.89-4.56 10.89-10.183S22.013 5 16 5zm1.147 13.655L14.33 15.73l-5.423 3 5.946-6.31 2.816 2.925 5.42-3-5.946 6.31z"></path></svg></span><span class="a2a_label">Facebook Messenger</span></a>
                                                <a class="a2a_button_whatsapp a2a_counter" target="_blank" href="https://www.addtoany.com/add_to/whatsapp?linkurl=https%3A%2F%2Fwww.swatantra-samachar.com%2FFrontnewview%2Fsinglepage.aspx%3Fnewspostid%3D4&amp;linkname=%E0%AA%B8%E0%AB%8D%E0%AA%B5%E0%AA%A4%E0%AA%82%E0%AA%A4%E0%AB%8D%E0%AA%B0%20%E0%AA%B8%E0%AA%AE%E0%AA%BE%E0%AA%9A%E0%AA%BE%E0%AA%B0&amp;linknote=FacebookFacebook%20MessengerWhatsAppGmailSMSCopy%20Link%0A" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_whatsapp" style="background-color: rgb(18, 175, 10);">
                                                    <svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" fill="#FFF" d="M16.21 4.41C9.973 4.41 4.917 9.465 4.917 15.7c0 2.134.592 4.13 1.62 5.832L4.5 27.59l6.25-2.002a11.241 11.241 0 0 0 5.46 1.404c6.234 0 11.29-5.055 11.29-11.29 0-6.237-5.056-11.292-11.29-11.292zm0 20.69c-1.91 0-3.69-.57-5.173-1.553l-3.61 1.156 1.173-3.49a9.345 9.345 0 0 1-1.79-5.512c0-5.18 4.217-9.4 9.4-9.4 5.183 0 9.397 4.22 9.397 9.4 0 5.188-4.214 9.4-9.398 9.4zm5.293-6.832c-.284-.155-1.673-.906-1.934-1.012-.265-.106-.455-.16-.658.12s-.78.91-.954 1.096c-.176.186-.345.203-.628.048-.282-.154-1.2-.494-2.264-1.517-.83-.795-1.373-1.76-1.53-2.055-.158-.295 0-.445.15-.584.134-.124.3-.326.45-.488.15-.163.203-.28.306-.47.104-.19.06-.36-.005-.506-.066-.147-.59-1.587-.81-2.173-.218-.586-.46-.498-.63-.505-.168-.007-.358-.038-.55-.045-.19-.007-.51.054-.78.332-.277.274-1.05.943-1.1 2.362-.055 1.418.926 2.826 1.064 3.023.137.2 1.874 3.272 4.76 4.537 2.888 1.264 2.9.878 3.43.85.53-.027 1.734-.633 2-1.297.266-.664.287-1.24.22-1.363-.07-.123-.26-.203-.54-.357z"></path></svg></span><span class="a2a_label">WhatsApp</span></a>
                                                <a class="a2a_button_google_gmail" target="_blank" href="/#google_gmail" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_gmail" style="background-color: rgb(221, 83, 71);">
                                                    <svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
                                                        <path fill="#fff" opacity=".25" d="M4.958 6.569h22.338V25.43H4.958z"></path><path d="M28.709 7.321a1.7 1.7 0 0 0-1.409-.752h-.077l-1.1.8-.082.06-9.952 7.271L5.961 7.3l-1-.733H4.7A1.7 1.7 0 0 0 3 8.273v15.454a1.676 1.676 0 0 0 .069.481A1.7 1.7 0 0 0 4.7 25.431h1.261V11.36l7.35 5.368 2.416 1.764.445.326 2.778-2.029 7.088-5.177v13.819H27.3a1.7 1.7 0 0 0 1.634-1.223 1.675 1.675 0 0 0 .066-.481V8.273a1.7 1.7 0 0 0-.291-.952z" fill="#fff"></path></svg></span><span class="a2a_label">Gmail</span></a>
                                                <a class="a2a_button_sms" target="_blank" href="/#sms" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_sms" style="background-color: rgb(108, 190, 69);">
                                                    <svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
                                                        <path fill="#FFF" d="M16 3.543c-7.177 0-13 4.612-13 10.294 0 3.35 2.027 6.33 5.16 8.21 1.71 1.565 1.542 4.08-.827 6.41 2.874 0 7.445-1.698 8.462-4.34H16c7.176 0 13-4.605 13-10.285s-5.824-10.29-13-10.29zM9.045 17.376c-.73 0-1.45-.19-1.81-.388l.294-1.194c.384.2.98.398 1.6.398.66 0 1.01-.275 1.01-.692 0-.398-.302-.625-1.07-.9-1.06-.37-1.753-.957-1.753-1.886 0-1.09.91-1.924 2.415-1.924.72 0 1.25.152 1.63.322l-.322 1.166a3.037 3.037 0 0 0-1.336-.303c-.625 0-.93.284-.93.616 0 .41.36.59 1.186.9 1.127.42 1.658 1.01 1.658 1.91.003 1.07-.822 1.98-2.575 1.98zm9.053-.095l-.095-2.44a72.993 72.993 0 0 1-.057-2.626h-.028a35.41 35.41 0 0 1-.71 2.475l-.778 2.49h-1.128l-.682-2.473a29.602 29.602 0 0 1-.578-2.493h-.02c-.037.863-.065 1.85-.112 2.645l-.114 2.425H12.46l.407-6.386h1.924l.63 2.13c.2.74.397 1.536.54 2.285h.027a52.9 52.9 0 0 1 .607-2.293l.683-2.12h1.886l.35 6.386H18.1zm4.09.1c-.73 0-1.45-.19-1.81-.39l.293-1.194c.39.2.99.398 1.605.398.663 0 1.014-.275 1.014-.692 0-.396-.305-.623-1.07-.9-1.064-.37-1.755-.955-1.755-1.884 0-1.09.91-1.924 2.416-1.924.72 0 1.25.153 1.63.323l-.322 1.166a3.038 3.038 0 0 0-1.337-.303c-.625 0-.93.284-.93.616 0 .408.36.588 1.186.9 1.127.42 1.658 1.006 1.658 1.906.002 1.07-.823 1.98-2.576 1.98z"></path></svg></span><span class="a2a_label">SMS</span></a>
                                                <a class="a2a_button_copy_link" target="_blank" href="/#copy_link" rel="nofollow noopener"><span class="a2a_svg a2a_s__default a2a_s_link" style="background-color: rgb(1, 102, 255);">
                                                    <svg focusable="false" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
                                                        <path fill="#FFF" d="M24.412 21.177c0-.36-.126-.665-.377-.917l-2.804-2.804a1.235 1.235 0 0 0-.913-.378c-.377 0-.7.144-.97.43.026.028.11.11.255.25.144.14.24.236.29.29s.117.14.2.256c.087.117.146.232.177.344.03.112.046.236.046.37 0 .36-.126.666-.377.918a1.25 1.25 0 0 1-.918.377 1.4 1.4 0 0 1-.373-.047 1.062 1.062 0 0 1-.345-.175 2.268 2.268 0 0 1-.256-.2 6.815 6.815 0 0 1-.29-.29c-.14-.142-.223-.23-.25-.254-.297.28-.445.607-.445.984 0 .36.126.664.377.916l2.778 2.79c.243.243.548.364.917.364.36 0 .665-.118.917-.35l1.982-1.97c.252-.25.378-.55.378-.9zm-9.477-9.504c0-.36-.126-.665-.377-.917l-2.777-2.79a1.235 1.235 0 0 0-.913-.378c-.35 0-.656.12-.917.364L7.967 9.92c-.254.252-.38.553-.38.903 0 .36.126.665.38.917l2.802 2.804c.242.243.547.364.916.364.377 0 .7-.14.97-.418-.026-.027-.11-.11-.255-.25s-.24-.235-.29-.29a2.675 2.675 0 0 1-.2-.255 1.052 1.052 0 0 1-.176-.344 1.396 1.396 0 0 1-.047-.37c0-.36.126-.662.377-.914.252-.252.557-.377.917-.377.136 0 .26.015.37.046.114.03.23.09.346.175.117.085.202.153.256.2.054.05.15.148.29.29.14.146.222.23.25.258.294-.278.442-.606.442-.983zM27 21.177c0 1.078-.382 1.99-1.146 2.736l-1.982 1.968c-.745.75-1.658 1.12-2.736 1.12-1.087 0-2.004-.38-2.75-1.143l-2.777-2.79c-.75-.747-1.12-1.66-1.12-2.737 0-1.106.392-2.046 1.183-2.818l-1.186-1.185c-.774.79-1.708 1.186-2.805 1.186-1.078 0-1.995-.376-2.75-1.13l-2.803-2.81C5.377 12.82 5 11.903 5 10.826c0-1.08.382-1.993 1.146-2.738L8.128 6.12C8.873 5.372 9.785 5 10.864 5c1.087 0 2.004.382 2.75 1.146l2.777 2.79c.75.747 1.12 1.66 1.12 2.737 0 1.105-.392 2.045-1.183 2.817l1.186 1.186c.774-.79 1.708-1.186 2.805-1.186 1.078 0 1.995.377 2.75 1.132l2.804 2.804c.754.755 1.13 1.672 1.13 2.75z"></path></svg></span><span class="a2a_label">Copy Link</span></a>


                                                <div style="clear: both;"></div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_default_1">
                                        <div class="well well-sm">
                                            <h4>PERSONAL DATA</h4>
                                        </div>
                                       <%-- <p align="right">
                                            <button type="button" class="btn btn-default btn-sm">
                                                <span class="glyphicon glyphicon-edit"></span>Edit</button>

                                        </p>--%>
                                        <table class="table bio-table">
                                            <tbody>
                                                <tr>
                                                    <td>Name</td>
                                                    <td>: <%# Eval("Name") %></td>
                                                </tr>
                                                <tr>
                                                    <td>Gender</td>
                                                    <td>: <%# Eval("Gender") %></td>
                                                </tr>
                                                <tr>
                                                    <td>Date of Birthday (DD/MM/YYYY) </td>
                                                    <td>: <%# DataBinder.Eval(Container.DataItem, "Date_of_Birth", "{0:d/M/yyyy}") %></td>
                                                </tr>
                                                <tr>
                                                    <td>Time of Birth</td>
                                                    <td>: <%# Eval("Time_of_Birth") %></td>
                                                </tr>
                                                <tr>
                                                    <td>Place of Birth </td>
                                                    <td>: <%# Eval("Place_of_Birth") %></td>
                                                </tr>
                                                <tr>
                                                    <td>Religion</td>
                                                    <td>: <%# Eval("Religion") %></td>
                                                </tr>
                                                <tr>
                                                    <td>Zodiac Sign</td>
                                                    <td>: <%# Eval("Zodiac_Sign") %></td>
                                                </tr>
                                                <tr>
                                                    <td>Height</td>
                                                    <td>: <%# Eval("Height") %></td>
                                                </tr>
                                                <tr>
                                                    <td>Weight In Kg </td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Weight")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Blood Group</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Blood_group")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Skin complaction </td>
                                                    <td>: <%#ProcessMyDataItem( Eval("Skin_complaction")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Maritial Status</td>
                                                    <td>:
                                                        <asp:Label ID="lblmaritialstatus" runat="server" Text=' <%# ProcessMyDataItem(Eval("Maritial_Status")) %>'></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="lblnochild" runat="server" Text=' No Of Child :'></asp:Label></td>
                                                    <td>
                                                        <asp:Label ID="lblnoofchild" runat="server" Text='<%# ProcessMyDataItem(Eval("No_of_child")) %>'></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td>Known Language</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Language_Know")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Hobbies </td>
                                                    <td>: <%# ProcessMyDataItem( Eval("Hobbies")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Nationality</td>
                                                    <td>: <%#ProcessMyDataItem( Eval("Nationality")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>City</td>
                                                    <td>: <%#ProcessMyDataItem( Eval("Current_city")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>State</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Current_state")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Country</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Current_country")) %></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="tab-pane" id="tab_default_2">
                                        <div class="well well-sm">
                                            <h4>EDUCATION</h4>
                                        </div>
                                      <%--  <p align="right">
                                            <button type="button" class="btn btn-default btn-sm">
                                                <span class="glyphicon glyphicon-edit"></span>Edit</button>
                                        </p>--%>
                                        <table class="table bio-table">
                                            <tbody>
                                                <tr>
                                                    <td>Hightest Education</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Hightest_Education")) %></td>

                                                </tr>
                                                <tr>
                                                    <td>University </td>
                                                    <td>: <%# ProcessMyDataItem(Eval("University") )%></td>

                                                </tr>
                                                <tr>
                                                    <td>Year of Passing </td>
                                                    <td>: <%#ProcessMyDataItem( Eval("Year_of_Passing")) %></td>

                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="tab-pane" id="tab_default_3">
                                        <div class="well well-sm">
                                            <h4>OCCUPATION</h4>
                                        </div>
                                       <%-- <p align="right">
                                            <button type="button" class="btn btn-default btn-sm">
                                                <span class="glyphicon glyphicon-edit"></span>Edit</button>
                                        </p>--%>
                                        <table class="table bio-table">
                                            <tbody>
                                                <tr>
                                                    <td>Occupation</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Occupation")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Occupation in details</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Occupation_in_details")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Monthly Income</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Monthly_Income")) %></td>
                                                </tr>

                                            </tbody>
                                        </table>

                                        <br />


                                    </div>

                                    <div class="tab-pane" id="tab_default_4">
                                        <div class="well well-sm">
                                            <h4>FAMILY</h4>
                                        </div>
                                        <%--<p align="right">
                                            <button type="button" class="btn btn-default btn-sm">
                                                <span class="glyphicon glyphicon-edit"></span>Edit</button>
                                        </p>--%>
                                        <table class="table bio-table">
                                            <tbody>
                                                <tr>
                                                    <td>Father Name</td>
                                                    <td>: <%#ProcessMyDataItem( Eval("Father_Name")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Mother Name</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Mother_Name")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Brother</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Brother")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Sister</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Sister")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Family Address</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Family_Address")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>City</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Family_add_city")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>State</td>
                                                    <td>: <%#ProcessMyDataItem( Eval("Family_add_state")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Country</td>
                                                    <td>: <%# ProcessMyDataItem( Eval("Family_add_country")) %></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="tab-pane" id="tab_default_5">
                                        <div class="well well-sm">
                                            <h4>CONTACT DETAIL</h4>
                                        </div>
                                       <%-- <p align="right">
                                            <button type="button" class="btn btn-default btn-sm">
                                                <span class="glyphicon glyphicon-edit"></span>Edit</button>
                                        </p>--%>
                                        <table class="table bio-table">
                                            <tbody>
                                                <tr>
                                                    <td>Mobile 1</td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Home_Mobile1")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Mobile 2</td>
                                                    <td>: <%# ProcessMyDataItem( Eval("Home_Mobile2")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Email Address 1 </td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Email_Address_1")) %></td>
                                                </tr>
                                                <tr>
                                                    <td>Email Address 2 </td>
                                                    <td>: <%# ProcessMyDataItem(Eval("Email_Address_2")) %></td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>

                                    <%--<div class="tab-pane" id="tab_default_6">
                                        <div class="well well-sm">
                                            <h4>PHOTOES</h4>
                                        </div>
                                        <p align="right">
                                            <button type="button" class="btn btn-default btn-sm">
                                                <span class="glyphicon glyphicon-edit"></span>Edit</button>
                                        </p>
                                        <table class="table bio-table">
                                            <tbody>
                                                <div id="gallery" class="galleryview">
                                                  <asp:DataList ID="dtlist" runat="server" RepeatColumns="4" CellPadding="5">
<ItemTemplate>
<asp:HyperLink ID="HyperLink1" class="preview" ToolTip='<%#Bind("image") %>' NavigateUrl='<%# Bind("image", "~/Picture/{0}") %>' runat="server">
<asp:Image Width="100" ID="Image1" ImageUrl='<%# Bind("image", "~/Picture/{0}") %>' runat="server" />
</asp:HyperLink>
</ItemTemplate>
<ItemStyle BorderColor="Brown" BorderStyle="dotted" BorderWidth="3px" HorizontalAlign="Center"
VerticalAlign="Bottom" />
</asp:DataList>
                                                    <ul class="filmstrip">
                                                        <asp:Repeater ID="rptthumb" runat="server">
                                                            <ItemTemplate>
                                                                <li>
                                                                   <img src='Picture/<%# Eval("image") %>' alt="" class="img-responsive" height="200" width="200"></li>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </ul>
                                                </div>
                                             
                                            </tbody>
                                        </table>


                                        
                                    </div>--%>

                                </div>
                            </div>
                        </div>
                    </div>



                </div>
          
                </div>
        </ItemTemplate>
    </asp:Repeater>
      <div id="divBackground" class="modal">
</div>
<div id="divImage" class = "info Content" >
   
    <table style="height: 100%; width: 100%" class="table table-responsive-sm">
         <tr>
            <td align="center" valign="top">
                <input id="btnClose" type="button" class="btn btn-danger" value="Close"
                 onclick="HideDiv()"/>
            </td>
        </tr>
        <tr>
            <td valign="middle" align="center" onscroll="">
                <img id="imgLoader" alt=""
                 src="images/loader.gif" />
                <div class = "" >
                <img id="imgFull" runat="server" alt="" src="" 
                 style="display: none;
                height: auto;width: 590px" class="img img-responsive" />
                    </div>
            </td>
        </tr>
       
    </table>
</div>
</div>
</asp:Content>

