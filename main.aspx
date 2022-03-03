<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <section class="osahan-slider slider-h-auto">
        <div id="osahanslider" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#osahanslider" data-slide-to="0" class="active"></li>
                <li data-target="#osahanslider" data-slide-to="1"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active" style="background-image: url('https://www.matrimonyforgujarati.com/App_Themes/Fronttheme/img/slider/5.jpg');">
                    <div class="overlay"></div>
                    <div class="section-padding">
                        <div class="container banner-list pl-5 pr-5">
                            <div class="row">
                                <div class="col-lg-12 col-md-8">
                                    <h1 class="mt-5 mb-4 text-white">FINDING LOVE IS BEING OVERLY DIFFICULT IN TODAY’S WORLD. BUT ONCE YOU HAVE FOUND IT, THERE IS NOTHING BETTER</h1>
                                    <h6 class="mb-5 text-white">It is indeed true that everyone wishes to be loved as it makes them feel special and cared for.</h6>
                                 
                                    <a href="validregistration.aspx" class="btn btn-success">Register</a>
                                </div>
                              
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item" style="background-image: url('https://www.matrimonyforgujarati.com/App_Themes/Fronttheme/img/slider/5.jpg');">
                    <div class="overlay"></div>
                    <div class="section-padding">
                        <div class="container banner-list pl-5 pr-5">
                            <div class="row">
                                 <div class="col-lg-12 col-md-8">
                                    <h1 class="mt-5 mb-4 text-white">FINDING LOVE IS BEING OVERLY DIFFICULT IN TODAY’S WORLD. BUT ONCE YOU HAVE FOUND IT, THERE IS NOTHING BETTER</h1>
                                    <h6 class="mb-5 text-white">It is indeed true that everyone wishes to be loved as it makes them feel special and cared for.</h6>
                                   
                                      <a href="validregistration.aspx" class="btn btn-success">Register</a>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#osahanslider" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#osahanslider" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </section>

    <section class="section-padding">
        <div class="section-title text-center mb-5">
            <h2>Latest Profile</h2>
           <%-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>--%>
        </div>
        <div class="container">
            <div class="row">
                        <asp:Repeater ID="rptlatestprofile" runat="server" OnItemDataBound="rptlatestprofile_ItemDataBound1">
                            <ItemTemplate>
                                <div class="col-lg-4 col-md-4">
                                    <div class="card card-list card-list-view">

                                        <div class="row no-gutters">
                                            <div class="col-lg-5 col-md-5">
                                                <span class="badge badge-success"><%# Eval("gender") %></span>
                                                <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="img-thumbnail" height="300" width="300" style="margin-top:22px;height:150px;width:150px">
                                            </div>
                                            <div class="col-lg-7 col-md-7">
                                                <div class="card-body">
                                                    <h5 class="card-title"><%# Eval("Name") %></h5>
                                                    <h5 class="card-title"></h5>
                                                    <h6 class="card-subtitle mb-2 text-muted"><b>Height : </b><%# Eval("Height") %>
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="lblbiodataid" runat="server" Text='<%# Eval("Biodata_id") %>' Visible="false"></asp:Label>
                                                        <%--  <b> Occupation :</b> <%# Eval("Occupation") %><br /><br />--%>
                                                        <b>Hightest Education :</b><%# Eval("Hightest_Education") %><br /><br /><b>Monthly Income : Rs.</b>    <%# Eval("Monthly_Income") %> </h6>
                                                  
                                                </div>


                                            </div>

                                        </div>
                                        <hr />
                                        <div class="row no-gutters">
                                            <div class="col-lg-2">
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkexpressintrest" CssClass="btn btn-success btn-sm" ForeColor="White" CommandArgument='<%# Eval("Biodata_id") + "," + Eval("Name") + "," + Eval("id") %>' runat="server" OnClick="lnkexpressintrest_Click" Width="110">Express Intrest</asp:LinkButton>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-facebook btn-sm" ForeColor="White" CommandArgument='<%# Eval("Search_ID") %>' runat="server" OnClick="LinkButton1_Click">View in Detail</asp:LinkButton>
                                            </div>
                                            <div class="col-lg-2">
                                            </div>
                                        </div>
                                        <br />

                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                            <asp:Repeater ID="rptPaging" runat="server" onitemcommand="rptPaging_ItemCommand">
