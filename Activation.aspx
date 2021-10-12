<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" CodeFile="Activation.aspx.cs" EnableViewStateMac="false" Inherits="Activation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
      <div class="content-wrapper pb-0">
    <section class="single-post-area section-padding ">
          <div class="row">

            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
            
            <div class="form-contact contact_form" id="contactForm1" novalidate="novalidate">
                <div class="row">
                   <div class="col-lg-4"></div>
                   <div class="col-lg-8" style="margin-top: 34px;">
                        <div class="form-group mt-3" style="margin-top:53px">
                            <asp:Label ID="lblmsg" runat="server" Text="" CssClass="col-form-label" Visible="true"> </asp:Label></div>
                    </div>

                  
                </div>
                </div>
                <div class="row">
              <div class="col-lg-4"></div>
                <div class="col-lg-8">
                    <asp:Label ID="Label2" runat="server" Text="" CssClass="alert alert-warning" Visible="false"> </asp:Label>
                 
                        <div class="row">

                            <div class="col-sm-6">
                                <div class="form-group">
                                  
                        <asp:TextBox ID="txtotp" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter OTP'" onblur="this.placeholder = 'Enter OTP'" placeholder="Enter OTP" ValidationGroup="B"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtotp" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter OTP"></asp:RequiredFieldValidator>


                                       </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                     <u>   <asp:LinkButton ID="lnkresend" runat="server" CssClass="link" OnClick="lnkresend_Click" ForeColor="#ff3300" style="letter-spacing: 1.5px;" Font-Bold="true" Font-Size="Large">Resend</asp:LinkButton></u>
                            
                                </div>
                            </div>
                          
                        </div>
                   
                        <div class="form-group mt-3">
                             <asp:Button ID="btnerify" runat="server" class="btn btn-primary mr-2" ValidationGroup="B" Text="VERIFY"  OnClick="btnerify_Click" />
                          
                            </div>
                      <div class="form-group mt-3">
                            
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                            </asp:Timer>
                          
                            <asp:Label ID="Label1" runat="server" Text="" ForeColor="red" Font-Size="Larger"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                        </div>
                   
                </div>
            
            </div>
                
                <div class="row">
                   
                    <div class="col-4"></div>
                    <div class="col-4">


                    </div>
                    <div class="col-4">
                         
                  
                          </div>
                          </div>
                
                <div class="row">
                <div class="col-4">

                </div>

                <div class="col-4">
                    <br />
                   
                </div>

                <div class="col-4"></div>

            </div>
            </div>


                <div>

                    <%--<asp:Timer ID="Timer1" runat="server" Interval="1000" ontick="Timer1_Tick">
    </asp:Timer> 
<asp:UpdatePanel ID="UpdatePanel1"
    runat="server">
    <ContentTemplate>
       Timer: <asp:Label ID="Label1" runat="server" ForeColor = "Red"></asp:Label>  
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Timer1"  EventName="Tick">
        </asp:AsyncPostBackTrigger>
    </Triggers>
</asp:UpdatePanel>--%>


                    <%--<asp:ScriptManager ID= "SM1" runat="server"></asp:ScriptManager>
        <asp:Timer ID="timer2" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
        </div>
   
       <div>
       <asp:UpdatePanel id="updPnl" runat="server" UpdateMode="Conditional">
       <ContentTemplate>
       <asp:Label ID="lblTimer" runat="server" ForeColor="Red"></asp:Label>

           <asp:Label ID="Label1" runat="server" ForeColor = "Red"></asp:Label>  
       </ContentTemplate>
       <Triggers>
       <asp:AsyncPostBackTrigger ControlID="timer2" EventName ="tick" />
       </Triggers>
       </asp:UpdatePanel>--%>
                </div>

            </div>
            
       
        <div class="col-3"></div>


        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="section_title text-center mb-55">
                    <h1>
                        <asp:Literal ID="ltMessage" runat="server" /></h1>
                </div>
            </div>
        </div>
       </div>
              </div>
        
        
    </section>
</div>
</asp:Content>

