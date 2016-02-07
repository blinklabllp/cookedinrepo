<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<main class="main main-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="#" title="Home">Dashboard</a></li>
					<li>Sign Up or Login</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
<section style="visibility: visible;" class="content center full-width">
					<div class="col-lg-6 container">
						<h3>SignUp</h3>
						 <div class="f-row">
                            <asp:Label ID="lblerrormessage" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="col-lg-6"> <asp:TextBox ID="txtemailid" runat="server" placeholder="Email Id" ValidationGroup="personal"></asp:TextBox> </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtemailid" Text="*"
                            Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                       
                        <div class="col-lg-6"> <asp:TextBox ID="txtusername" runat="server" placeholder="User Name" ValidationGroup="personal"></asp:TextBox> </div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtusername" Text="*"
                            Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                       
                        <div class="col-lg-6 top-10"> <asp:TextBox ID="txtpassword" runat="server" placeholder="Password" ValidationGroup="personal" TextMode="Password"></asp:TextBox> </div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtpassword" Text="*"
                            Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      
                        <div class="col-lg-6 top-10"> <asp:TextBox ID="txtconfirmpassword" runat="server" placeholder="Confirm Password" ValidationGroup="personal" TextMode="Password"></asp:TextBox> </div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtconfirmpassword" Text="*"
                            Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>

                          <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtconfirmpassword" ControlToCompare="txtpassword" Display="Dynamic" SetFocusOnError="True" Text="Mismatch Password"></asp:CompareValidator>
                   
						<div class="f-row bwrap btn-signup-margin"> <asp:Button ID="btnregister" runat="server" 
                                Text="Register Now" onclick="btnregister_Click"></asp:Button>
                                <%-- <asp:Button ID="btnregister" runat="server" ValidationGroup="personal"
                                Text="Register Now" ></asp:Button>--%>
                                </div>
					
					<div class="col-lg-3"></div>
					</div>

                    <div class="col-lg-6 container">
                    <h3>Login</h3>
                     <div class="f-row">
                      <asp:Panel ID="pnlwarning" runat="server" Visible="false">
                             <div class="row">
                                 <div class="full-width wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                                     <div role="alert" class="alert alert-danger"><asp:Label ID="lblwarningmessage" runat="server" ></asp:Label></div>
                                 </div>
                            </div>
                         </asp:Panel>
                         </div>
                          <div class="f-row">
                                    <asp:TextBox ID="txtconsumerusername" runat="server" placeholder="User Name" ValidationGroup="login" ></asp:TextBox>
						        </div>
						        <div class="f-row">
                                <asp:TextBox ID="txtconsumerpassword" runat="server" placeholder="Password" ValidationGroup="login" TextMode="Password"></asp:TextBox>
						        </div>
                                 <div class="f-row"></div> <div class="f-row"></div>
						        <div class="f-row bwrap">
                                    <asp:Button ID="btnconsumerlogin" runat="server" Text="login" 
                                        onclick="btnconsumerlogin_Click" ValidationGroup="personal"></asp:Button>
                                      
                                      
						        </div>

                    </div>

				</section>
                </div>
                </main>
</asp:Content>

