<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/UserDashboardMasterPage.master" AutoEventWireup="true" CodeFile="Patnerprefrences.aspx.cs" Inherits="UserDashboard_Patnerprefrences" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <div class="top-bar clearfix">
        <div class="page-title">
            <h4>Patner prefrences<small class="samll"></small></h4>
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
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <h4>Patner prefrences</h4>
                        </div>
                        <div class="panel-body">
                <div class="row gutter">
                      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                    <div class="form-contact contact_form" id="contactForm1" novalidate="novalidate">
                        <div class="row gutter-10">
                            <div class="col-sm-12">
                                <h2 class="contact-title"></h2>
                                    <asp:Label ID="lblmsg" runat="server" Text="dfds" CssClass="alert alert-success" Visible="false"> </asp:Label>
                            </div>
                            <br />
                            <br />
                             <div class="col-md-12">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    Gender
                                    <asp:DropDownList ID="ddlgender" class="form-control valid" runat="server">
                                        <asp:ListItem Value="Groom">Groom</asp:ListItem>
                                        <asp:ListItem Value="Bride">Bride</asp:ListItem>

                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlgender" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Select Gender"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-sm-6">

                                <div class="form-group">
                                    <div class="col-md-1">
                                        Age
                                    </div>

                                    <div class="col-sm-2">

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


                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlage1" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter height"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        To
                                    </div>
                                    <div class="col-sm-2">

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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlage2" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter height"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>


                                </div>
                            </div>
