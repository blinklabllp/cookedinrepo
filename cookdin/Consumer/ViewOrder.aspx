<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="ViewOrder.aspx.cs" Inherits="Consumer_ViewOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <main class="main main-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a title="Home" href="index.html">Home</a></li>
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
						<span class="order-text">Order No: <asp:Label ID="lblordernumber" runat="server" Text=""></asp:Label></span>
                        <span class="order-text" style="float: right">Order Place Date: <asp:Label ID="lblorderdate" runat="server" Text=""></asp:Label></span>
					</section>
					<!--//one-half-->
				</section>
				<!--//content-->
                <!--content-->
				<section class="content three-fourth" style="visibility: visible; animation-name: fadeInLeft;">
					<!--one-half-->
					<section class="container">
					    <div class="f-row">
                          <div class="checkout-title">
                            <asp:DataList ID="DataList1" runat="server" >
       <HeaderTemplate>
                            <table class="table table-striped table-bordered bootstrap-datatable datatable">
                            <tr>
                                <td align="center">Item</td>
                                <td align="center">Dish</td>
                                <td align="center">Date & Time</td>
                                <td align="center">Qty</td>
                                <td align="center">Total Price</td>
                            </tr>
                            <tr><td colspan="7"><div style="height:1px; background-color:gray" id="devider"></div> </td></tr>
                        </div>
                        <div class="order-group">
                        <div class="checkout-content">
                        </div>
                        </HeaderTemplate>
                         <ItemTemplate>
                            <tr>
                            <td align="center">
								<img src='<%# "../dishphotoupload/"+Eval("Dish_Image")%>' alt="" class="dish-image-square">
                            </td>
                            <td align="center">
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="small" 
                                Text='<%#Eval("Dish_Name") %>'></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="Label8" runat="server" Font-Size="Small" ForeColor="#999999" 
                                    Text='<%# "Deliver By:" +Eval("DeliveryDate", "{0:M-dd-yyyy}") %>'></asp:Label>
                                <asp:Label ID="Label3" runat="server" Font-Size="Small" ForeColor="#999999" 
                                    Text='<%#Eval("Slot") %>'></asp:Label>
                            </td>
                            <td align="center">
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Qty") %>' 
                                    ></asp:Label>
                            </td>
                            <td align="center">
                                 <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("totPrice") %>'></asp:Label>
                                <asp:Label ID="lblUnitPrice" runat="server" Text='<%#Eval("price") %>' 
                                    Visible="false"></asp:Label>
                            </td>
                            </tr>
                             </ItemTemplate>
                             <FooterTemplate>
                        </table>
                        </FooterTemplate>
                         </asp:DataList>
                        </div>
                        </div>
                        </div>
					</section>
					<!--//one-half-->
				</section>
				<!--//content-->
				<!--right sidebar-->
				<aside class="sidebar one-fourth" style="visibility: visible;">
					<div class="widget">
						<h3>Delivery Address</h3>
                            <div>
                                <b><asp:Label ID="lblconsumnername" runat="server" Text=""></asp:Label></b></div>
                                <asp:Label ID="lblAddressID" runat="server" Text="" Visible="false" CssClass="order-text"></asp:Label>
                                <asp:Label ID="lblmobileno" runat="server" Text="" Visible="false" CssClass="order-text"></asp:Label>
                                <div class="address"><asp:Label ID="lblBlockNo" runat="server" Text="" CssClass="order-text"></asp:Label> -
                                <asp:Label ID="lblhouseno" runat="server" Text="" CssClass="order-text"></asp:Label>,
                            </div>
                            <div class="address"><asp:Label ID="lblsociatyname" runat="server" Text="" CssClass="order-text"></asp:Label>,</div>
                            <div class="address"><asp:Label ID="lbllandmark" runat="server" Text="" CssClass="order-text"></asp:Label>,</div>
                            <div class="address"><asp:Label ID="lblcity" runat="server" Text="" CssClass="order-text"></asp:Label> - 
                            <asp:Label ID="lblpincode" runat="server" Text="" CssClass="order-text"></asp:Label></div>
                            <div></div>
                    </div>
					<div class="widget">
						<div class="widget nutrition">
						<h3>Payment Summary</h3>
						<table>
							<tbody>
                            <tr>
								<td>Order Total</td>
								<td>Rs.<asp:Label ID="lblTotalAmt" runat="server" Text="0" Visible="true"></asp:Label></td>
							</tr>
							<tr>
								<td>Shipping</td>
								<td><asp:Label ID="lblDelivery" runat="server" Text="0" Visible="true"></asp:Label> </td>
							</tr>
							<tr>
								<td>TAX 12%</td>
								<td>Rs.<asp:Label ID="lblTax" runat="server" Text="0" Visible="true"></asp:Label></td>
							</tr>
							<tr>
								<td>Discount </td>
								<td>Rs.<asp:Label ID="lblDiscount" runat="server" Text="0" Visible="true"></asp:Label> </td>
							</tr>
                            <tr>
								<td>Payable Amount</td>
								<td>Rs.<asp:Label ID="lblFinalTotal" runat="server" Text="0" Visible="true"></asp:Label> </td>
							</tr>
						</tbody></table>
					</div>
                    <asp:Button ID="btnCheckOut" runat="server" Text="Continue Ordering"  
                            class="button full-width"></asp:Button>
                  </div>
				</aside>
            <!--//right sidebar-->
			</div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>                
</asp:Content>

