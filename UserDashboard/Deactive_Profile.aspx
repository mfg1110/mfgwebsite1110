<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/UserDashboardMasterPage.master" AutoEventWireup="true" CodeFile="Deactive_Profile.aspx.cs" Inherits="UserDashboard_Deactive_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container-fluid">
        <!---728x90--->
        <div class="matches elite-app">

            <div class="row">
                <div class="col-lg-12">
                     <span class="label label-danger" id="lblmsg1" runat="server" visible="false"  >
  <span><i class="glyphicon glyphicon-remove-circle"> </i>  <asp:Label ID="lblmsg" runat="server" Text="dfds"   Font-Bold="true"> </asp:Label></span>
  
</span>
                    <span class="label label-success" id="lblmsgsuccessspan" runat="server" visible="false">
                        <span><i class="glyphicon glyphicon-ok-circle"></i>
                            <asp:Label ID="lblmsgsucess" runat="server" Text="dfds" Font-Bold="true"> </asp:Label></span>

                    </span>

                    <br />
                    <%-- <div style="text-align:center">   
                        <b>Login</b> <a href="Login.aspx">Click Here..</a>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

