<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" CodeFile="View_Matrimony.aspx.cs" EnableViewStateMac="false" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--  <style>
        .img {
  max-width: 100%;
  height: auto;
}
    </style>--%>

    <style>
        .thumbnail {
            display: block;
            overflow: hidden;
            height: 200px;
            width: 200px;
        }

            .thumbnail img {
                display: block;
                height: 100%;
            }
    </style>
    <style>
        .card {
            width: 350px;
            border: none;
            border-radius: 10px;
            background-color: #fff;
        }

        .stats {
            background: #f2f5f8 !important;
            color: #000 !important;
        }

        .articles {
            font-size: 10px;
            color: #a1aab9;
        }

        .number1 {
            font-weight: 500;
        }

        .followers {
            font-size: 10px;
            color: #a1aab9;
        }

        .number2 {
            font-weight: 500;
        }

        .rating {
            font-size: 10px;
            color: #a1aab9;
        }

        .number3 {
            font-weight: 500;
        }
    </style>

    <style>
        .p-card {
            border: 1px solid #eee;
        }

        #h5 {
            color: white;
        }

        .p-details {
            padding: 10px;
            border-radius: 0px;
            /*background: #000;*/
            background: #495057;
            color: #fff;
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
        }

        body {
            background: #eee;
        }

        .spec span {
            font-size: 13px;
        }

        .spec h6 {
            font-size: 16px;
            font-weight: 500;
        }

        .carousel-indicators li {
            box-sizing: content-box;
            -ms-flex: 0 1 auto;
            flex: 0 1 auto;
            width: 12px;
            height: 12px;
            margin-right: 3px;
            margin-left: 3px;
            text-indent: -999px;
            cursor: pointer;
            background-color: #fff;
            background-clip: padding-box;
            border-top: 10px solid transparent;
            border-bottom: 10px solid transparent;
            opacity: .5;
            transition: opacity .6s ease;
        }

        .line {
            background-color: #fff;
            margin-top: 4px;
            margin-bottom: 4px;
            height: 0.2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="content-wrapper pb-0">
    <section class="single-post-area section-padding ">
          <div class="row">

            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
        <div class="our_volunteer_area">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">

                        <div class="section_title text-center mb-55">
                            <h3><span style="border-bottom-color: #000; margin-top: 53px; font-family: 'Times New Roman'">Our Groom and Bride</span></h3>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-10">
                        <div class="form-group">
                            <asp:TextBox ID="txtsearch" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Search ID/Search Name/Location'" placeholder="Enter Search ID/Search Name/Location"  OnTextChanged="txtsearch_TextChanged">
                              
                            </asp:TextBox>
                             
                        </div>
                        </div>

                     <div class="col-lg-2">
                        <div >
                            <asp:DropDownList ID="ddlgender" runat="server" class="form-control"   AutoPostBack="true" OnSelectedIndexChanged="ddlgender_SelectedIndexChanged">
                                <asp:ListItem Value="All">All</asp:ListItem>
                                    <asp:ListItem Value="Male">Groom</asp:ListItem>
                                 <asp:ListItem Value="Female">Bride</asp:ListItem>
                            </asp:DropDownList>
                        <%--    <asp:RadioButtonList ID="RadioButtonList1" CssClass="form-check-inline" RepeatDirection="Horizontal" runat="server" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                <asp:ListItem Value="Male">Groom</asp:ListItem>
                                 <asp:ListItem Value="Female">Bride</asp:ListItem>
                            </asp:RadioButtonList>--%>
                        </div>
                        </div>
                </div>

                <div class="row">

                    <div class="col-lg-2">
                        <div class="form-group">
                            <asp:LinkButton runat="server" ID="btnsearchid" OnClick="btnsearchid_Click" CssClass="button button-contactForm boxed-btn" > <i class='fa fa-search'></i>  Search  </asp:LinkButton>
                        </div>
                    </div>

                   

                </div>
                <div class="row justify-content-center">
                    <div class="container mt-5 mb-5">
                        <div class="row g-1">
                            <asp:Repeater ID="rptourdata" runat="server" OnItemDataBound="rptourdata_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-md-4">
                                        <div class="p-card" style="margin-bottom: 40px">
                                            <div class="p-carousel">
                                                <div class="carousel" data-ride="carousel" id="carousel-1">
                                                   <center> <div class="carousel-inner" role="listbox" style="background-color:black">
                                                        <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="img img-responsive rounded" height="300"  style="  object-fit: contain;">
                                                        <%--  <img src="<%# ProcessDataItem(DataBinder.Eval(Container.DataItem, "Photo","../Picture/{0}"))%>" alt=""  class="rounded" height="300" width="400" >--%>
                                                        <%--   <asp:Image ID="Image1" runat="server" src='<%# DataBinder.Eval(Container.DataItem, "Image","../Newsimage/{0}")%>' Text='<%#Eval("Image")%>'   class="img-responsive"  onerror="setDefaultImage(this);"/>--%>
                                                    </div></center>
                                                    <%-- <div><a class="carousel-control-prev" href="#carousel-1" role="button" data-slide="prev"><span class="carousel-control-prev-icon"></span><span class="sr-only">Previous</span></a><a class="carousel-control-next" href="#carousel-1" role="button" data-slide="next"><span class="carousel-control-next-icon"></span><span class="sr-only">Next</span></a></div>
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-1" data-slide-to="1"></li>
                            <li data-target="#carousel-1" data-slide-to="2"></li>
                        </ol>--%>
                                                </div>
                                            </div>
                                            <div class="p-details">
                                                <div class="d-flex justify-content-between align-items-center mx-2">
                                                    <h5 style="color: white">Name - </h5>
                                                    <span><%# Eval("Name") %></span>

                                                </div>
                                                <div class="d-flex justify-content-between align-items-center mx-2">
                                                    <h5 style="color: white">Search ID - </h5>
                                                    <span><%# Eval("Search_ID") %></span>
                                                </div>
                                                <div class="mx-2">
                                                    <hr class="line">
                                                </div>
                                                <%--<div class="d-flex justify-content-between mt-2 spec mx-2">
                        <div class="d-flex flex-column align-items-center">
                             <h5>Name - </h5><span><%# Eval("Name") %></span>
                        </div>
                        <div class="d-flex flex-column align-items-center">
                           <h5>Name - </h5><span><%# Eval("Name") %></span>
                        </div>
                        <div class="d-flex flex-column align-items-center">
                            <h5>Name - </h5><span><%# Eval("Name") %></span>
                        </div>
                    </div>--%>
                                                <div class="d-flex justify-content-between align-items-center mx-2">
                                                    <h5 style="color: white">Birthdate - </h5>
                                                    <span><%# DataBinder.Eval(Container.DataItem, "Date_of_Birth", "{0:d/M/yyyy}") %></span>
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center mx-2">
                                                    <h5 style="color: white">Time Of Birth - </h5>
                                                    <span><%# Eval("Time_of_Birth") %></span>
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center mx-2">
                                                    <h5 style="color: white">Place Of Birth - </h5>
                                                    <span><%# Eval("Place_of_Birth") %></span>
                                                </div>
                                                <div class="buy mt-3">
                                                    <asp:LinkButton ID="lnkview" CssClass="btn btn-block" BackColor="#ff5e13" ForeColor="White" CommandArgument='<%# Eval("Search_ID") %>' runat="server" OnClick="lnkview_Click">View in Detail</asp:LinkButton>

                                                    <%--<div Class="btn btn-block" >             
<div class="a2a_kit a2a_kit_size_32 a2a_default_style ">
  
    <a class="a2a_dd btn btn-block" href="https://www.addtoany.com/share"><span style="color:white">Share</span></a>
</div>

<script async src="https://static.addtoany.com/menu/page.js"></script>
                        </div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <table class="table table-responsive" >
                                    <tr id="trEmpty" runat="server" visible="false" >
                                        <td colspan="3" align="center" style="border-top:none" >
                                        <div class="alert alert-danger" style="color:#ff0000">  
                                             No Records Found.
                                        </div> 
                                        </td>
                                    </tr>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>

                        </div>
                    </div>


                </div>
            </div>
        </div>
</div>
                    </div>
                </div>
              </div>
    </section>
         </div>
</asp:Content>

