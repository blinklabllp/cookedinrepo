<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="dishorder.aspx.cs" Inherits="Consumer_dishorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<main class="main" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			<!--breadcrumbs-->
			<%--<nav class="breadcrumbs">
				<ul>
					<li><a href="http://www.themeenergy.com/themes/html/social-chef/index.html" title="Home">Home</a></li>
					<li>Page</li>
				</ul>
			</nav>--%>
			<!--//breadcrumbs-->
			
			<!--row-->
			<div class="row">
				<header style="visibility: visible;" class="s-title">
					<!--<h1></h1>-->
				</header>
				<!--content-->
				<section style="visibility: visible;" class="content full-width">
					<!--one-half-->
					<section class="container">
						<h3>Thank You ! Your Order has been received.</h3>
                                                <div class="">
                                                    <div class="widget nutrition width-widget-order">
                                                        <h3>Order Details</h3>
						<table>
							<tbody>
                                                        <tr>
							                                     <td><h3>Order No : <asp:Label ID="lblordernumber" runat="server" Text="Label"></asp:Label></h3></td>
                                                                <td><h3>Order Place Date : <asp:Label ID="lblorderdate" runat="server" Text="Label"></asp:Label></h3></td>
                                                        </tr>
                                                        <tr>
								<td><h3></h3></td>
                                                                <td><h3>Order Delivery Date : <asp:Label ID="lbldeliverydate" runat="server" Text="Label"></asp:Label></h3></td>
							</tr>
							<%--<tr>
								                                <td><asp:Label ID="lbldishname" runat="server" Text="Label"></asp:Label></td>
                                                                <td><asp:Label ID="lbldishprice" runat="server" Text="Label"></asp:Label></td>
							</tr>--%>
							<tr>
								<td>PAYMENT METHOD</td>
                                                                <td>CASH ON DELIVERY</td>
							</tr>
							<tr>
								<td>TOTAL</td>
                                                                <td><asp:Label ID="lbltotalprice" runat="server" Text="Label"></asp:Label></td>
							</tr>
						</tbody></table>
                                                </div>
                                                </div>
                                                <div class="widget nutrition width-widget-address">
                                                    <h3>Billing Address</h3>
						<table>
							<tbody>
                                                        <tr>
								                                <td>Name</td>
                                                                <td><asp:Label ID="lblconsumnername" runat="server" Text="Label"></asp:Label></td>
							</tr>
							<tr>
								                                <td>Contact No</td>
                                                                <td><asp:Label ID="lblmobileno" runat="server" Text="Label"></asp:Label></td>
							</tr>
                                                        <tr>
								                                <td>Address</td>
                                                                <td><asp:Label ID="lblhouseno" runat="server" Text="Label"></asp:Label></td>
							</tr>
                                                        <tr>
								<td></td>
                                                                <td><asp:Label ID="lblsociatyname" runat="server" Text="Label"></asp:Label></td>
							</tr>
                                                        <tr>
								<td></td>
                                                                <td><asp:Label ID="lblcity" runat="server" Text="Label"></asp:Label></td>
							</tr>
                                                        <tr>
								<td></td>
                                                                <td><asp:Label ID="lbllandmark" runat="server" Text="Label"></asp:Label></td>
							</tr>
							<tr><td><asp:Button ID="btnViewOrder" runat="server" Text="View Order" 
                                    onclick="btnViewOrder_Click"></asp:Button></td>
                            </tr>
						</tbody></table>
                                                </div>
                                                
					</section>
					<!--//one-half-->
				</section>
				<!--//content-->
			</div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>
</asp:Content>

