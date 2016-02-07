﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="adminlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
        <meta charset="utf-8">
        <title>Login | Admin Login</title>
        <!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Force IE9 to render in normal mode -->
        <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
        <meta name="author" content="" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta name="application-name" content="" />
        <!-- Import google fonts - Heading first/ text second -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet" type="text/css">
        <!-- Css files -->
        <!-- Icons -->
        <link href="admin-template/css/icons.css" rel="stylesheet" />
        <!-- Bootstrap stylesheets (included template modifications) -->
        <link href="admin-template/css/bootstrap.css" rel="stylesheet" />
        <!-- Plugins stylesheets (all plugin custom css) -->
        <link href="admin-template/css/plugins.css" rel="stylesheet" />
        <!-- Main stylesheets (template main css file) -->
        <link href="admin-template/css/main.css" rel="stylesheet" />
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <link href="admin-template/css/custom.css" rel="stylesheet" />
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="">
        <link rel="apple-touch-icon-precomposed" href="">
        <link rel="icon" href="templete/image/favicon.png" type="image/png">
        <!-- Windows8 touch icon ( https://www.buildmypinnedsite.com/ )-->
        <meta name="msapplication-TileColor" content="#3399cc" />
    </head>
    <body class="login-page">
        <div id="header" class="animated fadeInDown">
            <div class="row">
                <div class="navbar">
                    <div class="container text-center">
                        <a class="navbar-brand" href="">Admin Login<span class="slogan"></span></a>
                    </div>
                </div>
                <!-- /navbar -->
            </div>
            <!-- End .row -->
        </div>
        <!-- End #header -->
        <!-- Start login container -->
        <div class="container login-container">
            <div class="login-panel panel panel-default plain animated bounceIn">
                <!-- Start .panel -->
                <div class="panel-body">
                    <%--<form class="form-horizontal mt0" action="" id="login-form" role="form" runat="server">--%>
                     <form runat="server">
                        <div class="form-group">
                            <div class="col-md-12">
                                <!-- col-md-12 start here -->
                                <label for="">Username:</label>
                            </div>
                            <!-- col-md-12 end here -->
                            <div class="col-lg-12">
                                <div class="input-group input-icon">
                                    <asp:TextBox ID="txtusername" runat="server" CssClass="form-control"  placeholder="Enter Username"></asp:TextBox>
                                  <%--  <input type="text" name="username" id="username" class="form-control" value="Administrator" placeholder="Enter username ...">--%>
                                    <span class="input-group-addon"><i class="icomoon-icon-user s16"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <!-- col-md-12 start here -->
                                <label for="">Password:</label>
                            </div>
                            <!-- col-md-12 end here -->
                            <div class="col-lg-12">
                              <div class="input-group input-icon">
                                    <%--  <input type="password" name="password" id="password" class="form-control" value="somepass" placeholder="Your password">--%>
                                     <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control"   TextMode="Password"></asp:TextBox>
                                    <span class="input-group-addon"><i class="icomoon-icon-lock s16"></i></span> 
                                </div>
                                <span class="help-block text-right"><a href="">Forgout password ?</a></span> 
                            </div>
                        </div>
                        <div class="form-group mb0">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-8">
                               <%-- <div class="checkbox-custom">
                                    <input type="checkbox" name="remember" id="remember" value="option">
                                    <label for="remember">Remember me ?</label>
                                </div>--%>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-4 mb25">
                               <%-- <button class="btn btn-default pull-right" type="submit">Login</button>--%>
                                <asp:Button ID="btnlogin" runat="server" Text="Login" 
                                    CssClass="btn btn-default pull-right" onclick="btnlogin_Click" />
                            </div>
                        </div>
                    </form>
                 <%--   <div class="seperator">
                        <strong>or</strong>
                        <hr>
                    </div>
                    <div class="social-buttons text-center mt5 mb5">
                        <a href="#" class="btn btn-primary btn-alt mr10">Sign in with <i class="fa fa-facebook s20 ml5 mr0"></i></a> 
                        <a href="#" class="btn btn-danger btn-alt ml10">Sign in with <i class="fa fa-google-plus s20 ml5 mr0"></i></a> 
                    </div>--%>
                </div>
                <%--<div class="panel-footer gray-lighter-bg">
                    <h4 class="text-center"><strong>Don`t have an account ?</strong>
                    </h4>
                    <p class="text-center"><a href="register.html" class="btn btn-success">Create account</a>
                    </p>
                </div>--%>
            </div>
            <!-- End .panel -->
        </div>
        <!-- End login container -->
        <div class="container">
            <div class="footer">
                <p class="text-center">&copy;2015 Copyright vertilex. All right reserved !!!</p>
            </div>
        </div>
        <!-- Javascripts -->
        <!-- Important javascript libs(put in all pages) -->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script>
            window.jQuery || document.write('<script src="assets/js/libs/jquery-2.1.1.min.js">\x3C/script>')
        </script>
        <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script>
            window.jQuery || document.write('<script src="assets/js/libs/jquery-ui-1.10.4.min.js">\x3C/script>')
        </script>
        <!--[if lt IE 9]>
  <script type="text/javascript" src="js/libs/excanvas.min.js"></script>
  <script type="text/javascript" src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <script type="text/javascript" src="js/libs/respond.min.js"></script>
<![endif]-->
        <!-- Bootstrap plugins -->
        <script src="admin-template/js/bootstrap/bootstrap.js"></script>
        <!-- Form plugins -->
        <script src="admin-template/plugins/forms/validation/jquery.validate.js"></script>
        <script src="admin-template/plugins/forms/validation/additional-methods.min.js"></script>
        <!-- Init plugins olny for this page -->
        <script src="admin-template/js/pages/login.js"></script>
    </body>
</html>