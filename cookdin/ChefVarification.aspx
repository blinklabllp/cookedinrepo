<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChefVarification.aspx.cs" Inherits="Sucess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <main class="main " role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			<!--row-->
            <asp:Panel ID="Panel1" runat="server" Visible="false">
			<div class="row top-padding">
				<header style="visibility: visible; animation-name: fadeInLeft;" class="s-title wow fadeInLeft animated">
	                <h1><asp:Label ID="lbldishname" runat="server" Text="Your Varification is Sucessfully done."></asp:Label></h1>
				</header>
                </div>
                </asp:Panel>
                 <asp:Panel ID="Panel2" runat="server" Visible="false">
			<div class="row top-padding">
				<header style="visibility: visible; animation-name: fadeInLeft;" class="s-title wow fadeInLeft animated">
	                <h1><asp:Label ID="Label1" runat="server" Text="You can not varify. Please Try again"></asp:Label></h1>
				</header>
                </div>
                </asp:Panel>
                </div>
                </main>
    
</asp:Content>

