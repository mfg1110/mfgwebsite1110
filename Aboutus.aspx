<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpage/MainMasterpage.master" AutoEventWireup="true" CodeFile="Aboutus.aspx.cs" Inherits="Aboutus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="section-padding bg-dark inner-header">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h1 class="mt-0 mb-3 text-white">ABOUT US</h1>
                    <div class="breadcrumbs">
                        <p class="mb-0 text-white"><a class="text-white" href="#">Home</a> &nbsp;/&nbsp; <span class="text-success">ABOUT US</span></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section-padding bg-white">
        <div class="container">
            <div class="row">
                <div class="pl-4 col-lg-5 col-md-5 pr-4">
                    <img class="rounded img-fluid" src="App_Themes/Fronttheme/img/70963401.png" alt="Card image cap">
                </div>
                <div class="col-lg-6 col-md-6 pl-5 pr-5">
                    <h2 class="mt-5 mb-5">WE HELP AT EVERY STAGE</h2>
                    <h5 class="mt-2">Our Vision</h5>
                    <p>Matrimony For Gujrati is a matchmaking service created for parents who are looking for a life partner for their loved ones. Unlike other Matrimonial services, we focus on providing detailed family and background information to help you take the next step with confidence. With over 80+ community sites, you can find a match from your own community.</p>
                   <%-- <h5 class="mt-4">Our Goal</h5>--%>
                    <p>Matrimony For Gujarati - India's No. 1 and Most Trusted Matrimony service, has helped Millions like you find matches from across different communities such as Agarwal, Brahmin, Kalita, Kayastha, Khandayat, Khatri, Lingayath, Maratha, Nair, Parsi, Rajput, Reddy. Why Choose Matrimony For Gujarati?</p>
                </div>
            </div>
        </div>
    </section>
    <section class="section-padding">
        <div class="section-title text-center mb-5">
            <h2>Assisted Services</h2>
           <%-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>--%>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="mt-4 mb-4"><i class="text-success mdi mdi-account-box-outline mdi-48px"></i></div>
                    <h5 class="mt-3 mb-3">Sign Up</h5>
                
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="mt-4 mb-4"><i class="text-success mdi mdi-check-circle-outline mdi-48px"></i></div>
                    <h5 class="mb-3">Shortlisted Matches</h5>
                   
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="mt-4 mb-4"><i class="text-success mdi mdi-account-multiple-outline mdi-48px"></i></div>
                    <h5 class="mt-3 mb-3">Find Common Links With Prospects</h5>
                  
                </div>
            </div>
            
        </div>
    </section>
</asp:Content>

