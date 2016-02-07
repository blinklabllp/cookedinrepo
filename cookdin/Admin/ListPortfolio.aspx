<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ListPortfolio.aspx.cs" Inherits="Admin_AddPortfolio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <asp:MultiView ID="MultiView1" runat="server">
   <asp:View ID="View1" runat="server">

<div class="row">
        <div class="col-lg-12">
            <!-- col-lg-12 start here -->
            <div class="panel panel-default toggle panelClose panelRefresh">
                <!-- Start .panel -->
                <div class="panel-heading white-bg">
                    <h4 class="panel-title">Portfolios</h4>
                </div>
                <div class="panel-body pt0 pb0">
                    <div class="form-horizontal group-border stripped">
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for="">Title</label>
                               <div class="col-lg-10 col-md-9">
                                    <asp:TextBox ID="txtTitle" runat="server" class="form-control required" name="default" area-required="true"></asp:TextBox>
                            </div>
                        </div>
                        <!-- End .form-group  -->
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for="">Description</label>
                                <div class="col-lg-10 col-md-9">
                                    <asp:TextBox ID="txtDescription" runat="server" class="form-control required" name="default" area-required="true"></asp:TextBox>
                            </div>
                        </div>
                        <!-- End .form-group  -->   
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for="">Website</label>
                                <div class="col-lg-10 col-md-9">
                                    <asp:TextBox ID="txtWebsite" runat="server" class="form-control required" name="default" area-required="true"></asp:TextBox>
                            </div>
                        </div>
                        <!-- End .form-group  -->
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for="">File upload</label>
                            <div class="col-lg-10 col-md-9">
                            <asp:FileUpload ID="FileUpload1" runat="server" class="filestyle" data-buttonText="Find file" data-buttonName="btn-default" data-iconName="fa fa-plus"/>
                               <%-- <input type="file" class="filestyle" data-buttonText="Find file" data-buttonName="btn-default" data-iconName="fa fa-plus">--%>
                            </div>
                        </div>
                        <!-- End .form-group  -->
                        <div class="col-lg-10 col-md-9">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                class="btn btn-primary mr5 mb10" onclick="btnSubmit_Click" />
                            <asp:Button ID="btnDanger" runat="server" Text="Cancel" 
                                class="btn btn-danger mr5 mb10" />
                        </div>
                    </div>
                <!-- End .form-group  -->         
                </div>
            </div>
             <!-- End .panel -->
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
                                    <h4 class="panel-title">Portfolios</h4>
                                </div>
                                <div class="panel-body">
                            <!-- End .panel -->
                            <!-- End .form-group  -->
                            <div class="form-group">
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="Add More" 
                                    class="btn btn-primary mr5 mb10" onclick="LinkButton1_Click" ><i class="icomoon-icon-plus-circle mr5"></i>Add Portfolio</asp:LinkButton>
                            </div>
                            <!-- End .form-group  -->
      <asp:Repeater ID="Repeater1" runat="server">
      <HeaderTemplate>
      	<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
                              <th>Portfolio Image</th>
                                  <th>ID</th>
                                  <th>Title</th>
                                  <th>Descrition</th>
                                  <th>Website</th>
                                  <th>Actions</th>
							  </tr>
						  </thead>   
						  <tbody>
      </HeaderTemplate>
      <ItemTemplate>
         <tr>

       <%--  <%#"~/User_Profilepictures/"+Eval("default_pic") %>--%>
	<td class="center"> <asp:Image runat="server" src='<%# "../Profile_Photo/"+Eval("Image")%>' Height="70" Width="70"/></td>
     <td class="center"><%#Eval("Portfolio_ID")%></td>
     <td class="center"><%#Eval("Title")%></td>
     <td class="center"><%#Eval("Description")%></td>
     <td class="center"><%#Eval("Website")%></td>
    
          <td class="center">
          <a class="btn btn-info mr5 mb10" href='ListBusinessUser.aspx?vid=<%# Eval("Portfolio_ID")%>'><i class="icon-trash icon-white"></i>View</a>
          <a class="btn btn-danger mr5 mb10" href='ListPortfolio.aspx?did=<%# Eval("Portfolio_ID")%>'><i class="icon-trash icon-white"></i>Delete</a>
          
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

