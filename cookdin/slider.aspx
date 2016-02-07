<%@ Page Language="C#" AutoEventWireup="true" CodeFile="slider.aspx.cs" Inherits="slider" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- bxSlider Javascript file -->
    <script src="templete/bxslider/jquery.bxslider.min.js"></script>
    <!-- bxSlider CSS file -->
    <link href="templete/bxslider/jquery.bxslider.css" rel="stylesheet" />
    <script>
        jQuery(document).ready(function ($) {
            $('#bxs').bxSlider({
                pager: false,
                auto: true
            });
        });
    </script>
</head>
<body>
   
    <div>
        <ul class="bx1" id="bxs">
            <li><img src="templete/image/avatar1.jpg" /></li>
            <li><img src="templete/image/avatar2.jpg" /></li>
            <li><img src="templete/image/avatar3.jpg" /></li>
            <li><img src="templete/image/avatar4.jpg" /></li>
            <li><img src="templete/image/avatar5.jpg" /></li>
        </ul>
    </div>
    
</body>
</html>
