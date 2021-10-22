<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" CodeFile="Viewlist.aspx.cs" Inherits="Viewlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <section class="section-padding bg-dark inner-header">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 class="mt-0 mb-3 text-white">View List</h1>
                    <div class="breadcrumbs">
                        <p class="mb-0 text-white"><a class="text-white" href="#">Home</a> &nbsp;/&nbsp; <span class="text-success">View List</span></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="card sidebar-card">
                   
                        <div class="card-body">
                              <h5 class="card-title mb-3">
                            Find that special someone
                       </h5>
                            <asp:UpdatePanel ID="UpdatePanel6" runat="server">

                                <ContentTemplate>
                                    <%-- <h5 class="card-title">Special title treatment</h5>--%>
                                    <div class="form-contact contact_form card-text" id="contactForm1" novalidate="novalidate">
                                        <div class="row">

                                            <div class="col-sm-4">
                                                <span style="text-align: center">
                                                    <asp:Label ID="Label1" runat="server" Text=" I'm looking for a "></asp:Label>

                                                </span>

                                            </div>

                                            <div class="col-sm-8">
                                                <div class="form-group">

                                                    <asp:DropDownList ID="ddllookingfor" class="form-control" runat="server">
                                                        <asp:ListItem Value="Male">Groom</asp:ListItem>
                                                        <asp:ListItem Value="Female">Bride</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">

                                            <div class="col-md-4">
                                                <span style="text-align: center">
                                                    <asp:Label ID="Label2" runat="server" Text=" Age (in Years) "></asp:Label>

                                                </span>

                                            </div>

                                            <div class="col-md-8">
                                                <div class="form-group">


                                                    <div class="col-sm-2.5">

                                                        <div class="form-group">
                                                           
                                                                <asp:DropDownList ID="ddlage1" runat="server" class="form-control valid">
                                           
                                            <asp:ListItem Value="18">18</asp:ListItem>
                                            <asp:ListItem Value="19">19</asp:ListItem>
                                            <asp:ListItem Value="20">20</asp:ListItem>
                                            <asp:ListItem Value="21">21</asp:ListItem>
                                            <asp:ListItem Value="22">22</asp:ListItem>
                                            <asp:ListItem Value="23">23</asp:ListItem>
                                            <asp:ListItem Value="24">24</asp:ListItem>
                                            <asp:ListItem Value="25">25</asp:ListItem>
                                            <asp:ListItem Value="26">26</asp:ListItem>
                                            <asp:ListItem Value="27">27</asp:ListItem>
                                            <asp:ListItem Value="28">28</asp:ListItem>
                                            <asp:ListItem Value="29">29</asp:ListItem>
                                            <asp:ListItem Value="30">30</asp:ListItem>
                                            <asp:ListItem Value="31">31</asp:ListItem>
                                            <asp:ListItem Value="32">32</asp:ListItem>
                                            <asp:ListItem Value="33">33</asp:ListItem>
                                            <asp:ListItem Value="34">34</asp:ListItem>
                                            <asp:ListItem Value="35">35</asp:ListItem>
                                            <asp:ListItem Value="36">36</asp:ListItem>
                                            <asp:ListItem Value="37">37</asp:ListItem>
                                            <asp:ListItem Value="38">38</asp:ListItem>
                                            <asp:ListItem Value="39">39</asp:ListItem>
                                            <asp:ListItem Value="40">40</asp:ListItem>
                                            <asp:ListItem Value="41">41</asp:ListItem>
                                            <asp:ListItem Value="42">42</asp:ListItem>
                                            <asp:ListItem Value="43">43</asp:ListItem>
                                            <asp:ListItem Value="44">44</asp:ListItem>
                                            <asp:ListItem Value="45">45</asp:ListItem>
                                            <asp:ListItem Value="46">46</asp:ListItem>
                                            <asp:ListItem Value="47">47</asp:ListItem>
                                            <asp:ListItem Value="48">48</asp:ListItem>
                                            <asp:ListItem Value="49">49</asp:ListItem>
                                            <asp:ListItem Value="50">50</asp:ListItem>
                                            <asp:ListItem Value="51">51</asp:ListItem>
                                            <asp:ListItem Value="52">52</asp:ListItem>
                                            <asp:ListItem Value="53">53</asp:ListItem>
                                            <asp:ListItem Value="54">54</asp:ListItem>
                                            <asp:ListItem Value="55">55</asp:ListItem>
                                            <asp:ListItem Value="56">56</asp:ListItem>
                                            <asp:ListItem Value="57">57</asp:ListItem>
                                            <asp:ListItem Value="58">58</asp:ListItem>
                                            <asp:ListItem Value="59">59</asp:ListItem>
                                            <asp:ListItem Value="60">60</asp:ListItem>
                                        </asp:DropDownList>

                                                           
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlage1" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter height"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2.5">
                                                        TO
                                                    </div>
                                                   
                                                    <div class="col-sm-2.5">

                                                        <div class="form-group">
                                                             <asp:DropDownList ID="ddlage2" runat="server" class="form-control valid">
                                           
                                            <asp:ListItem Value="18">18</asp:ListItem>
                                            <asp:ListItem Value="19">19</asp:ListItem>
                                            <asp:ListItem Value="20">20</asp:ListItem>
                                            <asp:ListItem Value="21">21</asp:ListItem>
                                            <asp:ListItem Value="22">22</asp:ListItem>
                                            <asp:ListItem Value="23">23</asp:ListItem>
                                            <asp:ListItem Value="24">24</asp:ListItem>
                                            <asp:ListItem Value="25">25</asp:ListItem>
                                            <asp:ListItem Value="26">26</asp:ListItem>
                                            <asp:ListItem Value="27">27</asp:ListItem>
                                            <asp:ListItem Value="28">28</asp:ListItem>
                                            <asp:ListItem Value="29">29</asp:ListItem>
                                            <asp:ListItem Value="30">30</asp:ListItem>
                                            <asp:ListItem Value="31">31</asp:ListItem>
                                            <asp:ListItem Value="32">32</asp:ListItem>
                                            <asp:ListItem Value="33">33</asp:ListItem>
                                            <asp:ListItem Value="34">34</asp:ListItem>
                                            <asp:ListItem Value="35">35</asp:ListItem>
                                            <asp:ListItem Value="36">36</asp:ListItem>
                                            <asp:ListItem Value="37">37</asp:ListItem>
                                            <asp:ListItem Value="38">38</asp:ListItem>
                                            <asp:ListItem Value="39">39</asp:ListItem>
                                            <asp:ListItem Value="40">40</asp:ListItem>
                                            <asp:ListItem Value="41">41</asp:ListItem>
                                            <asp:ListItem Value="42">42</asp:ListItem>
                                            <asp:ListItem Value="43">43</asp:ListItem>
                                            <asp:ListItem Value="44">44</asp:ListItem>
                                            <asp:ListItem Value="45">45</asp:ListItem>
                                            <asp:ListItem Value="46">46</asp:ListItem>
                                            <asp:ListItem Value="47">47</asp:ListItem>
                                            <asp:ListItem Value="48">48</asp:ListItem>
                                            <asp:ListItem Value="49">49</asp:ListItem>
                                            <asp:ListItem Value="50">50</asp:ListItem>
                                            <asp:ListItem Value="51">51</asp:ListItem>
                                            <asp:ListItem Value="52">52</asp:ListItem>
                                            <asp:ListItem Value="53">53</asp:ListItem>
                                            <asp:ListItem Value="54">54</asp:ListItem>
                                            <asp:ListItem Value="55">55</asp:ListItem>
                                            <asp:ListItem Value="56">56</asp:ListItem>
                                            <asp:ListItem Value="57">57</asp:ListItem>
                                            <asp:ListItem Value="58">58</asp:ListItem>
                                            <asp:ListItem Value="59">59</asp:ListItem>
                                            <asp:ListItem Value="60">60</asp:ListItem>
                                        </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlage2" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter height"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                        </div>


                                        <div class="row">

                                            <div class="col-sm-4">
                                                <span style="text-align: center">
                                                    <asp:Label ID="Label3" runat="server" Text=" Religion "></asp:Label>

                                                </span>

                                            </div>

                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="ddlreligion" runat="server" class="form-control valid" AutoPostBack="true" OnSelectedIndexChanged="ddlreligion_SelectedIndexChanged">
                                                    <asp:ListItem Value="0">None</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <br />
                                        <div class="row">

                                            <div class="col-sm-4">
                                                <span style="text-align: center">
                                                    <asp:Label ID="Label5" runat="server" Text=" Caste "></asp:Label>

                                                </span>

                                            </div>

                                            <div class="col-sm-8">

                                                <div class="form-group">

                                                    <asp:DropDownList ID="ddlsubcaste" runat="server" class="form-control valid">
                                                        <asp:ListItem Value="0">None</asp:ListItem>
                                                    </asp:DropDownList>


                                                </div>

                                            </div>
                                        </div>



                                        <div class="row">

                                            <div class="col-sm-2">
                                            </div>

                                            <div class="col-sm-8">
                                                <div class="form-group mt-3">
                                                    <asp:Button ID="Button1" runat="server" class="btn btn-success mr-2" ValidationGroup="B" Text="Search" OnClick="btnsubmit_Click" />
                                                    <%--<input type="button" id="Save" value="Save Data" />--%>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                            </div>
                                        </div>


                                    </div>
                                    
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            </div>
</div>
                    <div id="sidebar" runat="server" visible="false">
                    <div class="card sidebar-card">
                        <div class="card-body">
                            <h5 class="card-title mb-3">Find that special someone By Subcaste</h5>
                            <asp:Repeater ID="rptmenu" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <asp:LinkButton ID="lnksubcast" runat="server" CommandArgument='<%# Eval("Subcast") %>' OnCommand="lnksubcast_Command"><%#Eval("Subcast")%> (<span><%#Eval("total_record")%></span>)</asp:LinkButton>


                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="card sidebar-card">
                        <div class="card-body">
                            <h5 class="card-title mb-3">Find that special someone By Gender</h5>
                            <asp:Repeater ID="rptgender" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <asp:LinkButton ID="lnkgender" runat="server" CommandArgument='<%# Eval("Gender") %>' OnCommand="lnkgender_Command"><%#Eval("Gender")%> (<span><%#Eval("total_record")%></span>)</asp:LinkButton>


                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8">

                    <div class="row">
                        <asp:Repeater ID="rptourdata" runat="server" OnItemDataBound="rptourdata_ItemDataBound">
                            <ItemTemplate>
                                <div class="col-lg-6 col-md-6">
                                    <div class="card card-list card-list-view">

                                        <div class="row no-gutters">
                                            <div class="col-lg-5 col-md-5">
                                                <span class="badge badge-success"><%# Eval("gender") %></span>
                                                <img src="../Picture/<%# ProcessDataItem(Eval("Photo")) %>" alt="" class="img-thumbnail" height="150" width="150" style="margin-top:22px;height:150px;width:150px">
                                            </div>
                                            <div class="col-lg-7 col-md-7">
                                                <div class="card-body">
                                                    <h5 class="card-title"><%# Eval("Name") %></h5>
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
                                        <hr />
                                        <div class="row no-gutters">
                                            <div class="col-lg-2">
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="lnkexpressintrest" CssClass="btn btn-success btn-sm" ForeColor="White" CommandArgument='<%# Eval("Biodata_id") + "," + Eval("Name") + "," + Eval("id") %>' runat="server" OnClick="lnkexpressintrest_Click">Express Intrest</asp:LinkButton>
                                            </div>
                                            <div class="col-lg-4">
                                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-success btn-sm" ForeColor="White" CommandArgument='<%# Eval("Search_ID") %>' runat="server" OnClick="LinkButton1_Click">View in Detail</asp:LinkButton>
                                            </div>
                                            <div class="col-lg-2">
                                            </div>
                                        </div>
                                        <br />

                                    </div>
                                </div>
                            </ItemTemplate>

                            <FooterTemplate>
                                    <div id="trEmpty" runat="server" visible="false">
                                        <td colspan="3" align="center">No records found.
                                        </td>
                                    </div>

                                </FooterTemplate>
                        </asp:Repeater>

                            <asp:Repeater ID="rptPaging" runat="server" onitemcommand="rptPaging_ItemCommand">
<ItemTemplate>
    <nav class="mt-5">
                        <ul class="pagination justify-content-center">
                            
                            <li class="page-item active"><asp:LinkButton ID="lnkPage"
style="padding:8px; margin:2px; background:#0033c4; border:solid 1px #666; color:#fff; font-weight:bold"
CommandName="Page" CommandArgument="<%# Container.DataItem %>"
runat="server" Font-Bold="True"><%# Container.DataItem %>
</asp:LinkButton></li>
                            
                        </ul>
                    </nav>

</ItemTemplate>
</asp:Repeater>
                    </div>
                    
                </div>

            </div>
            </div>
    </section>
</asp:Content>

