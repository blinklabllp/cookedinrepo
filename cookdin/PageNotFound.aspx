<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageNotFound.aspx.cs" Inherits="PageNotFound" %>

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
	
   

     <link href="templete/css/ninja-slider.css" rel="stylesheet" type="text/css" />
    <script src="templete/js/ninja-slider.js" type="text/javascript"></script>


	<script>	    new WOW().init();</script>


     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type = "text/javascript"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type = "text/javascript"></script> 
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel = "Stylesheet" type="text/css" /> 


	<link rel="stylesheet" href="templete/css/style.css">
	<link rel="stylesheet" href="templete/css/animate.css">
	<link href="templete/css/css.css" rel="stylesheet">
	<link rel="shortcut icon" href="templete/image/favicon.png">
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
</head>
<body  class="home remove-margin landlingpg-bg">
    <main class="main main-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			<div class="row">
				<!--right sidebar-->
				<aside class="sidebar one-third" style="visibility: visible;">
					<div class="widget">
                        <a href="homepg.aspx"  title="cookd'IN" class="logo-landingpg"><img src="templete/image/logo.png" alt="cook'dIN logo"></a>
						
					</div>
				</aside>
				<!--//right sidebar-->
                <section class="content two-third" style="visibility: visible;">
					<!--one-half-->
					<section class="container">
						<h1>Oops! Since You Are Very Hungry , You Have Lost Your Way </h1>
                        <h2>You Can Go To Home Page or Search Here </h2>
                        <div class="f-row">
							<a class="button" href="homepg.aspx">Go TO HomePage</a>
                        </div>
                        
					</section>
					<!--//one-half-->
				</section>
				<!--//content-->
				
				
			</div>
		</div>
		<!--//wrap-->
	</main>
	<!--//main-->
	<script src="templete/js/jquery-1.js"></script>
	<script src="templete/js/jquery_002.js"></script>
	<script src="templete/js/wow.js"></script>
	<script src="templete/js/jquery.js"></script>
	<script src="templete/js/scripts.js"></script>
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

</body>
</body>
</html>
