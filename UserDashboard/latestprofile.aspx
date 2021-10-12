<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/UserDashboardMasterPage.master" AutoEventWireup="true" CodeFile="latestprofile.aspx.cs" Inherits="UserDashboard_latestprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="top-bar clearfix">
        <div class="page-title">
            <h4>Lastest Profile<small class="samll"></small></h4>
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

                    <div class="row gutter">
                        <div class="col-md-12">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    <h4>Lastest Profile</h4>
                                </div>
                                <div class="panel-body">
                                    <ul class="rating-wrapper">
                                        <asp:Repeater ID="rptourdata" runat="server" OnItemDataBound="rptourdata_ItemDataBound">
                                            <ItemTemplate>
                                                <div class="col-lg-4 col-md-8 col-sm-12 col-xs-12">
                                                <li>
                                                     
                                                    <div class="user pull-left">
                                                        <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="prf-img img-responsive" height="500" style="object-fit: contain;">
                                                    </div>
                                                    <div class="info">
                                                         <h4><%# Eval("Name") %></h4>
                                                                <p><%# Eval("Height") %>, <%# Eval("Occupation") %>, <%# Eval("Hightest_Education") %>, Rs. <%# Eval("Monthly_Income") %> </p>
                                                    </div>
                                                        
                                                </li>
                                                 </div>
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
                </div>

</asp:Content>

