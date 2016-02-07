<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditChef.aspx.cs" Inherits="Admin_EditChef" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="col-lg-12">
            <!-- col-lg-12 start here -->
            <div class="panel panel-default toggle panelMove panelClose panelRefresh">
                <!-- Start .panel -->
                <div class="panel-heading">
                    <h4 class="panel-title">Edit Chef</h4>
                </div>
                <div class="panel-body pt0 pb0">
                    <div class="form-horizontal group-border stripped">
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for="">Chef Profile</label>
                            <div class="col-lg-10 col-md-9">
                            <asp:FileUpload ID="FileUpload1" runat="server" class="filestyle" data-buttonText="Find file" data-buttonName="btn-default" data-iconName="fa fa-plus"/>
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for="">Chef Full Name</label>
                                <div class="col-lg-3 col-md-9">
                                    <asp:TextBox ID="txtFname" runat="server" class="form-control required" name="default" area-required="true" placeholder="FirstName"></asp:TextBox>
                                </div>
                                <div class="col-lg-3 col-md-9">
                                    <asp:TextBox ID="txtMname" runat="server" class="form-control required" name="default" area-required="true" placeholder="MiddleName"></asp:TextBox>
                                </div>
                                <div class="col-lg-3 col-md-9">
                                    <asp:TextBox ID="txtLname" runat="server" class="form-control required" name="default" area-required="true" placeholder="LastName"></asp:TextBox>
                                </div>
                        </div>
                        <!-- End .form-group  -->
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for="">Chef Name</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtChefName" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                <div class="col-lg-10 col-md-9">
                                    <asp:TextBox ID="txtChefName" runat="server" class="form-control" name="default"></asp:TextBox>
                                </div>
                        </div>
                        <!-- End .form-group  -->
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3  control-label" for="">Date of Birthday</label>
                         
                                 <div class="col-lg-10 col-md-9">

                                    <asp:TextBox ID="txtDOB" runat="server" class="form-control" name="default"></asp:TextBox>
                            <asp:CalendarExtender ID="txtDOB_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="txtDOB">
                            </asp:CalendarExtender>
                            </div>
                        </div>
                        <!-- End .form-group  -->
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label">Gender</label>
                            <div class="col-lg-10 col-md-9">

                            <asp:DropDownList ID="ddlGender" runat="server"  class="form-control" name="default">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>

                               
                            </div>
                        </div>
                        <!-- End .form-group  -->
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for="">Email</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <div class="col-lg-10 col-md-9">
                                <asp:TextBox ID="txtEmail" runat="server" class="form-control" name="default"></asp:TextBox>
                            </div>
                        </div>
                        <!-- End .form-group  -->
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for="">Contact No</label>
                            <div class="col-lg-10 col-md-9">
                                    <asp:TextBox ID="txtContactNo" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <!-- End .form-group  -->
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for="">Mobile No</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtMobileNo" Display="Dynamic" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            <div class="col-lg-10 col-md-9">
                                    <asp:TextBox ID="txtMobileNo" runat="server" class="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <!-- End .form-group  -->
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for="">About Me</label>
                            <div class="col-lg-10 col-md-9">
                                <asp:TextBox ID="txtDescription" runat="server" class="form-control" name="default" rows="3"></asp:TextBox>
                            </div>
                        </div>
                        <!-- End .form-group  -->
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for="">Address</label>
                            <div class="col-lg-3 col-md-9">
                                <asp:TextBox ID="txtHouse" runat="server" class="form-control" name="default" rows="3" placeholder="House No."></asp:TextBox>
                            </div>
                            <div class="col-lg-3 col-md-9">
                                <asp:TextBox ID="txtBlock" runat="server" class="form-control" name="default" rows="3" placeholder="House No."></asp:TextBox>
                            </div>
                            <div class="col-lg-3 col-md-9">
                                <asp:TextBox ID="txtSoc" runat="server" class="form-control" name="default" rows="3" placeholder="Society"></asp:TextBox>
                            </div>
                            </div>
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for=""></label>
                            <div class="col-lg-3 col-md-9">
                                <asp:DropDownList ID="ddlState" runat="server"  class="form-control" name="default"></asp:DropDownList>
                            </div>
                            <div class="col-lg-3 col-md-9">

                            <asp:DropDownList ID="ddlCity" runat="server"  class="form-control" name="default"></asp:DropDownList>

                               
                            </div>
                            
                            </div>
                            <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for=""></label>
                            <div class="col-lg-3 col-md-9">
                            <asp:DropDownList ID="ddlArea" runat="server"  class="form-control" name="default"></asp:DropDownList>
                            </div>
                            <div class="col-lg-3 col-md-9">
                            <asp:DropDownList ID="ddlLandmark" runat="server"  class="form-control" name="default" placeholder="Area"></asp:DropDownList>

                            </div>
                            </div>
                        </div>
                        <!-- End .form-group  -->
                        <div class="form-group">
                            <label class="col-lg-2 col-md-3 control-label" for=""></label>
                            <div class="col-lg-10 col-md-9">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                    class="btn btn-primary mr5 mb10" onclick="btnSubmit_Click" />
                                <asp:Button ID="btnDanger" runat="server" Text="Cancel" 
                                    class="btn btn-danger mr5 mb10" onclick="btnDanger_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                                
            </div>
            <!-- End .panel -->
                            
        </div>
        <!-- col-lg-12 end here -->
    </div>
        <!-- Javascripts -->
        <!-- Load pace first -->
        <script src="../plugins/core/pace/pace.min.js"></script>
        <!-- Important javascript libs(put in all pages) -->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script>
            window.jQuery || document.write('<script src="js/libs/jquery-2.1.1.min.js">\x3C/script>')
        </script>
        <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <script>
            window.jQuery || document.write('<script src="js/libs/jquery-ui-1.10.4.min.js">\x3C/script>')
        </script>
        <script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script>
            window.jQuery || document.write('<script src="js/libs/jquery-migrate-1.2.1.min.js">\x3C/script>')
        </script>
        <script src="../plugins/forms/dropzone/dropzone.js"></script>
        <script src="../js/pages/gallery.js"></script>
        <script src="../plugins/charts/sparklines/jquery.sparkline.js"></script>
        <script src="../plugins/forms/bootstrap-filestyle/bootstrap-filestyle.js"></script>
        <script src="../plugins/forms/autosize/jquery.autosize.js"></script>
        <script src="../plugins/ui/lightbox/ekko-lightbox.js"></script>
        <script src="../plugins/forms/maxlength/bootstrap-maxlength.js"></script>
        <script src="../plugins/forms/dropzone/dropzone.js"></script>
        <script src="../plugins/forms/checkall/jquery.checkAll.js"></script>
        <script src="../js/jquery.supr.js"></script>
        <script src="../js/main.js"></script>
        <script src="../js/pages/forms-basic.js"></script>
        <script src="../js/pages/gallery.js"></script>
    </div>
</asp:Content>

