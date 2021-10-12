<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" CodeFile="cast.aspx.cs" Inherits="cast" %>

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
                    <h2 class="contact-title"  style="margin-top:53px">Caste</h2>
                </div>
                <div class="col-lg-8">
                    <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                 
                        <div class="row">

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtcaste" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Religion'" placeholder="Enter Religion"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="b" ControlToValidate="txtcaste" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger" ErrorMessage="Please Enter Religion"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-sm-6">
                               
                            </div>
                            
                        </div>
                   
                       <div class="form-group mt-3">
                            <asp:Button ID="btnaddcaste" runat="server" ValidationGroup="b" class="btn btn-primary mr-2" Text="ADD" OnClick="btnaddcaste_Click" />


                        </div>
                </div>
                
            </div>

                        <div class="row">
                <div class="col-12">
                    <h2 class="contact-title"  style="margin-top:53px">Caste</h2>
                </div>
                <div class="col-lg-8">
                    <asp:Label ID="Label1" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                    
                    <div class="row">

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlreligion" runat="server" CssClass="form-control">
                                       
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="A" ControlToValidate="txtsubcast" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger" ErrorMessage="Please Enter Caste"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-sm-6">
                               
                            </div>
                            
                        </div>                 

                        <div class="row">

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtsubcast" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Caste'" placeholder="Enter Caste"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="A" ControlToValidate="txtsubcast" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger" ErrorMessage="Please Enter Caste"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-sm-6">
                               
                            </div>
                            
                        </div>
                   
                       <div class="form-group mt-3">
                            <asp:Button ID="btnsubcast" runat="server" ValidationGroup="A" class="btn btn-primary mr-2" Text="ADD" OnClick="btnsubcast_Click" />


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

