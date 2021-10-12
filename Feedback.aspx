<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" EnableViewStateMac="false" Inherits="Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div class="content-wrapper pb-0">
    <section class="single-post-area section-padding ">
          <div class="row">

            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
            
            
                            <div class="container" >

                                <div class="row">
                                    <div class="col-12">
                                        <h2 class="contact-title" style="margin-top: 53px">Feedback</h2>
                                    </div>
                                    <div class="col-lg-8">
                                        <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>

                                        <div class="row">

                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtemail" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email'" placeholder="Enter Email"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="A" ControlToValidate="txtemail" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ErrorMessage="Please Enter Email"></asp:RequiredFieldValidator>
                                                </div>
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtdesc" runat="server" class="form-control valid" name="name" TextMode="MultiLine" Rows="6" Columns="6" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Description'" placeholder="Enter Description"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="A" ControlToValidate="txtdesc" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger  embed-responsive" ErrorMessage="Please Enter Description"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                            </div>
                                                 <asp:Button ID="btnsend" runat="server" ValidationGroup="A" class="btn btn-primary mr-2" Text="Send" OnClick="btnsend_Click1" />
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

