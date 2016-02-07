<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="areaswework.aspx.cs" Inherits="areaswework" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <main role="main" class="main main-padding">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a title="Home" href="#">Home</a></li>
					<li>Lorem</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
        <section class="content">
			<!--row-->
			<div class="row">
				<header class="s-title wow fadeInLeft animated" style="visibility: visible; animation-name: fadeInLeft;">
					<h1>Area We Work</h1>


                    <asp:Panel ID="pnlfailer" runat="server" Visible="false">
     <div class="row">
         <div class="full-width wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
             <div role="alert" class="alert alert-danger"><asp:Label ID="Label3" runat="server" Text="Sorry we are not available in your Area yet. You can sign up our newsletter to be kept updated on when we are available in your Area. "></asp:Label></div>
         </div>
    </div>
 </asp:Panel>
               <asp:Panel ID="pnlsuccess" runat="server" Visible="false">
     <div class="row">
         <div class="full-width wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
             <div role="alert" class="alert alert-success"><asp:Label ID="Label4" runat="server" Text="we are available in your Area. You can sign up our newsletter to be kept updated on when we are available in your Area. "></asp:Label></div>
         </div>
    </div>
 </asp:Panel>
			</header>
    <div class="full-width wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
		<div class="container">
        <table align="center">
            <tr>
            <td>State</td>
            <td class="form-dropdown"><asp:DropDownList ID="ddlstate" runat="server" 
                    Width="100%" AutoPostBack="True" 
                    onselectedindexchanged="ddlstate_SelectedIndexChanged"></asp:DropDownList></td>
            </tr>
            <tr>
            <td>City</td>
            <td class="form-dropdown"><asp:DropDownList ID="ddlcity" runat="server" 
                    Width="100%" AutoPostBack="True" 
                    onselectedindexchanged="ddlcity_SelectedIndexChanged"></asp:DropDownList></td>
            </tr>
        </table>
			</div>
	</div>
    </section>
    </div>
    </main>
</div>


    </ContentTemplate>
    </asp:UpdatePanel>
 
</asp:Content>

