<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="View_Account.aspx.cs" Inherits="Admin_View_Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <asp:MultiView ID="MultiView1" runat="server">
   <asp:View ID="View1" runat="server">
<div class="row">
                        <div class="col-lg-12">
                            <!-- col-lg-12 start here -->
                            <div class="panel panel-default toggle panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading white-bg">
                                    <h4 class="panel-title">Admin Commision Sheet</h4>
                                </div>
                                <div class="panel-body">
                                    
                             
                            <!-- End .panel -->
      <asp:Repeater ID="Repeater1" runat="server">
      <HeaderTemplate>
      	<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
                             <th>Date</th>
                              <th>Order ID</th>
                              <th>Amount</th>
                              <th>Action</th>
                              
                            </tr>
						  </thead>   
						  <tbody>
      </HeaderTemplate>
      <ItemTemplate>
         <tr>
	
    <td class="center"><%#Eval("Date")%></td>
     <td class="center"><%#Eval("Order_ID")%></td>
     <td class="center"><%#Eval("Amount")%></td>
     
     <td class="center"><a class="btn btn-success mr5 mb10" href='View_Account.aspx?oid=<%# Eval("Order_ID")%>'><i class="icon-trash icon-white"></i>View Detail</a>
     </td>
    
            
		
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
    </asp:View>
    <asp:View ID="View2" runat="server">
<div class="row">
                        <div class="col-lg-12">
                            <!-- col-lg-12 start here -->
                            <div class="panel panel-default toggle panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading white-bg">
                                    <h4 class="panel-title">Admin Commision Detail</h4>
                                </div>
                                <div class="panel-body">
                                    
                             
                            <!-- End .panel -->
      <asp:Repeater ID="Repeater2" runat="server">
      <HeaderTemplate>
      	<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
                             <th>Detail</th>
                              <th>Chef ID</th>
                              <th>Debit/Credit</th>
                              <th>Amount</th>
                              
                            </tr>
						  </thead>   
						  <tbody>
      </HeaderTemplate>
      <ItemTemplate>
         <tr>
	
    <td class="center"><%#Eval("Detail")%></td>
     <td class="center"><%#Eval("Chef_ID")%></td>
     <td class="center"><%#Eval("Debit_Credit")%></td>
     
     <td class="center"><%#Eval("Admin_Amount")%>
     </td>
    
            
		
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
    </asp:View>
     </asp:MultiView>
    
</asp:Content>

