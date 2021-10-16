<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/UserDashboardMasterPage.master" AutoEventWireup="true" CodeFile="Userprofile.aspx.cs" Inherits="UserDashboard_Userprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="top-bar clearfix">
        <div class="page-title">
            <h4>Profile<small class="samll">User Profile</small></h4>
        </div>

    </div>

    <div class="main-container">
        <div class="container-fluid">
            <asp:Repeater ID="rptuserprofile" runat="server" OnItemCommand="rptuserprofile_ItemCommand">
                <ItemTemplate>
                    <div class="spacer-xs">
                        <div class="row gutter">
                            <div class="col-md-12 col-sm-12 col-sx-12">
                                <div class="user-account">
                                    <div class="user-bg"></div>
                                    <div class="user-pic">
                                        <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" style="object-fit: contain;">
                                    </div>
                                    <div class="user-details">
                                        <h4 class="user-name"><%# Eval("Name") %> </h4>

                                        <h6 style="color: white"><i class="mdi mdi-phone"></i><%# Eval("Home_Mobile1") %></h6>
                                        <h6 style="color: white"><i class="mdi mdi-email"></i><%# Eval("Email_Address_1") %></h6>

                                    </div>
                                    <div class="social-list">
                                        <div class="row gutter">
                                            <div class="col-md-6 col-md-offset-3">
                                                <div class="row">
                                                    <div class="col-md-4 col-sm-4 col-xs-4 center-text">
                                                        <h3><i class="glyphicon glyphicon-edit"></i></h3>
                                                        <asp:LinkButton ID="linkedit" runat="server" ForeColor="White" CommandName="edit" CommandArgument='<%# Eval("Biodata_id") %>' OnCommand="linkedit_Command">Edit</asp:LinkButton>
                                                    </div>
                                                    <div class="col-md-4 col-sm-4 col-xs-4 center-text">
                                                        <h3><i class="glyphicon glyphicon-eye-close"></i></h3>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" CommandName="DeactivateProfile" CommandArgument='<%# Eval("id") %>'>Deactivate Profile</asp:LinkButton>
                                                    </div>
                                                    <div class="col-md-4 col-sm-4 col-xs-4 center-text">

                                                        <h3><i class="glyphicon glyphicon-trash"></i></h3>
                                                        <asp:LinkButton ID="lnkdelete" runat="server" ForeColor="White" CommandName="Delete" CommandArgument='<%# Eval("id") %>'>Delete</asp:LinkButton>
                                                    </div>

                                                    <%--  <div class="col-md-3 col-sm-3 col-xs-3 center-text">
                                                <h3>57</h3>
                                                <small>Contacts</small></div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row gutter">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-sx-12">
                                <div class="panel panel-red">
                                    <div class="panel-heading">
                                        <h4>Activity</h4>
                                    </div>
                                    <div class="panel-body">
                                        <ol class="activity-stream">
                                            <li><i class="fa fa-comment-o red-bg icon"></i>

                                                <div class="card padding-card">
                                                    <div class="card-body">
                                                        <h5 class="card-title mb-3">ABOUT</h5>
                                                        <hr />
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4">
                                                                <div class="list-icon">
                                                                    <i class="mdi mdi-minus"></i>
                                                                    <strong>Age:</strong>
                                                                    <p class="mb-0"><%# Eval("Age") %></p>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4">
                                                                <div class="list-icon">
                                                                    <i class="mdi mdi-minus"></i>
                                                                    <strong>Religion/Cast:</strong>
                                                                    <p class="mb-0"><%# Eval("Cast") %> / <%# Eval("Subcast") %></p>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-md-4">
                                                                <div class="list-icon">
                                                                    <i class="mdi mdi-minus"></i>
                                                                    <strong>Height / Weight:</strong>
                                                                    <p class="mb-0"><%# Eval("Height") %> / <%# Eval("Weight") %> kg</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-4 col-md-4">
                                                                <div class="list-icon">
                                                                    <i class="mdi mdi-minus"></i>
                                                                    <strong>Zodiac Sign :</strong>
                                                                    <p class="mb-0"><%# Eval("Starname") %></p>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-6 col-md-6">
                                                                <div class="list-icon">
                                                                    <i class="mdi mdi-minus"></i>
                                                                    <strong>Date of Birth / Time of Birth:</strong>
                                                                    <p class="mb-0"><%# Eval("Date_of_Birth") %> / <%# Eval("Time_of_Birth") %></p>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </li>
                                            <li><i class="fa fa-envelope-o green-bg icon"></i>
                                                <div class="card padding-card">
                                                    <div class="card-body">
                                                        <h5 class="card-title mb-3">PERSONAL DETAILS</h5>
                                                        <hr />
                                                        <div class="row mb-3">

                                                            <div class="col-lg-6 col-md-6">
                                                                <p><strong class="text-dark">Blood group :</strong>  <%# Eval("Blood_group") %></p>
                                                                <p><strong class="text-dark">Skin complaction :</strong>  <%# Eval("Skin_complaction") %></p>
                                                                <p><strong class="text-dark">Maritial Status :</strong>  <%# Eval("Maritial_Status") %></p>
                                                                <p><strong class="text-dark">No of child :</strong>  <%# Eval("No_of_child") %></p>
                                                                <p><strong class="text-dark">Language Know :</strong>  <%# Eval("Language_Know") %></p>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6">

                                                                <p><strong class="text-dark">Hobbies :</strong>  <%# Eval("Hobbies") %></p>
                                                                <p><strong class="text-dark">Nationality :</strong> <%# Eval("Nationality") %></p>
                                                                <p><strong class="text-dark">Current Address :</strong> <%# Eval("Current_Address") %></p>
                                                                <p><strong class="text-dark">Current City/State/Country :</strong> <%# Eval("Current_city") %>/<%# Eval("Current_state") %>/<%# Eval("Current_country") %></p>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </li>
                                            <li><i class="fa fa-tags blue-bg icon"></i>
                                                <div class="card padding-card">
                                                    <div class="card-body">
                                                        <h5 class="card-title mb-3">PROFESSIONAL DETAILS</h5>
                                                        <div class="row mb-3">

                                                            <div class="col-lg-6 col-md-6">
                                                                <p><strong class="text-dark">Hightest Education :</strong>  <%# Eval("Hightest_Education") %></p>
                                                                <p><strong class="text-dark">University :</strong>  <%# Eval("University") %></p>
                                                                <p><strong class="text-dark">Year of Passing :</strong>  <%# Eval("Year_of_Passing") %></p>

                                                            </div>
                                                            <div class="col-lg-6 col-md-6">
                                                                <p><strong class="text-dark">Occupation :</strong>  <%# Eval("Occupation") %></p>
                                                                <p><strong class="text-dark">Occupation details :</strong>  <%# Eval("Occupation_in_details") %></p>
                                                                <p><strong class="text-dark">Monthly Income :</strong> <%# Eval("Monthly_Income") %></p>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </li>
                                            <li><i class="fa fa-thumbs-o-up fb-bg icon"></i>
                                                <div class="card padding-card">
                                                    <div class="card-body">
                                                        <h5 class="card-title mb-3">FAMILY DETAILS</h5>
                                                        <div class="row mb-3">

                                                            <div class="col-lg-6 col-md-6">
                                                                <p><strong class="text-dark">Father NamE :</strong>  <%# Eval("Father_Name") %></p>
                                                                <p><strong class="text-dark">Father Occupation :</strong>  <%# Eval("Father_Occupation") %></p>
                                                                <p><strong class="text-dark">Mother Name :</strong>  <%# Eval("Mother_Name") %></p>
                                                                <p><strong class="text-dark">Mother Occupation :</strong>  <%# Eval("Mother_Occupation") %></p>
                                                                <p><strong class="text-dark">Brother :</strong>  <%# Eval("Brother") %></p>
                                                                <p><strong class="text-dark">Sister :</strong>  <%# Eval("Sister") %></p>
                                                            </div>
                                                            <div class="col-lg-6 col-md-6">

                                                                <p><strong class="text-dark">Family Address :</strong> <%# Eval("Family_Address") %></p>
                                                                <p><strong class="text-dark">Family Address city/state/country :</strong> <%# Eval("Family_add_city") %> /<%# Eval("Family_add_state") %>/<%# Eval("Family_add_country") %></p>
                                                                <p><strong class="text-dark">Home Mobile Number 2 :</strong> <%# Eval("Home_Mobile2") %></p>
                                                                <p><strong class="text-dark">Home Mobile Number 3 :</strong> <%# Eval("Home_Mobile3") %></p>
                                                                <p><strong class="text-dark">Email Address ID 2 :</strong> <%# Eval("Email_Address_1") %></p>
                                                                <p><strong class="text-dark">Email Address ID 3 :</strong> <%# Eval("Email_Address_2") %></p>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </li>

                                        </ol>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</asp:Content>

