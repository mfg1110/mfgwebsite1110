<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/UserDashboardMasterPage.master" AutoEventWireup="true" CodeFile="Changepassword.aspx.cs" Inherits="UserDashboard_Changepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true"></asp:ScriptManager>
     <div class="top-bar clearfix">
        <div class="page-title">
            <h4>Change Password<small class="samll"></small></h4>
        </div>
        
    </div>
      <div class="main-container">
        <div class="container-fluid">
            <div class="row gutter">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <h4>Change Password</h4>
                        </div>
                        <div class="panel-body">
           <asp:Label ID="Label1" runat="server" Text="" CssClass="notice red" Visible="false"> </asp:Label>

	<div class="col-md-12 login-form-w3-agile">
        
			
        <div class="form-contact contact_form" id="contactForm1" novalidate="novalidate">
                 <div class="row">
                     <div class="col-sm-2">
                         </div>
                     <div class="col-sm-8">
                         <asp:Label ID="lblmsg1" CssClass="genric-btn success-border medium" runat="server" Text="Label" Visible="false"></asp:Label>
                    <asp:Label ID="lblmsg" runat="server" Text="" CssClass="notice red" Visible="false"> </asp:Label>
                         </div>
                     <div class="col-sm-2">
                         </div>
                    </div>
                <div class="row">
                     <div class="col-sm-2">
                         </div>
                     <div class="col-sm-8">
                         <div class="form-groupstyle1" id="oldpwd" runat="server" visible="false">
                                    Old Password :
                                    <asp:TextBox ID="txtoldpwd" runat="server" class="form-control" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Old Password'" placeholder="Enter Old Password" Visible="false"  OnTextChanged="txtoldpwd_TextChanged" AutoPostBack="true"></asp:TextBox>
                             <asp:Label ID="lbloldpwd" runat="server"  CssClass="notice red" Text="" Visible="false" ForeColor="Red"></asp:Label>
                                </div>
                           <div class="form-groupstyle1" id="email" runat="server" visible="false">
                               
                                  Email :
                                     <asp:TextBox ID="txtemail" runat="server" class="form-control" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email'" placeholder="Enter Email" Visible="false"></asp:TextBox>

                               </div>
                         <div class="form-groupstyle1">
                                    New Password :
                                    <asp:TextBox ID="txtnewpwd" runat="server" class="form-control" name="name" TextMode="Password" type="text"  onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter New Password'" placeholder="Enter New Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="A" ForeColor="Red" ControlToValidate="txtnewpwd"  Display="Dynamic"  CssClass="notice red" ErrorMessage="Please Enter New Password"></asp:RequiredFieldValidator>
                             
                                </div>
                        
                         <div class="groupstyle1">
                                       Confirm Password :
                                    <asp:TextBox ID="txtconfirmpwd" runat="server" class="form-control" name="name" TextMode="Password" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Confirm Password'" placeholder="Enter Confirm Password"></asp:TextBox>
                                 
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtconfirmpwd" ForeColor="Red" Display="Dynamic" CssClass="notice red"  ValidationGroup="A" ErrorMessage="Please Enter Confirm Password"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnewpwd" ForeColor="Red"  Display="Dynamic" CssClass="notice red" ControlToValidate="txtconfirmpwd" ValidationGroup="A" ErrorMessage="Confirm Password Must Be Same With Password "></asp:CompareValidator>
                                </div>
                         <br />
                         </div>
                     <div class="col-sm-2">
                         </div>
                    </div>

                   <div class="row">
                     <div class="col-sm-2">
                         </div>
                     <div class="col-sm-8">
                      <div class="form-group mt-10">
                            <asp:Button ID="btnchangepwd" runat="server" ValidationGroup="A" class="btn btn-primary mr-2" Text="Change Password" OnClick="btnchangepwd_Click" />

                            </div>
                         </div>
                     <div class="col-sm-2">
                         </div>
                    </div>
                </div>
                   

        </div>
    </div>
                        </div>
            </ContentTemplate>
                          </asp:UpdatePanel>
                    </div>
                </div>
            </div>
     </div>
</asp:Content>

