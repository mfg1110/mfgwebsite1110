<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Login.aspx.cs" EnableViewStateMac="false" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="http://code.jquery.com/jquery-1.7.1.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $("#btnsubmit").click(function () {
                var person = new Object();
                person.fname = $('#txtfname').val();
                person.lname = $('#lname').val();
                person.UserID = $('#txtuserid').val();
                person.Phoneno = $('#txtphoneno').val();
                person.password = $('#txtpwd').val();

                var fname = $('#txtfname').val();
                var lname = $('#lname').val();
                var UserID = $('#txtuserid').val();
                var Phoneno = $('#txtphoneno').val();
                var password = $('#txtpwd').val();
                $.ajax({
                    url: 'http://api.ohmsoftwaresinc.com/api/missingperson/Registration?fname=' + person.fname + '&lname=' + person.lname + '&UserID=' + person.UserID + '&Phoneno=' + person.Phoneno + '&password=' + person.password,
                    type: 'POST',
                    dataType: 'json',
                    data: person,
                    success: function (data, textStatus, xhr) {
                        console.log(data);
                    },
                    error: function (xhr, textStatus, errorThrown) {
                        console.log('Error in Operation');
                    }
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <!-- bradcam_area_start  -->
    
    <!-- bradcam_area_end  -->

    <!-- ================ contact section start ================= -->
    <div class="content-wrapper pb-0">
    <section class="single-post-area section-padding ">
          <div class="row">

            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                       <div class="row">
                <div class="col-12">
                    <h2 class="contact-title" style="margin-top:53px">Log In</h2>
                
                </div>
                <div class="col-lg-8">
                    <asp:Label ID="lblmsg" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                 
                        <div class="row">

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtuserlogin" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email'" placeholder="Enter Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="A" ControlToValidate="txtuserlogin" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger" ErrorMessage="Please Enter UserID"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ControlToValidate="txtuserlogin" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger" ValidationGroup="B" ErrorMessage="Invalid email address"></asp:RegularExpressionValidator>
 
                                       </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <asp:TextBox ID="txtpwdlogin" runat="server" class="form-control valid" name="name" TextMode="Password" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Password'" placeholder="Enter Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="A" ControlToValidate="txtpwdlogin" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            
                            <div style="margin-left:20px">
                                 
                             <asp:CheckBox ID="chkRememberMe" runat="server" /> Remember me:<br />
                                <br />
                              <u> <a href="../forgotpassword.aspx" style="color:#ff6a00;">Forgot Password</a></u> 
                                   
                            </div>
                        </div>
                   
                        <div class="form-group mt-3">
                            <asp:Button ID="btnlogin" runat="server" ValidationGroup="A" class="btn btn-primary mr-2" Text="Login" OnClick="btnlogin_Click" />


                        </div>
                   
                </div>
                <%--<div class="col-lg-3 offset-lg-1">
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-home"></i></span>
                            <div class="media-body">
                                <h3>Buttonwood, California.</h3>
                                <p>Rosemead, CA 91770</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                            <div class="media-body">
                                <h3>+1 253 565 2365</h3>
                                <p>Mon to Fri 9am to 6pm</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-email"></i></span>
                            <div class="media-body">
                                <h3>support@colorlib.com</h3>
                                <p>Send us your query anytime!</p>
                            </div>
                        </div>
                    </div>--%>
            </div>
            

                </ContentTemplate>
             
            </asp:UpdatePanel>
         
</div>
                    </div>
                </div>
              </div>
        
    </section>
        </div>
    <!-- ================ contact section end ================= -->


    <!-- footer_start  -->

    <!-- footer_end  -->

</asp:Content>

