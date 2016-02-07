<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ListChef.aspx.cs" Inherits="Admin_ListBusinessUser" %>

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
                              <th>User Name</th>
                                 <th>First Name</th>
                                  
                                  <th>Last Name</th>
                                  <th>Status</th>
                                   <th>Actions</th>
							  </tr>
						  </thead>   
						  <tbody>
      </HeaderTemplate>
      <ItemTemplate>
         <tr>
	
     <td class="center"><%#Eval("Chef_ID")%></td>
     <td class="center"><%#Eval("Chef_UserName")%></td>
     <td class="center"><%#Eval("Chef_Fname")%></td>
     
      <td class="center"><%#Eval("Chef_Lname")%></td>
      <td class="center"><%#Eval("IsApprove")%></td>
    
          <td class="center">
          <a class="btn btn-info mr5 mb10" href='ViewChef.aspx?vid=<%# Eval("Chef_ID")%>'><i class="icon-trash icon-white"></i>View</a>
          <a class="btn btn-success mr5 mb10" href='EditChef.aspx?eid=<%# Eval("Chef_ID")%>'><i class="icon-trash icon-white"></i>Edit</a>
          <a class="btn btn-danger mr5 mb10" href='ListChef.aspx?did=<%# Eval("Chef_ID")%>'><i class="icon-trash icon-white"></i>Delete</a>
          <a class="btn btn-success mr5 mb10" href='ListChef.aspx?aid=<%# Eval("Chef_ID")%>'><i class="icon-trash icon-white"></i>Approve</a>
         
       
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

