<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CMS.aspx.cs" Inherits="Dashboard_CMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="top-bar clearfix">
        <div class="page-title">
            <h4>Star Management</h4>
        </div>
        <%--<ul class="sales-stats hidden-xs">
            <li>
                <div class="sales-block hidden-sm hidden-xs">
                    <span id="sale_today">
                        <canvas width="123" height="24" style="display: inline-block; vertical-align: top; width: 123px; height: 24px;"></canvas>
                    </span>
                </div>
                <div class="sales-details">
                    <h4>$<span>580</span> <i class="icon-arrow-up-right2 up"></i></h4>
                    <h5>Today's Income</h5>
                </div>
            </li>
            <li>
                <div class="sales-block hidden-sm hidden-xs">
                    <span id="sale_weekly">
                        <canvas width="132" height="24" style="display: inline-block; vertical-align: top; width: 132px; height: 24px;"></canvas>
                    </span>
                </div>
                <div class="sales-details">
                    <h4>$<span>7235</span> <i class="icon-arrow-down-right2 down"></i></h4>
                    <h5>Week's Income</h5>
                </div>
            </li>
        </ul>--%>
    </div>
    <div class="main-container">
        <div class="container-fluid">
            <div class="row gutter">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <h4>Horizontal Form</h4>
                        </div>
                        <div class="panel-body">
                           
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2 control-label">Website Name</label>
                                    <div class="col-sm-10">
                                      
                                          <asp:TextBox ID="txtwebsitename1" runat="server" class="form-control" placeholder="Enter Website Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="notice red" runat="server" Display="Dynamic" ControlToValidate="txtwebsitename1" ForeColor="Red" ErrorMessage="Please Enter Website Name"></asp:RequiredFieldValidator>
                                         </div>
                                   
                                </div>
                               
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-2 control-label">Website Admin Mail</label>
                                    <div class="col-sm-10">
                              
                                        <asp:TextBox ID="txtadminmail" runat="server" class="form-control" placeholder="Website Admin Mail"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="notice red" Display="Dynamic" runat="server" ControlToValidate="txtadminmail" ForeColor="Red" ErrorMessage="Please Enter Website Admin Mail"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                           
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-2 control-label">Website URL</label>
                                    <div class="col-sm-10">
                                        
                                         <asp:TextBox ID="txtWebsiteURL" runat="server" class="form-control" placeholder="Website URL"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="notice red" Display="Dynamic" runat="server" ControlToValidate="txtWebsiteURL" ForeColor="Red" ErrorMessage="Please Enter Website URL"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-2 control-label">Mail URL</label>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txtmailurl" runat="server" class="form-control" placeholder="Mail URL"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="notice red" Display="Dynamic" runat="server" ControlToValidate="txtmailurl" ForeColor="Red" ErrorMessage="Please Enter Mail URL"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                          
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-2 control-label">Existing Site Logo</label><div class="col-sm-10">

                                        <asp:FileUpload ID="filelogo" runat="server" class="form-control" />
                                                                                                                         </div>
                                </div>
                            
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-2 control-label">Site Logo</label><div class="col-sm-10">
                                         <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" /></div>
                                </div>
                             <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-2 control-label">SMTP Host</label><div class="col-sm-10">
                                      <asp:TextBox ID="txtsmtphost" runat="server" class="form-control" placeholder="SMTP Host"></asp:TextBox>    
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="notice red" Display="Dynamic" runat="server" ControlToValidate="txtsmtphost" ForeColor="Red" ErrorMessage="Please Enter SMTP Host"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                             <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-2 control-label">SMTP Mail</label><div class="col-sm-10">
                                       <asp:TextBox ID="txtsmtpmail" runat="server" class="form-control" placeholder="SMTP Mail"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="notice red" Display="Dynamic" runat="server" ControlToValidate="txtsmtpmail" ForeColor="Red" ErrorMessage="Please Enter SMTP Mail"></asp:RequiredFieldValidator>
                                                                                                                </div>
                                </div>
                             <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-2 control-label">SMTP Password</label><div class="col-sm-10">
                                      
                                         <asp:TextBox ID="txtsmtppwd" runat="server" class="form-control" placeholder="SMTP Password"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="notice red" Display="Dynamic" runat="server" ControlToValidate="txtsmtppwd" ForeColor="Red" ErrorMessage="Please Enter SMTP Password"></asp:RequiredFieldValidator>
                                                                                                                     </div>
                                </div>
                            <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-2 control-label">Contact No</label><div class="col-sm-10">
                                        <asp:TextBox ID="txtcontactno" runat="server" class="form-control" placeholder="Contact No"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="notice red" Display="Dynamic" runat="server" ControlToValidate="txtcontactno" ForeColor="Red" ErrorMessage="Please Enter Contact No"></asp:RequiredFieldValidator>
                                                                                                                     </div>
                                </div>
                            <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-2 control-label">SMTP Port</label><div class="col-sm-10">
                                        <asp:TextBox ID="txtsmtpport" runat="server" class="form-control" placeholder="SMTP Port"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" CssClass="notice red" Display="Dynamic" runat="server" ControlToValidate="txtsmtpport" ForeColor="Red" ErrorMessage="Please Enter SMTP Port"></asp:RequiredFieldValidator>
                                                
                                                                                                                </div>
                                </div>
                             <div class="form-group">
                                    <label for="inputPassword3" class="col-sm-2 control-label">ContactusEmail</label><div class="col-sm-10">
                                       <asp:TextBox ID="txtcontactusemail" runat="server" class="form-control" placeholder="Contactus Email"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" CssClass="notice red" Display="Dynamic" runat="server" ControlToValidate="txtcontactusemail" ForeColor="Red" ErrorMessage="Please Enter Contactus Email"></asp:RequiredFieldValidator>
        
                                                                                                                     </div>
                              
                                   </div>
                              <asp:LinkButton ID="lnkcmssubmit" runat="server" class="btn btn-info waves-effect waves-light" OnClick="lnkcmssubmit_Click1">ADD</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            

        </div>
    </div>
    
</asp:Content>

