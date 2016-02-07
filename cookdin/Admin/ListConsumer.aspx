<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ListConsumer.aspx.cs" Inherits="Admin_ListEndUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   







<div class="row">
                        <div class="col-lg-12">
                            <!-- col-lg-12 start here -->
                            <div class="panel panel-default toggle panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading white-bg">
                                    <h4 class="panel-title">List Consumers</h4>
                                </div>
                                <div class="panel-body">
                                    
                             
                            <!-- End .panel -->

      <asp:Repeater ID="Repeater1" runat="server">
      <HeaderTemplate>
      	<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
                              <th>ID</th>
                             <%-- <th>User Name</th>--%>
                                 <th>First Name</th>
                                 <th>Middle Name</th>
                                  <th>Last Name</th>
                                   <th>Actions</th>
							  </tr>
						  </thead>   
						  <tbody>
      </HeaderTemplate>
      <ItemTemplate>
         <tr>
	
     <td class="center"><%#Eval("Consumer_ID")%></td>
    <%-- <td class="center"><%#Eval("Consumer_UserName")%></td>--%>
     <td class="center"><%#Eval("Consumer_Fname")%></td>
     <td class="center"><%#Eval("Consumer_Mname")%></td>
     <td class="center"><%#Eval("Consumer_Lname")%></td>    
    
          <td class="center">
          <a class="btn btn-info mr5 mb10" href='ViewConsumer.aspx?vid=<%# Eval("Consumer_ID")%>'><i class="icon-trash icon-white"></i>View</a>
          <a class="btn btn-success mr5 mb10" href='EditConsumer.aspx?eid=<%# Eval("Consumer_ID")%>'><i class="icon-trash icon-white"></i>Edit</a>
          <a class="btn btn-danger mr5 mb10" href='ListConsumer.aspx?did=<%# Eval("Consumer_ID")%>'><i class="icon-trash icon-white"></i>Delete</a>
        
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