<ItemTemplate>
<asp:LinkButton ID="lnkPage"
style="padding:8px; margin:2px; background:#0033c4; border:solid 1px #666; color:#fff; font-weight:bold"
CommandName="Page" CommandArgument="<%# Container.DataItem %>"
runat="server" Font-Bold="True"><%# Container.DataItem %>
</asp:LinkButton>
</ItemTemplate>
</asp:Repeater>
                    </div>
           
        </div>
    </section>

    <%--<section class="section-padding bg-white">
        <div class="section-title text-center mb-5">
            <h2>Property By City</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8">
                    <div class="card bg-dark text-white card-overlay">
                        <a href="#">
                            <img class="card-img" src="img/overlay/1.png" alt="Card image">
                            <div class="card-img-overlay">
                                <h3 class="card-title text-white">New York</h3>
                                <p class="card-text text-white">16 Properties</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="card bg-dark text-white card-overlay">
                        <a href="#">
                            <img class="card-img" src="img/overlay/2.png" alt="Card image">
                            <div class="card-img-overlay">
                                <h3 class="card-title text-white">Los Angeles</h3>
                                <p class="card-text text-white">265 Properties</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="card bg-dark text-white card-overlay">
                        <a href="#">
                            <img class="card-img" src="img/overlay/3.png" alt="Card image">
                            <div class="card-img-overlay">
                                <h3 class="card-title text-white">Chicago</h3>
                                <p class="card-text text-white">620 Properties</p>
                            </div>
                        </a>
                        .
                    </div>
                </div>
                <div class="col-lg-8 col-md-8">
                    <div class="card bg-dark text-white card-overlay">
                        <a href="#">
                            <img class="card-img" src="img/overlay/4.png" alt="Card image">
                            <div class="card-img-overlay">
                                <h3 class="card-title text-white">Philadelphia</h3>
                                <p class="card-text text-white">28 Properties</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>

    <%--<section class="section-padding">
        <div class="section-title text-center mb-5">
            <h2>Trusted Agents</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="agents-card text-center">
                        <img class="img-fluid mb-4" src="img/user/1.jpg" alt="">
                        <p class="mb-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.</p>
                        <h6 class="mb-0 text-success">- Stave Martin</h6>
                        <small>Buying Agent</small>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="agents-card text-center">
                        <img class="img-fluid mb-4" src="img/user/2.jpg" alt="">
                        <p class="mb-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.</p>
                        <h6 class="mb-0 text-success">- Mark Smith</h6>
                        <small>Selling Agent</small>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="agents-card text-center">
                        <img class="img-fluid mb-4" src="img/user/3.jpg" alt="">
                        <p class="mb-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been.</p>
                        <h6 class="mb-0 text-success">- Ryan Printz</h6>
                        <small>Real Estate Broker</small>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>

    <%--<section class="section-padding border-top">
        <div class="section-title text-center mb-5">
            <h2>Blogs We Wrote For You</h2>
            <p>Lorem ipsum dolor sit amet.</p>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="card blog-card">
                        <a href="#">
                            <img class="card-img-top" src="img/blog/1.png" alt="Card image cap">
                            <div class="card-body">
                                <span class="badge badge-success">House/Villa</span>
                                <h6>Possimus aut mollitia eum ipsum</h6>
                                <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
                            </div>
                            <div class="card-footer">
                                <p class="mb-0"><img class="rounded-circle" src="img/user/3.jpg" alt="Card image cap"> <strong>Rahul Yadav</strong> On October 03, 2018</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="card blog-card">
                        <a href="#">
                            <img class="card-img-top" src="img/blog/2.png" alt="Card image cap">
                            <div class="card-body">
                                <span class="badge badge-danger">Shop/Showroom</span>
                                <h6>Consectetur adipisicing elit</h6>
                                <p class="mb-0">Cnsectetur ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
                            </div>
                            <div class="card-footer">
                                <p class="mb-0"><img class="rounded-circle" src="img/user/2.jpg" alt="Card image cap"> <strong>Rahul Yadav</strong> On October 05, 2018</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="card blog-card">
                        <a href="#">
                            <img class="card-img-top" src="img/blog/3.png" alt="Card image cap">
                            <div class="card-body">
                                <span class="badge badge-info">Industrial Building</span>
                                <h6>Fugiat odio officiis odit</h6>
                                <p class="mb-0">Mollitia ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
                            </div>
                            <div class="card-footer">
                                <p class="mb-0"><img class="rounded-circle" src="img/user/1.jpg" alt="Card image cap"> <strong>Rahul Yadav</strong> On October 06, 2018</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>

</asp:Content>

