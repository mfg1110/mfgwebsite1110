<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Employeefeedback.aspx.cs" Inherits="Dashboard_Employeefeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="top-bar clearfix">
        <div class="page-title">
            <h4>Employee Feedback</h4>
        </div>
        </div>
        <div class="main-container">
        <div class="container-fluid">
            <div class="row gutter">
                 
                

                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel panel-red">
                       
                        <div class="panel-body">
                            <table class="table no-margin">
                                <thead>
                                    <tr>
                                       
                                        <th>Employee Feedback ID</th>
                                        <th>Employee Name</th>
                                        <th>Description</th>
                                         <th>DATE1</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                <asp:Repeater ID="rptemployeedata" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Eval("Employee_Feedback_ID")%></td>
                                            <td><%#Eval("Employee_Name")%></td>
                                             <td><%#Eval("Description")%></td>
                                             <td><%#Eval("DATE1")%></td>
                                            
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

