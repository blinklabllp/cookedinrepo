<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register src="~/DishListing.ascx" TagName="DishListing" TagPrefix="UserInformation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="keywords" content="COOK'DIN">
	<meta name="description" content="COOK'DIN">
	<meta name="author" content="COOK'DIN">
	
	<title>Cook'dIN</title>
	
    <script src="templete/js/jquery-1.js"></script>
	<script src="templete/js/jquery_002.js"></script>
	<script src="templete/js/wow.js"></script>
	<script src="templete/js/jquery.js"></script>
	<script src="templete/js/scripts.js"></script>

     <link href="templete/css/ninja-slider.css" rel="stylesheet" type="text/css" />
     
    <script src="templete/js/ninja-slider.js" type="text/javascript"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript">
        function sticky_relocate() {
            var window_top = $(window).scrollTop();
            var div_top = $('#sticky-anchor').offset().top;
            if (window_top > div_top) {
                $('#sticky').addClass('stick');
            } else {
                $('#sticky').removeClass('stick');
            }
        }

        $(function () {
            $(window).scroll(sticky_relocate);
            sticky_relocate();
        });
    </script>


	<script>	    new WOW().init();</script>


 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type = "text/javascript"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type = "text/javascript"></script> 
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel = "Stylesheet" type="text/css" />
<link rel="stylesheet" href="templete/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="templete/css/style.css">
<link rel="stylesheet" href="templete/css/animate.css">
<link href="templete/css/css.css" rel="stylesheet">
<link rel="shortcut icon" href="templete/image/favicon.png">
	
      <%--for popup at page load--%>
   <%--  <link rel="stylesheet" href="templete/css/main.css">--%>
      <link href="templete/css/radiocss.css" rel="stylesheet" type="text/css" />
   
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script> 
<script src="templete/js/main.js"></script>--%>
  <%--for popup at page load--%>

  <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
        }
        .modalPopup
        {
            /*background-color: #FFFFFF;*/
            -webkit-border-radius: 50px;
            -moz-border-radius: 50px;
            /*   border-radius: 10px;
            border: 3px solid rgb(253,121,114);*/
            padding: 0;
        }
        .modalPopup .header
        {
            background-color: rgb(253,121,114);
            height: 30px;
            color: White;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
            
        }
        .modalPopup .body
        {
            min-height: 50px;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
            margin-bottom: 5px;
          
   
        }
    </style>


	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
