<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="test1.aspx.cs" Inherits="Consumer_test1" %>

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
						<table>
							<tbody>
                            <tr>
                                <td colspan="3">
                                    <asp:Label ID="Label21" runat="server" Text="Chef" ForeColor="#999999" Font-Size="Small" Font-Bold="True"></asp:Label>
                                    <asp:Label ID="Label22" runat="server" Text='<%#Eval("Chef_UserName") %>' Font-Bold="True" Font-Size="small"></asp:Label>
                                </td>
                                <td>
                                      <asp:Label ID="Label13" runat="server" Text="Rating"></asp:Label>
                                </td>
                            </tr>
							<tr>
                                <td rowspan="3">
                                <div class="members"> 
                                    <ul class=""> 
                                        <div class="avatar">
                                            <a href="">
                                                <img src='<%# "../Chef/upload/"+Eval("Dish_Image")%>' alt="" class="dish-image-square">
                                            </a>
                                        &nbsp;</div>
                                    </ul>
                                </div>
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("Dish_Name") %>' Font-Bold="True" Font-Size="small"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Shipping :Rs" ForeColor="#999999" Font-Size="Small"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblDelivery" runat="server" Text="0" ForeColor="#999999" Font-Size="Small"></asp:Label>
                                </td>
                                <td >
                     
                                </td>
                                <td>
                                    Dish Price :Rs. <asp:Label ID="lblUnitPrice" runat="server" Text='<%#Eval("price") %>'  ></asp:Label>
                                </td>
							</tr>
                            <tr>
                                <td>
                                        <asp:Button ID="Button1" runat="server" Text="-" CssClass="qtyBtn" CommandName="Minus"></asp:Button>
                                        <span class="qty-text"><asp:Label ID="lblqty" runat="server" Text='<%#Eval("Qty") %>'></asp:Label></span>
                                        <asp:Button ID="Button2" runat="server" Text="+" CssClass="qtyBtn addBtn plus" CommandName="Plus"></asp:Button>
                                </td>
                                <td>
                                        <asp:Label ID="Label8" runat="server" Text='<%# "Deliver Slot:" +Eval("Order_Date", "{0:M-dd-yyyy}") %>' ForeColor="#999999" Font-Size="Small"></asp:Label><br />
                                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("Slot") %>' ForeColor="#999999" Font-Size="Small"></asp:Label>
                                </td>
                                <td colspan="2" style="padding: 0; margin: 0;">
                                   Total Price :Rs. <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("totPrice") %>'></asp:Label></td>
							</tr>
                            <tr>
                                 <td>
                                        <asp:Label ID="lblDishcartid" runat="server" Text='<%#Eval("ConsumerDishCart_ID") %>' Visible="false" ></asp:Label> 
                                        <asp:Label ID="lblCartid" runat="server" Text='<%#Eval("Cart_ID") %>' Visible="false" ></asp:Label>
                                        <asp:Label ID="lblChefid" runat="server" Text='<%#Eval("Chef_ID") %>' Visible="false" ></asp:Label>
                                        <asp:Label ID="lbldishid" runat="server" Text='<%#Eval("Dish_ID") %>' Visible="false" ></asp:Label>
                                        <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Order_Date") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>' Visible="false"></asp:Label>
                                </td>
                                <td>
                                        <asp:Label ID="Label6" runat="server" Text="Promo Code Applied" Font-Size="Small" ForeColor="#006600" Visible="false"></asp:Label><br />
                                        <div class="small">
                                            <asp:TextBox ID="txtCoupon" runat="server" CssClass="" placeholder="Enter Coupon code" Font-Underline="True" ></asp:TextBox>
                                        </div>
                                        <asp:LinkButton ID="Apply" runat="server" Text="X" CssClass="qtyBtn" CommandName="Apply">Apply</asp:LinkButton>
                                </td>
                                <td>
                  
                                </td>
                                <td colspan="2">
                                        <asp:LinkButton ID="remove" runat="server" Text="X" CssClass="qtyBtn" CommandName="Remove">Remove</asp:LinkButton>
                                </td>          
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
                                   class="button full-width" ></asp:Button>
                  </div>
				</aside>
            <!--//right sidebar-->
			</div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>

</asp:Content>

