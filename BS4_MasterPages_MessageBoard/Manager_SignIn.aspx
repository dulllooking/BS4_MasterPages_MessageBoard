<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manager_SignIn.aspx.cs" Inherits="messageBoard.Manager_SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Manager Sign In</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    <!-- Favicon icon -->
    <link rel="icon" href="assets/images/logo.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
<body class="fix-menu">
    <form id="form1" runat="server">
        <!-- Pre-loader end -->

        <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
            <!-- Container-fluid starts -->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <!-- Authentication card start -->
                        <div class="login-card card-block auth-body mr-auto ml-auto">
                            <form class="md-float-material">
                                <div class="text-center">
                                    <img src="assets/images/auth/logo-dark.png" alt="logo.png">
                                </div>
                                <div class="auth-box">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h3 class="text-left txt-primary">Sign in for manage</h3>
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox1" runat="server" AutoCompleteType="Disabled" required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('請勿留白!')" class="form-control" placeholder="Your Account"></asp:TextBox>
                                        <span class="md-line"></span>
                                    </div>
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox2" runat="server" AutoCompleteType="Disabled" TextMode="Password" required="" aria-required="true" oninput="setCustomValidity('');" oninvalid="setCustomValidity('請勿留白!')" class="form-control" placeholder="Password"></asp:TextBox>
                                        <span class="md-line"></span>
                                    </div>
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label>
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Sign in" Font-Bold="True" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20"/>
                                        </div>
                                        <div class="col-md-12">
                                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Back to index" Font-Bold="True" class="btn btn btn-info btn-md btn-block waves-effect text-center m-b-20" UseSubmitBehavior="False"/>
                                        </div>
                                    </div>
                                    <hr/>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <p class="text-inverse text-left m-b-0">Thank you and enjoy our website.</p>
                                            <p class="text-inverse text-left"><b>Your Authentication Team</b></p>
                                        </div>
                                        <div class="col-md-2">
                                            <img src="assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
                                        </div>
                                    </div>

                                </div>
                            </form>
                            <!-- end of form -->
                        </div>
                        <!-- Authentication card end -->
                    </div>
                    <!-- end of col-sm-12 -->
                </div>
                <!-- end of row -->
            </div>
            <!-- end of container-fluid -->
        </section>
        <!-- Required Jquery -->
        <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js"></script>
        <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js"></script>
        <!-- jquery slimscroll js -->
        <script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
        <!-- modernizr js -->
        <script type="text/javascript" src="assets/js/modernizr/modernizr.js"></script>
        <script type="text/javascript" src="assets/js/modernizr/css-scrollbars.js"></script>
        <script type="text/javascript" src="assets/js/common-pages.js"></script>

    </form>
</body>
</html>
