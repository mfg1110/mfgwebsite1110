<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" EnableViewStateMac="false" CodeFile="signup.aspx.cs" Inherits="signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <!-- bradcam_area_start  -->
    <div class="content-wrapper pb-0">
    <section class="single-post-area section-padding ">
          <div class="row">

            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div class="row">
                <div class="col-12">
                    <h2 class="contact-title" style="margin-top:53px">Registration</h2>
                    <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                </div>
                <div class="col-lg-8">
                    <div class="form-contact contact_form" id="contactForm1" novalidate="novalidate">
                        <div class="row">

                            <div class="col-sm-6">

                                <div class="form-group">
                                    
                                    <asp:TextBox ID="txtfname" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter First Name'" onblur="this.placeholder = 'Enter First Name'" placeholder="Enter First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfname" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter First Name"></asp:RequiredFieldValidator>
                           
                                      </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtlname" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Last Name'" onblur="this.placeholder = 'Enter Last Name'" placeholder="Enter Last Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtlname" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Last Name"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtuserid" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Email'" onblur="this.placeholder = 'Enter Email'" placeholder="Enter Email" AutoPostBack="true" OnTextChanged="txtuserid_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtuserid" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Email"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ControlToValidate="txtuserid" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Invalid email address"></asp:RegularExpressionValidator>
                                    <asp:Label ID="lblerror" CssClass="alert alert-danger embed-responsive" ForeColor="Red" runat="server" Text=" " Visible="false"></asp:Label>
                                </div>
                            </div>
                            <%--<div id="otp" class="col-12" runat="server" Visible="false">
                                    <div class="form-group">
                                         <asp:TextBox ID="txtotp" runat="server" class="form-control valid" name="name"  type="text" onfocus="this.placeholder = 'Enter OTP'" onblur="this.placeholder = 'Enter OTP'" placeholder="Enter OTP" AutoPostBack="true"  OnTextChanged="txtotp_TextChanged"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtotp" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger" ValidationGroup="B" ErrorMessage="Please Enter OTP"></asp:RequiredFieldValidator>
                                    </div>
                                </div>--%>
                           <%-- <div class="col-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtphoneno" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Phone No'" onblur="this.placeholder = 'Enter Phone No'" placeholder="Enter Phone No" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtphoneno" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Phone No"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revMobNo" runat="server" ErrorMessage="Invalid Mobile Number" ValidationExpression="^([0-9]{10})$" ControlToValidate="txtphoneno" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
--%>

                            <div class="col-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtpwd" runat="server" class="form-control valid" name="name" TextMode="Password" type="text" onfocus="this.placeholder = 'Enter Password'" onblur="this.placeholder = 'Enter Password'" placeholder="Enter Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtpwd" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtcpwd" runat="server" class="form-control valid" name="name" TextMode="Password" type="text" onfocus="this.placeholder = 'Enter Confirm Password'" onblur="this.placeholder = 'Enter Confirm Password'" placeholder="Enter Confirm Password" ValidationGroup="B"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcpwd" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Confirm Password"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpwd" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ControlToValidate="txtcpwd" ValidationGroup="B" ErrorMessage="Confirm Password Must Be Same With Password "></asp:CompareValidator>
                                </div>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <asp:Button ID="btnsubmit" runat="server" class="btn btn-primary mr-2"  ValidationGroup="B" Text="Submit" OnClick="btnsubmit_Click" />
                            <%--<input type="button" id="Save" value="Save Data" />--%>
                        </div>
                    </div>
                </div>
                <%--<div class="col-lg-3 offset-lg-1">
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-home"></i></span>
                            <div class="media-body">
                                <h3>Buttonwood, California.</h3>
                                <p>Rosemead, CA 91770</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                            <div class="media-body">
                                <h3>+1 253 565 2365</h3>
                                <p>Mon to Fri 9am to 6pm</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-email"></i></span>
                            <div class="media-body">
                                <h3>support@colorlib.com</h3>
                                <p>Send us your query anytime!</p>
                            </div>
                        </div>
                    </div>--%>
            </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
                    </div>
                </div>
              </div>
         </section>
        </div>
</asp:Content>

