<%@ Page Language="C#" AutoEventWireup="true" CodeFile="landingpg.aspx.cs" Inherits="landingpg" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="https://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="keywords" content="COOK'DIN">
	<meta name="description" content="COOK'DIN">
	<meta name="author" content="COOK'DIN">
	
	<title>Home cooked food at your door step - Cook'dIn</title>
	
    <script src="templete/js/jquery-1.js"></script>
	<script src="templete/js/jquery_002.js"></script>
	<script src="templete/js/wow.js"></script>
	<script src="templete/js/jquery.js"></script>
	<script src="templete/js/scripts.js"></script>

     <link href="templete/css/ninja-slider.css" rel="stylesheet" type="text/css" />
     
    <script src="templete/js/ninja-slider.js" type="text/javascript"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
   <script>	    new WOW().init();</script>


 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type = "text/javascript"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type = "text/javascript"></script> 
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel = "Stylesheet" type="text/css" />
<link rel="stylesheet" href="templete/css/bootstrap.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="templete/css/style.css">
<link rel="stylesheet" href="templete/css/animate.css">
<link href="templete/css/css.css" rel="stylesheet">
<link rel="shortcut icon" href="templete/image/favicon.png">
	
      <%--for popup at page load--%>
   <%--  <link rel="stylesheet" href="templete/css/main.css">--%>
      <link href="templete/css/radiocss.css" rel="stylesheet" type="text/css" />
   

</head>
<%--<body>--%>
    <body class="home remove-margin landlingpg-bg">
    <%--<header class="head header-sticky" role="banner" id="chef-header">
	<!--wrap-->
		<div class="wrap clearfix full-width-menu">
			<a href="homepg.aspx"  title="cookd'IN" class="logo"><img src="templete/image/logo.png" alt="cook'dIN logo"></a>
		</div>
	</header>--%>
    <!--main-->
	<main class="main main-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			<div class="row">
				<section class="content two-third wow fadeInLeft animated" style="visibility: visible; animation-name: fadeInLeft;">
					<!--one-half-->
					<%--<section class="container">
						<h1>COOK'DIN Welcomes Home Cooks !</h1>
					</section>--%>
					<!--//one-half-->
				</section>
				<!--//content-->
				<!--right sidebar-->
				<aside class="sidebar one-third wow fadeInRight animated" style="visibility: visible; animation-name: fadeInRight;">
					<div class="widget" style="text-align:center">
                        <a href="homepg.aspx"  title="cookd'IN" class="logo-landingpg">
                            <img src="templete/image/logo.png" alt="cook'dIN logo" class="landingpglg"></a>
						<div class="">
							<h2>Delicious home cooked meals packed and delivered to your homes.</h2>
						</div>
                        <div class="">
                            <h2>Coming to Ahmedabad starting February</h2>
						</div>
                        <div class="">
							<h3 style="margin: 0">OR</h3>
						</div>
                        <div class="">
							<a class="button full-width" href="newsletter.aspx">Sign Up for Newsletter</a>
                        </div>
                        <div class="f-row">
							<h5>Are you a <b>HomeChef</b> ?Click <a href="signup.aspx">here</a> to Register</h5>
						</div>
					</div>
                    <div class="widget" style="text-align:center">
                        <div class="col-lg-3">
                        </div>
                        <div class="col-lg-7 center center-block" >
							<h4 style="float: left">
                                Coming Soon on
                                <div class="bg-icon"></div>
                            </h4>
						</div>
                    </div>
				</aside>
				<!--//right sidebar-->
            </div>
		</div>
		<!--//wrap-->
	</main>
	<!--//main-->
	<!--footer-->
    <!--preloader-->
	<div style="display: none;" class="preloader">
		<div class="spinner"></div>
	</div>
	<!--//preloader-->
</body>
<%--</body>--%>
</html>
