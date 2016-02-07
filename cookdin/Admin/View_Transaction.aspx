<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="View_Transaction.aspx.cs" Inherits="Admin_View_Transaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<div class="row">
                        <div class="col-lg-12">
                            <!-- col-lg-12 start here -->
                            <div class="panel panel-default toggle panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading white-bg">
                                    <h4 class="panel-title">List Transaction</h4>
                                </div>
                                <div class="panel-body">
                                    
                             
                            <!-- End .panel -->
      <asp:Repeater ID="Repeater1" runat="server">
      <HeaderTemplate>
      	<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
                              <%--   <th>Image</th>--%>
                             <%-- <th>ID</th>--%>
                              <th>Chef  </th>
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
	
  <%--  <td class="center"><asp:Image ID="Image1" runat="server" src='<%# "../Chef/upload/"+Eval("Dish_Image")%>' Height="70" Width="70"/></td>--%>
    <%-- <td class="center"><%#Eval("Dish_ID")%></td>
     --%>
     <td class="center"><%#Eval("Chef_UserName")%></td>
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
    </div>

</asp:Content>

