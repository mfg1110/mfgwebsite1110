<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
     
        <div class="w3layouts-banner" id="home">
            <div class="container-fluid">
                <div class="logo">
                    <h1><a class="cd-logo link link--takiri" href="index.html">Matrimony <span><i class="fa fa-heart" aria-hidden="true"></i>For Gujarati.</span></a></h1>
                </div>
                <div class="clearfix"></div>
                <div class="agileits-register">
                    <h3>Register NOW!</h3>
                      <asp:Label ID="lblerror" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                  <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                        <div class="w3_modal_body_grid">
                            <span>Profile For:</span>
                            <asp:DropDownList ID="ddlprofilefor" runat="server" class="frm-field required">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Myself</asp:ListItem>
                            <asp:ListItem>Son</asp:ListItem>
                            <asp:ListItem>Daughter</asp:ListItem>
                            <asp:ListItem>Brother</asp:ListItem>
                            <asp:ListItem>Sister</asp:ListItem>
                            <asp:ListItem>Relative</asp:ListItem>
                            <asp:ListItem>Friend</asp:ListItem>
                            </asp:DropDownList>
                          <%--  <select id="w3_country" onchange="change_country(this.value)" class="frm-field required">
                                <option value="null">Select</option>
                                <option value="null">Myself</option>
                                <option value="null">Son</option>
                                <option value="null">Daughter</option>
                                <option value="null">Brother</option>
                                <option value="null">Sister</option>
                                <option value="null">Relative</option>
                                <option value="null">Friend</option>
                            </select>--%>
                        </div>
                        <div class="w3_modal_body_grid w3_modal_body_grid1">
                            <span>Name:</span>
                            <asp:TextBox ID="txtname" runat="server" placeholder="Name"></asp:TextBox>
                           
                        </div>
                        <%--<div class="w3_modal_body_grid">
                            <span>Gender:</span>
                            <div class="w3_gender">
                                <asp:RadioButtonList ID="rdlgender" runat="server">
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                     <asp:ListItem Value="Female">Female</asp:ListItem>
                                </asp:RadioButtonList>
                               
                                <div class="clearfix"> </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="w3_modal_body_grid w3_modal_body_grid1">
                            <span>Date Of Birth:</span>
                             <asp:TextBox ID="txtdate" runat="server"  TextMode="Date"></asp:TextBox>
                        
                        </div>
                        <div class="w3_modal_body_grid">
                            <span>religion:</span>
                            <asp:DropDownList ID="ddlreligion" runat="server" class="frm-field required">
                    
                            </asp:DropDownList>
                         
                        </div>--%>
                        <div class="w3_modal_body_grid w3_modal_body_grid1">
                            <span>Mobile No:</span>
                            <!-- country codes (ISO 3166) and Dial codes. -->
                            <asp:TextBox ID="txtmobileno" runat="server" placeholder="Mobile"></asp:TextBox>
                        
                            <!-- Load jQuery from CDN so can run demo immediately -->
                            <script src="../App_Themes/Theme1/js/intlTelInput.js"></script>
                            <script>
                                $("#phone").intlTelInput({
                                    // allowDropdown: false,
                                    // autoHideDialCode: false,
                                    // autoPlaceholder: "off",
                                    // dropdownContainer: "body",
                                    // excludeCountries: ["us"],
                                    // formatOnDisplay: false,
                                    // geoIpLookup: function(callback) {
                                    //   $.get("http://ipinfo.io", function() {}, "jsonp").always(function(resp) {
                                    //     var countryCode = (resp && resp.country) ? resp.country : "";
                                    //     callback(countryCode);
                                    //   });
                                    // },
                                    // initialCountry: "auto",
                                    // nationalMode: false,
                                    // onlyCountries: ['us', 'gb', 'ch', 'ca', 'do'],
                                    // placeholderNumberType: "MOBILE",
                                    // preferredCountries: ['cn', 'jp'],
                                    // separateDialCode: true,
                                    utilsScript: "../App_Themes/Theme1/js/utils.js"
                                });
                            </script>
                        </div>
                        <div class="w3_modal_body_grid">
                            <span>Email:</span>
                            <asp:TextBox ID="txtemail" runat="server" placeholder="Email"></asp:TextBox>
                        
                        </div>
                        <div class="w3_modal_body_grid w3_modal_body_grid1">
                            <span>Password:</span>
                          <asp:TextBox ID="txtpwd" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        
                        </div>
                     <div class="w3_modal_body_grid w3_modal_body_grid1">
                            <span>Confirm Password:</span>
                          <asp:TextBox ID="txtcpwd" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                        
                        </div>
                        <div class="w3-agree">
                            <input type="checkbox" id="c1" name="cc">
                            <label class="agileits-agree">I have read & agree to the <a href="terms.html">Terms and Conditions</a></label>
                        </div>
                 <div style="text-align:right">
                      <asp:LinkButton ID="lnkregisterme" runat="server" CssClass="btn btn-danger"  OnClick="lnkregisterme_Click">Register me</asp:LinkButton>
                 </div>  
                        <%--<input type="submit" value="Register me" />--%>
                        <div class="clearfix"></div>
                        <p class="w3ls-login">Already a member? <a href="login.aspx" >Login</a></p> <%--data-toggle="modal" data-target="#myModal"--%>
                    <%--</form>--%>
                </div>
                <!-- Modal -->
                <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Login to Continue</h4>
                            </div>
                            <div class="modal-body">
                                <div class="login-w3ls">
                                   
                                        <label>User Name </label>
                                    <asp:TextBox ID="txtuname" runat="server" placeholder="Username" required=""></asp:TextBox>
                                        <%--<input type="text" name="User Name" placeholder="Username" required="">--%>
                                        <label>Password</label>
                                      <asp:TextBox ID="txtpassword" runat="server" placeholder="Password" required=""></asp:TextBox>
                                      <%--  <input type="password" name="Password" placeholder="Password" required="">--%>
                                        <div class="w3ls-loginr">
                                              <asp:CheckBox ID="chkRememberMe" runat="server" /> Remember me:<br />
                                           
                                            <a href="#">Forgot password ?</a>
                                        </div>
                                        <div class="clearfix"> </div>
                                       <%-- <input type="submit" name="submit" value="Login">--%>
                                    <asp:LinkButton ID="lnklogin" runat="server" CssClass="btn btn-danger" OnClick="lnklogin_Click">Login</asp:LinkButton>
                                        <div class="clearfix"> </div>
                                        <div class="social-icons">
                                            <ul>
                                                <li><a href="#"><span class="icons"><i class="fa fa-facebook" aria-hidden="true"></i></span><span class="text">Facebook</span></a></li>
                                                <li class="twt"><a href="#"><span class="icons"><i class="fa fa-twitter" aria-hidden="true"></i></span><span class="text">Twitter</span></a></li>
                                            </ul>
                                            <div class="clearfix"> </div>
                                        </div>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //Modal -->
            </div>
        </div>
        <!---728x90--->
        <!-- Find your soulmate -->
        <div class="w3l_find-soulmate text-center">
            <h3>Find Your Soulmate</h3>
            <div class="container">
                <a class="scroll" href="#home">
                    <div class="col-sm-3 w3_soulgrid">
                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                        <h3>Sign Up</h3>
                        <p>Signup for free and Upload your profile</p>
                    </div>
                </a>
                <a class="scroll" href="#home">
                    <div class="col-sm-3 w3_soulgrid">
                        <i class="fa fa-search" aria-hidden="true"></i>
                        <h3>Search</h3>
                        <p>Search for your right partner</p>
                    </div>
                </a>
                <a class="scroll" href="#home">
                    <div class="col-sm-3 w3_soulgrid">
                        <i class="fa fa-users" aria-hidden="true"></i>
                        <h3>Connect</h3>
                        <p>Connect your perfect Match</p>
                    </div>
                </a>
                <a class="scroll" href="#home">
                    <div class="col-sm-3 w3_soulgrid">
                        <i class="fa fa-comments-o" aria-hidden="true"></i>
                        <h3>Interact</h3>
                        <p>Become a member and start Conversation</p>
                    </div>
                </a>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- //Find your soulmate -->
        <!---728x90--->
        <!-- featured profiles -->
        <div class="w3layouts_featured-profiles">
            <div class="container">
                <!-- slider -->
                <div class="agile_featured-profiles">
                    <h2>Featured Profiles</h2>
                    <ul id="flexiselDemo3">
                        <li>
                            <asp:Repeater ID="rptlatestprofile" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-3 biseller-column">
                                <a href="groom_profile.html">
                                    <div class="profile-image">
                                        <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="img-responsive" height="500" style="object-fit: contain;">
                                       
                                        <div class="agile-overlay">
                                            <h4>Profile ID: 458645</h4>
                                            <ul>
                                                 <li><span>Name </span>: <%# Eval("Name") %></li>
                                                <li><span>Age / Height</span>: 26 / <%# Eval("Height") %></li>
                                                <li><span>Caste</span>: <%# Eval("Subcast") %></li>
                                                <li><span>Religion</span>:  <%# Eval("Cast") %></li>
                                                <li><span>Profession</span>: <%# Eval("Occupation") %></li>
                                                <li><span>Profile Created By</span>:</li>
                                                <li><span>Location</span>: <%# Eval("Current_Address") %></li>
                                            </ul>
                                        </div>
                                    </div>
                                </a>
                            </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            
                        
                        </li>
                      
                    </ul>
                </div>
            </div>
            <!-- //slider -->
        </div>
        <script type="text/javascript" src="../App_Themes/Theme1/js/jquery.flexisel.js"></script><!-- flexisel-js -->
        <script type="text/javascript">
            $(window).load(function () {
                $("#flexiselDemo3").flexisel({
                    visibleItems: 1,
                    animationSpeed: 1000,
                    autoPlay: false,
                    autoPlaySpeed: 5000,
                    pauseOnHover: true,
                    enableResponsiveBreakpoints: true,
                    responsiveBreakpoints: {
                        portrait: {
                            changePoint: 480,
                            visibleItems: 1
                        },
                        landscape: {
                            changePoint: 640,
                            visibleItems: 1
                        },
                        tablet: {
                            changePoint: 768,
                            visibleItems: 1
                        }
                    }
                });

            });
        </script>
        <!-- //featured profiles -->
        <!-- mobile-app -->
        <div class="wthree-mobilaapp main-grid-border">
            <div class="container">
                <div class="app">
                    <div class="col-md-6 w3ls_app-left mpl">
                        <h3>Matrimonial mobile app on your smartphone!</h3>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
                        <div class="agileits_app-devices">
                            <h5>Download the App</h5>
                            <a href="#"><img src="images/1.png" alt=""></a>
                            <a href="#"><img src="images/2.png" alt=""></a>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <div class="col-md-offset-1 col-md-5 app-image">
                        <img src="images/mob.png" alt="">
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- /mobile-app -->
        <!-- browse profiles -->
        <div class="w3layouts-browse text-center">
            <div class="container">
                <h3>Browse Matchmaking Profiles by</h3>
                <div class="col-md-4 w3-browse-grid">
                    <h4>By Country</h4>
                    <ul>
                        <li><a href="nri_list.html">Country 1</a></li>
                        <li><a href="nri_list.html">Country 2</a></li>
                        <li><a href="nri_list.html">Country 3</a></li>
                        <li><a href="nri_list.html">Country 4</a></li>
                        <li><a href="nri_list.html">Country 5</a></li>
                        <li><a href="nri_list.html">Country 6</a></li>
                        <li><a href="nri_list.html">Country 7</a></li>
                        <li><a href="nri_list.html">Country 8</a></li>
                        <li><a href="nri_list.html">Country 9</a></li>
                        <li><a href="nri_list.html">Country 10</a></li>
                        <li><a href="nri_list.html">Country 11</a></li>
                        <li class="more"><a href="nri_list.html">more..</a></li>
                    </ul>
                </div>
                <div class="col-md-4 w3-browse-grid">
                    <h4>By Religion</h4>
                    <ul>
                        <li><a href="r_list.html">Religion 1</a></li>
                        <li><a href="r_list.html">Religion 2</a></li>
                        <li><a href="r_list.html">Religion 3</a></li>
                        <li><a href="r_list.html">Religion 4</a></li>
                        <li><a href="r_list.html">Religion 5</a></li>
                        <li><a href="r_list.html">Religion 6</a></li>
                        <li><a href="r_list.html">Religion 7</a></li>
                        <li><a href="r_list.html">Religion 8</a></li>
                        <li><a href="r_list.html">Religion 9</a></li>
                        <li><a href="r_list.html">Religion 10</a></li>
                        <li><a href="r_list.html">Religion 11</a></li>
                        <li class="more"><a href="r_list.html">more..</a></li>
                    </ul>
                </div>
                <div class="col-md-4 w3-browse-grid">
                    <h4>By Community</h4>
                    <ul>
                        <li><a href="r_list.html">Community 1</a></li>
                        <li><a href="r_list.html">Community 2</a></li>
                        <li><a href="r_list.html">Community 3</a></li>
                        <li><a href="r_list.html">Community 4</a></li>
                        <li><a href="r_list.html">Community 5</a></li>
                        <li><a href="r_list.html">Community 6</a></li>
                        <li><a href="r_list.html">Community 7</a></li>
                        <li><a href="r_list.html">Community 8</a></li>
                        <li><a href="r_list.html">Community 9</a></li>
                        <li class="more"><a href="r_list.html">more..</a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //browse profiles -->
        <!-- Assisted Service -->
        <div class="agile-assisted-service text-center">
            <h4>Assisted Service</h4>
            <p>Our Relationship Managers have helped thousands of members find their life partners.</p>
            <a href="assisted_services.html">Know More</a>
        </div>
        <!-- //Assisted Service -->
        <!-- Location -->
        <div class="location w3layouts">
            <div class="container">
                <div class="col-md-6 col-sm-6 w3layouts location-grids location-grids-1">
                    <h3>Where We Are</h3>
                    <h5>Our Branches</h5>
                    <p>250+ branches across World, Largest Network of its Kind.</p>
                </div>
                <div class="col-md-6 col-sm-6 w3layouts location-grids location-grids-2">
                    <a href="contact.html"><img src="images/location.jpg" class="img-responsive" alt="Agileits W3layouts" /></a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- //Location -->
        <!-- Get started -->
        <div class="w3layous-story text-center">
            <div class="container">
                <h4>Your story is waiting to happen!  <a class="scroll" href="#home">Get started</a></h4>
            </div>
        </div>
        <!-- //Get started -->
        <!-- footer -->
        
</asp:Content>

