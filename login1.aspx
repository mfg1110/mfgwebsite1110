<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MasterPage.master" AutoEventWireup="true" CodeFile="login1.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="w3layouts-banner" id="home">
            <div class="container">
                <div class="logo">
                    <h1><a class="cd-logo link link--takiri" href="index.html">Matrimony <span><i class="fa fa-heart" aria-hidden="true"></i>For Gujarati.</span></a></h1>
                </div>
                <div class="clearfix"></div>
                <div class="agileits-register">
                    <h3>LOGIN!</h3>
                      <asp:Label ID="lblerror" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                  <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                        <div class="w3_modal_body_grid">
                             <span>User Name </span>
                                    <asp:TextBox ID="txtuname" runat="server" placeholder="Username" required=""></asp:TextBox>
                          
                        </div>
                    <br />
                        <div class="w3_modal_body_grid ">
                             <span>Password</span>
                                      <asp:TextBox ID="txtpassword" runat="server" placeholder="Password" required=""></asp:TextBox>
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
                   
                        <div class="w3-agree">
                            <input type="checkbox" id="c1" name="cc">
                            <label class="agileits-agree">I have read & agree to the <a href="terms.html">Terms and Conditions</a></label>
                        </div>
                 <div style="text-align:right">
                          <asp:LinkButton ID="lnklogin" runat="server" CssClass="btn btn-danger" OnClick="lnklogin_Click">Login</asp:LinkButton>
                 </div>  
                        <%--<input type="submit" value="Register me" />--%>
                        <div class="clearfix"></div>
                        <p class="w3ls-login">Already a member? <a href="#" data-toggle="modal" data-target="#myModal">Login</a></p>
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
                                   
                                     
                                        <%--<input type="text" name="User Name" placeholder="Username" required="">--%>
                                     
                                      <%--  <input type="password" name="Password" placeholder="Password" required="">--%>
                                        <div class="w3ls-loginr">
                                              <asp:CheckBox ID="chkRememberMe" runat="server" /> Remember me:<br />
                                           
                                            <a href="#">Forgot password ?</a>
                                        </div>
                                        <div class="clearfix"> </div>
                                       <%-- <input type="submit" name="submit" value="Login">--%>
                             
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
                    <div class="col-md-3 w3_soulgrid">
                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                        <h3>Sign Up</h3>
                        <p>Signup for free and Upload your profile</p>
                    </div>
                </a>
                <a class="scroll" href="#home">
                    <div class="col-md-3 w3_soulgrid">
                        <i class="fa fa-search" aria-hidden="true"></i>
                        <h3>Search</h3>
                        <p>Search for your right partner</p>
                    </div>
                </a>
                <a class="scroll" href="#home">
                    <div class="col-md-3 w3_soulgrid">
                        <i class="fa fa-users" aria-hidden="true"></i>
                        <h3>Connect</h3>
                        <p>Connect your perfect Match</p>
                    </div>
                </a>
                <a class="scroll" href="#home">
                    <div class="col-md-3 w3_soulgrid">
                        <i class="fa fa-comments-o" aria-hidden="true"></i>
                        <h3>Interact</h3>
                        <p>Become a member and start Conversation</p>
                    </div>
                </a>
                <div class="clearfix"> </div>
            </div>
        </div>
</asp:Content>

