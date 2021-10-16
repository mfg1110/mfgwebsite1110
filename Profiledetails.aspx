﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" CodeFile="Profiledetails.aspx.cs" Inherits="Profiledetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="section-padding bg-dark inner-header">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 class="mt-0 mb-3 text-white">PROFILE DETAIL</h1>
                    <div class="breadcrumbs">
                        <p class="mb-0 text-white"><a class="text-white" href="main.aspx">Home</a> &nbsp;/&nbsp; <span class="text-success">PROFILE</span></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="section-padding">
        <div class="container">
            <asp:Repeater ID="rptprofile" runat="server" OnItemDataBound="rptprofile_ItemDataBound">
                <ItemTemplate>
                    <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="card sidebar-card">
                        <div class="card-body">
                            <h5 class="card-title mb-4">About <%# Eval("Name") %></h5>
                            <div id="featured-properties">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <div class="card card-list">
                                            <a href="#">
                                               <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="card-img-top"   style="  object-fit: contain;">
                                                <div class="card-body pb-0">
                                                    <h5 class="card-title mb-4"><%# Eval("Name") %></h5>
                                                    <h6 class="card-subtitle mb-3 text-muted"><i class="mdi mdi-phone"></i><%# Eval("Home_Mobile1") %></h6>
                                                    <h6 class="card-subtitle mb-3 text-muted"><i class="mdi mdi-email"></i><%# Eval("Email_Address_1") %></h6>
                                                  
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card sidebar-card">
                          <asp:Repeater ID="rptfeacheredprofile" runat="server">
                <ItemTemplate>
                        <div class="card">

            <div class="row no-gutters">

                <div class="col-sm-5">
                       <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="card-img"   style="  object-fit: contain;">
                
                </div>
                <div class="col-sm-7">
                    <div class="card-body">
                        <h5 class="card-title"><%# Eval("Name") %></h5>
                        <p class="card-text"><p> <%# Eval("Height") %>, <%# Eval("Occupation") %>, <%# Eval("Hightest_Education") %>, Rs. <%# Eval("Monthly_Income") %> </p></p>
                       <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success btn-sm" ForeColor="White" CommandArgument='<%# Eval("Search_ID") %>' runat="server" OnClick="LinkButton1_Click">View in Detail</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
                    </ItemTemplate>
                              </asp:Repeater>
                    </div>
                    
                    
                </div>
                <div class="col-lg-8 col-md-8">
                    <div class="card padding-card">
                        <div class="card-body">
                            <h5 class="card-title mb-3">About</h5>
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
                                        <p class="mb-0"><%# Eval("Zodiac_Sign") %></p>
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
                    <div class="card padding-card">
                        <div class="card-body">
                            <h5 class="card-title mb-3"> Personal details</h5>
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
                    <div class="card padding-card">
                        <div class="card-body">
                            <h5 class="card-title mb-3"> professional details</h5>
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
                    <div class="card padding-card">
                        <div class="card-body">
                            <h5 class="card-title mb-3"> Family details</h5>
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
                    
              
                </div>
                
            </div>
                </ItemTemplate>
            </asp:Repeater>
            
        </div>
    </section>
</asp:Content>

