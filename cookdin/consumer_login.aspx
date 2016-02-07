<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="consumer_login.aspx.cs" Inherits="consumer_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section style="visibility: visible;" class="content center full-width">
					<div class="modal container">
						<h3>Login For Foody</h3>
						<div class="f-row">
							<asp:TextBox ID="txtusername" runat="server" placeholder="Your username"></asp:TextBox>
						</div>
						<div class="f-row">
							<asp:TextBox ID="txtPassword" runat="server" placeholder="Your Password" TextMode=Password></asp:TextBox>
						</div>
						<div class="f-row bwrap">
							<asp:Button ID="btnlogin" runat="server" Text="login" onclick="btnlogin_Click"></asp:Button>
						</div>
						<%--<p><a href="#">Forgotten password?</a></p>--%>
						<p>Dont have an account yet? <a href="consumer_signup.aspx">Sign up.</a></p>
					</div>
                   
                </section>
</asp:Content>

