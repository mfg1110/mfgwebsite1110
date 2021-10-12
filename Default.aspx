<%@ Page Title="" Language="C#" MasterPageFile="~/Master Pages/FrontMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .card-design {
            background-color: #495057;
            text-align: center;
            color: #ffffff;
            padding: 65px;
            border: initial;
            margin-bottom: 15px;
            font-size: large;
            border-radius: 24px;
        }

        .per {
            color: #ffffff;
            font-family: 'Arial Rounded MT';
            letter-spacing: 2px;
        }
    </style>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">


<!-- Latest compiled JavaScript -->

    <%--<script>
        var jqNew = jQuery.noConflict();
        alert($jqNew.fn.jquery);
       </script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <section class="contact-section" style="background: #ffffff; margin-top: 85px;margin-bottom:20px; height: auto">
        <div class="container" style="height: auto">



            <div class="row">

                <div class="col-lg-4">

                    <div class="w3-card-4">
                        <%--  <a href="https://vapi.rana-samaj.com/" target="_blank">--%>
                        <%--  <img src="App_Themes/location/VAPI.png" class="img img-thumbnail">--%>
                        <div class="w3-container w3-center">
                            <div class="card-design">
                                <h1 class="per">Vapi</h1>
                                <p class="per">Rana samaj</p>

                                <button id="myBtn1"><a href="https://vapi.rana-samaj.com/" target="_blank">Click here</a></button>
                            </div>
                        </div>
                        <%--</a>--%>
                    </div>

                </div>
                <div class="col-lg-4">

                    <div class="w3-card-4">
                        <%--  <a href="https://valsad.rana-samaj.com/" target="_blank">--%>
                        <%--  <img src="App_Themes/location/valsad.jpg" class="img img-thumbnail"  alt="Avatar">--%>
                        <div class="w3-container w3-center">
                            <div class="card-design">
                                <h1 class="per">Valsad</h1>
                                <p class="per">Rana samaj</p>

                                <button id="myBtn2"><a href="https://valsad.rana-samaj.com/" target="_blank">Click here</a></button>
                            </div>
                        </div>
                        <%--   </a>--%>
                    </div>
                </div>
                <div class="col-lg-4">

                    <div class="w3-card-4">
                        <%-- <a href="https://bilimora.rana-samaj.com/" target="_blank">--%>
                        <%--<img src="App_Themes/location/BIM.png" class="img img-thumbnail" alt="Avatar">--%>
                        <div class="w3-container w3-center">
                            <div class="card-design">
                                <h1 class="per">Bilimora</h1>
                                <p class="per">Rana samaj</p>

                                <button id="myBtn3"><a href="https://bilimora.rana-samaj.com/" target="_blank">Click here</a></button>
                            </div>
                        </div>
                        <%-- </a>--%>
                    </div>


                </div>

            </div>
            <br />
            <div class="row">

                <div class="col-lg-4">

                    <div class="w3-card-4">
                        <%-- <a href="https://navsari.rana-samaj.com/" target="_blank">--%>
                        <%--   <img src="App_Themes/location/NVS.png" class="img img-thumbnail" alt="Avatar">--%>
                        <div class="w3-container w3-center">
                            <div class="card-design">
                                <h1 class="per">Navsari</h1>
                                <p class="per">Rana samaj</p>

                                <button id="myBtn4"><a href="https://navsari.rana-samaj.com/" target="_blank">Click here</a></button>
                            </div>
                        </div>
                        <%-- </a>--%>
                    </div>


                </div>

                <div class="col-lg-4">

                    <div class="w3-card-4">
                        <%-- <a href="https://surat.rana-samaj.com/" target="_blank">--%>
                        <%--  <img src="App_Themes/location/surat1.png" class="img img-thumbnail" alt="Avatar">--%>
                        <div class="w3-container w3-center">
                            <div class="card-design">
                                <h1 class="per">Surat</h1>
                                <p class="per">Rana samaj</p>

                                <button id="myBtn5"><a href="https://surat.rana-samaj.com/" target="_blank">Click here</a></button>
                            </div>
                        </div>
                        <%-- </a>--%>
                    </div>
                </div>

                <div class="col-lg-4">

                    <div class="w3-card-4">
                        <%-- <a href="https://vadodara.rana-samaj.com/" target="_blank">--%>
                        <%-- <img src="App_Themes/location/baroda.jpg" class="img img-thumbnail"  alt="Avatar">  --%>


                        <div class="w3-container w3-center">
                            <div class="card-design ">
                                <h1 class="per">Vadodara</h1>
                                <p class="per">
                                    Rana samaj
                                
                                </p>

                                <button id="myBtn6"><a href="https://vadodara.rana-samaj.com/" target="_blank">Click here</a></button>
                            </div>


                        </div>
                        <%-- </a>--%>
                    </div>

                </div>

            </div>

        </div>

   
        <div id="myModal1" class="modal" style="float: initial" role="dialog">

            <!-- Modal content -->
            <div class="modal-content" style="height: 300px; width: 400px">
              <%--  <div class="modal-header">
                    <h4 class="modal-title">Modal Heading</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>--%>
                <span class="close">&times;</span>
                <img src="App_Themes/underconstruction.jpg" class="img img-responsive" />
            </div>

        </div>
        


    </section>

    
    <%--<script>
        // Get the modal
        var modal = document.getElementById("myModal1");

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn1");
        var btn2 = document.getElementById("myBtn2");
        var btn3 = document.getElementById("myBtn3");
        var btn4 = document.getElementById("myBtn4");
        var btn5 = document.getElementById("myBtn5");
        var btn6 = document.getElementById("myBtn6");
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on the button, open the modal
        btn.onclick = function () {
            modal.style.display = "block";
        }
        btn2.onclick = function () {
            modal.style.display = "block";
        }
        btn3.onclick = function () {
            modal.style.display = "block";
        }
        btn4.onclick = function () {
            modal.style.display = "block";
        }
        btn5.onclick = function () {
            modal.style.display = "block";
        }
        btn6.onclick = function () {
            modal.style.display = "block";
        }
        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>--%>
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            top: calc(100% - 500px);
            right: auto;
            left: auto;
            bottom: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
        }

        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
    </style>

    <!-- jQuery library -->
  <%--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
      <%--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>--%>


</asp:Content>

