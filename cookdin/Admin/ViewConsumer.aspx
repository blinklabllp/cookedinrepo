<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewConsumer.aspx.cs" Inherits="Admin_ViewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
                        <div class="col-lg-12 col-md-6 col-sm-12">
                            <!-- col-lg-4 start here -->
                            <div class="panel panel-default">
                                <!-- Start .panel -->
                                <div class="panel-heading">
                                    <h4 class="panel-title">View User</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="row profile">
                                        <!-- Start .row -->
                                        <div class="col-md-4">
                                            <div class="profile-avatar">
                                               <asp:Image ID="imgProfile" runat="server" ImageUrl="../img/avatars/128.jpg" Height="100" Width="100"/>
                                                <p class="mt10">
                                                    Online
                                                    <span class="device">
                                    <i class="fa fa-mobile s16"></i>
                                </span>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="profile-name">
                                                <h3><asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label></h3>
                                                <p class="job-title mb0"><i class="fa fa-building"></i> <asp:Label ID="lblFullName" runat="server" Text="Gender"></asp:Label></p>
                                                <%--<p class="balance">
                                                    Category: <span><asp:Label ID="lblBusCategory" runat="server" Text="Label"></asp:Label></span>
                                                </p>
                                                <a href="#" class="btn btn-primary btn-large mr10"> <i class="fa fa-envelope"></i> Send email</a>--%>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="contact-info bt">
                                                <div class="row">
                                                    <!-- Start .row -->
                                                    <div class="col-md-4">
                                                        <dl class="mt20">
                                                            <dt class="text-muted">Contact Details</dt>
                                                            <dt class="text-muted">Phone</dt>
                                                            <dd><asp:Label ID="lblContactNo" runat="server" Text="Label"></asp:Label></dd>
                                                            <dt class="text-muted">Mobile</dt>
                                                            <dd><asp:Label ID="lblMobileNo" runat="server" Text="Label"></asp:Label></dd>
                                                        </dl>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <dl class="mt20">
                                                            <dt class="text-muted">Email</dt>
                                                            <dd><asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label></dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                                <!-- End .row -->
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="profile-info bt">
                                                <h5 class="text-muted">Chef info - Description</h5>
                                                <p><asp:Label ID="lblDescription" runat="server" Text="Label"></asp:Label></p>
                                            </div>
                                            <div class="profile-info bt">
                                                <h5 class="text-muted">Address</h5>
                                                <p>
                                                    <asp:Label ID="Label1" runat="server" Text="House No : "></asp:Label>
                                                    <asp:Label ID="lblHouse" runat="server" Text="Label"></asp:Label>
                                                </p>
                                                <p>
                                                    <asp:Label ID="Label2" runat="server" Text="Block No : "></asp:Label>
                                                    <asp:Label ID="lblBlock" runat="server" Text="Label"></asp:Label>
                                                </p>
                                                <p>
                                                    <asp:Label ID="Label4" runat="server" Text="Society : "></asp:Label>
                                                    <asp:Label ID="lblSoc" runat="server" Text="Label"></asp:Label>
                                                </p>
                                                <p>
                                                    <asp:Label ID="Label6" runat="server" Text="Area : "></asp:Label>
                                                    <asp:Label ID="lblArea" runat="server" Text="Label"></asp:Label>
                                                </p>
                                                <p>
                                                    <asp:Label ID="Label8" runat="server" Text="City : "></asp:Label>
                                                    <asp:Label ID="lblCity" runat="server" Text="Label"></asp:Label>
                                                </p>
                                                <p>
                                                    <asp:Label ID="Label10" runat="server" Text="Landmark : "></asp:Label>
                                                    <asp:Label ID="lblLandmark" runat="server" Text="Label"></asp:Label>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- End .row -->
                                </div>
                            </div>
                            <!-- End .panel -->
                        </div>
                        <!-- col-lg-4 end here -->
                    </div>
</asp:Content>

