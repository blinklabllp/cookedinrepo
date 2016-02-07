<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="View_NewsLetterSubscriber.aspx.cs" Inherits="Admin_View_NewsLetterSubscriber" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
<div class="row">
                        <div class="col-lg-12">
                            <!-- col-lg-12 start here -->
                            <div class="panel panel-default toggle panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading white-bg">
                                    <h4 class="panel-title">List of NewsLetter Scbscriber</h4>
                                </div>
                                <div class="panel-body">
                                    
                             
                            <!-- End .panel -->

                        

      <asp:Repeater ID="Repeater1" runat="server">
      <HeaderTemplate>
      	<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
                              <th>Name</th>
                              <th>Email</th>
                              <th>Date</th>
                            
							  </tr>
						  </thead>   
						  <tbody>
      </HeaderTemplate>
      <ItemTemplate>
         <tr>
	
     <td class="center"><%#Eval("SubscriberName")%></td>
     
     <td class="center"><%#Eval("EmailId")%></td>
     <td class="center"><%#Eval("GeneratedDate")%></td>
    
        
		
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
  

</ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

