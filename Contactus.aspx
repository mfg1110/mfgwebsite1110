<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="Contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true"></asp:ScriptManager>
   
    <section class="section-padding bg-dark inner-header">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 class="mt-0 mb-3 text-white">FEEDBACK</h1>
                    <div class="breadcrumbs">
                        <p class="mb-0 text-white"><a class="text-white" href="#">Home</a> &nbsp;/&nbsp; <span class="text-white">FEEDBACK</span></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 mx-auto">
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
                        <div class="card padding-card">
                            <div class="card-body">
                                <h5 class="card-title mb-4">FEEDBACK</h5>
                                  <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                                <div class="form-group">
                                    <label>EMAIL ID<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="Enter Email"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1txtemail" runat="server" ControlToValidate="txtemail" Display="Dynamic" CssClass="badge badge-danger"  ErrorMessage="Please Enter Email ID"></asp:RequiredFieldValidator>
                                
                                      <asp:RegularExpressionValidator
        id="regEmail"
        ControlToValidate="txtemail"
        Text="Enter Valid Email ID"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="badge badge-danger" ForeColor="White" Display="Dynamic"
        Runat="server" /> 
                                </div>
                                <div class="form-group">
                                    <label>DESCRIPTION<span class="text-danger">*</span></label>
                                   <asp:TextBox ID="txtdescription" runat="server" class="form-control" TextMode="MultiLine" placeholder="Enter Description"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtdescription" Display="Dynamic" CssClass="badge badge-danger"  ErrorMessage="Please Enter Description"></asp:RequiredFieldValidator>
                                    
                                </div>
                            <asp:LinkButton ID="lnksend" class="btn btn-success btn-block" runat="server" OnClick="lnksend_Click">SEND</asp:LinkButton>
                       
                            </div>
                        </div>
            </ContentTemplate>
                          </asp:UpdatePanel>
                   
                </div>
            </div>
        </div>
    </section>
</asp:Content>

