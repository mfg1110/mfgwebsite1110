<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" CodeFile="ViewBiodetail.aspx.cs" Inherits="ViewBiodetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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

  
    <style>
        
.bio-table {
    width: 100%;
    border: 0px solid;
    max-width:100%;
    margin-left: -78px;
}

    .bio-table td {
        /*text-transform: capitalize;*/
        text-align: left;
        font-size: 15px;
    }

    .bio-table > tbody > tr > td {
        border: 0px solid;
        /*text-transform: capitalize;*/
        color: rgb(0, 4, 51);
        font-size: 15px;
    }

.responsiv-table {
    border: 0px solid;
}

@media all and (max-width:430px) {
    .profile-head ul li {
        font-size: 12px !important;
    }

    .nav-menu li {
        width: 50%;
    }
   
    .bio-table > tbody > tr > td {
        font-size: 13px;
    }
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="rptsingledata" runat="server" OnItemDataBound="rptsingledata_ItemDataBound">
        <ItemTemplate>
    <div class="content-wrapper pb-0">
    <section class="single-post-area section-padding ">
          <div class="row">

            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <div class="container" style="margin-top: -10px;">
                    <div class="row">
                        <!--col-md-4 col-sm-4 col-xs-12 close-->
                        <div class="col-md- col-sm-4 col-xs-12">
                           <%--   <asp:image id="Image1" runat="server" onclick="ShowFull(this)" ImageUrl='Picture/<%# ProcessDataItem(Eval("Photo")) %>' class="img img-responsive" style="background-color:#ffffff"/>--%>
                            
                           <a href="<%# DataBinder.Eval(Container.DataItem, "Photo","Picture/{0}")%>" target="_blank" style="border-width:thick">
                          
                              <img src="Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="img img-responsive img-thumbnail" Height="150" Width="150" style="background-color:#ffffff;cursor: pointer;margin-left: 80px;padding: 7px 5px;object-fit: contain;background-color:white;border-width:thick;height:150px">
                      	</a>

                          	
                                                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%--  <div class="container" style="margin-left: 90px;">
                                <span class="btn btn-default uplod-file">Upload Photo
                                    <input type="file" />
                                </span>
                            </div>--%></div>
                        <!--col-md-4 col-sm-4 col-xs-12 close-->

                        <div class="col-md-5 col-sm-5 col-xs-12">
                            <h5 style="letter-spacing: 5px;"><%# Eval("Name") %></h5>


                            <ul>
                                <li><span class="glyphicon glyphicon-briefcase"></span><%#ProcessMyDataItem( Eval("Occupation") )%></li>
                                <li><span class="glyphicon glyphicon-map-marker"></span><%# ProcessMyDataItem(Eval("Current_country")) %></li>
                                <li><span class="glyphicon glyphicon-home"></span><%# ProcessMyDataItem(Eval("Current_Address")) %></li>
                                <li><span class="glyphicon glyphicon-phone"></span>
                                    <a href="#" title="call"><%# ProcessMyDataItem(Eval("Home_Mobile1")) %></a>
                                   
                                </li>
                                <li><span class="glyphicon glyphicon-envelope"></span>
                                     <asp:Label ID="lblemail" runat="server" Text=""></asp:Label>
                                    <a href="#" title="mail"><%# ProcessMyDataItem(Eval("Email_Address_1") )%></a>

                                </li>
                              <!--   <li> <asp:LinkButton ID="lnkchat" CssClass="btn btn-block" BackColor="#ff5e13" ForeColor="White" CommandArgument='<%# Eval("Name") %>' runat="server" OnClick="lnkchat_Click" >Chat</asp:LinkButton>-->
                                   
                            </ul>

                        </div>
                    </div>
                    <br />

                    <!--profile-head close-->
                </div>

    <div class="container mt-4">
   <div class="col-12">
<ul class="nav nav-tabs responsive " role="tablist">

   <li class="nav-item">
                                        <a class="nav-link"  href="#tab_default_1" data-toggle="tab">Personal Info </a>
                                    </li>
                                   <li class="nav-item">
                                        <a class="nav-link"  href="#tab_default_2" data-toggle="tab">Education</a>
                                    </li>
                                   <li class="nav-item">
                                        <a  class="nav-link" href="#tab_default_3" data-toggle="tab">Occupation Info</a>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link"  href="#tab_default_4" data-toggle="tab">Family Details</a>
                                    </li>
                                  <li class="nav-item">
                                        <a  class="nav-link"  href="#tab_default_5" data-toggle="tab">Contact Details</a>
                                    </li>
	<%--<li class="nav-item">
		<a class="nav-link active" data-toggle="tab" href="#home" role="tab">First Panel</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#profile" role="tab">Second Panel</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" data-toggle="tab" href="#messages" role="tab">Third Panel</a>
	</li>--%>
</ul><!-- Tab panes -->
<div class="tab-content responsive">
	<div class="tab-pane active"  id="tab_default_1" role="tabpanel">
		<div class="container-fluid">
			<div class="row mt-3">
                <div class="col">
                 <div class="well well-sm">
                                            <h4>PERSONAL DATA</h4>
                                        </div>
                                       <%-- <p align="right">
                                            <button type="button" class="btn btn-default btn-sm">
                                                <span class="glyphicon glyphicon-edit"></span>Edit</button>

                                        </p>--%>
                                        <table class="table bio-table">
                                            <tbody>
                                                <tr >
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
                                               <%-- <tr>
                                                    <td>Religion</td>
                                                    <td>: <%# Eval("Religion") %></td>
                                                </tr>--%>
                                                 <tr>
                                                    <td>Religion</td>
                                                    <td>: <%# Eval("Cast") %></td>
                                                </tr>
                                                 <tr>
                                                    <td>Cast</td>
                                                    <td>: <%# Eval("Subcast") %></td>
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
				
			</div>
		</div>
	</div>
	<div class="tab-pane" id="tab_default_2" role="tabpanel">
		<div class="container-fluid">
			<div class="row mt-3">
                	<div class="col">
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
				
			</div>
		</div>
	</div>
	<div class="tab-pane" id="tab_default_3" role="tabpanel">
		<div class="container-fluid">
			<div class="row mt-3">
                	<div class="col">
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
			</div>
		</div>
	</div>
    <div class="tab-pane" id="tab_default_4" role="tabpanel">
		<div class="container-fluid">
			<div class="row mt-3">
                <div class="col">
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
			</div>
		</div>
	</div>
    <div class="tab-pane" id="tab_default_5" role="tabpanel">
		<div class="container-fluid">
			<div class="row mt-3">
                 
				<div class="col">
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
        </section>



        
        </div>
            </ItemTemplate>
        </asp:Repeater>
   
</asp:Content>

