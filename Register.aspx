<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" EnableEventValidation="true"  CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                             <asp:Label ID="lblerror" runat="server" Text="" CssClass="alert alert-info" Visible="false"> </asp:Label>
                  <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-info" Visible="false" ForeColor="White"> </asp:Label>
                            <div class="form-group">
                                <label>PROFILE FOR<span class="text-danger">*</span></label>
                                <asp:DropDownList ID="ddlprofilefor" runat="server" class="form-control">
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
                                <label>FIRST NAME <span class="text-danger">*</span></label>
                             
                                <asp:TextBox ID="txtname" class="form-control" runat="server" placeholder="Enter Your First Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="badge badge-danger" ForeColor="White" runat="server" ErrorMessage="Please Enter First Name" ControlToValidate="txtname" ValidationGroup="A" Display="Dynamic"></asp:RequiredFieldValidator>

                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  
ControlToValidate="txtname" ErrorMessage="Only Alphabet accept"  CssClass="badge badge-danger" ForeColor="White" Display="Dynamic"
ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator> 

                                 <asp:Label ID="lblfname" runat="server" Text="Label"  Visible="false"></asp:Label>
                            </div>
                             <div class="form-group">
                                <label>LAST NAME <span class="text-danger">*</span></label>

                                <asp:TextBox ID="txtlname" class="form-control" runat="server" placeholder="Enter Your Last Name"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="badge badge-danger" ForeColor="White" runat="server" ErrorMessage="Please Enter Last Name" ControlToValidate="txtlname" ValidationGroup="A" Display="Dynamic"></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"  
