<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MasterPage.master" AutoEventWireup="true" CodeFile="profilelist.aspx.cs" Inherits="profilelist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="w3layouts-inner-banner">
		<div class="container">
			<div class="logo">
				<h1><a class="cd-logo link link--takiri" href="index.html">Match <span><i class="fa fa-heart" aria-hidden="true"></i>Made in heaven.</span></a></h1>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
    <div class="w3layouts-breadcrumbs text-center">
		<div class="container">
			<span class="agile-breadcrumbs"><a href="Default.aspx">Home</a> &gt; <span>NRI here</span></span>
		</div>
	</div>
    <div class="w3ls-list">
		<div class="container">
		<h2>Gujarati Matrimonial Profiles list</h2>
		<div class="col-md-9 profiles-list-agileits">
		<!--Horizontal Tab-->
			<div id="parentHorizontalTab" style="display: block; width: 100%; margin: 0px;">
				<ul class="resp-tabs-list hor_1">
					<li class="resp-tab-item hor_1 resp-tab-active" aria-controls="hor_1_tab_item-0" role="tab" style="background-color: white; border-color: rgb(193, 193, 193);">Grooms</li>
					<li class="resp-tab-item hor_1" aria-controls="hor_1_tab_item-1" role="tab" style="background-color: rgb(245, 245, 245);">Brides</li>
				</ul>
				<div class="resp-tabs-container hor_1" style="border-color: rgb(193, 193, 193);">
					<h2 class="resp-accordion hor_1 resp-tab-active" role="tab" aria-controls="hor_1_tab_item-0" style="background: none; border-color: rgb(193, 193, 193);"><span class="resp-arrow"></span>Grooms</h2><div class="resp-tab-content hor_1 resp-tab-content-active" aria-labelledby="hor_1_tab_item-0" style="display:block">			
						<div class="match-profile">
                            <asp:Repeater ID="rptourdata" runat="server" OnItemDataBound="rptourdata_ItemDataBound">
                                <ItemTemplate>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : <%# Eval("Search_ID") %></h5>
                                       <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="prf-img img-responsive" height="300"  style="  object-fit: contain;">
			
									<div class="w3-prfr">
                                        <h4><%# Eval("Name") %></h4>
										<p> <%# Eval("Height") %>, <%# Eval("Occupation") %>, <%# Eval("Hightest_Education") %>, Rs. <%# Eval("Monthly_Income") %> </p>
										<%--<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>--%>
										   <asp:LinkButton ID="lnkexpressintrest" CssClass="btn btn-primary" ForeColor="White" Visible="false" CommandArgument='<%# Eval("Biodata_id") + "," + Eval("Name") + "," + Eval("id") %>' runat="server" OnClick="lnkexpressintrest_Click">Express Intrest</asp:LinkButton>

                                  
                                         <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" ForeColor="White" CommandArgument='<%# Eval("Search_ID") %>' runat="server" OnClick="LinkButton1_Click">View in Detail</asp:LinkButton>

									</div>
									<div class="clearfix"></div>
									<%--<p class="light">Smart, Intelligent, well mannered and humble boy... <a href="groom_profile.html">read more</a></p>--%>
								</div>
							</div>
							</ItemTemplate>
                                </asp:Repeater>
							<div class="clearfix"></div>
						</div>
					</div>
					<h2 class="resp-accordion hor_1" role="tab" aria-controls="hor_1_tab_item-1" style="background-color: rgb(245, 245, 245); border-color: rgb(193, 193, 193);"><span class="resp-arrow"></span>Brides</h2><div class="resp-tab-content hor_1" aria-labelledby="hor_1_tab_item-1" style="border-color: rgb(193, 193, 193);">
						<div class="match-profile">
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="col-md-6 one-w3-profile">
								<div class="profile-details">
									<h5>Profile ID : T45Dfsd64</h5>
									<img src="images/profile-image-girl.jpg" class="prf-img img-responsive" alt="profile image">
									<div class="w3-prfr">
										<p>24yrs / 5Ft. 3In. (160 cm). Female, Hindu, Gupta, Hindi USA</p>
										<h4>Contact Now:</h4>
										<a href="#" data-toggle="modal" data-target="#myModal">Login</a><span>or</span><a href="index.html">Register</a>
										
									</div>
									<div class="clearfix"></div>
									<p class="light">My daughter, is fair, charming and broad minded. S... <a href="bride_profile.html">read more</a></p>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3 w3ls-aside">
			<h4>Filter Profiles by</h4>
			<div class="fltr-w3ls">
				<h5>Country</h5>
				<ul>
					<li><a href="#">Country1</a></li>
					<li><a href="#">Country2</a></li>
					<li><a href="#">Country3</a></li>
					<li><a href="#">Country4</a></li>
					<li><a href="#">Country5</a></li>
					<li><a href="#">Country6</a></li>
					<li><a href="#">Country7</a></li>
					<li><a href="#">Country8</a></li>
				</ul>
			</div>
			<div class="fltr-w3ls">
				<h5>Religion</h5>
				<ul>
					<li><a href="#">Religion1</a></li>
					<li><a href="#">Religion2</a></li>
					<li><a href="#">Religion3</a></li>
					<li><a href="#">Religion4</a></li>
					<li><a href="#">Religion5</a></li>
					<li><a href="#">Religion6</a></li>
					<li><a href="#">Religion7</a></li>
				</ul>
			</div>
			<div class="fltr-w3ls">
				<h5>Profession</h5>
				<ul>
					<li><a href="#">Profession1</a></li>
					<li><a href="#">Profession2</a></li>
					<li><a href="#">Profession3</a></li>
					<li><a href="#">Profession4</a></li>
					<li><a href="#">Profession5</a></li>
					<li><a href="#">Profession6</a></li>
				</ul>
			</div>
		</div>
	<div class="clearfix"></div>
	</div>
	<!-- Modal -->
				<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
				  <div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
					  <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h4 class="modal-title">Login to Continue</h4>
					  </div>
					  <div class="modal-body">
						<div class="login-w3ls">
							<form id="signin" action="#" method="post">
								<label>User Name </label>
								<input type="text" name="User Name" placeholder="Username" required="">
								<label>Password</label>
								<input type="password" name="Password" placeholder="Password" required="">	
								<div class="w3ls-loginr"> 
									<input type="checkbox" id="brand" name="checkbox" value="">
									<span> Remember me ?</span> 
									<a href="#">Forgot password ?</a>
								</div>
								<div class="clearfix"> </div>
								<input type="submit" name="submit" value="Login">
								<div class="clearfix"> </div>
								<div class="social-icons">
									<ul>  
										<li><a href="#"><span class="icons"><i class="fa fa-facebook" aria-hidden="true"></i></span><span class="text">Facebook</span></a></li> 
										<li class="twt"><a href="#"><span class="icons"><i class="fa fa-twitter" aria-hidden="true"></i></span><span class="text">Twitter</span></a></li>  
									</ul> 
									<div class="clearfix"> </div>
								</div>	
							</form>
						</div>
					  </div>
					</div>

				  </div>
				</div>
				<!-- //Modal -->
	</div>
</asp:Content>

