<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="PaymentSheetaspx.aspx.cs" Inherits="Admin_PaymentSheetaspx" %>

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
                            <th></th>
                              <th>Chef  </th>
                              <th>Amount</th>
                              <th>Status</th>
                              <th>Action</th>
							  </tr>
						  </thead>   
						  <tbody>
      </HeaderTemplate>
      <ItemTemplate>
         <tr>

           <td class="center">
               <asp:CheckBox ID="CheckBox1" runat="server" /></td>
     <td class="center"><%#Eval("Chef_Fname")%></td>
     <td class="center"><%#Eval("Price")%></td>
        <td class="center"><%#Eval("Status")%></td>   
        <td><a class="btn btn-success mr5 mb10" href='ChangeDeliveryStatus.aspx?sid=<%# Eval("Serial_No")%>'><i class="icon-trash icon-white"></i>Delivered</a>
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
</asp:Content>

