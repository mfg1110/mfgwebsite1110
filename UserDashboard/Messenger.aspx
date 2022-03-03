<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/UserDashboardMasterPage.master" AutoEventWireup="true" CodeFile="Messenger.aspx.cs" Inherits="Messenger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous" />

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
    <style>
        body, html {
            /*height: 100%;*/
            margin: 0;
            /*background: #7F7FD5;
	       background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
	        background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);*/
        }

        .chat {
            /*margin-top: auto;
			margin-bottom: auto;*/
        }

        .card {
            /*height: 500px;*/
            border-radius: 15px !important;
            /*background-color: rgba(0,0,0,0.4) !important;*/
            background-color: white;
        }

        .contacts_body {
            padding: 0.75rem 0 !important;
            overflow-y: auto;
            white-space: nowrap;
        }

        .msg_card_body {
            overflow-y: auto;
        }

        .card-header {
            border-radius: 15px 15px 0 0 !important;
            border-bottom: 0 !important;
        }

        .card-footer {
            border-radius: 0 0 15px 15px !important;
            border-top: 0 !important;
        }

        .container {
            align-content: center;
        }

        .search {
            border-radius: 15px 0 0 15px !important;
            background-color: rgba(0,0,0,0.3) !important;
            border: 0 !important;
            color: white !important;
        }

            .search:focus {
                box-shadow: none !important;
                outline: 0px !important;
            }

        .type_msg {
            background-color: rgba(0,0,0,0.3) !important;
            border: 0 !important;
            color: white !important;
            height: 60px !important;
            overflow-y: auto;
        }

            .type_msg:focus {
                box-shadow: none !important;
                outline: 0px !important;
            }

        .attach_btn {
            border-radius: 15px 0 0 15px !important;
            background-color: rgba(0,0,0,0.3) !important;
            border: 0 !important;
            color: white !important;
            cursor: pointer;
        }

        .send_btn {
            border-radius: 0 15px 15px 0 !important;
            background-color: rgba(0,0,0,0.3) !important;
            border: 0 !important;
            color: white !important;
            cursor: pointer;
        }

        .search_btn {
            border-radius: 0 15px 15px 0 !important;
            background-color: rgba(0,0,0,0.3) !important;
            border: 0 !important;
            color: white !important;
            cursor: pointer;
        }

        .contacts {
            list-style: none;
            padding: 0;
        }

            .contacts li {
                width: 100% !important;
                padding: 5px 10px;
                margin-bottom: 15px !important;
            }

        .active {
            background-color: rgba(0,0,0,0.3);
        }

        .user_img {
            height: 36px;
            /*width: 70px;*/
            border: 1.5px solid #f5f6fa;
        }

        .user_img_msg {
            height: 40px;
            width: 40px;
            border: 1.5px solid #f5f6fa;
        }

        .img_cont {
            position: relative;
            height: 70px;
            width: 70px;
        }

        .img_cont_msg {
            height: 40px;
            width: 40px;
        }

        .online_icon {
            position: absolute;
            height: 15px;
            width: 15px;
            background-color: #4cd137;
            border-radius: 50%;
            bottom: 0.2em;
            right: 0.4em;
            border: 1.5px solid white;
        }

        .offline {
            background-color: #c23616 !important;
        }

        .user_info {
            margin-top: auto;
            margin-bottom: auto;
            margin-left: 15px;
        }

            .user_info span {
                font-size: 20px;
                /*color: white;*/
                color: black;
            }

            .user_info p {
                font-size: 10px;
                color: rgba(255,255,255,0.6);
            }

        .video_cam {
            margin-left: 50px;
            margin-top: 5px;
        }

            .video_cam span {
                color: white;
                font-size: 20px;
                cursor: pointer;
                margin-right: 20px;
            }

        .msg_cotainer {
            margin-top: auto;
            margin-bottom: auto;
            margin-left: 10px;
            border-radius: 25px;
            background-color: #82ccdd;
            padding: 10px;
            position: relative;
        }

        .msg_cotainer_send {
            margin-top: auto;
            margin-bottom: auto;
            margin-right: 10px;
            border-radius: 25px;
            background-color: #78e08f;
            padding: 10px;
            position: relative;
        }

        .msg_time {
            position: absolute;
            left: 0;
            bottom: -15px;
            color: rgba(255,255,255,0.5);
            font-size: 10px;
        }

        .msg_time_send {
            position: absolute;
            right: 0;
            bottom: -15px;
            color: rgba(255,255,255,0.5);
            font-size: 10px;
        }

        .msg_head {
            position: relative;
        }

        #action_menu_btn {
            position: absolute;
            right: 10px;
            top: 10px;
            color: white;
            cursor: pointer;
            font-size: 20px;
        }

        .action_menu {
            z-index: 1;
            position: absolute;
            padding: 15px 0;
            background-color: rgba(0,0,0,0.5);
            color: white;
            border-radius: 15px;
            top: 30px;
            right: 15px;
            display: none;
        }

            .action_menu ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

                .action_menu ul li {
                    width: 100%;
                    padding: 10px 15px;
                    margin-bottom: 5px;
                }

                    .action_menu ul li i {
                        padding-right: 10px;
                    }

                    .action_menu ul li:hover {
                        cursor: pointer;
                        background-color: rgba(0,0,0,0.2);
                    }

        @media(max-width: 576px) {
            .contacts_card {
                margin-bottom: 15px !important;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .SenderClass {
            left: 55%;
            background: #0b59ce;
            color: #ffffff;
            border: 1px solid #0b59ce;
        }

        .ReceiverClass {
            left: -30%;
            background: #c46909;
            color: #ffffff;
            border: 1px solid #c46909;
        }

        .MainChatListClass {
            padding: 5px;
            width: 250px;
            position: relative;
            border-radius: 5px;
            word-wrap: break-word;
            margin-top: 5px;
        }

        .SenderClass::after {
            content: ' ';
            position: absolute;
            width: 0;
            height: 0;
            left: 243px;
            top: 0px;
            border: 10px solid;
            border-color: transparent transparent #0b59ce #0b59ce;
        }

        .ReceiverClass::after {
            content: ' ';
            position: absolute;
            width: 0;
            height: 0;
            right: 243px;
            top: 3px;
            border: 10px solid;
            border-color: #c46909 #c46909 transparent transparent;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true"></asp:ScriptManager>

    <div class="top-bar clearfix">
        <div class="page-title">
            <h4>Member Chat</h4>
        </div>

    </div>
    <div class="main-container">
        <div class="container-fluid">
            <div class="col-lg-4 col-md-4">
                <div class="panel panel-red no-margin">
                    <div class="panel-heading">
                        <h4>
                            <asp:TextBox ID="txtsearch" runat="server" placeholder="Search..." AutoPostBack="true" CssClass="form-control" OnTextChanged="txtsearch_TextChanged"></asp:TextBox>
                        </h4>
                    </div>
                    <div class="panel-body">
                        <ul class="todo-list">
                            <asp:Label ID="CurrentSender" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="CurrentRecevier" runat="server" Text="" Visible="false"></asp:Label>

                            <asp:Repeater ID="rptusers" runat="server">
                                <ItemTemplate>
                                    <li class="list">
                                        <img src="../image/user.png" class="rounded-circle user_img">
                                        <asp:LinkButton ID="lnksender" runat="server" OnCommand="lnksender_Command" CommandArgument='<%# Eval("Receiver") %>'><%# Eval("Receiver") %></asp:LinkButton>

                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <div id="trEmpty" runat="server" visible="false" class="alert alert-success">
                                        <td colspan="3" align="center">No records found.
                                        </td>
                                    </div>

                                </FooterTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-8 ">
                <div class="card">
                    <div class="card-header msg_head">
                        <div class="d-flex bd-highlight">
                            <ul class="todo-list">

                                <li class="list">
                                    <img src="../image/user.png" class="rounded-circle user_img" />

                                    <span><%= GetWelcomeBanner(CurrentRecevier.Text)%></span>
                                    <div style="float: right">
                                        <asp:LinkButton ID="linkdeleteall" runat="server" CommandArgument='CurrentRecevier.Text' OnCommand="linkdeleteall_Command"><i class="glyphicon glyphicon-trash"></i>Clear Chat </asp:LinkButton>
                                    </div>
                                </li>




                            </ul>
                         
                        </div>
                        <hr />
                        <span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
                        <div class="action_menu">
                            <ul>
                                <li><i class="fas fa-user-circle"></i>View profile</li>
                                <li><i class="fas fa-users"></i>Add to close friends</li>
                                <li><i class="fas fa-plus"></i>Add to group</li>
                                <li><i class="fas fa-ban"></i>Block</li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body msg_card_body">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick" />
                                <div class="d-flex justify-content-start mb-4">
                                    <asp:DataList ID="DataList2" runat="server" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatLayout="Table">
                                        <ItemTemplate>
                                            <div style="float: right"></div>
                                            <div class="<%# GetStyleForMsgList(Eval("Sender").ToString()) %>  MainChatListClass">

                                                <asp:Label ID="Label1" runat="server" Text='<%# GetPerfactName(Eval("Sender").ToString()) %>'></asp:Label>

                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Message") %>'></asp:Label>

                                                <br />

                                                <span class="time_date" style="color: white"><%# Eval("Date1") %></span>
                                                <div style="float: right">
                                                    <asp:LinkButton ID="lnkdelete" ForeColor="White" runat="server" CommandArgument='<%#Eval("ID")%>' OnCommand="lnkdelete_Command"><i class="glyphicon glyphicon-trash"></i> </asp:LinkButton>
                                                </div>
                                            </div>

                                        </ItemTemplate>
                                    </asp:DataList>


                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div class="card-footer">
                                    <br />
                                    <div>
                                        <asp:TextBox ID="MSGTextBox" runat="server" placeholder="Type your message..." CssClass="form-control" BackColor="White" TextMode="MultiLine"></asp:TextBox>

                                        <div class="input-group-append">
                                            <asp:LinkButton ID="btnRandom"
                                                runat="server"
                                                CssClass="btn btn-danger"
                                                OnClick="btnRandom_Click1">
    <span aria-hidden="true" class="fas fa-location-arrow"></span>
                                            </asp:LinkButton>

                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                </div>
            </div>
        </div>

    </div>
</asp:Content>

