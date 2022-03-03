<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" CodeFile="Profiledetails.aspx.cs" Inherits="Profiledetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="section-padding bg-dark inner-header">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 class="mt-0 mb-3 text-white">PROFILE DETAIL</h1>
                    <div class="breadcrumbs">
                        <p class="mb-0 text-white"><a class="text-white" href="main.aspx">Home</a> &nbsp;/&nbsp; <span class="text-white">PROFILE</span></p>
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
                                                        <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="card-img-top" style="object-fit: contain;">
                                                        <div class="card-body pb-0">
                                                            <h5 class="card-title mb-4"><%# Eval("Name") %></h5>
                                                             <asp:Label ID="lblbiodataid" runat="server" Text='<%# Eval("Biodata_id") %>' Visible="false"></asp:Label>
                                                            <h6 class="card-subtitle mb-3 text-muted"><i class="mdi mdi-phone"></i> <asp:Label ID="lblmobile" runat="server" Text='<%# Eval("Home_Mobile1") %>' Visible="false"></asp:Label></h6>
                                                            <h6 class="card-subtitle mb-3 text-muted"><i class="mdi mdi-email"></i><%# Eval("Email_Address_1") %></h6>
                                                            <asp:LinkButton ID="lnkchat" runat="server" CssClass="btn btn-success btn-sm" CommandArgument='<%# Eval("id") %>' Visible="true" OnCommand="lnkchat_Command">Chat</asp:LinkButton>
                                                            <asp:LinkButton ID="lnkshortlist" CommandArgument='<%# Eval("Biodata_id") %>' CssClass="btn btn-success btn-sm" runat="server" OnCommand="lnkshortlist_Command">Shortlist</asp:LinkButton>
                                                            <asp:LinkButton ID="lnkexpressintrest" CssClass="btn btn-success btn-sm" ForeColor="White" CommandArgument='<%# Eval("Biodata_id") + "," + Eval("Name") + "," + Eval("id") %>' runat="server" OnClick="lnkexpressintrest_Click">Express Intrest</asp:LinkButton>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                                <asp:Repeater ID="rptfeacheredprofile" runat="server" OnItemDataBound="rptfeacheredprofile_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="card sidebar-card" style="max-width: 500px;">
                                            <div class="row g-0">
                                                <div class="col-sm-5">
                                                    <%-- <img src="images/sample.svg" class="card-img-top h-100" alt="...">--%>
                                                    <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="img img-thumbnail" height="300" width="300" style="margin-top: 22px; height: 150px; width: 150px;margin-left:16px">
                                                </div>
                                                <div class="col-sm-7">
                                                    <div class="card-body">
                                                        <h5 class="card-title"><%# Eval("Name") %></h5>
                                                        <p class="card-text">
                                                            <b>Height : </b><%# Eval("Height") %>
                                                            <br />

                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Biodata_id") %>' Visible="false"></asp:Label>
                                                            <%--  <b> Occupation :</b> <%# Eval("Occupation") %><br /><br />--%>
                                                            <b>Hightest Education :</b><%# Eval("Hightest_Education") %><br />

                                                            <b>Monthly Income : Rs.</b>    <%# Eval("Monthly_Income") %>
                                                        </p>
                                                        <asp:LinkButton ID="LinkButton1" CssClass="btn btn-facebook btn-sm" ForeColor="White" CommandArgument='<%# Eval("Search_ID") %>' runat="server" OnClick="LinkButton1_Click">View in Detail</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </ItemTemplate>
                                </asp:Repeater>
                            


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
                                                <p class="mb-0"><%# Eval("Starname") %></p>
                                            </div>
                                        </div>

                                        <div class="col-lg-6 col-md-6">
                                            <div class="list-icon">
                                                <i class="mdi mdi-minus"></i>
                                                <strong>Date of Birth / Time of Birth:</strong>
                                                <p class="mb-0"><%# Eval("Date_of_Birth", "{0: dd/MM/yyyy}")%> / <%# Eval("Time_of_Birth") %></p>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="card padding-card">
                                <div class="card-body">
                                    <h5 class="card-title mb-3">Personal details</h5>
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
                                    <h5 class="card-title mb-3">Professional details</h5>
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
                                    <h5 class="card-title mb-3">Family details</h5>
                                    <div class="row mb-3">

                                        <div class="col-lg-6 col-md-6">
                                            <p><strong class="text-dark">Father Name :</strong>  <%# Eval("Father_Name") %></p>
                                            <p><strong class="text-dark">Father Occupation :</strong>  <%# Eval("Father_Occupation") %></p>
                                            <p><strong class="text-dark">Mother Name :</strong>  <%# Eval("Mother_Name") %></p>
                                            <p><strong class="text-dark">Mother Occupation :</strong>  <%# Eval("Mother_Occupation") %></p>
                                            <p><strong class="text-dark">Brother :</strong>  <%# Eval("Brother") %></p>
                                            <p><strong class="text-dark">Sister :</strong>  <%# Eval("Sister") %></p>
                                        </div>
                                        <div class="col-lg-6 col-md-6">

                                            <p><strong class="text-dark">Family Address :</strong> <%# Eval("Family_Address") %></p>
                                            <p><strong class="text-dark">Family Address city/state/country :</strong> <%# Eval("Family_add_city") %> /<%# Eval("Family_add_state") %>/<%# Eval("Family_add_country") %></p>
                                            <p><strong class="text-dark">Home Mobile Number 1 :</strong> <%# Eval("Home_Mobile2") %></p>
                                            <p><strong class="text-dark">Home Mobile Number 2 :</strong> <%# Eval("Home_Mobile3") %></p>
                                            <p><strong class="text-dark">Email Address ID 1 :</strong> <%# Eval("Email_Address_1") %></p>
                                            <p><strong class="text-dark">Email Address ID 2 :</strong> <%# Eval("Email_Address_2") %></p>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="card padding-card" id="lipreference" runat="server" visible="false">
                                <div class="card-body">


                                    <div id="lipatner" runat="server" visible="false">
                                        <h2>See how well
                                            <asp:Label ID="lblg" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="lblgender" runat="server" Text='<%# Eval("Gender") %>' Visible="false"></asp:Label>
                                            profile matches  
                            With Your preferences</h2>
                                        <asp:Label ID="lblbiodata" runat="server" Text='<%# Eval("Biodata_id") %>' Visible="false"></asp:Label>
                                        <br />

                                    </div>



                                    <div class="row mb-3">

                                        <div class="col-lg-6 col-md-6">
                                            <h5 class="card-title mb-3">Profile Details</h5>
                                            <p><span class="mdi mdi-check"></span><b>Age</span>: </b><%# ProcessMyDataItem(Eval("Age")) %></p>
                                            <p><span class="mdi mdi-check"></span><b>Height</b>:  <%#ProcessMyDataItem( Eval("Height")) %>  </p>
                                            <%--  <p> <span class="mdi mdi-check"></span><b> Physical Status</b>: <%# ProcessMyDataItem(Eval("Physical_Status")) %></p>--%>
                                            <p><span class="mdi mdi-check"></span><b>Religion</b>: <%# ProcessMyDataItem(Eval("Religion")) %></p>
                                            <p><span class="mdi mdi-check"></span><b>Caste</b>:  <%# ProcessMyDataItem(Eval("Cast")) %></p>
                                            <p><span class="mdi mdi-check"></span><b>Zoradic</b>:  <%# ProcessMyDataItem(Eval("Starname")) %></p>
                                            <p><span class="mdi mdi-check"></span><b>Education</b>:  <%# ProcessMyDataItem(Eval("Hightest_Education")) %></p>
                                            <p><span class="mdi mdi-check"></span><b>Mother language</b>: <%# ProcessMyDataItem(Eval("Language_Know")) %></p>
                                            <p><span class="mdi mdi-check"></span><b>Occupation</b>:  <%# ProcessMyDataItem(Eval("Occupation")) %></p>

                                            <p><span class="mdi mdi-check"></span><b>Monthly Income</b>:  <%# ProcessMyDataItem(Eval("Monthly_Income")) %></p>
                                            <p>
                                                <span class="mdi mdi-check"></span><b>Country</b>:  <%# ProcessMyDataItem(Eval("Country")) %>
                                            </p>
                                            <p>
                                                <span class="mdi mdi-check"></span><b>Residing City</b>:  <%# ProcessMyDataItem(Eval("Family_add_city")) %>
                                            </p>
                                        </div>
                                        <div class="col-lg-6 col-md-6">
                                            <asp:Repeater ID="rptbasicpreference" runat="server">
                                                <ItemTemplate>
                                                    <h5 class="card-title mb-3">Your Basic Preference </h5>
                                                    <p><span class="mdi mdi-check"></span><b><%# Eval("Gender") %> Age</span>: </b><%# ProcessMyDataItem(Eval("AgeFrom")) %> To  <%# ProcessMyDataItem(Eval("AgeTo")) %></p>
                                                    <p><span class="mdi mdi-check"></span><b>Height</b>:  <%#ProcessMyDataItem( Eval("HeightFrom")) %> To <%# ProcessMyDataItem(Eval("HeightTo")) %></p>
                                                    <p><span class="mdi mdi-check"></span><b>Physical Status</b>: <%# ProcessMyDataItem(Eval("Physical_Status")) %></p>
                                                    <p><span class="mdi mdi-check"></span><b>Religion</b>: <%# ProcessMyDataItem(Eval("Religion")) %></p>
                                                    <p><span class="mdi mdi-check"></span><b>Caste</b>:  <%# ProcessMyDataItem(Eval("Caste")) %></p>
                                                    <p><span class="mdi mdi-check"></span><b>Zoradic</b>:  <%# ProcessMyDataItem(Eval("Zoradic")) %></p>
                                                    <p><span class="mdi mdi-check"></span><b>Education</b>:  <%# ProcessMyDataItem(Eval("Education")) %></p>
                                                    <p><span class="mdi mdi-check"></span><b>Mother language</b>: <%# ProcessMyDataItem(Eval("Mother_language")) %></p>
                                                    <p><span class="mdi mdi-check"></span><b>Occupation</b>:  <%# ProcessMyDataItem(Eval("Occupation")) %></p>

                                                    <p><span class="mdi mdi-check"></span><b>Annual Income</b>:  <%# ProcessMyDataItem(Eval("Annual_Income")) %></p>
                                                    <p>
                                                        <span class="mdi mdi-check"></span><b>Country</b>:  <%# ProcessMyDataItem(Eval("Country")) %>
                                                    </p>
                                                    <p>
                                                        <span class="mdi mdi-check"></span><b>Residing City</b>:  <%# ProcessMyDataItem(Eval("Residing_City")) %>
                                                    </p>

                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                        </div>
                        </div>

                    </div>
                 
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                            </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
    </section>
</asp:Content>

