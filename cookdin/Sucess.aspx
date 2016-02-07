<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sucess.aspx.cs" Inherits="Sucess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<script type = "text/javascript" >

    function preventBack() { window.history.forward(); }

    setTimeout("preventBack()", 0);

    window.onunload = function () { null };

</script>


    <main class="main " role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			<!--row-->
			<div class="row top-padding">
				<header style="visibility: visible; animation-name: fadeInLeft;" class="s-title wow fadeInLeft animated">
	                <h1><asp:Label ID="lbldishname" runat="server" Text="Your Registration is Sucessfully done."></asp:Label></h1>
				</header>
                </div>
                </div>
                </main>
    
</asp:Content>

