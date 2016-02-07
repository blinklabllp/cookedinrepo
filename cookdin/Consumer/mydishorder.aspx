<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="mydishorder.aspx.cs" Inherits="Consumer_mydishorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <main role="main" class="main main-padding">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a title="Home" href="#">Home</a></li>
					<li>Order Details</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
			
			<!--row-->
			<div class="">
				<!--content-->
				<section class="content three-fourth" style="visibility: visible;">
					<!--one-half-->
                    <section class="container" style="padding-bottom: 17px;">
						<h1>Thank You! Your Order Has Been Received.</h1>
                    </section>
					<!--//one-half-->
				</section>
				<!--//content-->
                <!--content-->
				<section class="content three-fourth" style="visibility: visible;">
					<!--right sidebar-->
				<aside class="" style="visibility: visible; animation-name: fadeInRight;">
					<div class="widget">
						<div class="widget nutrition">
						<h3>Order Details</h3>
						<table>
							<tbody>
                            <tr>
								<td>Order No</td>
								<td><asp:Label ID="lblordernumber" runat="server" Text="Label"></asp:Label></td>
							</tr>
							<tr>
								<td>Order Place Date</td>
								<td><asp:Label ID="lblorderdate" runat="server" Text="Label"></asp:Label></td>
							</tr>
							<tr>
								<td>Order Delivery Date</td>
								<td><asp:Label ID="lbldeliverydate" runat="server" Text="Label"></asp:Label></td>
							</tr>
							<tr>
								<td>Payment Method</td>
								<td>Cash On Delivery<asp:Label ID="Label13" runat="server" Text="0" Visible="true"></asp:Label> </td>
							</tr>
                            <tr>
								<td>Total</td>
								<td>Rs.<asp:Label ID="lbltotalprice" runat="server" Text="Label"></asp:Label></td>
							</tr>
						</tbody></table>
					</div>
                  </div>
				</aside>
            <!--//right sidebar-->
				</section>
				<!--//content-->
				<!--right sidebar-->
				<aside class="sidebar one-fourth" style="visibility: visible;">
					<div class="widget">
						<div class="widget nutrition">
						<h3>Billing Address</h3>
						<table>
							<tbody>
                            <tr>
								<td>Name</td>
								<td><asp:Label ID="lblconsumnername" runat="server" Text="Label"></asp:Label></td>
							</tr>
							<tr>
								<td>Contact No</td>
								<td><asp:Label ID="lblmobileno" runat="server" Text="Label"></asp:Label> </td>
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
								<td><asp:Label ID="lbllandmark" runat="server" Text="Label"></asp:Label></td>
							</tr>
                            <tr>
								<td></td>
								<td><asp:Label ID="lblcity" runat="server" Text="Label"></asp:Label> </td>
							</tr>
						</tbody></table>
					</div>
                   <asp:Button ID="btnViewOrder" runat="server" Text="View Order" 
                                   class="button full-width" onclick="btnViewOrder_Click"></asp:Button>
                  </div>
				</aside>
            <!--//right sidebar-->
			</div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>

</asp:Content>

