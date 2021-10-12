<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" CodeFile="postbiodata.aspx.cs" EnableViewStateMac="false" Inherits="postbiodata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
      <style type="text/css">
        #wizHeader li .prevStep {
            background-color: #669966;
        }

            #wizHeader li .prevStep:after {
                border-left-color: #669966 !important;
            }

        #wizHeader li .currentStep {
            background-color: #C36615;
        }

            #wizHeader li .currentStep:after {
                border-left-color: #C36615 !important;
            }

        #wizHeader li .nextStep {
            background-color: #C2C2C2;
        }

            #wizHeader li .nextStep:after {
                border-left-color: #C2C2C2 !important;
            }

        #wizHeader {
            list-style: none;
            overflow: hidden;
            font: 18px Helvetica, Arial, Sans-Serif;
            margin: 56px;
            padding: 21px;
        }

            #wizHeader li {
                float: left;
            }

                #wizHeader li a {
                    color: white;
                    text-decoration: none;
                    padding: 10px 0 10px 55px;
                    background: brown; /* fallback color */
                    background: hsla(34,85%,35%,1);
                    position: relative;
                    display: block;
                    float: left;
                    margin-bottom: 3px;
                }

                    #wizHeader li a:after {
                        content: " ";
                        display: block;
                        width: 0;
                        height: 0;
                        border-top: 50px solid transparent; /* Go big on the size, and let overflow hide */
                        border-bottom: 50px solid transparent;
                        border-left: 30px solid hsla(34,85%,35%,1);
                        position: absolute;
                        top: 50%;
                        margin-top: -50px;
                        left: 100%;
                        z-index: 2;
                    }

                    #wizHeader li a:before {
                        content: " ";
                        display: block;
                        width: 0;
                        height: 0;
                        border-top: 50px solid transparent;
                        border-bottom: 50px solid transparent;
                        border-left: 30px solid white;
                        position: absolute;
                        top: 50%;
                        margin-top: -50px;
                        margin-left: 1px;
                        left: 100%;
                        z-index: 1;
                    }

                #wizHeader li:first-child a {
                    /*padding-left: 10px;*/
                }

                #wizHeader li:last-child {
                    padding-right: 50px;
                }

                #wizHeader li a:hover {
                    background: #FE9400;
                }

                    #wizHeader li a:hover:after {
                        border-left-color: #FE9400 !important;
                    }

        .content {
            height: 100%;
            padding-top: 75px;
            /*text-align: center;*/
            /*background-color: #F9F9F9;*/
            font-size: 12px;
        }
    </style>
    <script type="text/javascript">
        function showImagePreview(input) {
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#imgPreview').attr('src', e.target.result);
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <div class="content-wrapper pb-0">

        <section class="contact-section" style="background: #ffffff; margin-bottom: 97px;">
            <div class="container">
                <div class="row">


                    <div class="row">
                        <div class="col-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <div class="form-contact contact_form" id="contactForm1" novalidate="novalidate">



                                        <asp:Wizard ID="Wizard1" runat="server" DisplaySideBar="false" OnActiveStepChanged="Wizard1_ActiveStepChanged1" OnLoad="Wizard1_Load" OnPreviousButtonClick="Wizard1_PreviousButtonClick">

                                            <FinishNavigationTemplate>
                                                <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False"
                                                    CommandName="MovePrevious" Text="Previous" OnClick="FinishPreviousButton_Click" class="btn btn-primary mr-2" />
                                                <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" OnClick="FinishButton_Click"
                                                    Text="Finish It" class="btn btn-primary mr-2" />
                                            </FinishNavigationTemplate>
                                            <StartNavigationTemplate>
                                                <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" ValidationGroup="B" OnClick="StartNextButton_Click"
                                                    Text="Save & Next" class="btn btn-primary mr-2" />
                                            </StartNavigationTemplate>
                                            <StepNavigationTemplate>
                                                <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False"
                                                    CommandName="MovePrevious" Text="Previous" class="btn btn-primary mr-2" />
                                                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" ValidationGroup="B" OnClick="StepNextButton_Click"
                                                    Text="Save & Next" class="btn btn-primary mr-2" />
                                            </StepNavigationTemplate>

                                            <WizardSteps>
                                                <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
                                                    <%--<div class="content">Personal Detail --%>

                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <h2 class="contact-title">Personal Details</h2>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Name 
                                            <asp:TextBox ID="txtname" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Name'" onblur="this.placeholder = 'Enter Name'" placeholder="Enter Name"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. Hetvi Rana</span>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter  Name"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Gender
                                    <asp:DropDownList ID="ddlgender" class="form-control valid" runat="server">
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>

                                    </asp:DropDownList>

                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlgender" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Select Gender"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Date Of Birth 
                                            <asp:TextBox ID="txtdob" runat="server" class="form-control valid" TextMode="Date" name="name" type="text" onfocus="this.placeholder = 'Enter Date Of Birth'" onblur="this.placeholder = 'Enter Date Of Birth'" placeholder="Date Of Birth"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. yyyy-mm-dd / 1996-01-26</span>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtdob" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Date Of Birth"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                                <%--  <div class="col-sm-6">--%>
                                                                <div class="col-sm-2">
                                                                    Time of Birth 
                                        
                                                                </div>
                                                                <div class="col-sm-1.5">
                                                                    Hours
                                          
                                        <asp:DropDownList ID="ddlhours" runat="server" class="form-control valid">
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
                                                                </div>
                                                                <div class="col-sm-1.5">
                                                                    Minutes
                                          
                                        <asp:DropDownList ID="ddlminut" runat="server" class="form-control ">
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
                                            <asp:ListItem Value="13">13</asp:ListItem>
                                            <asp:ListItem Value="14">14</asp:ListItem>
                                            <asp:ListItem Value="15">15</asp:ListItem>
                                            <asp:ListItem Value="16">16</asp:ListItem>
                                            <asp:ListItem Value="17">17</asp:ListItem>
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
                                                                </div>
                                                                <div class="col-sm-1.5">
                                                                    Second
                                        
                                        <asp:DropDownList ID="ddlsecond" runat="server" class="form-control valid">
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
                                            <asp:ListItem Value="13">13</asp:ListItem>
                                            <asp:ListItem Value="14">14</asp:ListItem>
                                            <asp:ListItem Value="15">15</asp:ListItem>
                                            <asp:ListItem Value="16">16</asp:ListItem>
                                            <asp:ListItem Value="17">17</asp:ListItem>
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
                                                                </div>
                                                                <div class="col-sm-1.5">
                                                                    AM/PM
                                           
                                        <asp:DropDownList ID="ddl12hour" runat="server" class="form-control valid">
                                            <asp:ListItem Value="AM">AM</asp:ListItem>
                                            <asp:ListItem Value="PM">PM</asp:ListItem>

                                        </asp:DropDownList>
                                                                </div>
                                                                <%-- <div class="form-group">
                                       <asp:TextBox ID="txttob" runat="server" class="form-control valid" TextMode="Time" name="name"  type="text" onfocus="this.placeholder = 'Enter Time of Birth'" onblur="this.placeholder = 'Enter Time of Birth'" placeholder="Time of Birth"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txttob" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Time of Birth"></asp:RequiredFieldValidator>
                                    </div>
                            --%>
                                                                <%-- </div>--%>
                                                                <div class="col-sm-12">
                                                                    <div class="form-group">
                                                                        Place of Birth 
                                            <asp:TextBox ID="txtpob" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Place of Birth'" onblur="this.placeholder = 'Enter Place of Birth'" placeholder="Enter Place of Birth"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. Valsad, Gujrat, India</span>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtpob" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Place of Birth"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6" runat="server" visible="false">

                                                                    <div class="form-group">
                                                                        Religion  (optional)
                                            <asp:TextBox ID="txtreligion" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Religion'" onblur="this.placeholder = 'Enter Religion'" placeholder="Enter Religion" ValidationGroup="B"></asp:TextBox>

                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Zodiac Sign 
                                       
                                            <asp:DropDownList ID="ddlzoradicsign" runat="server" class="form-control valid">
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

                                            </asp:DropDownList>

                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlzoradicsign" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Select Zodiac Sign"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-1">
                                                                    Height 
                              
                                    
                                                                </div>

                                                                <div class="col-sm-1.5">
                                                                    Feet 
                                           <div class="form-group">
                                               <asp:DropDownList ID="ddlfeet" runat="server" class="form-control valid">


                                                   <asp:ListItem Value="1">1</asp:ListItem>
                                                   <asp:ListItem Value="2">2</asp:ListItem>
                                                   <asp:ListItem Value="3">3</asp:ListItem>
                                                   <asp:ListItem Value="4">4</asp:ListItem>
                                                   <asp:ListItem Value="5">5</asp:ListItem>
                                                   <asp:ListItem Value="6">6</asp:ListItem>
                                                   <asp:ListItem Value="7">7</asp:ListItem>

                                               </asp:DropDownList>

                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlfeet" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter height"></asp:RequiredFieldValidator>
                                           </div>
                                                                </div>
                                                                <div class="col-sm-1.5">
                                                                    Inch 
                                           <div class="form-group">
                                               <asp:DropDownList ID="ddlinch" runat="server" class="form-control valid">


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
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlinch" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter height"></asp:RequiredFieldValidator>
                                           </div>
                                                                </div>
                                                                <div class="col-sm-1">
                                                                </div>


                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Religion
                                          <asp:DropDownList ID="ddlreligion" runat="server" class="form-control valid" AutoPostBack="true" OnSelectedIndexChanged="ddlreligion_SelectedIndexChanged">
                                              <asp:ListItem Value="0">None</asp:ListItem>
                                          </asp:DropDownList>
                                                                        <asp:HiddenField ID="hfCustomerId" runat="server" />
                                                                        <%--  <span style="font-size: small; color: #ff6a00">* Ex. 75</span>--%>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtweight" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter weight"></asp:RequiredFieldValidator>--%>
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

                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Weight In Kg (optional)
                                            <asp:TextBox ID="txtweight" runat="server" class="form-control valid" name="name" TextMode="Number" type="text" onfocus="this.placeholder = 'Enter weight'" onblur="this.placeholder = 'Enter weight'" placeholder="Enter weight" ValidationGroup="B"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. 75</span>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtweight" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter weight"></asp:RequiredFieldValidator>--%>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Blood Group (optional)
                                            <asp:DropDownList ID="ddlbloodgroup" runat="server" class="form-control valid">
                                                <asp:ListItem Value="0">None</asp:ListItem>
                                                <asp:ListItem Value="A+">A+</asp:ListItem>
                                                <asp:ListItem Value="A-">A-</asp:ListItem>
                                                <asp:ListItem Value="O+">O+</asp:ListItem>
                                                <asp:ListItem Value="O-">O-</asp:ListItem>
                                                <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                                <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                                <asp:ListItem Value="B+">B+</asp:ListItem>
                                                <asp:ListItem Value="B-">B-</asp:ListItem>
                                            </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Skin complaction (optional)
                                            <asp:TextBox ID="txtskincomplaction" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Skin complaction'" onblur="this.placeholder = 'Enter Skin complaction'" placeholder="Enter Skin complaction" ValidationGroup="B"></asp:TextBox>

                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        Maritial Status
                                    <asp:DropDownList ID="ddlmaritialstatus" class="form-control valid" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlmaritialstatus_SelectedIndexChanged">

                                        <asp:ListItem Value="Single">Single</asp:ListItem>
                                        <asp:ListItem Value="Divorce">Divorce</asp:ListItem>
                                        <asp:ListItem Value="Widow">Widow</asp:ListItem>
                                        <asp:ListItem Value="Widower">Widower</asp:ListItem>
                                    </asp:DropDownList>

                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="ddlmaritialstatus" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Select Maritial Status"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group" id="noofchild" runat="server" visible="false">
                                                                        No of Child
                                     <asp:DropDownList ID="ddlnoofchild" runat="server" class="form-control valid">
                                         <asp:ListItem Value="0">0</asp:ListItem>
                                         <asp:ListItem Value="1">1</asp:ListItem>
                                         <asp:ListItem Value="2">2</asp:ListItem>
                                         <asp:ListItem Value="2+">2+</asp:ListItem>

                                     </asp:DropDownList>


                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Known Language (optional)
                                            <asp:TextBox ID="txtlanguageknow" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = ' Enter Known Language '" onblur="this.placeholder = 'Enter Known Language '" placeholder="Enter Known Language" ValidationGroup="B"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. Gujrati, Hindi, English, Marathi</span>
                                                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtlanguageknow" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Language Know"></asp:RequiredFieldValidator>--%>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Hobbies (optional)
                                            <asp:TextBox ID="txtHobbies" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Hobbies'" onblur="this.placeholder = 'Enter Hobbies'" placeholder="Enter Hobbies" ValidationGroup="B"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. Reading, cooking</span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Current Address
                                            <asp:TextBox ID="txtcurrentaddress" runat="server" class="form-control valid" name="name" Rows="2" Columns="2" TextMode="MultiLine" type="text" onfocus="this.placeholder = 'Enter Current Address'" onblur="this.placeholder = 'Enter Current Address'" placeholder="Enter Current Address" ValidationGroup="B"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtcurrentaddress" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Current Address"></asp:RequiredFieldValidator>

                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Nationality (optional)
                                            <asp:TextBox ID="txtNationality" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Nationality'" onblur="this.placeholder = 'Enter Nationality'" placeholder="Enter Nationality" ValidationGroup="B"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. Indian</span>
                                                                        <%--    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtNationality" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Nationality"></asp:RequiredFieldValidator>--%>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        City
                                            <asp:TextBox ID="txtCity" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter City'" onblur="this.placeholder = 'Enter City'" placeholder="Enter City" ValidationGroup="B"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. Valsad</span>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCity" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter City"></asp:RequiredFieldValidator>

                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        State
                                            <asp:TextBox ID="txtState" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter State'" onblur="this.placeholder = 'Enter State'" placeholder="Enter State" ValidationGroup="B"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. Gujrat</span>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtState" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter State"></asp:RequiredFieldValidator>

                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        Country
                                            <asp:TextBox ID="txtCountry" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Country'" onblur="this.placeholder = 'Enter Country'" placeholder="Enter Country" ValidationGroup="B"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. India</span>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCountry" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Country"></asp:RequiredFieldValidator>

                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <%--</div>--%>
                                                </asp:WizardStep>
                                                <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>
                                                            <%--   <div class="content">This is Step 2</div>--%>
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <h2 class="contact-title">Education Details</h2>
                                                                </div>

                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Hightest Education   
                                            <asp:TextBox ID="txtHightestEducation" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter  Hightest Education'" onblur="this.placeholder = 'Enter  Hightest Education'" placeholder="Enter  Hightest Education" ValidationGroup="B"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. Master Of Computer Application (MCA)</span>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtHightestEducation" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter  Hightest Education "></asp:RequiredFieldValidator>

                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        University  (optional)
                                            <asp:TextBox ID="txtUniversity" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter University'" onblur="this.placeholder = 'Enter University'" placeholder="Enter University" ValidationGroup="B"></asp:TextBox>
                                                                        <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtUniversity" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter University"></asp:RequiredFieldValidator>
         --%>  <span style="font-size: small; color: #ff6a00">* Ex. Gujrat University</span>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Year of Passing (optional)
                                            <asp:TextBox ID="txtYearofPassing" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Year of Passing '" onblur="this.placeholder = 'Enter Year of Passing '" placeholder="Enter Year of Passing " ValidationGroup="B"></asp:TextBox>
                                                                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtYearofPassing" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Year of Passing "></asp:RequiredFieldValidator>
         --%><span style="font-size: small; color: #ff6a00">* Ex. March - 2011</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </asp:WizardStep>
                                                <asp:WizardStep ID="WizardStep3" runat="server" Title="Step 3">
                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                        <ContentTemplate>
                                                            <%--<div class="content">This is Step 3</div>--%>
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <h2 class="contact-title">Occupation Details</h2>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Occupation 
                                            <asp:TextBox ID="txtOccupation" runat="server" class="form-control valid" name="name" Text="" type="text" onfocus="this.placeholder = 'Enter Occupation'" onblur="this.placeholder = 'Enter Occupation'" placeholder="Enter Occupation" ValidationGroup="B"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtOccupation" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Occupation"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Occupation in details (optional)
                                            <asp:TextBox ID="txtOccupationindetails" runat="server" class="form-control valid" name="name" TextMode="MultiLine" type="text" onfocus="this.placeholder = 'Enter Occupation in details'" onblur="this.placeholder = 'Enter Occupation in details'" placeholder="Enter Occupation in details" ValidationGroup="B"></asp:TextBox>
                                                                        <%--     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtOccupationindetails" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Description"></asp:RequiredFieldValidator>
         --%>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Monthly Income (optional)
                                            <asp:TextBox ID="txtmonthlyincome" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Monthly Income '" onblur="this.placeholder = 'Enter Monthly Income '" placeholder="Enter Monthly Income " ValidationGroup="B"></asp:TextBox>
                                                                        <%--     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtOccupationindetails" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Description"></asp:RequiredFieldValidator>
         --%>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-3">
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
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </asp:WizardStep>
                                                <asp:WizardStep ID="WizardStep4" runat="server" Title="Step 4">
                                                    <%--<div class="content">This is Step 4</div>--%>
                                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                        <ContentTemplate>
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <h2 class="contact-title">Family Details</h2>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Father Name 
                                            <asp:TextBox ID="txtfathername" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Father Name'" onblur="this.placeholder = 'Enter Father Name'" placeholder="Enter Father Name" ValidationGroup="B"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtfathername" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Father Name "></asp:RequiredFieldValidator>

                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Mother Name 
                                            <asp:TextBox ID="txtmothername" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Mother Name'" onblur="this.placeholder = 'Enter Mother Name'" placeholder="Enter Mother Name" ValidationGroup="B"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtmothername" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Mother Name"></asp:RequiredFieldValidator>

                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Brother  <%--<asp:TextBox ID="txtbrother" runat="server" class="form-control valid" name="name"  type="text" onfocus="this.placeholder = 'Enter Brother'" onblur="this.placeholder = 'Enter Brother'" placeholder="Enter Brother" ValidationGroup="B"></asp:TextBox>--%>
                                                                        <asp:DropDownList ID="ddlbrother" runat="server" class="form-control valid">
                                                                            <asp:ListItem Value="0">0</asp:ListItem>
                                                                            <asp:ListItem Value="1">1</asp:ListItem>
                                                                            <asp:ListItem Value="2">2</asp:ListItem>
                                                                            <asp:ListItem Value="2+">2+</asp:ListItem>

                                                                        </asp:DropDownList>

                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-6">
                                                                    Sister
                                   
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlsister" runat="server" class="form-control valid">
                                                <asp:ListItem Value="0">0</asp:ListItem>
                                                <asp:ListItem Value="1">1</asp:ListItem>
                                                <asp:ListItem Value="2">2</asp:ListItem>
                                                <asp:ListItem Value="2+">2+</asp:ListItem>

                                            </asp:DropDownList>
                                            <%-- <asp:TextBox ID="txtSister" runat="server" class="form-control valid" name="name"  type="text" onfocus="this.placeholder = 'Enter Sister'" onblur="this.placeholder = 'Enter Sister'" placeholder="Enter Sister" ValidationGroup="B"></asp:TextBox>--%>
                                        </div>
                                                                </div>

                                                                <div class="col-sm-12">
                                                                    <div class="form-group">
                                                                        Family Address 
                                            <asp:TextBox ID="txtfamilyaddress" runat="server" TextMode="MultiLine" Rows="2" Columns="2" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Family Address'" onblur="this.placeholder = 'Enter Family Address'" placeholder="Enter Family Address" ValidationGroup="B"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtfamilyaddress" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Family Address"></asp:RequiredFieldValidator>

                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        City
                                            <asp:TextBox ID="txtfamilycity" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter City'" onblur="this.placeholder = 'Enter City'" placeholder="Enter City" ValidationGroup="B"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. Valsad</span>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtfamilycity" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter City"></asp:RequiredFieldValidator>

                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        State
                                            <asp:TextBox ID="txtfamilystate" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter State'" onblur="this.placeholder = 'Enter State'" placeholder="Enter State" ValidationGroup="B"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. Gujrat</span>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtfamilystate" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter State"></asp:RequiredFieldValidator>

                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-3">
                                                                    <div class="form-group">
                                                                        Country
                                            <asp:TextBox ID="txtfamilycountry" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Country'" onblur="this.placeholder = 'Enter Country'" placeholder="Enter Country" ValidationGroup="B"></asp:TextBox>
                                                                        <span style="font-size: small; color: #ff6a00">* Ex. India</span>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtfamilycountry" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Country"></asp:RequiredFieldValidator>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </asp:WizardStep>
                                                <asp:WizardStep ID="WizardStep5" runat="server" Title="Step 5">
                                                    <%-- <div class="content">This is Step 5</div>--%>
                                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                                        <ContentTemplate>
                                                            <div class="row">
                                                                <div class="col-sm-12">
                                                                    <h2 class="contact-title">Contact Details</h2>
                                                                </div>
                                                                <%--<div class="col-6">
                                    <div class="form-group">
                                    Landline Number   <asp:TextBox ID="txtMobile1" runat="server" class="form-control valid" name="name"  type="text" onfocus="this.placeholder = 'Enter Home Mobile 1'" onblur="this.placeholder = 'Enter Home Mobile 1'" placeholder="Enter Home Mobile 1" ValidationGroup="B"></asp:TextBox>
                          
                                    </div>
                                </div>--%>


                                                                <div class="col-sm-3">
                                                                    Contrycode
                                       
                                        <asp:DropDownList ID="ddlcountrycode1" runat="server" class="form-control valid">
                                            <asp:ListItem Value="0">None</asp:ListItem>
                                            <asp:ListItem Value="93">Afghanistan (+93)</asp:ListItem>
                                            <asp:ListItem Value="355">Albania (+355)</asp:ListItem>
                                            <asp:ListItem Value="213">Algeria (+213)</asp:ListItem>
                                            <asp:ListItem Value="684">American Samoa (+684)</asp:ListItem>
                                            <asp:ListItem Value="376">Andorra (+376)</asp:ListItem>
                                            <asp:ListItem Value="244">Angola (+244)</asp:ListItem>
                                            <asp:ListItem Value="264">Anguilla (+264)</asp:ListItem>
                                            <asp:ListItem Value="672">Antarctica (Casey) (+672)</asp:ListItem>
                                            <asp:ListItem Value="672">Antarctica (Scott) (+672)</asp:ListItem>
                                            <asp:ListItem Value="268">Antigua (+268)</asp:ListItem>
                                            <asp:ListItem Value="54">Argentina (+54)</asp:ListItem>
                                            <asp:ListItem Value="374">Armenia (+374)</asp:ListItem>
                                            <asp:ListItem Value="297">Aruba (+297)</asp:ListItem>
                                            <asp:ListItem Value="247">Ascension Islands (+247)</asp:ListItem>
                                            <asp:ListItem Value="0">Atlantic Ocean (+0)</asp:ListItem>
                                            <asp:ListItem Value="61">Australia (+61)</asp:ListItem>
                                            <asp:ListItem Value="0">Australia Territory (+0)</asp:ListItem>
                                            <asp:ListItem Value="43">Austria (+43)</asp:ListItem>
                                            <asp:ListItem Value="994">Azerbaijan (+994)</asp:ListItem>
                                            <asp:ListItem Value="242">Bahamas (+242)</asp:ListItem>
                                            <asp:ListItem Value="973">Bahrain (+973)</asp:ListItem>
                                            <asp:ListItem Value="880">Bangladesh (+880)</asp:ListItem>
                                            <asp:ListItem Value="246">Barbados (+246)</asp:ListItem>
                                            <asp:ListItem Value="268">Barbuda (+268)</asp:ListItem>
                                            <asp:ListItem Value="375">Belarus (+375)</asp:ListItem>
                                            <asp:ListItem Value="32">Belgium (+32)</asp:ListItem>
                                            <asp:ListItem Value="501">Belize (+501)</asp:ListItem>
                                            <asp:ListItem Value="229">Benin (+229)</asp:ListItem>
                                            <asp:ListItem Value="441">Bermuda (+441)</asp:ListItem>
                                            <asp:ListItem Value="975">Bhutan (+975)</asp:ListItem>
                                            <asp:ListItem Value="591">Bolivia (+591)</asp:ListItem>
                                            <asp:ListItem Value="387">Bosnia Herzegovina (+387)</asp:ListItem>
                                            <asp:ListItem Value="267">Botswana (+267)</asp:ListItem>
                                            <asp:ListItem Value="55">Brazil (+55)</asp:ListItem>
                                            <asp:ListItem Value="284">British Virgin Islands (+284)</asp:ListItem>
                                            <asp:ListItem Value="673">Brunei (+673)</asp:ListItem>
                                            <asp:ListItem Value="359">Bulgaria (+359)</asp:ListItem>
                                            <asp:ListItem Value="226">Burkina Faso (+226)</asp:ListItem>
                                            <asp:ListItem Value="257">Burundi (+257)</asp:ListItem>
                                            <asp:ListItem Value="855">Cambodia (+855)</asp:ListItem>
                                            <asp:ListItem Value="237">Cameroon (+237)</asp:ListItem>
                                            <asp:ListItem Value="1">Canada (+1)</asp:ListItem>
                                            <asp:ListItem Value="238">Cape Verde Island (+238)</asp:ListItem>
                                            <asp:ListItem Value="345">Cayman Island (+345)</asp:ListItem>
                                            <asp:ListItem Value="236">Central Africa Republic (+236)</asp:ListItem>
                                            <asp:ListItem Value="235">Chad Republic (+235)</asp:ListItem>
                                            <asp:ListItem Value="56">Chile (+56)</asp:ListItem>
                                            <asp:ListItem Value="86">China (+86)</asp:ListItem>
                                            <asp:ListItem Value="61">Christmas/Cocos (+61)</asp:ListItem>
                                            <asp:ListItem Value="57">Colombia (+57)</asp:ListItem>
                                            <asp:ListItem Value="269">Comoros (+269)</asp:ListItem>
                                            <asp:ListItem Value="242">Congo (+242)</asp:ListItem>
                                            <asp:ListItem Value="682">Cook Island (+682)</asp:ListItem>
                                            <asp:ListItem Value="506">Costa Rica (+506)</asp:ListItem>
                                            <asp:ListItem Value="385">Croatia (+385)</asp:ListItem>
                                            <asp:ListItem Value="53">Cuba (+53)</asp:ListItem>
                                            <asp:ListItem Value="599">Curacao (+599)</asp:ListItem>
                                            <asp:ListItem Value="357">Cyprus (+357)</asp:ListItem>
                                            <asp:ListItem Value="420">Czech Republic (+420)</asp:ListItem>
                                            <asp:ListItem Value="243">Dem. Rep. of Congo (+243)</asp:ListItem>
                                            <asp:ListItem Value="45">Denmark (+45)</asp:ListItem>
                                            <asp:ListItem Value="246">Diego Garcia (+246)</asp:ListItem>
                                            <asp:ListItem Value="253">Djibouti (+253)</asp:ListItem>
                                            <asp:ListItem Value="767">Dominica (+767)</asp:ListItem>
                                            <asp:ListItem Value="809">Dominican Republic (+809)</asp:ListItem>
                                            <asp:ListItem Value="670">East Timor (+670)</asp:ListItem>
                                            <asp:ListItem Value="56">Easter Island (+56)</asp:ListItem>
                                            <asp:ListItem Value="593">Ecuador (+593)</asp:ListItem>
                                            <asp:ListItem Value="20">Egypt (+20)</asp:ListItem>
                                            <asp:ListItem Value="503">El Salvador (+503)</asp:ListItem>
                                            <asp:ListItem Value="240">Equatorial Guinea (+240)</asp:ListItem>
                                            <asp:ListItem Value="291">Eritrea (+291)</asp:ListItem>
                                            <asp:ListItem Value="372">Estonia (+372)</asp:ListItem>
                                            <asp:ListItem Value="251">Ethiopia (+251)</asp:ListItem>
                                            <asp:ListItem Value="298">Faeroe Islands (+298)</asp:ListItem>
                                            <asp:ListItem Value="679">Fiji Islands (+679)</asp:ListItem>
                                            <asp:ListItem Value="358">Finland (+358)</asp:ListItem>
                                            <asp:ListItem Value="33">France (+33)</asp:ListItem>
                                            <asp:ListItem Value="596">French Antilles (+596)</asp:ListItem>
                                            <asp:ListItem Value="594">French Guiana (+594)</asp:ListItem>
                                            <asp:ListItem Value="689">French Polynesia (+689)</asp:ListItem>
                                            <asp:ListItem Value="241">Gabon (+241)</asp:ListItem>
                                            <asp:ListItem Value="220">Gambia (+220)</asp:ListItem>
                                            <asp:ListItem Value="995">Georgia (+995)</asp:ListItem>
                                            <asp:ListItem Value="49">Germany (+49)</asp:ListItem>
                                            <asp:ListItem Value="233">Ghana (+233)</asp:ListItem>
                                            <asp:ListItem Value="350">Gibraltar (+350)</asp:ListItem>
                                            <asp:ListItem Value="881">Global Mobile Satellite System (GMSS) (+881)</asp:ListItem>
                                            <asp:ListItem Value="30">Greece (+30)</asp:ListItem>
                                            <asp:ListItem Value="299">Greenland (+299)</asp:ListItem>
                                            <asp:ListItem Value="473">Grenada (+473)</asp:ListItem>
                                            <asp:ListItem Value="590">Guadeloupe (+590)</asp:ListItem>
                                            <asp:ListItem Value="671">Guam (+671)</asp:ListItem>
                                            <asp:ListItem Value="502">Guatemala (+502)</asp:ListItem>
                                            <asp:ListItem Value="224">Guinea (+224)</asp:ListItem>
                                            <asp:ListItem Value="592">Guyana (+592)</asp:ListItem>
                                            <asp:ListItem Value="509">Haiti (+509)</asp:ListItem>
                                            <asp:ListItem Value="504">Honduras (+504)</asp:ListItem>
                                            <asp:ListItem Value="852">Hong Kong (+852)</asp:ListItem>
                                            <asp:ListItem Value="36">Hungary (+36)</asp:ListItem>
                                            <asp:ListItem Value="354">Iceland (+354)</asp:ListItem>
                                            <asp:ListItem Value="91">India (+91)</asp:ListItem>
                                            <asp:ListItem Value="0">Indian Ocean (+0)</asp:ListItem>
                                            <asp:ListItem Value="62">Indonesia (+62)</asp:ListItem>
                                            <asp:ListItem Value="871">Inmarsat (Atlantic Ocean - East) (+871)</asp:ListItem>
                                            <asp:ListItem Value="874">Inmarsat (Atlantic Ocean - West) (+874)</asp:ListItem>
                                            <asp:ListItem Value="873">Inmarsat (Indian Ocean) (+873)</asp:ListItem>
                                            <asp:ListItem Value="872">Inmarsat (Pacific Ocean) (+872)</asp:ListItem>
                                            <asp:ListItem Value="870">Inmarsat SNAC (+870)</asp:ListItem>
                                            <asp:ListItem Value="98">Iran (+98)</asp:ListItem>
                                            <asp:ListItem Value="964">Iraq (+964)</asp:ListItem>
                                            <asp:ListItem Value="353">Ireland (+353)</asp:ListItem>
                                            <asp:ListItem Value="8817">Iridium (Mobile Satellite service) (+8817)</asp:ListItem>
                                            <asp:ListItem Value="972">Israel (+972)</asp:ListItem>
                                            <asp:ListItem Value="39">Italy (+39)</asp:ListItem>
                                            <asp:ListItem Value="225">Ivory Coast (+225)</asp:ListItem>
                                            <asp:ListItem Value="876">Jamaica (+876)</asp:ListItem>
                                            <asp:ListItem Value="81">Japan (+81)</asp:ListItem>
                                            <asp:ListItem Value="962">Jordan (+962)</asp:ListItem>
                                            <asp:ListItem Value="7">Kazakhstan (+7)</asp:ListItem>
                                            <asp:ListItem Value="254">Kenya (+254)</asp:ListItem>
                                            <asp:ListItem Value="686">Kiribati (+686)</asp:ListItem>
                                            <asp:ListItem Value="7">Kirighzia (+7)</asp:ListItem>
                                            <asp:ListItem Value="965">Kuwait (+965)</asp:ListItem>
                                            <asp:ListItem Value="996">Kyrgyz Republic (+996)</asp:ListItem>
                                            <asp:ListItem Value="7">Kyrgyzstan (+7)</asp:ListItem>
                                            <asp:ListItem Value="856">Laos (+856)</asp:ListItem>
                                            <asp:ListItem Value="371">Latvia (+371)</asp:ListItem>
                                            <asp:ListItem Value="961">Lebanon (+961)</asp:ListItem>
                                            <asp:ListItem Value="266">Lesotho (+266)</asp:ListItem>
                                            <asp:ListItem Value="231">Liberia (+231)</asp:ListItem>
                                            <asp:ListItem Value="218">Libya (+218)</asp:ListItem>
                                            <asp:ListItem Value="423">Liechtenstein (+423)</asp:ListItem>
                                            <asp:ListItem Value="370">Lithuania (+370)</asp:ListItem>
                                            <asp:ListItem Value="352">Luxembourg (+352)</asp:ListItem>
                                            <asp:ListItem Value="853">Macao (+853)</asp:ListItem>
                                            <asp:ListItem Value="389">Macedonia (+389)</asp:ListItem>
                                            <asp:ListItem Value="261">Madagascar (+261)</asp:ListItem>
                                            <asp:ListItem Value="265">Malawi (+265)</asp:ListItem>
                                            <asp:ListItem Value="60">Malaysia (+60)</asp:ListItem>
                                            <asp:ListItem Value="960">Maldives (+960)</asp:ListItem>
                                            <asp:ListItem Value="223">Mali Republic (+223)</asp:ListItem>
                                            <asp:ListItem Value="356">Malta (+356)</asp:ListItem>
                                            <asp:ListItem Value="692">Marshall Islands (+692)</asp:ListItem>
                                            <asp:ListItem Value="596">Martinique (+596)</asp:ListItem>
                                            <asp:ListItem Value="222">Mauritania (+222)</asp:ListItem>
                                            <asp:ListItem Value="230">Mauritius (+230)</asp:ListItem>
                                            <asp:ListItem Value="269">Mayotte Island (+269)</asp:ListItem>
                                            <asp:ListItem Value="521">Mexico Band 1 (+521)</asp:ListItem>
                                            <asp:ListItem Value="522">Mexico Band 2 (+522)</asp:ListItem>
                                            <asp:ListItem Value="523">Mexico Band 3 (+523)</asp:ListItem>
                                            <asp:ListItem Value="524">Mexico Band 4 (+524)</asp:ListItem>
                                            <asp:ListItem Value="525">Mexico Band 5 (+525)</asp:ListItem>
                                            <asp:ListItem Value="526">Mexico Band 6 (+526)</asp:ListItem>
                                            <asp:ListItem Value="527">Mexico Band 7 (+527)</asp:ListItem>
                                            <asp:ListItem Value="528">Mexico Band 8 (+528)</asp:ListItem>
                                            <asp:ListItem Value="691">Micronesia (+691)</asp:ListItem>
                                            <asp:ListItem Value="808">Midway Island (+808)</asp:ListItem>
                                            <asp:ListItem Value="373">Moldova (+373)</asp:ListItem>
                                            <asp:ListItem Value="377">Monaco (+377)</asp:ListItem>
                                            <asp:ListItem Value="976">Mongolia (+976)</asp:ListItem>
                                            <asp:ListItem Value="664">Montserrat (+664)</asp:ListItem>
                                            <asp:ListItem Value="212">Morocco (+212)</asp:ListItem>
                                            <asp:ListItem Value="258">Mozambique (+258)</asp:ListItem>
                                            <asp:ListItem Value="95">Myanmar (Burma) (+95)</asp:ListItem>
                                            <asp:ListItem Value="264">Namibia (+264)</asp:ListItem>
                                            <asp:ListItem Value="674">Nauru (+674)</asp:ListItem>
                                            <asp:ListItem Value="977">Nepal (+977)</asp:ListItem>
                                            <asp:ListItem Value="31">Netherlands (+31)</asp:ListItem>
                                            <asp:ListItem Value="599">Netherlands Antilles (+599)</asp:ListItem>
                                            <asp:ListItem Value="869">Nevis Island (+869)</asp:ListItem>
                                            <asp:ListItem Value="687">New Caledonia (+687)</asp:ListItem>
                                            <asp:ListItem Value="64">New Zealand (+64)</asp:ListItem>
                                            <asp:ListItem Value="505">Nicaragua (+505)</asp:ListItem>
                                            <asp:ListItem Value="227">Niger (+227)</asp:ListItem>
                                            <asp:ListItem Value="234">Nigeria (+234)</asp:ListItem>
                                            <asp:ListItem Value="683">Niue Island (+683)</asp:ListItem>
                                            <asp:ListItem Value="672">Norfolk Island (+672)</asp:ListItem>
                                            <asp:ListItem Value="850">North Korea (+850)</asp:ListItem>
                                            <asp:ListItem Value="670">Northern Marianas Islands (Saipan, Rota, & Tinian) (+670)</asp:ListItem>
                                            <asp:ListItem Value="47">Norway (+47)</asp:ListItem>
                                            <asp:ListItem Value="968">Oman (+968)</asp:ListItem>
                                            <asp:ListItem Value="92">Pakistan (+92)</asp:ListItem>
                                            <asp:ListItem Value="680">Palau (+680)</asp:ListItem>
                                            <asp:ListItem Value="970">Palestine (+970)</asp:ListItem>
                                            <asp:ListItem Value="809">Palm Island (+809)</asp:ListItem>
                                            <asp:ListItem Value="507">Panama (+507)</asp:ListItem>
                                            <asp:ListItem Value="675">Papau New Guinea (+675)</asp:ListItem>
                                            <asp:ListItem Value="595">Paraguay (+595)</asp:ListItem>
                                            <asp:ListItem Value="51">Peru (+51)</asp:ListItem>
                                            <asp:ListItem Value="63">Philippines (+63)</asp:ListItem>
                                            <asp:ListItem Value="48">Poland (+48)</asp:ListItem>
                                            <asp:ListItem Value="351">Portugal (+351)</asp:ListItem>
                                            <asp:ListItem Value="239">Principe (+239)</asp:ListItem>
                                            <asp:ListItem Value="974">Qatar (+974)</asp:ListItem>
                                            <asp:ListItem Value="262">Reunion Island (+262)</asp:ListItem>
                                            <asp:ListItem Value="40">Romania (+40)</asp:ListItem>
                                            <asp:ListItem Value="7">Russia (+7)</asp:ListItem>
                                            <asp:ListItem Value="250">Rwanda (+250)</asp:ListItem>
                                            <asp:ListItem Value="7">Sakhalin (+7)</asp:ListItem>
                                            <asp:ListItem Value="378">San Marino (+378)</asp:ListItem>
                                            <asp:ListItem Value="239">Sao Tome (+239)</asp:ListItem>
                                            <asp:ListItem Value="966">Saudi Arabia (+966)</asp:ListItem>
                                            <asp:ListItem Value="221">Senegal Republic (+221)</asp:ListItem>
                                            <asp:ListItem Value="381">Serbia (+381)</asp:ListItem>
                                            <asp:ListItem Value="248">Seychelles (+248)</asp:ListItem>
                                            <asp:ListItem Value="232">Sierra Leone (+232)</asp:ListItem>
                                            <asp:ListItem Value="65">Singapore (+65)</asp:ListItem>
                                            <asp:ListItem Value="421">Slovakia (+421)</asp:ListItem>
                                            <asp:ListItem Value="386">Slovenia (+386)</asp:ListItem>
                                            <asp:ListItem Value="677">Solomon Islands (+677)</asp:ListItem>
                                            <asp:ListItem Value="252">Somalia (+252)</asp:ListItem>
                                            <asp:ListItem Value="27">South Africa (+27)</asp:ListItem>
                                            <asp:ListItem Value="82">South Korea (+82)</asp:ListItem>
                                            <asp:ListItem Value="34">Spain (+34)</asp:ListItem>
                                            <asp:ListItem Value="94">Sri Lanka (+94)</asp:ListItem>
                                            <asp:ListItem Value="290">St. Helena (+290)</asp:ListItem>
                                            <asp:ListItem Value="869">St. Kitts (+869)</asp:ListItem>
                                            <asp:ListItem Value="758">St. Lucia (+758)</asp:ListItem>
                                            <asp:ListItem Value="508">St. Pierre & Miquelon (+508)</asp:ListItem>
                                            <asp:ListItem Value="784">St. Vincent & Grenadines (+784)</asp:ListItem>
                                            <asp:ListItem Value="249">Sudan (+249)</asp:ListItem>
                                            <asp:ListItem Value="597">Suriname (+597)</asp:ListItem>
                                            <asp:ListItem Value="268">Swaziland (+268)</asp:ListItem>
                                            <asp:ListItem Value="46">Sweden (+46)</asp:ListItem>
                                            <asp:ListItem Value="41">Switzerland (+41)</asp:ListItem>
                                            <asp:ListItem Value="963">Syria (+963)</asp:ListItem>
                                            <asp:ListItem Value="886">Taiwan (+886)</asp:ListItem>
                                            <asp:ListItem Value="992">Tajikistan (+992)</asp:ListItem>
                                            <asp:ListItem Value="255">Tanzania (+255)</asp:ListItem>
                                            <asp:ListItem Value="66">Thailand (+66)</asp:ListItem>
                                            <asp:ListItem Value="228">Togo (+228)</asp:ListItem>
                                            <asp:ListItem Value="690">Tokelau (+690)</asp:ListItem>
                                            <asp:ListItem Value="676">Tonga (+676)</asp:ListItem>
                                            <asp:ListItem Value="868">Trinidad/Tobago (+868)</asp:ListItem>
                                            <asp:ListItem Value="216">Tunisia (+216)</asp:ListItem>
                                            <asp:ListItem Value="90">Turkey (+90)</asp:ListItem>
                                            <asp:ListItem Value="993">Turkmenistan (+993)</asp:ListItem>
                                            <asp:ListItem Value="649">Turks/Caicos (+649)</asp:ListItem>
                                            <asp:ListItem Value="688">Tuvalu Islands (+688)</asp:ListItem>
                                            <asp:ListItem Value="256">Uganda (+256)</asp:ListItem>
                                            <asp:ListItem Value="380">Ukraine (+380)</asp:ListItem>
                                            <asp:ListItem Value="971">United Arab Emirates (+971)</asp:ListItem>
                                            <asp:ListItem Value="44">United Kingdom (+44)</asp:ListItem>
                                            <asp:ListItem Value="878">Universal Personal Telecommunications (UPT) (+878)</asp:ListItem>
                                            <asp:ListItem Value="598">Uruguay (+598)</asp:ListItem>
                                            <asp:ListItem Value="340">US Virgin Islands (+340)</asp:ListItem>
                                            <asp:ListItem Value="1">USA (+1)</asp:ListItem>
                                            <asp:ListItem Value="998">Uzbekistan (+998)</asp:ListItem>
                                            <asp:ListItem Value="678">Vanuatu (+678)</asp:ListItem>
                                            <asp:ListItem Value="39">Vatican City (+39)</asp:ListItem>
                                            <asp:ListItem Value="58">Venezuela (+58)</asp:ListItem>
                                            <asp:ListItem Value="84">Vietnam (+84)</asp:ListItem>
                                            <asp:ListItem Value="808">Wake Island (+808)</asp:ListItem>
                                            <asp:ListItem Value="685">West Samoa (+685)</asp:ListItem>
                                            <asp:ListItem Value="967">Yemen Arab Rep. (+967)</asp:ListItem>
                                            <asp:ListItem Value="381">Yugoslavia (+381)</asp:ListItem>
                                            <asp:ListItem Value="260">Zambia (+260)</asp:ListItem>
                                            <asp:ListItem Value="255">Zanzibar (+255)</asp:ListItem>
                                            <asp:ListItem Value="263">Zimbabwe (+263)</asp:ListItem>
                                        </asp:DropDownList>

                                                                </div>
                                                                <div class="col-sm-3">
                                                                    Mobile 1
                                       
                                        <asp:TextBox ID="txtMobile1" runat="server" TextMode="Number" MaxLength="10" onkeypress="return this.value.length<10" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Mobile Number'" onblur="this.placeholder = 'Enter Mobile Number'" placeholder="Enter Mobile Number" ValidationGroup="B"></asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="revMobNo" runat="server" ErrorMessage="Invalid Mobile Number" ValidationExpression="^([0-9]{10})$" ControlToValidate="txtMobile1" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtMobile1" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Mobile Number"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <div class="col-sm-3">
                                                                    Contrycode(optional)
                   
                                        <asp:DropDownList ID="ddlcountrycode2" runat="server" class="form-control valid">
                                            <asp:ListItem Value="0">None</asp:ListItem>
                                            <asp:ListItem Value="93">Afghanistan (+93)</asp:ListItem>
                                            <asp:ListItem Value="355">Albania (+355)</asp:ListItem>
                                            <asp:ListItem Value="213">Algeria (+213)</asp:ListItem>
                                            <asp:ListItem Value="684">American Samoa (+684)</asp:ListItem>
                                            <asp:ListItem Value="376">Andorra (+376)</asp:ListItem>
                                            <asp:ListItem Value="244">Angola (+244)</asp:ListItem>
                                            <asp:ListItem Value="264">Anguilla (+264)</asp:ListItem>
                                            <asp:ListItem Value="672">Antarctica (Casey) (+672)</asp:ListItem>
                                            <asp:ListItem Value="672">Antarctica (Scott) (+672)</asp:ListItem>
                                            <asp:ListItem Value="268">Antigua (+268)</asp:ListItem>
                                            <asp:ListItem Value="54">Argentina (+54)</asp:ListItem>
                                            <asp:ListItem Value="374">Armenia (+374)</asp:ListItem>
                                            <asp:ListItem Value="297">Aruba (+297)</asp:ListItem>
                                            <asp:ListItem Value="247">Ascension Islands (+247)</asp:ListItem>
                                            <asp:ListItem Value="0">Atlantic Ocean (+0)</asp:ListItem>
                                            <asp:ListItem Value="61">Australia (+61)</asp:ListItem>
                                            <asp:ListItem Value="0">Australia Territory (+0)</asp:ListItem>
                                            <asp:ListItem Value="43">Austria (+43)</asp:ListItem>
                                            <asp:ListItem Value="994">Azerbaijan (+994)</asp:ListItem>
                                            <asp:ListItem Value="242">Bahamas (+242)</asp:ListItem>
                                            <asp:ListItem Value="973">Bahrain (+973)</asp:ListItem>
                                            <asp:ListItem Value="880">Bangladesh (+880)</asp:ListItem>
                                            <asp:ListItem Value="246">Barbados (+246)</asp:ListItem>
                                            <asp:ListItem Value="268">Barbuda (+268)</asp:ListItem>
                                            <asp:ListItem Value="375">Belarus (+375)</asp:ListItem>
                                            <asp:ListItem Value="32">Belgium (+32)</asp:ListItem>
                                            <asp:ListItem Value="501">Belize (+501)</asp:ListItem>
                                            <asp:ListItem Value="229">Benin (+229)</asp:ListItem>
                                            <asp:ListItem Value="441">Bermuda (+441)</asp:ListItem>
                                            <asp:ListItem Value="975">Bhutan (+975)</asp:ListItem>
                                            <asp:ListItem Value="591">Bolivia (+591)</asp:ListItem>
                                            <asp:ListItem Value="387">Bosnia Herzegovina (+387)</asp:ListItem>
                                            <asp:ListItem Value="267">Botswana (+267)</asp:ListItem>
                                            <asp:ListItem Value="55">Brazil (+55)</asp:ListItem>
                                            <asp:ListItem Value="284">British Virgin Islands (+284)</asp:ListItem>
                                            <asp:ListItem Value="673">Brunei (+673)</asp:ListItem>
                                            <asp:ListItem Value="359">Bulgaria (+359)</asp:ListItem>
                                            <asp:ListItem Value="226">Burkina Faso (+226)</asp:ListItem>
                                            <asp:ListItem Value="257">Burundi (+257)</asp:ListItem>
                                            <asp:ListItem Value="855">Cambodia (+855)</asp:ListItem>
                                            <asp:ListItem Value="237">Cameroon (+237)</asp:ListItem>
                                            <asp:ListItem Value="1">Canada (+1)</asp:ListItem>
                                            <asp:ListItem Value="238">Cape Verde Island (+238)</asp:ListItem>
                                            <asp:ListItem Value="345">Cayman Island (+345)</asp:ListItem>
                                            <asp:ListItem Value="236">Central Africa Republic (+236)</asp:ListItem>
                                            <asp:ListItem Value="235">Chad Republic (+235)</asp:ListItem>
                                            <asp:ListItem Value="56">Chile (+56)</asp:ListItem>
                                            <asp:ListItem Value="86">China (+86)</asp:ListItem>
                                            <asp:ListItem Value="61">Christmas/Cocos (+61)</asp:ListItem>
                                            <asp:ListItem Value="57">Colombia (+57)</asp:ListItem>
                                            <asp:ListItem Value="269">Comoros (+269)</asp:ListItem>
                                            <asp:ListItem Value="242">Congo (+242)</asp:ListItem>
                                            <asp:ListItem Value="682">Cook Island (+682)</asp:ListItem>
                                            <asp:ListItem Value="506">Costa Rica (+506)</asp:ListItem>
                                            <asp:ListItem Value="385">Croatia (+385)</asp:ListItem>
                                            <asp:ListItem Value="53">Cuba (+53)</asp:ListItem>
                                            <asp:ListItem Value="599">Curacao (+599)</asp:ListItem>
                                            <asp:ListItem Value="357">Cyprus (+357)</asp:ListItem>
                                            <asp:ListItem Value="420">Czech Republic (+420)</asp:ListItem>
                                            <asp:ListItem Value="243">Dem. Rep. of Congo (+243)</asp:ListItem>
                                            <asp:ListItem Value="45">Denmark (+45)</asp:ListItem>
                                            <asp:ListItem Value="246">Diego Garcia (+246)</asp:ListItem>
                                            <asp:ListItem Value="253">Djibouti (+253)</asp:ListItem>
                                            <asp:ListItem Value="767">Dominica (+767)</asp:ListItem>
                                            <asp:ListItem Value="809">Dominican Republic (+809)</asp:ListItem>
                                            <asp:ListItem Value="670">East Timor (+670)</asp:ListItem>
                                            <asp:ListItem Value="56">Easter Island (+56)</asp:ListItem>
                                            <asp:ListItem Value="593">Ecuador (+593)</asp:ListItem>
                                            <asp:ListItem Value="20">Egypt (+20)</asp:ListItem>
                                            <asp:ListItem Value="503">El Salvador (+503)</asp:ListItem>
                                            <asp:ListItem Value="240">Equatorial Guinea (+240)</asp:ListItem>
                                            <asp:ListItem Value="291">Eritrea (+291)</asp:ListItem>
                                            <asp:ListItem Value="372">Estonia (+372)</asp:ListItem>
                                            <asp:ListItem Value="251">Ethiopia (+251)</asp:ListItem>
                                            <asp:ListItem Value="298">Faeroe Islands (+298)</asp:ListItem>
                                            <asp:ListItem Value="679">Fiji Islands (+679)</asp:ListItem>
                                            <asp:ListItem Value="358">Finland (+358)</asp:ListItem>
                                            <asp:ListItem Value="33">France (+33)</asp:ListItem>
                                            <asp:ListItem Value="596">French Antilles (+596)</asp:ListItem>
                                            <asp:ListItem Value="594">French Guiana (+594)</asp:ListItem>
                                            <asp:ListItem Value="689">French Polynesia (+689)</asp:ListItem>
                                            <asp:ListItem Value="241">Gabon (+241)</asp:ListItem>
                                            <asp:ListItem Value="220">Gambia (+220)</asp:ListItem>
                                            <asp:ListItem Value="995">Georgia (+995)</asp:ListItem>
                                            <asp:ListItem Value="49">Germany (+49)</asp:ListItem>
                                            <asp:ListItem Value="233">Ghana (+233)</asp:ListItem>
                                            <asp:ListItem Value="350">Gibraltar (+350)</asp:ListItem>
                                            <asp:ListItem Value="881">Global Mobile Satellite System (GMSS) (+881)</asp:ListItem>
                                            <asp:ListItem Value="30">Greece (+30)</asp:ListItem>
                                            <asp:ListItem Value="299">Greenland (+299)</asp:ListItem>
                                            <asp:ListItem Value="473">Grenada (+473)</asp:ListItem>
                                            <asp:ListItem Value="590">Guadeloupe (+590)</asp:ListItem>
                                            <asp:ListItem Value="671">Guam (+671)</asp:ListItem>
                                            <asp:ListItem Value="502">Guatemala (+502)</asp:ListItem>
                                            <asp:ListItem Value="224">Guinea (+224)</asp:ListItem>
                                            <asp:ListItem Value="592">Guyana (+592)</asp:ListItem>
                                            <asp:ListItem Value="509">Haiti (+509)</asp:ListItem>
                                            <asp:ListItem Value="504">Honduras (+504)</asp:ListItem>
                                            <asp:ListItem Value="852">Hong Kong (+852)</asp:ListItem>
                                            <asp:ListItem Value="36">Hungary (+36)</asp:ListItem>
                                            <asp:ListItem Value="354">Iceland (+354)</asp:ListItem>
                                            <asp:ListItem Value="91">India (+91)</asp:ListItem>
                                            <asp:ListItem Value="0">Indian Ocean (+0)</asp:ListItem>
                                            <asp:ListItem Value="62">Indonesia (+62)</asp:ListItem>
                                            <asp:ListItem Value="871">Inmarsat (Atlantic Ocean - East) (+871)</asp:ListItem>
                                            <asp:ListItem Value="874">Inmarsat (Atlantic Ocean - West) (+874)</asp:ListItem>
                                            <asp:ListItem Value="873">Inmarsat (Indian Ocean) (+873)</asp:ListItem>
                                            <asp:ListItem Value="872">Inmarsat (Pacific Ocean) (+872)</asp:ListItem>
                                            <asp:ListItem Value="870">Inmarsat SNAC (+870)</asp:ListItem>
                                            <asp:ListItem Value="98">Iran (+98)</asp:ListItem>
                                            <asp:ListItem Value="964">Iraq (+964)</asp:ListItem>
                                            <asp:ListItem Value="353">Ireland (+353)</asp:ListItem>
                                            <asp:ListItem Value="8817">Iridium (Mobile Satellite service) (+8817)</asp:ListItem>
                                            <asp:ListItem Value="972">Israel (+972)</asp:ListItem>
                                            <asp:ListItem Value="39">Italy (+39)</asp:ListItem>
                                            <asp:ListItem Value="225">Ivory Coast (+225)</asp:ListItem>
                                            <asp:ListItem Value="876">Jamaica (+876)</asp:ListItem>
                                            <asp:ListItem Value="81">Japan (+81)</asp:ListItem>
                                            <asp:ListItem Value="962">Jordan (+962)</asp:ListItem>
                                            <asp:ListItem Value="7">Kazakhstan (+7)</asp:ListItem>
                                            <asp:ListItem Value="254">Kenya (+254)</asp:ListItem>
                                            <asp:ListItem Value="686">Kiribati (+686)</asp:ListItem>
                                            <asp:ListItem Value="7">Kirighzia (+7)</asp:ListItem>
                                            <asp:ListItem Value="965">Kuwait (+965)</asp:ListItem>
                                            <asp:ListItem Value="996">Kyrgyz Republic (+996)</asp:ListItem>
                                            <asp:ListItem Value="7">Kyrgyzstan (+7)</asp:ListItem>
                                            <asp:ListItem Value="856">Laos (+856)</asp:ListItem>
                                            <asp:ListItem Value="371">Latvia (+371)</asp:ListItem>
                                            <asp:ListItem Value="961">Lebanon (+961)</asp:ListItem>
                                            <asp:ListItem Value="266">Lesotho (+266)</asp:ListItem>
                                            <asp:ListItem Value="231">Liberia (+231)</asp:ListItem>
                                            <asp:ListItem Value="218">Libya (+218)</asp:ListItem>
                                            <asp:ListItem Value="423">Liechtenstein (+423)</asp:ListItem>
                                            <asp:ListItem Value="370">Lithuania (+370)</asp:ListItem>
                                            <asp:ListItem Value="352">Luxembourg (+352)</asp:ListItem>
                                            <asp:ListItem Value="853">Macao (+853)</asp:ListItem>
                                            <asp:ListItem Value="389">Macedonia (+389)</asp:ListItem>
                                            <asp:ListItem Value="261">Madagascar (+261)</asp:ListItem>
                                            <asp:ListItem Value="265">Malawi (+265)</asp:ListItem>
                                            <asp:ListItem Value="60">Malaysia (+60)</asp:ListItem>
                                            <asp:ListItem Value="960">Maldives (+960)</asp:ListItem>
                                            <asp:ListItem Value="223">Mali Republic (+223)</asp:ListItem>
                                            <asp:ListItem Value="356">Malta (+356)</asp:ListItem>
                                            <asp:ListItem Value="692">Marshall Islands (+692)</asp:ListItem>
                                            <asp:ListItem Value="596">Martinique (+596)</asp:ListItem>
                                            <asp:ListItem Value="222">Mauritania (+222)</asp:ListItem>
                                            <asp:ListItem Value="230">Mauritius (+230)</asp:ListItem>
                                            <asp:ListItem Value="269">Mayotte Island (+269)</asp:ListItem>
                                            <asp:ListItem Value="521">Mexico Band 1 (+521)</asp:ListItem>
                                            <asp:ListItem Value="522">Mexico Band 2 (+522)</asp:ListItem>
                                            <asp:ListItem Value="523">Mexico Band 3 (+523)</asp:ListItem>
                                            <asp:ListItem Value="524">Mexico Band 4 (+524)</asp:ListItem>
                                            <asp:ListItem Value="525">Mexico Band 5 (+525)</asp:ListItem>
                                            <asp:ListItem Value="526">Mexico Band 6 (+526)</asp:ListItem>
                                            <asp:ListItem Value="527">Mexico Band 7 (+527)</asp:ListItem>
                                            <asp:ListItem Value="528">Mexico Band 8 (+528)</asp:ListItem>
                                            <asp:ListItem Value="691">Micronesia (+691)</asp:ListItem>
                                            <asp:ListItem Value="808">Midway Island (+808)</asp:ListItem>
                                            <asp:ListItem Value="373">Moldova (+373)</asp:ListItem>
                                            <asp:ListItem Value="377">Monaco (+377)</asp:ListItem>
                                            <asp:ListItem Value="976">Mongolia (+976)</asp:ListItem>
                                            <asp:ListItem Value="664">Montserrat (+664)</asp:ListItem>
                                            <asp:ListItem Value="212">Morocco (+212)</asp:ListItem>
                                            <asp:ListItem Value="258">Mozambique (+258)</asp:ListItem>
                                            <asp:ListItem Value="95">Myanmar (Burma) (+95)</asp:ListItem>
                                            <asp:ListItem Value="264">Namibia (+264)</asp:ListItem>
                                            <asp:ListItem Value="674">Nauru (+674)</asp:ListItem>
                                            <asp:ListItem Value="977">Nepal (+977)</asp:ListItem>
                                            <asp:ListItem Value="31">Netherlands (+31)</asp:ListItem>
                                            <asp:ListItem Value="599">Netherlands Antilles (+599)</asp:ListItem>
                                            <asp:ListItem Value="869">Nevis Island (+869)</asp:ListItem>
                                            <asp:ListItem Value="687">New Caledonia (+687)</asp:ListItem>
                                            <asp:ListItem Value="64">New Zealand (+64)</asp:ListItem>
                                            <asp:ListItem Value="505">Nicaragua (+505)</asp:ListItem>
                                            <asp:ListItem Value="227">Niger (+227)</asp:ListItem>
                                            <asp:ListItem Value="234">Nigeria (+234)</asp:ListItem>
                                            <asp:ListItem Value="683">Niue Island (+683)</asp:ListItem>
                                            <asp:ListItem Value="672">Norfolk Island (+672)</asp:ListItem>
                                            <asp:ListItem Value="850">North Korea (+850)</asp:ListItem>
                                            <asp:ListItem Value="670">Northern Marianas Islands (Saipan, Rota, & Tinian) (+670)</asp:ListItem>
                                            <asp:ListItem Value="47">Norway (+47)</asp:ListItem>
                                            <asp:ListItem Value="968">Oman (+968)</asp:ListItem>
                                            <asp:ListItem Value="92">Pakistan (+92)</asp:ListItem>
                                            <asp:ListItem Value="680">Palau (+680)</asp:ListItem>
                                            <asp:ListItem Value="970">Palestine (+970)</asp:ListItem>
                                            <asp:ListItem Value="809">Palm Island (+809)</asp:ListItem>
                                            <asp:ListItem Value="507">Panama (+507)</asp:ListItem>
                                            <asp:ListItem Value="675">Papau New Guinea (+675)</asp:ListItem>
                                            <asp:ListItem Value="595">Paraguay (+595)</asp:ListItem>
                                            <asp:ListItem Value="51">Peru (+51)</asp:ListItem>
                                            <asp:ListItem Value="63">Philippines (+63)</asp:ListItem>
                                            <asp:ListItem Value="48">Poland (+48)</asp:ListItem>
                                            <asp:ListItem Value="351">Portugal (+351)</asp:ListItem>
                                            <asp:ListItem Value="239">Principe (+239)</asp:ListItem>
                                            <asp:ListItem Value="974">Qatar (+974)</asp:ListItem>
                                            <asp:ListItem Value="262">Reunion Island (+262)</asp:ListItem>
                                            <asp:ListItem Value="40">Romania (+40)</asp:ListItem>
                                            <asp:ListItem Value="7">Russia (+7)</asp:ListItem>
                                            <asp:ListItem Value="250">Rwanda (+250)</asp:ListItem>
                                            <asp:ListItem Value="7">Sakhalin (+7)</asp:ListItem>
                                            <asp:ListItem Value="378">San Marino (+378)</asp:ListItem>
                                            <asp:ListItem Value="239">Sao Tome (+239)</asp:ListItem>
                                            <asp:ListItem Value="966">Saudi Arabia (+966)</asp:ListItem>
                                            <asp:ListItem Value="221">Senegal Republic (+221)</asp:ListItem>
                                            <asp:ListItem Value="381">Serbia (+381)</asp:ListItem>
                                            <asp:ListItem Value="248">Seychelles (+248)</asp:ListItem>
                                            <asp:ListItem Value="232">Sierra Leone (+232)</asp:ListItem>
                                            <asp:ListItem Value="65">Singapore (+65)</asp:ListItem>
                                            <asp:ListItem Value="421">Slovakia (+421)</asp:ListItem>
                                            <asp:ListItem Value="386">Slovenia (+386)</asp:ListItem>
                                            <asp:ListItem Value="677">Solomon Islands (+677)</asp:ListItem>
                                            <asp:ListItem Value="252">Somalia (+252)</asp:ListItem>
                                            <asp:ListItem Value="27">South Africa (+27)</asp:ListItem>
                                            <asp:ListItem Value="82">South Korea (+82)</asp:ListItem>
                                            <asp:ListItem Value="34">Spain (+34)</asp:ListItem>
                                            <asp:ListItem Value="94">Sri Lanka (+94)</asp:ListItem>
                                            <asp:ListItem Value="290">St. Helena (+290)</asp:ListItem>
                                            <asp:ListItem Value="869">St. Kitts (+869)</asp:ListItem>
                                            <asp:ListItem Value="758">St. Lucia (+758)</asp:ListItem>
                                            <asp:ListItem Value="508">St. Pierre & Miquelon (+508)</asp:ListItem>
                                            <asp:ListItem Value="784">St. Vincent & Grenadines (+784)</asp:ListItem>
                                            <asp:ListItem Value="249">Sudan (+249)</asp:ListItem>
                                            <asp:ListItem Value="597">Suriname (+597)</asp:ListItem>
                                            <asp:ListItem Value="268">Swaziland (+268)</asp:ListItem>
                                            <asp:ListItem Value="46">Sweden (+46)</asp:ListItem>
                                            <asp:ListItem Value="41">Switzerland (+41)</asp:ListItem>
                                            <asp:ListItem Value="963">Syria (+963)</asp:ListItem>
                                            <asp:ListItem Value="886">Taiwan (+886)</asp:ListItem>
                                            <asp:ListItem Value="992">Tajikistan (+992)</asp:ListItem>
                                            <asp:ListItem Value="255">Tanzania (+255)</asp:ListItem>
                                            <asp:ListItem Value="66">Thailand (+66)</asp:ListItem>
                                            <asp:ListItem Value="228">Togo (+228)</asp:ListItem>
                                            <asp:ListItem Value="690">Tokelau (+690)</asp:ListItem>
                                            <asp:ListItem Value="676">Tonga (+676)</asp:ListItem>
                                            <asp:ListItem Value="868">Trinidad/Tobago (+868)</asp:ListItem>
                                            <asp:ListItem Value="216">Tunisia (+216)</asp:ListItem>
                                            <asp:ListItem Value="90">Turkey (+90)</asp:ListItem>
                                            <asp:ListItem Value="993">Turkmenistan (+993)</asp:ListItem>
                                            <asp:ListItem Value="649">Turks/Caicos (+649)</asp:ListItem>
                                            <asp:ListItem Value="688">Tuvalu Islands (+688)</asp:ListItem>
                                            <asp:ListItem Value="256">Uganda (+256)</asp:ListItem>
                                            <asp:ListItem Value="380">Ukraine (+380)</asp:ListItem>
                                            <asp:ListItem Value="971">United Arab Emirates (+971)</asp:ListItem>
                                            <asp:ListItem Value="44">United Kingdom (+44)</asp:ListItem>
                                            <asp:ListItem Value="878">Universal Personal Telecommunications (UPT) (+878)</asp:ListItem>
                                            <asp:ListItem Value="598">Uruguay (+598)</asp:ListItem>
                                            <asp:ListItem Value="340">US Virgin Islands (+340)</asp:ListItem>
                                            <asp:ListItem Value="1">USA (+1)</asp:ListItem>
                                            <asp:ListItem Value="998">Uzbekistan (+998)</asp:ListItem>
                                            <asp:ListItem Value="678">Vanuatu (+678)</asp:ListItem>
                                            <asp:ListItem Value="39">Vatican City (+39)</asp:ListItem>
                                            <asp:ListItem Value="58">Venezuela (+58)</asp:ListItem>
                                            <asp:ListItem Value="84">Vietnam (+84)</asp:ListItem>
                                            <asp:ListItem Value="808">Wake Island (+808)</asp:ListItem>
                                            <asp:ListItem Value="685">West Samoa (+685)</asp:ListItem>
                                            <asp:ListItem Value="967">Yemen Arab Rep. (+967)</asp:ListItem>
                                            <asp:ListItem Value="381">Yugoslavia (+381)</asp:ListItem>
                                            <asp:ListItem Value="260">Zambia (+260)</asp:ListItem>
                                            <asp:ListItem Value="255">Zanzibar (+255)</asp:ListItem>
                                            <asp:ListItem Value="263">Zimbabwe (+263)</asp:ListItem>
                                        </asp:DropDownList>

                                                                </div>
                                                                <div class="col-sm-3">
                                                                    Mobile 2 (optional)
                                       
                                        <asp:TextBox ID="txtMobile2" runat="server" TextMode="Number" MaxLength="10" onkeypress="return this.value.length<10" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter  Mobile Number'" onblur="this.placeholder = 'Enter Mobile Number'" placeholder="Enter Mobile Number" ValidationGroup="B"></asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Mobile Number" ValidationExpression="^([0-9]{10})$" ControlToValidate="txtMobile2" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                                                                </div>
                                                                <div class="col-sm-1.5"></div>
                                                                <%-- <div class="form-group">
                                       Mobile Number 1  
                        
                                    </div>--%>

                                                                <%--   <div class="col-6">
                                    <div class="form-group">
                                       Mobile Number 2  <asp:TextBox ID="txtMobile3" runat="server" class="form-control valid" name="name"  type="text" onfocus="this.placeholder = 'Enter Home Mobile 3'" onblur="this.placeholder = 'Enter  Home Mobile 3'" placeholder="Enter  Home Mobile 3" ValidationGroup="B"></asp:TextBox>
                          
                                    </div>
                                </div>
                --%>
                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Email Address 1 (optional)
                                            <asp:TextBox ID="txtemailaddress1" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Email Address 1'" onblur="this.placeholder = 'Enter Email Address 1'" placeholder="Enter Email Address 1" ValidationGroup="B"></asp:TextBox>
                                                                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtemailaddress1" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Email Address 1"></asp:RequiredFieldValidator>--%>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ControlToValidate="txtemailaddress1" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Invalid email address"></asp:RegularExpressionValidator>
                                                                    </div>
                                                                </div>

                                                                <div class="col-sm-6">
                                                                    <div class="form-group">
                                                                        Email Address 2 (optional)
                                            <asp:TextBox ID="txtemailaddress2" runat="server" class="form-control valid" name="name" type="text" onfocus="this.placeholder = 'Enter Email Address 2'" onblur="this.placeholder = 'Enter Email Address 2'" placeholder="Enter Email Address 2" ValidationGroup="B"></asp:TextBox>
                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ControlToValidate="txtemailaddress2" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Invalid email address"></asp:RegularExpressionValidator>
                                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtfamilyaddress" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Enter Email Address 2"></asp:RequiredFieldValidator>--%>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </asp:WizardStep>
                                                <asp:WizardStep ID="WizardStep6" runat="server" Title="Step 6">
                                                    <%--  <div class="content">This is Step 5</div>--%>
                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <h2 class="contact-title">ADD Photos</h2>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                Profile Photo
                                    <asp:FileUpload ID="FileUpload1" runat="server" class="form-control valid" AllowMultiple="false" onchange="showImagePreview(this)" />
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="FileUpload1" ForeColor="Red" Display="Dynamic" CssClass="alert alert-danger embed-responsive" ValidationGroup="B" ErrorMessage="Please Choose Photo"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="regexValidator" runat="server"
                                                                    ControlToValidate="FileUpload1" ForeColor="Red" Display="Dynamic"
                                                                    ErrorMessage="Only JPEG images are allowed"
                                                                    ValidationExpression="(.*\.([Jj][Pp][Gg])|.*\.([Jj][Pp][Ee][Gg])$)">  
                                                                </asp:RegularExpressionValidator>
                                                                <asp:Label ID="ltStatusText" runat="server" CssClass="alert alert-danger embed-responsive" Text="" ForeColor="Red"></asp:Label>

                                                                <asp:Image ID="profilephoto" runat="server" Visible="false" ImageUrl="~/Picture/noimage.png" CssClass="img img-thumbnail" Height="100" Width="100" />
                                                                <br />
                                                                <asp:Label ID="lblimage" runat="server" Text="" Visible="false"></asp:Label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">


                                                        <div class="col-sm-12">
                                                            <h2 class="contact-title">Preview</h2>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <img id="imgPreview" alt="Preview image" src="Picture/no-preview.png" width="300" height="200" style="object-fit: contain" />
                                                        </div>
                                                    </div>
                                                </asp:WizardStep>
                                            </WizardSteps>
                                            <HeaderTemplate>
                                                </div>
                               
                                
                                <ul id="wizHeader">
                                    <asp:Repeater ID="SideBarList" runat="server" OnItemDataBound="SideBarList_ItemDataBound">
                                        <ItemTemplate>
                                            <li><a class="<%# GetClassForWizardStep(Container.DataItem) %>" title="<%#Eval("Name")%>">
                                                <%# Eval("Name")%></a> </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                                            </HeaderTemplate>
                                        </asp:Wizard>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


        </section>

    </div>
    <script src="../App_Themes/Theme1/js/vendor/jquery-1.12.4.min.js"></script>

    <%--<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.10.0.min.js" type="text/javascript"></script>--%>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.9.2/themes/blitzer/jquery-ui.css"
        rel="Stylesheet" type="text/css" />


    <script type="text/javascript">

        $(document).ready(function () {
            $("#ContentPlaceHolder1_Wizard1_txtcaste").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: '<%=ResolveUrl("~/postbiodata.aspx/GetCustomers") %>',
                        data: "{ 'prefix': '" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.split('-')[0],
                                    val: item.split('-')[1]
                                }
                            }))
                        },
                        error: function (response) {
                            alert(response.responseText);
                        },
                        failure: function (response) {
                            alert(response.responseText);
                        }
                    });
                },
                select: function (e, i) {
                    $("#ContentPlaceHolder1_Wizard1_hfCustomerId").val(i.item.val);
                },
                minLength: 1
            });
        });
    </script>
</asp:Content>

