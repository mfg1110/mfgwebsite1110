<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-5 mx-auto">
                    <div class="card padding-card">
                        <div class="card-body">
                            <h5 class="card-title mb-4">REGISTER</h5>
                             <asp:Label ID="lblerror" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                  <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                            <div class="form-group">
                                <label>PROFILE FOR<span class="text-danger">*</span></label>
                                <asp:DropDownList ID="ddlprofilefor" runat="server" class="form-control">
                                    <asp:ListItem>Select</asp:ListItem>
                                    <asp:ListItem>Myself</asp:ListItem>
                                    <asp:ListItem>Son</asp:ListItem>
                                    <asp:ListItem>Daughter</asp:ListItem>
                                    <asp:ListItem>Brother</asp:ListItem>
                                    <asp:ListItem>Sister</asp:ListItem>
                                    <asp:ListItem>Relative</asp:ListItem>
                                    <asp:ListItem>Friend</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>NAME <span class="text-danger">*</span></label>

                                <asp:TextBox ID="txtname" class="form-control" runat="server" placeholder="Name"></asp:TextBox>

                            </div>
                            <div class="form-group">

                                <label>MOBILE NO<span class="text-danger">*</span></label>
                                <!-- country codes (ISO 3166) and Dial codes. -->
                                <asp:TextBox ID="txtmobileno" class="form-control" runat="server" placeholder="Mobile"></asp:TextBox>


                            </div>
                            <div class="form-group">
                                <label>EMAIL ADDRESS <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtemail" class="form-control" runat="server" placeholder="Email"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                <label>PASSWORD <span class="text-danger">*</span></label>

                                <asp:TextBox ID="txtpwd" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                <label>CONFIRM PASSWORD<span class="text-danger">*</span></label>


                                <asp:TextBox ID="txtcpwd" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                <div> <asp:CheckBox ID="chkRememberMe"  runat="server" /> 
                                 <%--   <input type="checkbox" class="custom-control-input" id="customControlAutosizing">--%>
                                    <label  for="customControlAutosizing">I agree with all <a href="terms.html">Terms &amp; Conditions</a></label>
                                </div>
                            </div>
                          
                              <asp:LinkButton ID="lnkregisterme" runat="server" class="btn btn-success btn-block" OnClick="lnkregisterme_Click">REGISTER</asp:LinkButton>
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

