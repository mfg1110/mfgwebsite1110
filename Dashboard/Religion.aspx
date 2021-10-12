<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Religion.aspx.cs" Inherits="Dashboard_Religion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="top-bar clearfix">
        <div class="page-title">
            <h4>Community Management</h4>
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
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <h4>Religion</h4>
                        </div>
                        <div class="panel-body">
                            
                                <div class="form-group">
                                    <label class="sr-only" for="exampleInputEmail2">Religion</label>

                                    <asp:TextBox ID="txtreligion" runat="server" class="form-control" placeholder="Enter Religion"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="notice red" runat="server" ControlToValidate="txtreligion" ValidationGroup="A" ForeColor="Red" ErrorMessage="Please Enter Religion"></asp:RequiredFieldValidator>
                                </div>

                                <asp:LinkButton ID="lnksubmit" runat="server" class="btn btn-info waves-effect waves-light" ValidationGroup="A" OnClick="lnksubmit_Click"> ADD</asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <h4>Subcaste</h4>
                        </div>
                        <div class="panel-body">

                            <div class="form-group">
                                <label class="sr-only" for="exampleInputEmail2">Religion</label>


                                <asp:DropDownList ID="ddlreligion" runat="server" class="form-control">
                                    <asp:ListItem>

                                    </asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <label class="sr-only" for="exampleInputEmail2">Caste</label>
                                <asp:TextBox ID="txtCaste" runat="server" class="form-control"  placeholder="Enter Caste"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="notice red" runat="server" ControlToValidate="txtCaste" ValidationGroup="B" ForeColor="Red" ErrorMessage="Please Enter Caste"></asp:RequiredFieldValidator>
                            </div>
                            <asp:LinkButton ID="lnkCaste" runat="server" class="btn btn-info waves-effect waves-light" ValidationGroup="B" OnClick="lnkCaste_Click">ADD</asp:LinkButton>

                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <h4>Caste Table</h4>
                            <div>
                                 <asp:TextBox ID="txtsearchreligion" runat="server" class="form-control" placeholder="Enter Religion"></asp:TextBox>
                            </div>
                        </div>
                        <div class="panel-body">
                            <table class="table no-margin">
                                <thead>
                                    <tr>
                                       
                                        <th>Caste ID</th>
                                        <th>Caste name</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                <asp:Repeater ID="rptreligion" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("Caste_ID")%></td>
                                            <td><%#Eval("Caste_name")%></td>
                                             <td>
                                                 <asp:LinkButton ID="lnkedit" runat="server" CommandArgument='<%#Eval("Caste_ID")%>' OnCommand="lnkedit_Command"><i class="glyphicon glyphicon-edit"></i> Edit</asp:LinkButton>
                                                 </td>
                                            <td>
                                                  <asp:LinkButton ID="lnkdelete" runat="server" CommandArgument='<%#Eval("Caste_ID")%>' OnCommand="lnkdelete_Command"><i class="glyphicon glyphicon-trash"></i> Delete</asp:LinkButton>
                                               
                                            </td>
                                            <%-- <td><span class="label label-danger">admin</span> </td>--%>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                           
                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <h4>Subcaste Table</h4>
                             <div>
                                 <asp:TextBox ID="txtsubcastesearch" runat="server" class="form-control" placeholder="Enter Subcaste"></asp:TextBox>
                            </div>
                        </div>
                        <div class="panel-body">
                            <table class="table no-margin">
                                <thead>
                                    <tr>
                                      <th>Subcaste ID</th>
                                    <th>Caste name</th>
                                    <th>Subcaste name</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                <asp:Repeater ID="rptsubcast" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("Subcaste_ID")%></td>
                                            <td><%#Eval("Caste_name")%></td>
                                            <td><%#Eval("Subcaste_name")%></td>
                                            <td>
                                                 <asp:LinkButton ID="lnksubcatedit" runat="server" CommandArgument='<%#Eval("Subcaste_ID")%>' OnCommand="lnksubcatedit_Command"><i class="glyphicon glyphicon-edit"></i> Edit</asp:LinkButton>
                                                 </td>
                                            <td>
                                                  <asp:LinkButton ID="lnksubcatdelete" runat="server" CommandArgument='<%#Eval("Subcaste_ID")%>' OnCommand="lnksubcatdelete_Command"><i class="glyphicon glyphicon-trash"></i> Delete</asp:LinkButton>
                                               
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
   

</asp:Content>

