<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddLandmark.aspx.cs" Inherits="Admin_AddCountry" %>

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
                                    <h4 class="panel-title">Add LandMark</h4>
                                </div>
                                <div class="panel-body pt0 pb0">
                                    <div class="form-horizontal group-border stripped">

                                    <asp:Panel ID="pnlsuccess" runat="server" CssClass="bs-callout-info-success" Visible="false"> <p>Landmark Added Successfully.</p></asp:Panel>
                                    <asp:Panel ID="pnlwarning" runat="server" CssClass="bs-callout-info-failer" Visible="false"> <p>Landmark Already Added.</p></asp:Panel>

                                    <div class="form-group">
                                            <label class="col-lg-2 col-md-3 control-label" for="">Area</label>
                                            <div class="col-lg-10 col-md-9">
                                                 <asp:DropDownList ID="ddlArea" runat="server"  class="form-control required" >
                                                 </asp:DropDownList>
                                                 
                                            </div>
                                            
                                        </div>
                                            <div class="form-group">
                                                <label class="col-lg-2 col-md-3 control-label" for="">LandMark</label>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtlandmark" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>

                                                 <div class="col-lg-10 col-md-9">
                                                     <asp:TextBox ID="txtlandmark" runat="server" class="form-control required" name="default" area-required="true"></asp:TextBox>
                                                </div>
                                             </div>
                                              <div class="form-group">
                                              <center>
                                                <div class="col-lg-10 col-md-9">
                                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit"  class="btn btn-primary mr5 mb10" onclick="btnSubmit_Click"/>
                                                       <asp:Button ID="Button2" runat="server" Text="Submit and Continue"  
                                                        class="btn btn-primary mr5 mb10" onclick="Button2_Click" />
                                                    <asp:Button ID="btnDanger" runat="server" Text="Cancel"   class="btn btn-danger mr5 mb10" onclick="btnDanger_Click"/>
                                                </div>
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
                                    <h4 class="panel-title">List Area</h4>
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
                              <th>ID</th>
                              <th>LandMark</th>
                                 <th>Area</th>
                                   <th>Actions</th>
							  </tr>
						  </thead>   
						  <tbody>
      </HeaderTemplate>
      <ItemTemplate>
         <tr>
	
     <td class="center"><%#Eval("LandMark_ID")%></td>
     
     <td class="center"><%#Eval("Landmark_Name")%></td>
     <td class="center"><%#Eval("Area_Name")%></td>
    
          <td class="center">
          <a class="btn btn-success mr5 mb10" href='AddLandmark.aspx?eid=<%# Eval("LandMark_ID")%>'><i class="icon-trash icon-white"></i>Edit</a>
          <a class="btn btn-danger mr5 mb10" href='AddLandmark.aspx?did=<%# Eval("LandMark_ID")%>'><i class="icon-trash icon-white"></i>Delete</a>
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