</div>
                             <div class="col-md-12">
                            <div class="col-sm-6">

                                <div class="form-group">
                                    <div class="col-md-2">
                                        Height
                                    </div>

                                    <div class="col-sm-2">
                                        Feet 
                                           <div class="form-group">
                                               <asp:DropDownList ID="ddlfeet1" runat="server" class="form-control valid">


                                                   <asp:ListItem Value="1">1</asp:ListItem>
                                                   <asp:ListItem Value="2">2</asp:ListItem>
                                                   <asp:ListItem Value="3">3</asp:ListItem>
                                                   <asp:ListItem Value="4">4</asp:ListItem>
                                                   <asp:ListItem Value="5">5</asp:ListItem>
                                                   <asp:ListItem Value="6">6</asp:ListItem>
                                                   <asp:ListItem Value="7">7</asp:ListItem>

                                               </asp:DropDownList>

                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlfeet1" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter height"></asp:RequiredFieldValidator>
                                           </div>
                                    </div>
                                    <div class="col-sm-2">
                                        Inch 
                                           <div class="form-group">
                                               <asp:DropDownList ID="ddlinch1" runat="server" class="form-control valid">


                                                   <asp:ListItem Value="1">1</asp:ListItem>
                                                   <asp:ListItem Value="2">2</asp:ListItem>
                                                   <asp:ListItem Value="3">3</asp:ListItem>
                                                   <asp:ListItem Value="4">4</asp:ListItem>
                                                   <asp:ListItem Value="5">5</asp:ListItem>
                                                   <asp:ListItem Value="6">6</asp:ListItem>
                                                   <asp:ListItem Value="7">7</asp:ListItem>
                                                   <asp:ListItem Value="8">8</asp:ListItem>
                                                   <asp:ListItem Value="9">9</asp:ListItem>
                                                   <asp:ListItem Value="10">10</asp:ListItem>
                                                   <asp:ListItem Value="11">11</asp:ListItem>
                                                   <asp:ListItem Value="12">12</asp:ListItem>

                                               </asp:DropDownList>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlinch1" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter height"></asp:RequiredFieldValidator>
                                           </div>
                                    </div>

                                    <div class="col-md-2">
                                        To
                                    </div>

                                    <div class="col-sm-2">
                                        Feet 
                                           <div class="form-group">
                                               <asp:DropDownList ID="ddlfeet2" runat="server" class="form-control valid">


                                                   <asp:ListItem Value="1">1</asp:ListItem>
                                                   <asp:ListItem Value="2">2</asp:ListItem>
                                                   <asp:ListItem Value="3">3</asp:ListItem>
                                                   <asp:ListItem Value="4">4</asp:ListItem>
                                                   <asp:ListItem Value="5">5</asp:ListItem>
                                                   <asp:ListItem Value="6">6</asp:ListItem>
                                                   <asp:ListItem Value="7">7</asp:ListItem>

                                               </asp:DropDownList>

                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlfeet2" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter height"></asp:RequiredFieldValidator>
                                           </div>
                                    </div>
                                    <div class="col-sm-2">
                                        Inch 
                                           <div class="form-group">
                                               <asp:DropDownList ID="ddlinch2" runat="server" class="form-control valid">


                                                   <asp:ListItem Value="1">1</asp:ListItem>
                                                   <asp:ListItem Value="2">2</asp:ListItem>
                                                   <asp:ListItem Value="3">3</asp:ListItem>
                                                   <asp:ListItem Value="4">4</asp:ListItem>
                                                   <asp:ListItem Value="5">5</asp:ListItem>
                                                   <asp:ListItem Value="6">6</asp:ListItem>
                                                   <asp:ListItem Value="7">7</asp:ListItem>
                                                   <asp:ListItem Value="8">8</asp:ListItem>
                                                   <asp:ListItem Value="9">9</asp:ListItem>
                                                   <asp:ListItem Value="10">10</asp:ListItem>
                                                   <asp:ListItem Value="11">11</asp:ListItem>
                                                   <asp:ListItem Value="12">12</asp:ListItem>

                                               </asp:DropDownList>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlinch2" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter height"></asp:RequiredFieldValidator>
                                           </div>
                                    </div>


                                </div>
                            </div>
                              <div class="col-sm-6">
                                <div class="form-group">
                                                                        Maritial Status
                                    <asp:DropDownList ID="ddlmaritialstatus" class="form-control valid" runat="server" >

                                        <asp:ListItem Value="Single">Single</asp:ListItem>
                                        <asp:ListItem Value="Divorce">Divorce</asp:ListItem>
                                        <asp:ListItem Value="Widow">Widow</asp:ListItem>
                                        <asp:ListItem Value="Widower">Widower</asp:ListItem>
                                    </asp:DropDownList>

                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="ddlmaritialstatus" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Select Maritial Status"></asp:RequiredFieldValidator>
                                                                    </div>
                            </div>
                            </div>
                             <div class="col-md-12">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    Religion
                                          <asp:DropDownList ID="ddlreligion" runat="server" class="form-control valid" AutoPostBack="true" OnSelectedIndexChanged="ddlreligion_SelectedIndexChanged">
                                              <asp:ListItem Value="0">None</asp:ListItem>
                                          </asp:DropDownList>
                                    <asp:HiddenField ID="hfCustomerId" runat="server" />
                                    <%--  <span style="font-size: small; color: #ff6a00">* Ex. 75</span>--%>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtweight" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter weight"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">

                                    <ContentTemplate>
                                        <div class="form-group">
                                            Caste
                                                          <asp:DropDownList ID="ddlsubcaste" runat="server" class="form-control valid">
                                                              <asp:ListItem Value="0">None</asp:ListItem>
                                                          </asp:DropDownList>

                                            <span style="font-size: small; color: #0d3dd9">* <a href="#">If Your Caste Not Added Then Please Click Here</a> </span>
                                            <asp:TextBox ID="txtsubcaste" runat="server" class="form-control valid" name="name" type="text" Visible="false" onfocus="this.placeholder = 'Enter Sub Caste'" onblur="this.placeholder = 'Enter Sub Caste'" placeholder="Enter Sub Caste" ValidationGroup="B"></asp:TextBox>
                                            <%-- <asp:DropDownList ID="DropDownList1" runat="server" class="form-control valid">
                                                <asp:ListItem Value="0">None</asp:ListItem>
                                                <asp:ListItem Value="A+">A+</asp:ListItem>
                                                <asp:ListItem Value="A-">A-</asp:ListItem>
                                                <asp:ListItem Value="O+">O+</asp:ListItem>
                                                <asp:ListItem Value="O-">O-</asp:ListItem>
                                                <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                                <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                                <asp:ListItem Value="B+">B+</asp:ListItem>
                                                <asp:ListItem Value="B-">B-</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        </div>

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
</div>
                             <div class="col-md-12">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    Physical Status
                                                                    <asp:RadioButtonList ID="rdphysical" class="form-check" runat="server" AutoPostBack="true">
                                                                        <asp:ListItem Value="Normal">
                                                                        Normal
                                                                        </asp:ListItem>
                                                                        <asp:ListItem Value="Physically challenged">
                                                                         Physically challenged
                                                                        </asp:ListItem>
                                                                        <asp:ListItem Value=" Doesn't matter">
                                                                        Doesn't matter
                                                                        </asp:ListItem>
                                                                    </asp:RadioButtonList>
                                </div>

                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    Zoradic Sign
                                                                        <br />
                                    <asp:CheckBoxList ID="chkzoradic" runat="server" CellPadding="30" RepeatLayout="Flow" AutoPostBack="true"
                                        RepeatDirection="Vertical">
                                        <asp:ListItem Value="Any"> Any</asp:ListItem>
                                        <asp:ListItem Value="Aries">Aries</asp:ListItem>
                                        <asp:ListItem Value="Aquarius">Aquarius</asp:ListItem>
                                        <asp:ListItem Value="Pisces">Pisces</asp:ListItem>
                                        <asp:ListItem Value="Taurus">Taurus</asp:ListItem>
                                        <asp:ListItem Value="Gemini">Gemini</asp:ListItem>
                                        <asp:ListItem Value="Cancer">Cancer</asp:ListItem>
                                        <asp:ListItem Value="leo">leo</asp:ListItem>
                                        <asp:ListItem Value="Virgo">Virgo</asp:ListItem>
                                        <asp:ListItem Value="Libra">Libra</asp:ListItem>
                                        <asp:ListItem Value="Scorpio">Scorpio</asp:ListItem>
                                        <asp:ListItem Value="Sagittarius">Sagittarius</asp:ListItem>
                                        <asp:ListItem Value="Capricorn">Capricorn</asp:ListItem>

                                    </asp:CheckBoxList>
                                </div>
                            </div>
                            <div class="col-sm-3">


                                <div class="form-group">
                                    Skin complaction (optional)
                                                                        <br />
                                    <asp:CheckBoxList ID="chkskincomplection" runat="server" CellPadding="30" RepeatLayout="Flow" AutoPostBack="true"
                                        RepeatDirection="Vertical">
                                        <asp:ListItem Value="Any"> Any</asp:ListItem>
                                        <asp:ListItem Value="Very Fair">Very Fair</asp:ListItem>
                                        <asp:ListItem Value="Fair">Fair</asp:ListItem>
                                        <asp:ListItem Value="Medium">Medium</asp:ListItem>
                                        <asp:ListItem Value="Olive">Olive</asp:ListItem>
                                        <asp:ListItem Value="Brown">Brown</asp:ListItem>
                                        <asp:ListItem Value="Black">Black</asp:ListItem>


                                    </asp:CheckBoxList>
                                </div>
                            </div>
                            <div class="col-sm-3">
                            </div>
                                 </div>
                             <div class="col-md-12">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    Hightest Education   
                                            <asp:TextBox ID="txtHightestEducation" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter  Hightest Education'" onblur="this.placeholder = 'Enter  Hightest Education'" placeholder="Enter  Hightest Education" ValidationGroup="B"></asp:TextBox>
                                    <span style="font-size: small; color: #ff6a00">* Ex. Master Of Computer Application (MCA)</span>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtHightestEducation" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter  Hightest Education "></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    Occupation 
                                            <asp:TextBox ID="txtOccupation" runat="server" class="form-control valid" name="name" Text="" type="text" onfocus="this.placeholder = 'Enter Occupation'" onblur="this.placeholder = 'Enter Occupation'" placeholder="Enter Occupation" ValidationGroup="B"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtOccupation" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter Occupation"></asp:RequiredFieldValidator>
                                </div>
                            </div>
