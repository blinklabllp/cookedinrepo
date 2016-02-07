<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ListDish.aspx.cs" Inherits="Admin_ListDish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<div class="row">
                        <div class="col-lg-12">
                            <!-- col-lg-12 start here -->
                            <div class="panel panel-default toggle panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading white-bg">
                                    <h4 class="panel-title">List Chef</h4>
                                </div>
                                <div class="panel-body">
                                    
                             
                            <!-- End .panel -->

      <asp:Repeater ID="Repeater1" runat="server">
      <HeaderTemplate>
      	<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
                              <th>ID</th>
                              <th>Dish Name</th>
                                 <th>Chef Name</th>
                                   <th>Status</th>
                                   <th>Actions</th>
							  </tr>
						  </thead>   
						  <tbody>
      </HeaderTemplate>
      <ItemTemplate>
         <tr>
	
     <td class="center"><%#Eval("Dish_ID")%></td>
      <td class="center"><%#Eval("Dish_Name")%></td>
     
      
     <td class="center"><%#Eval("Chef_UserName")%></td>
    
      <td class="center"><%#Eval("Status")%></td>
    
          <td class="center">
          <a class="btn btn-info mr5 mb10" href='ViewDish.aspx?did=<%# Eval("Dish_ID")%>'><i class="icon-trash icon-white"></i>View</a>
          
          <a class="btn btn-success mr5 mb10" href='ListDish.aspx?aid=<%# Eval("Dish_ID")%>'><i class="icon-trash icon-white"></i>Approve</a>
           <a class="btn btn-success mr5 mb10" href='ListDish.aspx?uid=<%# Eval("Dish_ID")%>'><i class="icon-trash icon-white"></i>UnApprove</a>
         
       
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

