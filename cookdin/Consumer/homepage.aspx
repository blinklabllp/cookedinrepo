﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="homepage.aspx.cs" Inherits="Consumer_homepage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>




<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="keywords" content="COOK'DIN">
	<meta name="description" content="COOK'DIN">
	<meta name="author" content="COOK'DIN">
	
	<title><%= Page.Title %></title>
	
    <script src="../templete/js/jquery-1.js"></script>
	<script src="../templete/js/jquery_002.js"></script>
	<script src="../templete/js/wow.js"></script>
	<script src="../templete/js/jquery.js"></script>
	<script src="../templete/js/scripts.js"></script>

     <link href="../templete/css/ninja-slider.css" rel="stylesheet" type="text/css" />
     
    <script src="../templete/js/ninja-slider.js" type="text/javascript"></script>
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

<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o),
  m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-73185015-1', 'auto');
    ga('send', 'pageview');

</script>
		
	<script>	    new WOW().init();</script>


 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type = "text/javascript"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type = "text/javascript"></script> 
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel = "Stylesheet" type="text/css" />
<link rel="stylesheet" href="../templete/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="../templete/css/style.css">
<link rel="stylesheet" href="../templete/css/animate.css">
<link href="../templete/css/css.css" rel="stylesheet">
<link rel="shortcut icon" href="../templete/image/favicon.png">
	
      <%--for popup at page load--%>
   <%--  <link rel="stylesheet" href="templete/css/main.css">--%>
      <link href="../templete/css/radiocss.css" rel="stylesheet" type="text/css" />
   
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script> 
<script src="templete/js/main.js"></script>--%>
  <%--for popup at page load--%>

  <style type="text/css">
        body
        {
            
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
            background-image: url(../images/Star.gif);
            height: 17px;
            width: 17px;
        }
        .WaitingStar
        {
            background-image: url(../images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }
        .FilledStar
        {
            background-image: url(../images/FilledStar.gif);
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
          <!-- Removing container popup-width -->
			    <div class="modal-pop">
                    <div class="modal-pop-content">
                        
                        <div class="form-dropdown1-popup-area">  
                        <asp:Label runat="server" ID="poptitletext" class="pop-up-title" Text="Please select your location"></asp:Label>
                        <asp:DropDownList ID="ddlarea" runat="server"  onselectedindexchanged="ddlarea_SelectedIndexChanged" AutoPostBack="True"> </asp:DropDownList>
                        </div>
                    </div>
               </div>
          </section>
        </div>

</asp:Panel>
    <!--header-->
     <div id="sticky-anchor"></div>
	<header class="head header-sticky" role="banner" id="sticky">
		<!--wrap--> 
        
		<div class="wrap clearfix full-width-menu">
			<a href="homepage.aspx"  title="cookd'IN" class="logo"><img src="../templete/image/logo.png" alt="cook'dIN logo"></a>
			
			<nav class="main-nav" role="navigation" id="menu">
					<ul>
                  
					<li><a href="MyProfile.aspx" title="Profile"><span>Profile</span></a>
                        <ul><li><a href="EditProfile.aspx" title="My Dishes">Edit Profile</a></li></ul>
                    </li>
                    <li><a href="OrderList.aspx" title="My Orders"><span>My Orders</span></a></li>
					<li><a href="../support.aspx" title="Support"><span>Support</span></a></li>					
                </ul>
			</nav>
			<nav class="user-nav" role="navigation">
				<ul>
                    <li class="light"><a href="Logout.aspx" title="">
                        <i class="ico i-logout"></i> <span>Logout</span></a>
                    </li>
					<li class="medium"><a href="MyCart.aspx" title=""><i class="ico i-cart"></i> 
                        <span>Cart <asp:Label ID="lblcartcount" runat="server" Text=""></asp:Label></span></a></li>
					<li class="dark"><a href="#" title=""><i class="ico i-account"></i> 
                        <asp:Label ID="lblusername" runat="server" Text=""></asp:Label></a></li>
                   
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
                             <span class=""><%#Eval("Dish_Type") %></span></a></li></ItemTemplate>
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
                    <a class="ns-img" href="../templete/image/f1.jpg"></a>
                    <div class="caption">HomeChef's showcase your culinary skills.</div>
                </li>
                <li>
                    <a class="ns-img" href="../templete/image/f2.jpg"></a>
                    <div class="caption">Food lovers expand your taste buds.</div>
                </li>
                <li>
                    <a class="ns-img" href="../templete/image/f3.jpg"></a>
                    <div class="caption">From Memories to Munchies</div>
                </li>
                <li>
                    <a class="ns-img" href="../templete/image/f4.jpg"></a>
                    <div class="caption">Tasty, Afforable, HomeCooked...!</div>
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
		<div class="wrap clearfix">
			<!--row-->
			<div class="row">
				<header style="visibility: visible; animation-name: fadeInLeft;" class="s-title">
					<!--<h1>Recipes</h1>-->
				</header>
				<!--content-->
            
                <section class="content full-width" style="visibility: visible; animation-name: fadeInUp;">
                <div class="entries row">
               <asp:Repeater ID="Repeaterdish" runat="server">
                <HeaderTemplate> </HeaderTemplate>
                <ItemTemplate>
                 <div style="visibility: visible; animation-name: fadeInLeft;" class="entry one-fourth">
                	<figure>
							<header class="s-title"><%--<img src="templete/image/sveg.png" class="meal-type-img"/>--%>
                             <asp:Image ID="ImgIsVeg" runat="server" ImageUrl="~/templete/image/sveg.png" class="meal-type-img"></asp:Image></header>
                                 <asp:Image ID="Image1" class="prod-img" runat="server" ImageUrl='<%# "../dishphotoupload/"+Eval("Dish_Image")%>'></asp:Image>
								<figcaption>
                                    <a href='ViewDish.aspx?did=<%# EncryptString(Eval("Dish_ID").ToString()) %>'>
                                                 <i class="ico i-chef-img hover-dish"> <asp:Image ID="Image2" CssClass="img-dish-list" runat="server" ImageUrl='<%# "../Profile_Photo/"+Eval("Photo")%>' alt="" style="border-radius: 50%"></asp:Image> </i>
                                                 <span>Chef <%#Eval("fullname")%></span> 
                                                 <span class="normal-font"><%#Eval ("Area") %></span>
                                                 <span class="normal-font"><asp:Rating ID="ChefRating" runat="server"   StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"  FilledStarCssClass="FilledStar" ReadOnly="true"></asp:Rating></span>
                                    </a>
                                 </figcaption>
							</figure>
							<div class="container dish-name">
								  <h2 class="normal-font"><a href='ViewDish.aspx?did=<%# EncryptString(Eval("Dish_ID").ToString()) %>'> 
                                    <%#Eval("Dish_Name").ToString().Length <= 20 ? Eval("Dish_Name") : Eval("Dish_Name").ToString().Substring(0, 20)+ "..."%></a>
                                  <!-- ToDo: Add a condtion to hide icon if no icon is available -->
                                  <%--<img src='<%# "UploadIcon/"+Eval("Icon")%>' class="veg-icon" />--%> 
                                  <span title="veg" class="veg-icon"></span> </h2>
                                   
                                <div class="actions">
									<div>
										     <div class="comments"><asp:Rating ID="DishRating" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar" ReadOnly="true"></asp:Rating></div>
                                             <span class="price-text-new normal-font"><asp:Label ID="lblOfferPrice" runat="server" Text='<%# "&#x20B9;" + Eval("SpecialOfferPrice")%>'></asp:Label></span>
                                              
                                            <span class="price-text-new normal-font"><asp:Label ID="lblPrice" runat="server" Text='<%#"&#x20B9;" + Eval ("Price") %>'></asp:Label></span>
                                             <%--<div class="comments"><i class="ico i-comments"></i> <a href="#"><%#Eval("Diet_Type")%></a></div>--%>
									</div>
								</div>
                             </div>
                            <div>
								<a class="button full-width" href='ViewDish.aspx?did=<%# EncryptString(Eval("Dish_ID").ToString()) %>'>View More</a>


        <%--              <a href='Login.aspx?id=<%#HttpUtility.UrlEncode(Encrypt(Eval("Dish_ID").ToString()))%>' style="text-decoration:none">nnnnn </a>--%>
    					</div>
                           <asp:Label ID="lblOfferStartDate" runat="server" Text='<%#Eval("OfferStartDate")%>' Visible="false"></asp:Label>
                           <asp:Label ID="lblOfferEndDate" runat="server" Text='<%#Eval("OfferEndDate")%>' Visible="false"></asp:Label>
                            <asp:Label ID="lblChefID" runat="server" Text='<%#Eval("Chef_ID")%>' Visible="false"></asp:Label>
                           <asp:Label ID="lblDishID" runat="server" Text='<%#Eval("Dish_ID")%>' Visible="false"></asp:Label>
                            <asp:Label ID="lblISVeg" runat="server" Text='<%#Eval("Is_Veg")%>' Visible="false"></asp:Label>
                            </div>
               
                      
                </ItemTemplate>
                <FooterTemplate>
               
                </FooterTemplate>
                </asp:Repeater>
               <%-- </asp:DataList>--%>
			        
                </div>
                </section>

             </div>
			<!--//right sidebar-->
		</div>
		<!--//wrap-->
	</main>
	<!--//main-->
	<!--footer-->
     
	<footer class="foot" role="contentinfo">
		<div class="wrap clearfix">
			<div class="row">
				<article class="one-half">
					<h5>About Cook'dIn </h5>
					<p>Cook'dIn is an online food discovery platform for foodies and a marketplace for HomeChef's to show case their culinary skills.</p>
				</article>
				<article class="one-fourth">
					<h5>Need help?</h5>
					<p>Contact us via phone or email.</p>
					<p><em>T:</em>  +91 960 160 5233<br><em>E:</em>  <a href="#">support@cookedin.com</a></p>
				</article>
				<article class="one-fourth">
					<h5>Follow us</h5>
					<ul class="social">
											<li class="facebook"><a href="https://www.facebook.com/cookedin?_rdr=p" title="facebook" target="_blank">facebook</a></li>
						<li class="twitter"><a href="https://www.twitter.com/Cookdin" title="twitter" target="_blank">twitter</a></li>
                        <li class="instagram"><a href="https://www.instagram.com/cookdin/" title="instagram" target="_blank">Instagram</a></li>
					</ul>
				</article>
				
				<div class="bottom">
					<p class="copy">Copyright 2016 Cook'dIn. All rights reserved</p>
					
					<nav class="foot-nav">
						<ul>
							<li><a href="homepage.aspx" title="Home">Home</a></li>
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
