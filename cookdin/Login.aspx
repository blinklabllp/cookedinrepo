<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <main class="main" role="main">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			    <section class="">
                <div class="col-lg-12">
                    <div class="col-lg-4"></div>
					<div style="visibility: visible;" class="one-third col-lg-5">
						<nav class="tabs tabs-width login-tabs">
							<ul>
								<li class="active"><a href="#cheflogin" title="Chef Login">Chef Login</a></li>
								<li class=""><a href="#consumerlogin" title="Consumer Login">Consumer Login</a></li>
							</ul>
						</nav>
						
						<!--about-->
						<div style="display: Block;" class="tab-content container one-third" id="cheflogin">
							<div class="row">
							<div class="center col-lg-12">
                            <asp:Panel ID="pnlwarning" runat="server" Visible="false">
                             <div class="row">
                                 <div class="full-width wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                                     <div role="alert" class="alert alert-danger"><asp:Label ID="lblwarningmessage" runat="server" ></asp:Label></div>
                                 </div>
                            </div>
                         </asp:Panel>
						        <h3>Login as a Chef</h3>
						        <div class="f-row">
                                    <asp:TextBox ID="txtusername" runat="server" placeholder="Your username"></asp:TextBox>
						        </div>
						        <div class="f-row">
                                <asp:TextBox ID="txtPassword" runat="server" placeholder="Your Password" TextMode=Password></asp:TextBox>
						        </div>
						        <div class="f-row bwrap">
                                    <asp:Button ID="Button1" runat="server" Text="login" onclick="btnlogin_Click"></asp:Button>
						        </div>
                                 <p>Don’t have an account yet? <a href="Signup.aspx">Signup Now!</a></p>
					        </div>
							</div>
						</div>
						<!--//about-->
					<!--my posts-->
						<div style="display: Block;" class="tab-content container one-third" id="consumerlogin">
							<!--entries-->
							<div class="row">
							<div class="center col-lg-12">
                                <h3>Login as a Consumer</h3>
						        <div class="f-row">
                                    <asp:TextBox ID="txtconsumerusername" runat="server" placeholder="Your username"></asp:TextBox>
						        </div>
						        <div class="f-row">
                                <asp:TextBox ID="txtconsumerpassword" runat="server" placeholder="Your Password" TextMode="Password"></asp:TextBox>
						        </div>
						        <div class="f-row bwrap">
                                    <asp:Button ID="btnconsumerlogin" runat="server" Text="login" 
                                        onclick="btnconsumerlogin_Click"></asp:Button>
						        </div>
                                 <p>Don’t have an account yet? <a href="consumer_signup.aspx">Signup Now!</a></p>
                                  
					        </div>
					        </div>
							</div>
							<!--//entries-->
						</div>
						<!--//my posts-->
                	</div>
</div>
</section>
</div>
</main>
<script src="templete/js/jquery-1.js"></script>
	<script src="templete/js/jquery_002.js"></script>
	<script src="templete/js/wow.js"></script>
	<script src="templete/js/jquery.js"></script>
	<script src="templete/js/scripts.js"></script>
    <script>        new WOW().init();</script>
</asp:Content>

