<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminMasterPage.master" AutoEventWireup="true" CodeFile="starmanagement.aspx.cs" Inherits="Dashboard_starmanagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="top-bar clearfix">
        <div class="page-title">
            <h4>Star Management</h4>
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
                            <h4>Star Management</h4>
                        </div>
                        <div class="panel-body">
                            
                                <div class="form-group">
                                    <label class="sr-only" for="exampleInputEmail2">Religion</label>

                                    <asp:TextBox ID="txtstar" runat="server" class="form-control" placeholder="Enter Star"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="notice red" runat="server" ControlToValidate="txtstar" ValidationGroup="B" ForeColor="Red" ErrorMessage="Please Enter Star"></asp:RequiredFieldValidator>
                                </div>

                                <asp:LinkButton ID="lnkstarsubmit" runat="server" class="btn btn-info waves-effect waves-light" OnClick="lnkstarsubmit_Click" ValidationGroup="B"> ADD</asp:LinkButton>
                        </div>
                    </div>
                </div>
                

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <h4>Star Management Table</h4>
                            <div>
                                 <asp:TextBox ID="txtsearchreligion" runat="server" class="form-control" placeholder="Enter Star"></asp:TextBox>
                            </div>
                        </div>
                        <div class="panel-body">
                            <table class="table no-margin">
                                <thead>
                                    <tr>
                                       
                                        <th>Star ID</th>
                                        <th>Star name</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                <asp:Repeater ID="rptstardetails" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("Star_id")%></td>
                                            <td><%#Eval("Starname")%></td>
                                             <td>
                                                 <asp:LinkButton ID="lnkedit" runat="server" CommandArgument='<%#Eval("Star_id")%>' OnCommand="lnkedit_Command"><i class="glyphicon glyphicon-edit"></i> Edit</asp:LinkButton>
                                                 </td>
                                            <td>
                                                  <asp:LinkButton ID="lnkdelete" runat="server" CommandArgument='<%#Eval("Star_id")%>' OnCommand="lnkdelete_Command"><i class="glyphicon glyphicon-trash"></i> Delete</asp:LinkButton>
                                               
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

                
            </div>









        </div>
    </div>
</asp:Content>

