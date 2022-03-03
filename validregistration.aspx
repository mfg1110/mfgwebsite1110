<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true"  CodeFile="validregistration.aspx.cs" EnableEventValidation="true" Inherits="validregistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true"></asp:ScriptManager>
   
    <section class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-5 mx-auto">
                    <div class="card padding-card">
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
                        <div class="card-body">
                            <h5 class="card-title mb-4">REGISTER</h5>
                           
                            <div class="form-group">
                                <label>EMAIL ADDRESS <span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtemail" class="form-control" runat="server" placeholder="Email" AutoPostBack="true" OnTextChanged="txtemail_TextChanged1"></asp:TextBox>
                         <asp:Label ID="lblEmailIdErr" runat="server" Text="Label" CssClass="badge badge-danger" Visible="false"></asp:Label>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="badge badge-danger" ForeColor="White" runat="server" ErrorMessage="Please Enter Email ID" ControlToValidate="txtemail" ValidationGroup="A" Display="Dynamic"></asp:RequiredFieldValidator>

                                 <asp:RegularExpressionValidator
        id="regEmail"
        ControlToValidate="txtemail"
        Text="Enter Valid Email ID"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="badge badge-danger" ForeColor="White" Display="Dynamic"
        Runat="server" /> 
                            </div>
                           <asp:Label ID="lblerror" runat="server" Text="" CssClass="badge badge-danger" Visible="false" ForeColor="White"> </asp:Label>
                  <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-danger" Visible="false" ForeColor="White"> </asp:Label>
                           
                             
                           <%-- <div class="mt-4 text-center login-with-social">
                                <button type="button" class="btn btn-facebook btn-block"><i class="mdi mdi-facebook"></i>Login With Facebook</button>
                                <button type="button" class="btn btn-twitter btn-block"><i class="mdi mdi-twitter"></i>Login With Twitter</button>
                                <button type="button" class="btn btn-google btn-block"><i class="mdi mdi-google-plus"></i>Login With Google</button>
                            </div>--%>
                        </div>
            </ContentTemplate>
    </asp:UpdatePanel>
             <asp:Button ID="lnkregister" runat="server"  class="btn btn-success btn-block" ValidationGroup="A"  OnClick="lnkregister_Click" Text="REGISTER"/>
               
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

