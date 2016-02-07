<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="Consumer_OrderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<main class="main main-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="#" title="Home">Dashboard</a></li>
					<li>My Orders</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
		<!--wrap-->
		<div class="wrap clearfix">
			<div class="row">
				<section class="content full-width" style="visibility: visible;">
					<!--entries-->
					<div class="entries row">
						<!--item-->
                        <h1>My Orders</h1>
						<div class="f-row">

                         <asp:DataList ID="DataList1" runat="server">
                         <HeaderTemplate>
                          <div class="checkout-title">
                                   <%-- <div class="food-name">Items</div>
                                    <div class="food-qty text-center">QTY</div>
                                    <div class="food-amt text-center">amount</div>
                                    <div class="food-del text-center"></div>--%>

                                     <%--<table cellpadding="10" cellspacing="10" >--%>
                                    <table class="table table-striped table-bordered bootstrap-datatable datatable">
                                    <tr>
                                      <td align="center">Item</td>
                                      <td align="center">Dish</td>
                                      <td align="center">Date & Time</td>
                                      <td align="center">Qty</td>
                                      <td align="center">Total Price</td>
                                      <td align="center">Status</td>
                                  <%--    <td align="center">Action</td>--%>
                                    </tr>
                                    <tr><td colspan="7"><div style="height:1px; background-color:gray" id="devider"></div> </td></tr>

                                </div>
                         </HeaderTemplate>
                     <ItemTemplate>
                         <div class="order-group">
                                    <div class="checkout-content">
                                       
                    <tr>
                        <td align="center">
                             <img src='<%# "../dishphotoupload/"+Eval("Dish_Image")%>' alt="" width="70px" height="70px">
                        </td>
                        <td align="center">
                            <%#Eval("Dish_Name") %>
                        </td>
                        <td align="center">
                           <span class="net_price"> <asp:Label ID="Label2" runat="server" Text='<%#Eval("DeliveryDate", "{0:M-dd-yyyy}") %>'></asp:Label></span>
                                            <span class="net_price"> <asp:Label ID="Label3" runat="server" Text='<%#Eval("Slot") %>'></asp:Label></span>
                          <%--                   <asp:Label ID="Label8" runat="server" Text='<%#Eval("Serial_No") %>' Visible="false"></asp:Label>--%>
                        </td>
                        <td align="center">
                           <%#Eval("Qty") %>
                        </td>
                        <td align="center">
                           <%#Eval("totPrice") %>
                        </td>
                        <td align="center">
                            <%#Eval("Cooking_Status")%>
                        </td>
                        <%--<td align="center">
                             <asp:Button ID="Button2" runat="server" Text="Cooked" CommandName="cooked" CssClass="button gold btn-small"></asp:Button>
                                        <asp:Button ID="Button5" runat="server" Text="Ready For Pick" CommandName="ready" CssClass="button gold btn-small"></asp:Button>
                        </td>--%>
                    </tr>
              <%--  </table>--%>
                                    </div>
                           </div>
                       </ItemTemplate>
                       <FooterTemplate>
                       </table>
                        <center>
                          <asp:Label ForeColor="#d94352" Visible='<%# DataList1.Items.Count==0 %>' runat="server" ID="lblmsg" Text="No Records Found"></asp:Label>
                       </center>
                       </FooterTemplate>

                        </asp:DataList>
                      
                        </div>
					</div>
					<!--//entries-->
				</section>
				<!--//content-->
            </div>
			<!--//row-->
		</div>
		<!--//wrap-->
        </div>
	</main>
</asp:Content>