</div>
                             <div class="col-md-12">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    Annual Income (optional)
                                     <asp:DropDownList ID="ddlannualincome" class="form-control valid" runat="server">
                                                <asp:ListItem Value="Any">----------Any----------</asp:ListItem>
                                                <asp:ListItem Value="Less Than Rs. 50 Thousand">Less Than Rs. 50 Thousand</asp:ListItem>
                                                <asp:ListItem Value="Rs. 50 Thousand">Rs. 50 Thousand</asp:ListItem>
                                                <asp:ListItem Value="Rs. 1 Lakh">Rs. 1 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 2 Lakh">Rs. 2 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 3 Lakh">Rs. 3 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 4 Lakh">Rs. 4 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 5 Lakh">Rs. 5 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 6 Lakh">Rs. 6 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 7 Lakh">Rs. 7 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 8 Lakh">Rs. 8 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 9 Lakh">Rs. 9 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 10 Lakh">Rs. 10 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 12 Lakh">Rs. 12 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 14 Lakh">Rs. 14 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 16 Lakh">Rs. 16 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 18 Lakh">Rs. 18 Lakh</asp:ListItem>
                                          <asp:ListItem Value="Rs. 20 Lakh">Rs. 20 Lakh</asp:ListItem>
                                           <asp:ListItem Value="Rs. 22 Lakh">Rs. 22 Lakh</asp:ListItem>
                                           <asp:ListItem Value="Rs. 24 Lakh">Rs. 24 Lakh</asp:ListItem>
                                           <asp:ListItem Value="Rs. 26 Lakh">Rs. 26 Lakh</asp:ListItem>
                                           <asp:ListItem Value="Rs. 28 Lakh">Rs. 28 Lakh</asp:ListItem>
                                           <asp:ListItem Value="Rs. 30 Lakh">Rs. 30 Lakh</asp:ListItem>

                                         </asp:DropDownList>

                                    <%--     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtOccupationindetails" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter Description"></asp:RequiredFieldValidator>
         --%>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    Currency
                                            <asp:DropDownList ID="ddlcurrency" class="form-control valid" runat="server">
                                                <asp:ListItem Value="0">----------Select----------</asp:ListItem>
                                                <asp:ListItem Value="INR">INR-Indian rupee</asp:ListItem>
                                                <asp:ListItem Value="USD">USD-US dollar</asp:ListItem>
                                                <asp:ListItem Value="KYD">KYD-Cayman Island Dollar</asp:ListItem>
                                                <asp:ListItem Value="EUR">EUR-Euro</asp:ListItem>
                                                <asp:ListItem Value="GIP">GIP-Gibraltar Pound</asp:ListItem>
                                                <asp:ListItem Value="GBP">GBP-British Pound</asp:ListItem>
                                                <asp:ListItem Value="JOD">JOD-Jordanian Dinar</asp:ListItem>
                                                <asp:ListItem Value="OMR">OMR-Omani Rial</asp:ListItem>
                                                <asp:ListItem Value="BHD">BHD-Bahraini Dinar</asp:ListItem>
                                                <asp:ListItem Value="KWD">KWD-Kuwaiti Dinar</asp:ListItem>
                                                <asp:ListItem Value="BGN">BGN-Bulgarian lev</asp:ListItem>
                                                <asp:ListItem Value="CZK">CZK-Czech koruna</asp:ListItem>
                                                <asp:ListItem Value="DKK">DKK-Danish krone</asp:ListItem>
                                                <asp:ListItem Value="HUF">HUF-Hungarian forint</asp:ListItem>
                                                <asp:ListItem Value="PLN">PLN-Polish zloty</asp:ListItem>
                                                <asp:ListItem Value="RON">RON-Romanian leu</asp:ListItem>
                                                <asp:ListItem Value="SEK">SEK-Swedish krona</asp:ListItem>
                                                <asp:ListItem Value="CHF">CHF-Swiss franc</asp:ListItem>
                                                <asp:ListItem Value="KRW">KRW-South Korean won</asp:ListItem>
                                                <asp:ListItem Value="SGD">SGD-Singapore dollar</asp:ListItem>

                                          </asp:DropDownList>
                                </div>
                            </div>
                            </div>
                             <div class="col-md-12">
                                                        <div class="col-sm-6">
                                <div class="form-group">
                                    Country
                                            <asp:TextBox ID="txtcountry" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Country '" onblur="this.placeholder = 'Enter Country '" placeholder="Enter Country " ValidationGroup="B"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtcountry" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter Country"></asp:RequiredFieldValidator>
         
                                </div>
                            </div>
                                                        <div class="col-sm-6">
                                <div class="form-group">
                                  Residing State
                                            <asp:TextBox ID="txtstate" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter State'" onblur="this.placeholder = 'Enter State '" placeholder="Enter State" ValidationGroup="B"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtstate" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter State"></asp:RequiredFieldValidator>
         
                                </div>
                            </div>
                                 </div>
                             <div class="col-md-12">
                                                        <div class="col-sm-6">
                                <div class="form-group">
                                  Residing City
                                            <asp:TextBox ID="txtcity" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter City '" onblur="this.placeholder = 'Enter City'" placeholder="Enter City " ValidationGroup="B"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtcity" ForeColor="white" Display="Dynamic" CssClass="label label-danger" ValidationGroup="B" ErrorMessage="Please Enter City"></asp:RequiredFieldValidator>
         
                                </div>
                            </div>
                                 </div>
                            <div class="col-md-12" style="margin-left:20px">
                                <div class="form-group">

                                    <asp:Button ID="btnsubmit" runat="server" ValidationGroup="B" class="btn btn-primary mr-2" Text="Submit" OnClick="btnsublit_Click" />

                                </div>
                            </div>

                        </div>
                    </div>
                                                            </ContentTemplate>
                          </asp:UpdatePanel>

                    <asp:Repeater ID="rptdata" runat="server">
    <HeaderTemplate>
        <table id="tblCustomers" class="table-responsive table table-active" border="0" cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <th data-class="expand">
                        Prefer_ID
                    </th>
                    <th scope="col">
                       Reg_ID
                    </th>
                    <th>
                        Gender
                    </th>
                    <th>
                        AgeFrom
                    </th>
                      <th>
                        AgeTo
                    </th>
                      <th>
                        HeightFrom
                    </th>
                      <th>
                        HeightTo
                    </th>
                      <th>
                        Marital_Status
                    </th>
                      <th>
                        Physical_Status
                    </th>
                      <th>
                        Religion
                    </th>
                     <th>
                        Caste
                    </th>
                     <th>
                        Zoradic
                    </th>
                     <th>
                        Education
                    </th>
                     <th>
                        Occupation
                    </th>
                     <th>
                        Annual_Income
                    </th>
                     <th>
                        Country
                    </th>
                     <th>
                        Residing_City
                    </th>
                     <th>
                        Residing_State
                    </th>
                </tr>
            </thead>
    </HeaderTemplate>
    <ItemTemplate>
        <tbody>
            <tr>
                <td>
                    <%#Eval("Prefer_ID")%>
                </td>
                <td>
                    <%#Eval("Reg_ID")%>
                </td>
                <td>
                    <%#Eval("Gender")%>
                </td>
                <td>
                    <%#Eval("AgeFrom")%>
                </td>
                 <td>
                    <%#Eval("AgeTo")%>
                </td>
                 <td>
                    <%#Eval("HeightFrom")%>
                </td>
                 <td>
                    <%#Eval("HeightTo")%>
                </td>
                 <td>
                    <%#Eval("Marital_Status")%>
                </td>
                 <td>
                    <%#Eval("Physical_Status")%>
                </td>
                 <td>
                    <%#Eval("Religion")%>
                </td>
                 <td>
                    <%#Eval("Caste")%>
                </td>
                 <td>
                    <%#Eval("Zoradic")%>
                </td>
                 <td>
                    <%#Eval("Education")%>
                </td>
                 <td>
                    <%#Eval("Occupation")%>
                </td>
                 <td>
                    <%#Eval("Annual_Income")%>
                </td>
                 <td>
                    <%#Eval("Country")%>
                </td>
                 <td>
                    <%#Eval("Residing_City")%>
                </td>
                    <td>
                    <%#Eval("Residing_State")%>
                </td>
            </tr>
        </tbody>
    </ItemTemplate>
    <FooterTemplate>
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
</asp:Content>

