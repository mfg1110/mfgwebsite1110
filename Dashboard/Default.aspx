<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Dashboard_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="top-bar clearfix">
        <div class="page-title">
            <h4>Dashboard</h4>
        </div>
        
    </div>

    <div class="main-container">
        <div class="container-fluid">
            <div class="row gutter">
                <asp:Repeater ID="rptgender" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="panel panel-grey spacer-sm">
                        <div class="social-details clearfix">
                            <div class="social-icon pull-left">
                                <div class="round-icon red"><i class="icon-man"></i></div>
                            </div>
                            <div class="social-num">
                                <h4><%#Eval("total_record")%> </h4>
                                <p><asp:LinkButton ID="lnkgender" runat="server" CommandArgument='<%# Eval("Gender") %>' OnCommand="lnkgender_Command"><%#Eval("Gender")%></asp:LinkButton>
                                   </p>
                                
                            </div>
                        </div>
                    </div>
                </div>
                    </ItemTemplate>
                </asp:Repeater>
                
                
               
                  <asp:Repeater ID="rpttotalprofile" runat="server">
                    <ItemTemplate>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="panel panel-grey spacer-sm">
                        <div class="social-details clearfix">
                            <div class="social-icon pull-left">
                                <div class="round-icon pink-icon"><i class="icon-verified_user"></i></div>
                            </div>
                            <div class="social-num">
                                <h4><%#Eval("total_record")%></h4>
                                <p>Total Profiles</p>
                              
                            </div>
                        </div>
                    </div>
                </div>
                        </ItemTemplate>
                      </asp:Repeater>
            </div>
            <div class="row gutter">
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="panel panel-grey">
                        <div class="panel-heading">
                            <h4>Caste</h4>
                        </div>
                        <div class="sale-board">
                           
                            <div class="scroll-widget spacer-sm">
                                <ul class="list-group no-margin">
                                     <asp:Repeater ID="rptmenu" runat="server">
                          <ItemTemplate>
                                <li class="list-group-item">
                                    <asp:LinkButton ID="lnksubcast" runat="server" CommandArgument='<%# Eval("Subcast") %>' OnCommand="lnksubcast_Command"><%#Eval("Subcast")%> </asp:LinkButton>
                                   <span class="pull-right text-info"><span><%#Eval("total_record")%></span></span>
                                  
                                </li>
                                 </ItemTemplate>
                                    </asp:Repeater>
                                  
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            
            </div>

            
         
        </div>
    </div>
</asp:Content>