ControlToValidate="txtlname" ErrorMessage="Only Alphabet accept"  CssClass="badge badge-danger" ForeColor="White" Display="Dynamic"
ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator> 
                             
                             </div>
                            <div class="form-group">

                                <label>MOBILE NO<span class="text-danger">*</span></label>
                                <!-- country codes (ISO 3166) and Dial codes. -->
                                <asp:TextBox ID="txtmobileno" class="form-control" runat="server" placeholder="Enter Your Mobile No" maxlength="10" AutoPostBack="true" OnTextChanged="txtmobileno_TextChanged"> </asp:TextBox>
                                  <asp:Label ID="lblmobilenoErr" runat="server" Text="Label" CssClass="badge badge-danger" Visible="false"  ></asp:Label>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="badge badge-danger" ForeColor="White" runat="server" ErrorMessage="Please Enter Mobile No" ControlToValidate="txtmobileno" ValidationGroup="A" Display="Dynamic"></asp:RequiredFieldValidator>
                           
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  
ControlToValidate="txtmobileno" ErrorMessage="Mobile No must be in 10 Digit"  CssClass="badge badge-danger" ForeColor="White" Display="Dynamic"
ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator> 

                                 </div>

                                 <div class="form-group">
                                      <asp:TextBox ID="txtotp" class="form-control" runat="server" placeholder="Enter otp" Visible="false" AutoPostBack="true" OnTextChanged="txtotp_TextChanged"> </asp:TextBox>
                                       <asp:Label ID="lblotp" runat="server" Text="Label" CssClass="badge badge-danger" Visible="false"  ></asp:Label>
                                     </div>
                            <div class="form-group">
                                
                                <asp:TextBox ID="txtemail" class="form-control" runat="server" placeholder="Enter Your Email ID" Visible="false"></asp:TextBox>
                         <asp:Label ID="lblEmailIdErr" runat="server" Text="Label" CssClass="badge badge-danger" Visible="false"></asp:Label>
                               
                            </div>
                            <div class="form-group">
                                <label>PASSWORD <span class="text-danger">*</span></label>

                                <asp:TextBox ID="txtpwd" runat="server" class="form-control" placeholder="Enter Your Password" TextMode="Password" ></asp:TextBox>
                                  <asp:Label ID="lblErrPwd" runat="server" Text="Label" CssClass="badge badge-danger" Visible="false"></asp:Label>

                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="badge badge-danger" ForeColor="White" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txtpwd" ValidationGroup="A" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label>CONFIRM PASSWORD<span class="text-danger">*</span></label>
                                <asp:TextBox ID="txtcpwd" runat="server" class="form-control"  placeholder="Enter Confirm Password" TextMode="Password"></asp:TextBox>
                                 <asp:Label ID="lblErrPWdConfirm" runat="server" Text="Label" CssClass="badge badge-danger" Visible="false"></asp:Label>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="badge badge-danger" ForeColor="White" runat="server" ErrorMessage="Please Enter Confirm Password" ControlToValidate="txtcpwd" ValidationGroup="A" Display="Dynamic"></asp:RequiredFieldValidator>
                           
                                <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="badge badge-danger" ControlToCompare="txtpwd" ControlToValidate="txtcpwd" ForeColor="White" ErrorMessage="Confirm Password or Password Must be Same "></asp:CompareValidator>
                                 </div>
                            
                          <div class="form-group">
                                <div> <%--<asp:CheckBox ID="chktermandcondition"  runat="server"  OnCheckedChanged="chktermandcondition_CheckedChanged1" AutoPostBack="true" onclick="  disableApprove(this); "/> --%>
                                    <input type="checkbox" id="CheckBox1" onclick="ToggleValidator(this);"  />
                                 <%--   <input type="checkbox" class="custom-control-input" id="customControlAutosizing">--%>
                                    <label  for="customControlAutosizing">I agree with all <a href="terms.html">Terms &amp; Conditions</a></label> <u><a href="Term_condition.aspx" style="color:red" target="_blank">Read..</a></u>

                                </div>
                                 <asp:Label ID="lbltermcondition" runat="server" Text="Label" CssClass="badge badge-danger" Visible="false"></asp:Label>
                            </div>
                             </ContentTemplate>
    </asp:UpdatePanel>
                        
                           <%-- <div class="mt-4 text-center login-with-social">
                                <button type="button" class="btn btn-facebook btn-block"><i class="mdi mdi-facebook"></i>Login With Facebook</button>
                                <button type="button" class="btn btn-twitter btn-block"><i class="mdi mdi-twitter"></i>Login With Twitter</button>
                                <button type="button" class="btn btn-google btn-block"><i class="mdi mdi-google-plus"></i>Login With Google</button>
                            </div>--%>
                        </div>
              <asp:Button ID="lnkregisterme" runat="server" class="btn btn-success btn-block" ValidationGroup="A" Enabled="false"  OnClick="lnkregisterme_Click" Text="REGISTER"/>
              
                        
                    </div>
                </div>
            </div>
      
    </section>
         <script type="text/javascript">
             function ToggleValidator(chk) {
                 var valName = document.getElementById("<%=RequiredFieldValidator1.ClientID%>");
                 ValidatorEnable(valName, chk.checked);
                 var valName1 = document.getElementById("<%=RequiredFieldValidator2.ClientID%>");
                 ValidatorEnable(valName1, chk.checked);
                 var valName2 = document.getElementById("<%=RequiredFieldValidator3.ClientID%>");
                 ValidatorEnable(valName2, chk.checked);
                 var valName3 = document.getElementById("<%=RequiredFieldValidator5.ClientID%>");
                 ValidatorEnable(valName3, chk.checked);
                 var valName4 = document.getElementById("<%=RequiredFieldValidator6.ClientID%>");
                 ValidatorEnable(valName4, chk.checked);
                 
                 var lnkregisterme1 = document.getElementById("<%=lnkregisterme.ClientID%>");
                 if (chk.checked) {
                     lnkregisterme1.disabled = false;
                    
                 }
                 else
                 {
                     lnkregisterme1.disabled = true;
                     lnkregisterme1.Attributes["disabled"] = "btn btn-success btn-block";
                 }
                     
    }
</script>
    <script type="text/javascript">

        function disableApprove(chk) {
            var imgs = document.getElementById('lnkregisterme');
            if (chk.checked)
                lnkregisterme.disabled = false;
            else
                lnkregisterme.disabled = true;

        }
    </script>
</asp:Content>

