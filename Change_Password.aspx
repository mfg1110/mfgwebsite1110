<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" CodeFile="Change_Password.aspx.cs" EnableEventValidation="false" EnableViewStateMac="false" Inherits="Change_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="content-wrapper pb-0">
    <section class="single-post-area section-padding ">
          <div class="row">

            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
            
        
            <div class="row">
                <div class="col-12">
                     <div class="row">

                    <div class="col-lg-2"></div>
                            <div class="col-lg-8">
                                    <asp:Label ID="lblmsg1" CssClass="genric-btn success-border medium" runat="server" Text="Label" Visible="false"></asp:Label>
                    <h2 class="contact-title"  style="margin-top:53px">Change Password</h2>
                         </div>
                    <div class="col-lg-2"></div>
                         </div>
                </div>
                <div class="col-lg-8">
                    <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                    <%--<form class="form-contact contact_form" action="contact_process.php" method="post" id="contactForm" novalidate="novalidate">--%>
                        <div class="row">
                            <div class="col-lg-2"></div>
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <asp:TextBox ID="txtoldpwd" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Old Password'" placeholder="Enter Old Password" Visible="false" TextMode="Password"></asp:TextBox>
                                 
                                     <asp:TextBox ID="txtemail" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email'" placeholder="Enter Email" Visible="false"></asp:TextBox>

                                </div>
                            </div>
                              <div class="col-lg-2"></div>

                            </div>
                         <div class="row">
                              <div class="col-lg-2"></div>
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <asp:TextBox ID="txtnewpwd" runat="server" class="form-control valid" name="name" TextMode="Password" type="text"  onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter New Password'" placeholder="Enter New Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="A" ControlToValidate="txtnewpwd" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ErrorMessage="Please Enter New Password"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                              <div class="col-lg-2"></div>
                        </div>
                         
                         <div class="row">
                              <div class="col-lg-2"></div>
                          <div class="col-lg-8">
                                <div class="form-group">
                                    <asp:TextBox ID="txtconfirmpwd" runat="server" class="form-control valid" name="name" TextMode="Password" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Confirm Password'" placeholder="Enter Confirm Password"></asp:TextBox>
                                 
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtconfirmpwd" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="A" ErrorMessage="Please Enter Confirm Password"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnewpwd" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ControlToValidate="txtconfirmpwd" ValidationGroup="A" ErrorMessage="Confirm Password Must Be Same With Password "></asp:CompareValidator>
                                </div>
                            </div>

                        
                          <div class="col-lg-2"></div>
                </div>
                         <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8">
                        <div class="form-group mt-10">
                            <asp:Button ID="btnchangepwd" runat="server" ValidationGroup="A" class="button button-contactForm boxed-btn" Text="Change Password" OnClick="btnchangepwd_Click" />

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
</asp:Content>

