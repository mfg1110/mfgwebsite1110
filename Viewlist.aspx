<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" CodeFile="Viewlist.aspx.cs" Inherits="Viewlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="section-padding bg-dark inner-header">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 class="mt-0 mb-3 text-white">Agency List</h1>
                    <div class="breadcrumbs">
                        <p class="mb-0 text-white"><a class="text-white" href="#">Home</a> &nbsp;/&nbsp; <span class="text-success">Agency List</span></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section-padding">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2 col-md-2">
                    <div class="card sidebar-card">
                        <div class="card-body">
                            <h5 class="card-title mb-3">Property Type</h5>
                            <ul class="sidebar-card-list">
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>House/Villa <span class="sidebar-badge">90</span></a></li>
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>Flat <span class="sidebar-badge">60</span></a></li>
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>Plot/Land <span class="sidebar-badge">44</span></a></li>
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>Office Space <span class="sidebar-badge">38</span></a></li>
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>Shop/Showroom <span class="sidebar-badge">29</span></a></li>
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>Commercial Land <span class="sidebar-badge">28</span></a></li>
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>Warehouse/ Godown <span class="sidebar-badge">12</span></a></li>
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>Industrial Building <span class="sidebar-badge">8</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card sidebar-card">
                        <div class="card-body">
                            <h5 class="card-title mb-3">Property Status</h5>
                            <ul class="sidebar-card-list">
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>For Rent <span class="sidebar-badge">600</span></a></li>
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>For Sale <span class="sidebar-badge">1200</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card sidebar-card">
                        <div class="card-body">
                            <h5 class="card-title mb-3">Property By City</h5>
                            <ul class="sidebar-card-list">
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>New York <span class="sidebar-badge">220</span></a></li>
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>Los Angeles <span class="sidebar-badge">150</span></a></li>
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>Chicago <span class="sidebar-badge">100</span></a></li>
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>Houston <span class="sidebar-badge">50</span></a></li>
                                <li><a href="#"><i class="mdi mdi-chevron-right"></i>Philadelphia <span class="sidebar-badge">23</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card sidebar-card">
                        <div class="card-body">
                            <h5 class="card-title mb-4">Featured Properties</h5>
                            <div id="featured-properties" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#featured-properties" data-slide-to="0" class="active"></li>
                                    <li data-target="#featured-properties" data-slide-to="1" class=""></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <div class="card card-list">
                                            <a href="#">
                                                <span class="badge badge-success">For Sale</span>
                                                <img class="card-img-top" src="img/list/1.png" alt="Card image cap">
                                                <div class="card-body">
                                                    <h5 class="card-title">House in Kent Street</h5>
                                                    <h6 class="card-subtitle mb-2 text-muted"><i class="mdi mdi-home-map-marker"></i>127 Kent Sreet, Sydny, NEW 2000</h6>
                                                    <h2 class="text-success mb-0 mt-3">$130,000 <small>/month</small></h2>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="card card-list">
                                            <a href="#">
                                                <span class="badge badge-secondary">For Rent</span>
                                                <img class="card-img-top" src="img/list/2.png" alt="Card image cap">
                                                <div class="card-body">
                                                    <h5 class="card-title">Family House in Hudson</h5>
                                                    <h6 class="card-subtitle mb-2 text-muted"><i class="mdi mdi-home-map-marker"></i>Hoboken, NJ, USA</h6>
                                                    <h2 class="text-success mb-0 mt-3">$127,000 <small>/month</small></h2>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-10 col-md-10">
                    
                    <div class="row">
                         <asp:Repeater ID="rptourdata" runat="server" >
                                <ItemTemplate>
                        <div class="col-lg-6 col-md-6">
                            <div class="card card-list card-list-view">
                                <a href="#">
                                    <div class="row no-gutters">
                                        <div class="col-lg-5 col-md-5">
                                            <span class="badge badge-success"><%# Eval("gender") %></span>
                                            <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="card-img-top" height="300"  style="  object-fit: contain;">
			
                                          
                                        </div>
                                        <div class="col-lg-7 col-md-7">
                                            <div class="card-body">
                                                <h5 class="card-title"><%# Eval("Name") %></h5>
                                                <h6 class="card-subtitle mb-2 text-muted"><i class="mdi mdi-home-map-marker"></i> <%# Eval("Height") %>, <%# Eval("Occupation") %>, <%# Eval("Hightest_Education") %>, Rs. <%# Eval("Monthly_Income") %> </h6>
                                                <%--<h2 class="text-success mb-0 mt-3">$130,000 <small>/month</small></h2>--%>
                                             <%--  <div class="card-subtitle mb-2 text-muted"> <asp:LinkButton ID="lnkexpressintrest" CssClass="btn btn-primary" ForeColor="White" CommandArgument='<%# Eval("Biodata_id") + "," + Eval("Name") + "," + Eval("id") %>' runat="server" OnClick="lnkexpressintrest_Click">Express Intrest</asp:LinkButton></div>    --%>

<%--                             --%>

                                            </div>
                                            <div class="card-footer">
<%--<span> </span>--%>
<span><i class="mdi mdi-scale-bathroom"></i> Baths : <strong>2</strong></span>
<span><i class="mdi mdi-move-resize-variant"></i> Area : <strong>587 sq ft</strong></span>
</div>
                                          <%--  <div class="card-footer">
                                             
                                            </div>--%>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                                    </ItemTemplate>
                             </asp:Repeater>
                        
                      
                    </div>
                    <nav class="mt-5">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1"><i class="mdi mdi-chevron-left"></i></a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">...</a></li>
                            <li class="page-item"><a class="page-link" href="#">10</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#"><i class="mdi mdi-chevron-right"></i></a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