</head>
<%--<body>--%>
    <body class="home remove-margin">
   
  <form id="form1" runat="server">

  <style type="text/css">
        .Star
        {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }
        .WaitingStar
        {
            background-image: url(images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }
        .FilledStar
        {
            background-image: url(images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
    </style>

    
   <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

  
       <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
  <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlpopup" TargetControlID="lnkDummy" BehaviorID="mpe" BackgroundCssClass="modalBackground"> </asp:ModalPopupExtender>

  <asp:Panel ID="pnlpopup" runat="server" Style="display: none"  CssClass="modalPopup">
        <div class="body">
          <section style="visibility: visible; animation-name: fadeInUp;" class="content center full-width wow fadeInUp animated">
			    <div class="modal-pop container popup-width">
                    <h3> I Am Ordering From :</h3>
                    <div class="f-row">  <asp:DropDownList ID="ddlarea" runat="server"  onselectedindexchanged="ddlarea_SelectedIndexChanged" AutoPostBack="True"> </asp:DropDownList></div>
               </div>
          </section>
        </div>

</asp:Panel>
    <!--header-->
     <div id="sticky-anchor"></div>
	<header class="head header-sticky" role="banner" id="sticky">
		<!--wrap--> 
        
		<div class="wrap clearfix full-width-menu">
			<a href="homepg.aspx"  title="cookd'IN" class="logo"><img src="templete/image/logo.png" alt="cook'dIN logo"></a>
			
			<nav class="main-nav" role="navigation" id="menu">
				<ul>
                    <li><a href="homepg.aspx" title="Home"><span>Home</span></a></li>
					<li><a href="#" title=""><span>Become a Chef</span></a></li>
                    <li><a href="#" title=""><span>How We Work</span></a></li>
					<li><a href="#" title=""><span>Areas We Serve</span></a></li>
                    <li><a href="#" title=""><span>About Us</span></a></li>					
                </ul>
			</nav>
			
			<nav class="user-nav" role="navigation">
				<ul>
                    <li class="light"><a href="Login.aspx" title="">
                        <i class="ico i-account"></i> <span>Login for Chef</span></a>
                    </li>
					<li class="medium"><a href="consumer_login.aspx" title=""><i class="ico i-account"></i> 
                        <span>Login</span></a></li>
					<li class="dark"><a href="#" title="faq">
                        <i class="ico i-submitrecipe"></i> <span>FAQ</span></a></li>
				</ul>
			</nav>
		</div>
       
	</header>
	<!--//header-->
    <!--header-->
    
	<header class="head top-menu-bar" role="banner">
		<!--wrap--> 
        <div class="wrap clearfix full-width-menu bg-color">
			<nav class="main-nav submenu-margin menu-head" role="navigation" id="menu">
				<ul style="width:207%;">
                    <%--<li><span class="all-items location date"></span></li>--%>

                    <li class="header-menu-text"><span class="dropdown-menu-text hover-color">
                          <asp:Label ID="lblselecteddate" runat="server" Text="Pick Delivery Date"></asp:Label><asp:Label ID="lblselect" runat="server" Text="" Visible="false"></asp:Label>
                     
                        </span>
                        <ul>
							<li> <asp:LinkButton ID="btnfirst" runat="server" onclick="btnfirst_Click" CssClass="font-bold"></asp:LinkButton><asp:Label ID="lblfirstdate" runat="server" Text="" Visible="false"></asp:Label></li>

                            <li><asp:LinkButton ID="btnsecond" runat="server" onclick="btnsecond_Click" CssClass="font-bold"></asp:LinkButton><asp:Label ID="lblseconddate" runat="server" Text="" Visible="false"></asp:Label></li>

                            <li><asp:LinkButton ID="btnthird" runat="server" onclick="btnthird_Click" CssClass="font-bold"></asp:LinkButton><asp:Label ID="lblthirddate" runat="server" Text="" Visible="false"></asp:Label></li>

                            <li><asp:LinkButton ID="btnforth" runat="server" onclick="btnforth_Click" CssClass="font-bold"></asp:LinkButton><asp:Label ID="lblforthdate" runat="server" Text="" Visible="false"></asp:Label></li>

                            <li><asp:LinkButton ID="btnfifth" runat="server" onclick="btnfifth_Click" CssClass="font-bold"></asp:LinkButton><asp:Label ID="lblfifthdate" runat="server" Text="" Visible="false"></asp:Label></li>

                            <li><asp:LinkButton ID="btnsix" runat="server" onclick="btnsix_Click" CssClass="font-bold"></asp:LinkButton><asp:Label ID="lblsixdate" runat="server" Text="" Visible="false"></asp:Label></li>

                            <li><asp:LinkButton ID="btnseven" runat="server" onclick="btnseven_Click" CssClass="font-bold"></asp:LinkButton><asp:Label ID="lblsevendate" runat="server" Text="" Visible="false"></asp:Label></li>
						</ul>
                    </li>

                    <li class="header-menu-text"><span class="dropdown-menu-text hover-color"><asp:LinkButton ID="btnlocation" 
                            Text="Pick Your Location" runat="server" onclick="btnlocation_Click" style="color:#fff"></asp:LinkButton></span></li>

                    <li class="header-menu-text" style="padding-top:2%"><span class="dropdown-menu-text hover-color">
                    
                          <asp:Label ID="lbldishtypeid" runat="server" Text="" Visible="false"></asp:Label>
                          <asp:Label ID="lbldishname" runat="server" Text="All Items"></asp:Label>

                    </span>
                       <asp:Repeater ID="Repeaterdishtype" runat="server">
                             <HeaderTemplate> <ul> </HeaderTemplate>
                             <ItemTemplate><li><a title="" href="homepg.aspx?id=<%#Eval("Dish_Type_ID") %>&date=<% =this.lblselect.Text %>" class="left">
                            <asp:Image ID="Image3" runat="server" ImageUrl='<%# "UploadIcon/"+Eval("Icon")%>' CssClass="icon-image"></asp:Image>
                             <span class="menu-width"><%#Eval("Dish_Type") %></span></a></li></ItemTemplate>
                             <FooterTemplate></ul></FooterTemplate>
                       </asp:Repeater>
                      </li>
			    </ul>
            </nav>
        </div>
    </header>
	<!--//header-->
    
		
	<!--main-->
	<main class="main" role="main">
		<!--intro-->
		<div class="intro homepg-slider">
			<!--start-->
    <div id="ninja-slider">
        <div class="slider-inner">
            <ul>
                <li>
                    <a class="ns-img" href="templete/image/f1.jpg"></a>
                    <div class="caption">For Chef Who Love To Cook</div>
                </li>
                <li>
                    <a class="ns-img" href="templete/image/f2.jpg"></a>
                    <div class="caption">For Foody Who Love To Eat</div>
                </li>
                <li>
                    <a class="ns-img" href="templete/image/f3.jpg"></a>
                    <div class="caption">Lorem Lorem</div>
                </li>
                <li>
                    <a class="ns-img" href="templete/image/f4.jpg"></a>
                    <div class="caption">Lorem Lorem</div>
                </li>
            </ul>
            <%--<div class="navsWrapper">
                <div id="ninja-slider-prev"></div>
                <div id="ninja-slider-next"></div>
            </div>--%>
        </div>
    </div>
    <!--end-->
			

		</div>
		<!--//intro-->
		
		<!--wrap-->
		 <UserInformation:DishListing id="UserInformation" runat="server"/>  
		<!--//wrap-->
	</main>
	<!--//main-->
	<!--footer-->
     
	<footer class="foot" role="contentinfo">
		<div class="wrap clearfix">
			<div class="row">
				<article class="one-half">
					<h5>About Cook'dIn Community</h5>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed 
diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat
 volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci.</p>
				</article>
				<article class="one-fourth">
					<h5>Need help?</h5>
					<p>Contact us via phone or email</p>
					<p><em>T:</em>  +91 960 160 5233<br><em>E:</em>  <a href="#">support@cookedin.com</a></p>
				</article>
				<article class="one-fourth">
					<h5>Follow us</h5>
					<ul class="social">
						<li class="facebook"><a href="https://www.facebook.com/cookedin?_rdr=p" title="facebook">facebook</a></li>
						<li class="twitter"><a href="https://twitter.com/Cookdin" title="twitter">twitter</a></li>
                        <li class="instagram"><a href="https://www.instagram.com/cookdin/" title="instagram">Instagram</a></li>
					</ul>
				</article>
				
				<div class="bottom">
					<p class="copy">Copyright 2016 Cook'dIn. All rights reserved</p>
					
					<nav class="foot-nav">
						<ul>
							<li><a href="home.aspx" title="Home">Home</a></li>
							<%--<li><a href="#" title="Search for recipes">Search for dishes</a></li>
							<li><a href="Login.aspx" title="Login">Login</a></li>	
                            <li><a href="signup.aspx" title="Register">Register</a></li>--%>
						</ul>
					</nav>
				</div>
			</div>
		</div>

        


	</footer>
	<!--//footer-->
	
	<!--preloader-->
	<div style="display: none;" class="preloader">
		<div class="spinner"></div>
	</div>
	<!--//preloader-->
	
	<%--<script src="SocialChef_files/jquery-1.js"></script>
	<script src="SocialChef_files/jquery_002.js"></script>
	<script src="SocialChef_files/wow.js"></script>
	<script src="SocialChef_files/jquery.js"></script>
	<script src="SocialChef_files/scripts.js"></script>--%>
	<script>
	    window.dynamicNumbersBound = false;
	    var wow = new WOW();
	    WOW.prototype.show = function (box) {
	        wow.applyStyle(box);
	        if (typeof box.parentNode !== 'undefined' && hasClass(box.parentNode, 'dynamic-numbers') && !window.dynamicNumbersBound) {
	            bindDynamicNumbers();
	            window.dynamicNumbersBound = true;
	        }
	        return box.className = "" + box.className + " " + wow.config.animateClass;
	    };
	    wow.init();

	    function hasClass(element, cls) {
	        return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
	    }

	    function bindDynamicNumbers() {
	        $('.dynamic-number').each(function () {
	            var startNumber = $(this).text();
	            var endNumber = $(this).data('dnumber');
	            var dynamicNumberControl = $(this);

	            $({ numberValue: startNumber }).animate({ numberValue: endNumber }, {
	                duration: 4000,
	                easing: 'swing',
	                step: function () {
	                    $(dynamicNumberControl).text(Math.ceil(this.numberValue));
	                }
	            });
	        });
	    }
		
	</script>

       
    </form>
</body>
<%--</body>--%>
</html>
