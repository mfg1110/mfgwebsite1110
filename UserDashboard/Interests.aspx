<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/UserDashboardMasterPage.master" AutoEventWireup="true" CodeFile="Interests.aspx.cs" Inherits="UserDashboard_Interests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="top-bar clearfix">
        <div class="page-title">
            <h4>Intrests<small class="samll"></small></h4>
        </div>
    </div>

    <div class="main-container">
        <div class="container-fluid">

            <div class="row gutter">

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <div class="row gutter">
                        <div class="col-md-12">

                            <asp:Repeater ID="rptinbox" runat="server">
                                <ItemTemplate>
                                    <!-- row -->
                                    <div class="panel-body">
                                        <ol class="activity-stream">

                                            <li>
                                                <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="img-thumbnail" height="50" width="50" style="object-fit: contain; height: 50px; width: 50px">
                                                <span class="mb-0 text-muted"><strong>
                                                    <asp:LinkButton ID="LinkButton1" CommandArgument='<%# Eval("Search_ID") %>' runat="server" OnClick="LinkButton1_Click">  <%# Eval("Name") %> </asp:LinkButton>
                                                </strong></span>

                                                <span class="text-dark">Who is interested in your profile.Would you like to See thier Profile? 
                                                    <asp:LinkButton ID="LinkButton2" CommandArgument='<%# Eval("Search_ID") %>' runat="server" OnClick="LinkButton2_Click"> Click here </asp:LinkButton></span>
                                                <span class="badge badge-success"><%# Eval("CreatedByDateTime","{0:dd, MMMM yyyy}") %></span>
                                                </li>
                                            </ol>
                                                <!-- label -->
                                        </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div id="trEmpty" runat="server" visible="false" class="alert alert-success">
                                        <td colspan="3" align="center">No records found.
                                        </td>
                                    </div>

                                </FooterTemplate>
                            </asp:Repeater>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

