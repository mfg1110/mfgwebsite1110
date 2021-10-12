<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="Contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="section-padding bg-dark inner-header">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 class="mt-0 mb-3 text-white">FEEDBACK</h1>
                    <div class="breadcrumbs">
                        <p class="mb-0 text-white"><a class="text-white" href="#">Home</a> &nbsp;/&nbsp; <span class="text-success">FEEDBACK</span></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 mx-auto">
                  
                        <div class="card padding-card">
                            <div class="card-body">
                                <h5 class="card-title mb-4">FEEDBACK</h5>
                                  <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                                <div class="form-group">
                                    <label>EMAIL ID<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="Enter Email"></asp:TextBox>
                                    
                                </div>
                                <div class="form-group">
                                    <label>DESCRIPTION<span class="text-danger">*</span></label>
                                   <asp:TextBox ID="txtdescription" runat="server" class="form-control" TextMode="MultiLine" placeholder="Enter Description"></asp:TextBox>
                                    
                                </div>
                           
                            </div>
                        </div>
                    <asp:LinkButton ID="lnksend" class="btn btn-success" runat="server" OnClick="lnksend_Click">SEND</asp:LinkButton>
                       
                </div>
            </div>
        </div>
    </section>
</asp:Content>

