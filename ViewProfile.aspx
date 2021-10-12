<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" CodeFile="ViewProfile.aspx.cs" Inherits="ViewProfile" enableEventValidation="true" EnableViewStateMac="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section class="blog_area single-post-area section-padding">
      <div class="container">
          <div class="container">
               
                <div class="row">
                    <div class="col-12">
                        <h2 class="contact-title" style="text-align:center">Profile</h2>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                          Add Images
                        <br />
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/NoImage_Available.png" Height="150" Width="150" />
                        <div class="media contact-info">
                            
                           
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                          
                        </div>
                       <%-- <div class="media contact-info">
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
                        </div>--%>
                    </div>
                    <div class="col-lg-8">
                        <form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                      First Name
                                        <asp:TextBox ID="txtfname" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your first name'" placeholder="Enter your first name" runat="server"></asp:TextBox>
                                    </div>
                                </div>  
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        Last Name
                                       <asp:TextBox ID="txtlname" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your last name'" placeholder="Enter your last name" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        Email ID
                                       <asp:TextBox ID="txtUserID" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your UserID'" placeholder="Enter your UserID" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                  <div class="col-6">
                                    <div class="form-group">
                                        Phone no
                                         <asp:TextBox ID="txtPhoneno" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your Phoneno'" placeholder="Enter your Phoneno" runat="server"></asp:TextBox>
                                    
                                    </div>
                                </div>
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                       <asp:TextBox ID="txtpassword" class="form-control valid" name="name" type="text" Visible="false" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your Password'" placeholder="Enter your Password" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                              
                            </div>
                            <div class="form-group mt-3">
                                <asp:Button ID="btnsend" runat="server" Text="Send" class="button button-contactForm boxed-btn" OnClick="btnsend_Click" />
                               
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
         <div class="row">

             </div>
          </div>
         </section>
</asp:Content>

