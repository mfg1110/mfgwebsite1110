<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" CodeFile="cast_suggestion.aspx.cs" Inherits="cast_suggestion" %>

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
                    <h2 class="contact-title"  style="margin-top:53px">Caste Suggestion</h2>
                    <br />
                </div>
                <div class="col-lg-8">
                    <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-success" Visible="false"> </asp:Label>
                 <br />
                    <br />
                    <div class="row">

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtfname" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter First Name'" placeholder="Enter First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="b" ControlToValidate="txtcaste" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger" ErrorMessage="Please Enter First Name"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtlname" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Last Name'" placeholder="Enter Last Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="b" ControlToValidate="txtcaste" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger" ErrorMessage="Please Enter Last Name"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            
                        </div>

                        <div class="row">

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtcaste" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Religion'" placeholder="Enter Caste"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="b" ControlToValidate="txtcaste" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger" ErrorMessage="Please Enter Caste"></asp:RequiredFieldValidator>
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

                        
            </div>
        </div>
                </div>
              </div>
      
    </section>
           </div>
</asp:Content>

