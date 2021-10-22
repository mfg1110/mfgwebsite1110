<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminMasterPage.master" AutoEventWireup="true" CodeFile="RegistereduserList.aspx.cs" Inherits="Dashboard_RegistereduserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
   <div class="top-bar clearfix">
        <div class="page-title">
            <h4>Registered User Details</h4>
        </div>
        <%--<ul class="sales-stats hidden-xs">
            <li>
                <div class="sales-block hidden-sm hidden-xs">
                    <span id="sale_today">
                        <canvas width="123" height="24" style="display: inline-block; vertical-align: top; width: 123px; height: 24px;"></canvas>
                    </span>
                </div>
                <div class="sales-details">
                    <h4>$<span>580</span> <i class="icon-arrow-up-right2 up"></i></h4>
                    <h5>Today's Income</h5>
                </div>
            </li>
            <li>
                <div class="sales-block hidden-sm hidden-xs">
                    <span id="sale_weekly">
                        <canvas width="132" height="24" style="display: inline-block; vertical-align: top; width: 132px; height: 24px;"></canvas>
                    </span>
                </div>
                <div class="sales-details">
                    <h4>$<span>7235</span> <i class="icon-arrow-down-right2 down"></i></h4>
                    <h5>Week's Income</h5>
                </div>
            </li>
        </ul>--%>
    </div>
    
    <div class="main-container">
        <div class="container-fluid">
         
            <div class="row gutter">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-blue no-margin">
                        <div class="panel-heading">
                            <h4>Registered User</h4>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-condensed table-striped no-margin">
                                    <thead>
                                        <tr>
                                            <th class="span1">ID</th>
                                            <th class="span4">Name</th>
                                            <th class="span5 hidden-phone">Email</th>
                                            <th class="span2 hidden-phone">password</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <asp:Repeater ID="rptuserlist" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("id")%></td>
                                            <td><%#Eval("fname")%> <%#Eval("lname")%></td>
                                            <td>
                                                <%#Eval("UserID")%>
                                            </td>
                                            <td><%#Eval("password")%></td>
                                            <td class="text-nowrap">
                                                <a href="#" data-toggle="tooltip" data-original-title="Edit"><i class="fa fa-pencil text-inverse m-r-10"></i></a>
                                                <a href="#" data-toggle="tooltip" data-original-title="Close"><i class="fa fa-close text-danger"></i></a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</div>
    
</asp:Content>

