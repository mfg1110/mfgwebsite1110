<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/MasterPage.master" AutoEventWireup="true" CodeFile="wizarddemo.aspx.cs" Inherits="wizarddemo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <section class="contact-section" style="background: #ffffff;margin-bottom: 97px;">
        <div class="container">
            <div class="row">
                <div class="col-12">
                 
                    <div class="form-contact contact_form" id="contactForm1" novalidate="novalidate">

    <asp:Wizard ID="Wizard1" runat="server" DisplaySideBar="false" OnActiveStepChanged="Wizard1_ActiveStepChanged" OnLoad="Wizard1_Load">

                            <FinishNavigationTemplate>
                                <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False"
                                    CommandName="MovePrevious" Text="Previous" />
                                <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" OnClick="FinishButton_Click"
                                    Text="Finish It" />
                            </FinishNavigationTemplate>
                            <StartNavigationTemplate >
                                <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" ValidationGroup="B" OnClick="StartNextButton_Click"
                                    Text="Save & Next" />
                            </StartNavigationTemplate>
                            <StepNavigationTemplate>
                                <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False"
                                    CommandName="MovePrevious" Text="Previous" />
                                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" ValidationGroup="B" OnClick="StepNextButton_Click"
                                    Text="Save & Next" />
                            </StepNavigationTemplate>
                            
                            <WizardSteps>
                                <asp:WizardStep ID="WizardStep1" runat="server" Title="Step 1">
                                     <div class="content">Personal Detail 

                                    
                                         </div>
                                </asp:WizardStep>
                                <asp:WizardStep ID="WizardStep2" runat="server" Title="Step 2">
                                     <div class="content">education Detail 

                                    
                                         </div>
                                </asp:WizardStep>
                                <asp:WizardStep ID="WizardStep3" runat="server" Title="Step 3">
                                     <div class="content">Occupation Detail 

                                    
                                         </div>
                                </asp:WizardStep>
                                </WizardSteps>

        <HeaderTemplate>
                                
                                <ul id="wizHeader">
                                    <asp:Repeater ID="SideBarList" runat="server" OnItemDataBound="SideBarList_ItemDataBound">
                                        <ItemTemplate>
                                            <li><a href="<%# GetIndexForWizardStep(Container.DataItem) %>" class="<%# GetClassForWizardStep(Container.DataItem) %>" title="<%#Eval("Name")%>">
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
         </section>
</asp:Content>

