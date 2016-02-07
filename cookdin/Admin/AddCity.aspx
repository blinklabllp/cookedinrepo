<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddCity.aspx.cs" Inherits="Admin_AddCity" %>

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
                                    <h4 class="panel-title">Add City</h4>
                                </div>
                                <div class="panel-body pt0 pb0">
                                    <div class="form-horizontal group-border stripped">
                                    <br />
                                        <asp:Panel ID="pnlsuccess" runat="server" CssClass="bs-callout-info-success" Visible="false">
                                          <p>City Added Successfully.</p>
                                        </asp:Panel>
                                        
                                         <asp:Panel ID="pnlwarning" runat="server" CssClass="bs-callout-info-failer" Visible="false">
                                          <p>City Already Added.</p>
                                        </asp:Panel>

                                                <div class="form-group">
                                                        <label class="col-lg-2 col-md-3 control-label" for="">State</label>
                                                        <div class="col-lg-10 col-md-9">
                                                             <asp:DropDownList ID="ddlState" runat="server"  class="form-control required" >
                                                             </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                 <div class="form-group">
                                                        <label class="col-lg-2 col-md-3 control-label" for="">City</label>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCity" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                         <div class="col-lg-10 col-md-9">
                                                             <asp:TextBox ID="txtCity" runat="server" class="form-control required" name="default" area-required="true"></asp:TextBox>
                                                        </div>
                                                  </div>
                                                <div class="form-group">        

                                               <div class="col-lg-10 col-md-9">
                                               <center>
                                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit"   class="btn btn-primary mr5 mb10" onclick="btnSubmit_Click"/>
                                                     <asp:Button ID="btnsaveandcontinue" runat="server" 
                                                        Text="Submit and InsertView"   class="btn btn-primary mr5 mb10" 
                                                        onclick="btnsaveandcontinue_Click" />
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
                                    <h4 class="panel-title">List City</h4>
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
                              <th>City</th>
                                 <th>State</th>
                                   <th>Actions</th>
							  </tr>
						  </thead>   
						  <tbody>
      </HeaderTemplate>
      <ItemTemplate>
         <tr>
	
     <td class="center"><%#Eval("City_ID")%></td>
     
     <td class="center"><%#Eval("City_Name")%></td>
     <td class="center"><%#Eval("State_Name")%></td>
    
    
          <td class="center">
          <a class="btn btn-success mr5 mb10" href='AddCity.aspx?eid=<%# Eval("City_ID")%>'><i class="icon-trash icon-white"></i>Edit</a>
          <a class="btn btn-danger mr5 mb10" href='AddCity.aspx?did=<%# Eval("City_ID")%>'><i class="icon-trash icon-white"></i>Delete</a>
          
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

      <%--            <div class="panel panel-default toggle panelMove panelClose panelRefresh">
                                <!-- Start .panel -->
                                <div class="panel-heading">
                                    <h4 class="panel-title">City</h4>
                                </div>
                                <div class="panel-body pb0">
                                   <div class="bs-callout bs-callout-info mt0">
                                        <p>Add class <code>.group-border .stripped</code> to your form.</p>
                                    </div>
                                    <div class="form-horizontal group-border stripped" role="form">
                                        <div class="form-group">
                                            <label for="inputEmail4" class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword4" class="col-sm-2 control-label">Password</label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <div class="checkbox-custom">
                                                    <input type="checkbox" id="checkbox2">
                                                    <label for="checkbox2">Remember me</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="submit" class="btn btn-default">Sign in</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
</asp:Content>

