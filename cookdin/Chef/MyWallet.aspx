<%@ Page Title="" Language="C#" MasterPageFile="~/Chef/ChefMasterPage.master" AutoEventWireup="true" CodeFile="MyWallet.aspx.cs" Inherits="Chef_MyWallet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<main class="main" role="main">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="#" title="Home">Dashboard</a></li>
					<li>Wallet</li>
				</ul>
			</nav>
			<div class="row">
				
				<!--//content-->
                                <section style="visibility: visible;" class="content full-width">
					<!--entries-->
					<div class="entries row">
						<!--item-->
                        <h1>Dishes Served</h1>
                <asp:Repeater ID="Repeater1" runat="server">
      <HeaderTemplate>
      	<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
                             <%-- <th>Image</th>--%>
                              <th>ID</th>
                              <th>Dish Name</th>
                              <th>Order Date</th>
                              <th>Dish Price</th>
                              <th>Qty</th>
                              <th>Total Amount</th>
                              <th>Delivery Charge</th>
                              <th>Admin Charge</th>
							  </tr>
						  </thead>   
						  <tbody>
      </HeaderTemplate>
      <ItemTemplate>
         <tr>
	<td class="center"><asp:Image ID="Image1" runat="server" src='<%# "upload/"+Eval("Dish_Image")%>' Height="70" Width="70"/></td>
    <%-- <td class="center"><%#Eval("Dish_ID")%></td>
     --%>
     <td class="center"><%#Eval("Dish_Name")%></td>
     <td class="center"><%#Eval("Order_Date")%></td>
     <td class="center"><%#Eval("dishprice")%></td>
     <td class="center"><%#Eval("Qty")%></td>
     <td class="center"><%#Eval("TotalPrice")%></td>
     <td class="center"><%#Eval("Delivery_Charges")%></td>
     <td class="center"><%#Eval("AdminCharge")%></td>

        
		
	</tr>
      </ItemTemplate>
      <FooterTemplate>
       </tbody>
					  </table>  
      </FooterTemplate>
      </asp:Repeater>
                    
                    </div>
                </div>
        </div>
        </main>
</asp:Content>

