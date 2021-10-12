<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" CodeFile="Forgotpassword.aspx.cs" Inherits="Forgotpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 mx-auto">
                     <span class="label label-danger" id="lblmsg1" runat="server" visible="false"  >
  <span><i class="glyphicon glyphicon-remove-circle"> </i>  <asp:Label ID="lblmsg" runat="server" Text=""   Font-Bold="true"> </asp:Label></span>
  
</span>       
        <span class="label label-success" id="lblmsgsuccessspan" runat="server" visible="false"  >
  <span><i class="glyphicon glyphicon-ok-circle"> </i>  <asp:Label ID="lblmsgsucess" runat="server" Text=""   Font-Bold="true"> </asp:Label></span>
  
</span>
                    <div class="card padding-card">
                        <div class="card-body">
                            <h5 class="card-title mb-4">FORGOT PASSWORD</h5>
                        
                                <div class="form-group">
                                    <label>EMAIL ID<span class="text-danger">*</span></label>
                                   <asp:TextBox ID="txtemailid" runat="server" class="form-control" placeholder="EMAIL ID" required=""></asp:TextBox>
                          
                                </div>
                               
                               
                              
                         <asp:LinkButton ID="lnksend" runat="server" class="btn btn-success btn-block" OnClick="lnksend_Click">SEND</asp:LinkButton>
                           <%-- <div class="mt-4 text-center login-with-social">
                                <button type="button" class="btn btn-facebook btn-block"><i class="mdi mdi-facebook"></i>Login With Facebook</button>
                                <button type="button" class="btn btn-twitter btn-block"><i class="mdi mdi-twitter"></i>Login With Twitter</button>
                                <button type="button" class="btn btn-google btn-block"><i class="mdi mdi-google-plus"></i>Login With Google</button>
                            </div>--%>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

