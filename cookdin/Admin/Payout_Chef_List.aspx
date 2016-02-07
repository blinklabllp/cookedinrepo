<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Payout_Chef_List.aspx.cs" Inherits="Admin_Payout_Chef_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<div class="row">
    
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
 <ContentTemplate>
                        <div class="col-lg-12">
                            <!-- col-lg-12 start here -->
                            <div class="panel panel-default toggle panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading white-bg">
                                    <h4 class="panel-title">Chef Payout List</h4>
                                </div>
                                <div class="panel-body">
                                   
                                   
                                  
                             <asp:CheckBox ID="checkMain" runat="server" AutoPostBack="True" 
                                        oncheckedchanged="checkMain_CheckedChanged" />
                            <asp:Button ID="btnProcessing" runat="server" Text="Processing" 
                                        class="btn btn-success mr5 mb10" onclick="btnProcessing_Click" />
                              <asp:Button ID="btnPaid"
                                        runat="server" Text="Paid" class="btn btn-success mr5 mb10" 
                                        onclick="btnPaid_Click" />
                             <asp:Button ID="btnBlock" runat="server" Text="Block" class="btn btn-success mr5 mb10" 
                                        onclick="btnBlock_Click" />
                             
                                    
                            
                                  


                            <!-- End .panel -->
      <asp:DataList ID="Repeater1" runat="server" Width="100%">
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
    <asp:CheckBox ID="checkDatalist" runat="server" /></td>
         <td class="center"> <%# Eval("Chef_UserName")%>   
         <asp:Label ID="lblInvoiceID" runat="server" Text='<%#Eval("Invoice_Id")%>' Visible="false"></asp:Label></td>
         <td class="center"><%#Eval("PayableAmount")%></td>
         <td class="center"><%#Eval("PaymentStatus")%></td>   
        <td><a class="btn btn-info mr5 mb10" href='Payout_Chef_List.aspx?vid=<%# Eval("Invoice_Id")%>'><i class="icon-trash icon-white"></i>View</a></td>

        
		
	</tr>
      </ItemTemplate>
      <FooterTemplate>
       </tbody>
					  </table>  
      </FooterTemplate>
      </asp:DataList>
         </div>
                            </div>
</div>
 </ContentTemplate>
</asp:UpdatePanel>
    </div>
     

</asp:Content>

