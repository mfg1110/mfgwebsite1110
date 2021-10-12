<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 mx-auto">
                    <div class="card padding-card">
                        <div class="card-body">
                            <h5 class="card-title mb-4">LOGIN</h5>
                            <asp:Label ID="lblerror" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                  <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                                <div class="form-group">
                                    <label>USER NAME <span class="text-danger">*</span></label>
                                   <asp:TextBox ID="txtuname" runat="server" class="form-control" placeholder="Username" required=""></asp:TextBox>
                          
                                </div>
                                <div class="form-group">
                                    <label>PASSWORD <span class="text-danger">*</span></label>
                                     <asp:TextBox ID="txtpassword" class="form-control" runat="server" TextMode="Password" placeholder="Password" required=""></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-checkbox">
                                       
                                     
                                          <asp:CheckBox ID="chkRememberMe"  runat="server" />    <label class="custom-control-label" for="customControlAutosizing">Remember Me</label>
                                           
                                            
                                    </div>
                                </div>
                              
                         <asp:LinkButton ID="lnklogin" runat="server" class="btn btn-success btn-block" OnClick="lnklogin_Click">SIGN IN</asp:LinkButton>
                           <%-- <div class="mt-4 text-center login-with-social">
                                <button type="button" class="btn btn-facebook btn-block"><i class="mdi mdi-facebook"></i>Login With Facebook</button>
                                <button type="button" class="btn btn-twitter btn-block"><i class="mdi mdi-twitter"></i>Login With Twitter</button>
                                <button type="button" class="btn btn-google btn-block"><i class="mdi mdi-google-plus"></i>Login With Google</button>
                            </div>--%>
                            <div class="mt-4 text-center">
                                <a href="Forgotpassword.aspx">Forget your password?</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

