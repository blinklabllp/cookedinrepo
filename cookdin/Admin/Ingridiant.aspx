<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Ingridiant.aspx.cs" Inherits="Admin_AddCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="Add" runat="server">
<div class="row">
                        <div class="col-lg-12">
                            <!-- col-lg-12 start here -->
                            <div class="panel panel-default toggle panelMove panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading white-bg">
                                    <h4 class="panel-title">Add Ingridiant</h4>
                                </div>
                                <div class="panel-body pt0 pb0">
                                    <div class="form-horizontal group-border stripped">

                                     <asp:Panel ID="pnlsuccess" runat="server" CssClass="bs-callout-info-success" Visible="false">
                                          <p>Ingridiant Added Successfully.</p>
                                        </asp:Panel>
                                        
                                         <asp:Panel ID="pnlwarning" runat="server" CssClass="bs-callout-info-failer" Visible="false">
                                          <p>Ingridiant Already Added.</p>
                                        </asp:Panel>

                                    <div class="form-group">
                                            <label class="col-lg-2 col-md-3 control-label" for="">Ingridiant Icon</label>
                                            
                                             <div class="col-lg-10 col-md-9">
                                                 <asp:FileUpload ID="FileUpload1" runat="server" class="form-control required" name="default" area-required="true"/>
                                            </div>
                                            </div>
                                    <div class="form-group">
                                            <label class="col-lg-2 col-md-3 control-label" for="">Category</label>
                                            <div class="col-lg-10 col-md-9">
                                                 <asp:DropDownList ID="ddlCategory" runat="server"  class="form-control required" >
                                                 </asp:DropDownList>
                                                 
                                            </div>
                                            
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-md-3 control-label" for="">Ingridiant</label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtIngridiant" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>

                                             <div class="col-lg-10 col-md-9">
                                                 <asp:TextBox ID="txtIngridiant" runat="server" class="form-control required" name="default" area-required="true"></asp:TextBox>
                                                 
                                            </div>
                                            </div>
                                             <div class="form-group">
                                            <label class="col-lg-2 col-md-3 control-label" for="">Description</label>
                                           
                                             <div class="col-lg-10 col-md-9">
                                                 <asp:TextBox ID="txtDescription" runat="server" class="form-control required" name="default" area-required="true"></asp:TextBox>
                                                 
                                            </div>
                                           </div>  
                                               <div class="form-group">
                                                    <div class="col-lg-10 col-md-9">
                                                     <center>
                                                      <asp:Button ID="btnSubmit" runat="server" Text="Submit"   class="btn btn-primary mr5 mb10" onclick="btnSubmit_Click"/>
                                                       <asp:Button ID="btnsubmitcontinue" runat="server" Text="Submit And InsertView"   
                                                             class="btn btn-primary mr5 mb10" onclick="btnsubmitcontinue_Click" />
                                                      <asp:Button ID="btnDanger" runat="server" Text="Cancel"  class="btn btn-danger mr5 mb10" onclick="btnDanger_Click"/>
                                                     </center>
                                                   </div>
                                               </div>
                                        </div>
                                        </div>

                                        
                                        </div>
                                        </div>
                                  
</div>
</asp:View>
    <asp:View ID="List" runat="server">
    

<div class="row">
                        <div class="col-lg-12">
                            <!-- col-lg-12 start here -->
                            <div class="panel panel-default toggle panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading white-bg">
                                    <h4 class="panel-title">List Ingridiant</h4>
                                </div>
                                <div class="panel-body">
                                    
                             
                            <!-- End .panel -->

                            <asp:LinkButton ID="Button1" runat="server" Text="Add More" 
                                        class="btn btn-primary mr5 mb10" onclick="Button1_Click"  ><i class="icomoon-icon-plus-circle mr5"></i>Add More</asp:LinkButton>


      <asp:Repeater ID="Repeater1" runat="server">
      <HeaderTemplate>
      	<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
                              <th>Icon</th>
                              <th>ID</th>
                              <th>Ingridiant</th>
                                 <th>Category</th>
                                 <th>Description</th>
                                   <th>Actions</th>
							  </tr>
						  </thead>   
						  <tbody>
      </HeaderTemplate>
      <ItemTemplate>
         <tr>
	<td class="center"><asp:Image ID="Image1" runat="server" src='<%# "../UploadIcon/"+Eval("Icon")%>' Height="70" Width="70"/></td>
    
     <td class="center"><%#Eval("Ingridiant_ID")%></td>
     
     <td class="center"><%#Eval("Ingridiant_Name")%></td>
     <td class="center"><%#Eval("Category_Name")%></td>
      <td class="center"><%#Eval("Description")%></td>
    
          <td class="center">
          <a class="btn btn-success mr5 mb10" href='Ingridiant.aspx?eid=<%# Eval("Ingridiant_ID")%>'><i class="icon-trash icon-white"></i>Edit</a>
          <a class="btn btn-danger mr5 mb10" href='Ingridiant.aspx?did=<%# Eval("Ingridiant_ID")%>'><i class="icon-trash icon-white"></i>Delete</a>
          
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

</ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

