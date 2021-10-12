<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" CodeFile="forgotpassword.aspx.cs" EnableViewStateMac="false" Inherits="forgotpassword" %>

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
                    <h2 class="contact-title"  style="margin-top:53px">Forgot Password</h2>
                </div>
                <div class="col-lg-8">
                    <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                 
                        <div class="row">

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtemail" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email'" placeholder="Enter Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="A" ControlToValidate="txtemail" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger" ErrorMessage="Please Enter Email"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-sm-6">
                               
                            </div>
                            
                        </div>
                   
                       <div class="form-group mt-3">
                            <asp:Button ID="btngetpassord" runat="server" ValidationGroup="A" class="btn btn-primary mr-2" Text="Reset Password" OnClick="btngetpassord_Click" />


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
            </div>
        </div>
                </div>
              </div>
      
    </section>
</asp:Content>

