<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" CodeFile="demo.aspx.cs" Inherits="demo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 mx-auto">
                     
                    <div class="card padding-card">

                        <div class="card-body">
                           
                            <h5 class="card-title mb-4">FORGOT PASSWORD</h5>
                         <span class="badge badge-danger" id="lblmsg1" runat="server" visible="false" style="color:white" >
  <span><i class="glyphicon glyphicon-remove-circle"> </i>  <asp:Label ID="lblmsg" runat="server" Text=""   Font-Bold="true"> </asp:Label></span>
  
</span>       
        <span class="badge badge-success" id="lblmsgsuccessspan" runat="server" visible="false" style="color:white"  >
  <span><i class="glyphicon glyphicon-ok-circle"> </i>  <asp:Label ID="lblmsgsucess" runat="server" Text=""   Font-Bold="true"> </asp:Label></span>
  
</span>
                                <div class="form-group">
                                    <label>EMAIL ID<span class="text-danger">*</span></label>
                                   <asp:TextBox ID="txtemailid" runat="server" class="form-control" placeholder="EMAIL ID" required=""></asp:TextBox>
                          
                                </div>
                               
                               
                              
                         <asp:LinkButton ID="lnksend" runat="server" class="btn btn-success btn-block" OnClick="lnksend_Click">SEND</asp:LinkButton>
                           <%-- <div class="mt-4 text-center login-with-social">
                                <button type="button" class="btn btn-facebook btn-block"><i class="mdi mdi-facebook"></i>Login With Facebook</button>
                                <button type="button" class="btn btn-twitter btn-block"><i class="mdi mdi-twitter"></i>Login With Twitter</button>
                                <button type="button" class="btn btn-google btn-block"><i class="mdi mdi-google-plus"></i>Login With Google</button>
                            </div>--%>
                            
                        </div>

                        <div class="card padding-card">

                        <div class="card-body">
                           <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false">
    <Columns>
       <%-- <asp:BoundField ItemStyle-Width="150px" DataField="CustomerID" HeaderText="CustomerID"/>
        <asp:BoundField ItemStyle-Width="150px" DataField="ContactName" HeaderText="Contact Name"/>
        <asp:BoundField ItemStyle-Width="150px" DataField="City" HeaderText="City"/>--%>
    </Columns>
</asp:GridView>
                            </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
    <script type="text/javascript">
        $("body").on("click", "#lnksend", function () {
            var txtName = $("#txtemailid");
            //var txtCountry = $("#txtCountry");
            var _customer = {};
            Name = txtName.val();
            //_customer.Country = txtCountry.val();
            $.ajax({
                type: "POST",
                url: "https://api.ohmsoftwaresinc.com/api/Matrimonyforgujarati/iNSERTDEMO2",
                data: JSON.stringify(_customer),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    alert("CustomerId: " + r.CustomerId.toString());
                }
            });
        });
    </script>
    <%--<script type="text/javascript">
        $("#lnksend").click(function () {
            var PersonalDetails = {
                "FirstName": $("#FirstName").val(),
                "LastName": $("#LastName").val(),
                "Age": $("#Age").val(),
                "Active": $("#Active").val()
            };

            $.ajax({
                type: "POST",
                url: 'https://api.ohmsoftwaresinc.com/api/Matrimonyforgujarati/iNSERTDEMO',
                data: JSON.stringify(PersonalDetails),
                dataType: "json",
                processData: true,
                success: function (data, status, xhr) {
                    alert(status);
                },
                error: function (xhr) {
                    alert(xhr.responseText);
                }
            });
        });
</script>--%>
</asp:Content>


