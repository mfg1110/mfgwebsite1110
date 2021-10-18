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

                                               <div class="col-lg-4 col-md-4">
                                    <div class="card card-list card-list-view">

                                        <div class="row no-gutters">
                                            <div class="col-lg-5 col-md-5">
                                              
                                                <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="img-thumbnail" height="150" width="150" style="object-fit: contain;height:150px;width:150px">
                                            </div>
                                            <div class="col-lg-7 col-md-7">
                                                <div class="card-body">
                                                    <h5 class="card-title"><%# Eval("Name") %></h5>   <span class="badge badge-success"><%# Eval("gender") %></span>
                                            <asp:Label ID="lblbiodataid" runat="server" Text='<%# Eval("Biodata_id") %>' Visible="false"></asp:Label>
                                                    <h6 class="card-subtitle mb-2 text-muted"><b>Height : </b><%# Eval("Height") %>
                                                        <br />
                                                        <br />
                                                        <%--  <b> Occupation :</b> <%# Eval("Occupation") %><br /><br />--%>
                                                        <b>Hightest Education :</b><%# Eval("Hightest_Education") %><br />
                                                        <br />
                                                        <b>Monthly Income : Rs.</b>    <%# Eval("Monthly_Income") %> </h6>
                                                    <%--<h2 class="text-success mb-0 mt-3">$130,000 <small>/month</small></h2>--%>
                                                    <%--  <div class="card-subtitle mb-2 text-muted"> <asp:LinkButton ID="lnkexpressintrest" CssClass="btn btn-primary" ForeColor="White" CommandArgument='<%# Eval("Biodata_id") + "," + Eval("Name") + "," + Eval("id") %>' runat="server" OnClick="lnkexpressintrest_Click">Express Intrest</asp:LinkButton></div>    --%>

                                                    <%--                             --%>
                                                </div>


                                            </div>

                                        </div>
                                      
                                        <div class="row no-gutters">
                                            <div class="col-lg-2">
                                            </div>
                                            <div class="col-lg-4">
                                               
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success btn-sm" ForeColor="White" CommandArgument='<%# Eval("Search_ID") %>' runat="server" OnClick="LinkButton1_Click">View in Detail</asp:LinkButton>
                                            </div>
                                            <div class="col-lg-2">
                                            </div>
                                        </div>
                                       

                                    </div>
                                                   
                                </div>
                                               
                                            </ItemTemplate>
                                        </asp:Repeater>
                                         
                                    </ul>
                                </div>
                                 <hr />
                            </div>
                            
                        </div>
                        </div>
                    </div>
                
                
                    </div>
            </div>
                </div>

</asp:Content>

