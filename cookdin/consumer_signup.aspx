<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="consumer_signup.aspx.cs" Inherits="consumer_signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <main role="main" class="main main-padding">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
		<section class="">
			<!--row-->
	        <div class="">
                    <div class="col-lg-3"></div>				
                	<div class="col-lg-6 center">
				    <!-- ToDo: Nothing was showing so temp removing the class modal if you need to add it back please do the needful -->
                	<div class="container">
					  <h3>Register For Consumer</h3>
                      
                        <div class="f-row">
                            <asp:Label ID="lblerrormessage" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="f-row"> <asp:TextBox ID="txtemailid" runat="server" placeholder="EmailId" ValidationGroup="personal"></asp:TextBox> </div>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtemailid" Text="*"
                            Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                       
                        <div class="f-row"> <asp:TextBox ID="txtusername" runat="server" placeholder="User Name" ValidationGroup="personal"></asp:TextBox> </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtusername" Text="*"
                            Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                       
                        <div class="f-row"> <asp:TextBox ID="txtpassword" runat="server" placeholder="Password" ValidationGroup="personal" TextMode="Password"></asp:TextBox> </div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtpassword" Text="*"
                            Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                      
                        <div class="f-row"> <asp:TextBox ID="txtconfirmpassword" runat="server" placeholder="Confirm Password" ValidationGroup="personal" TextMode="Password"></asp:TextBox> </div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtconfirmpassword" Text="*"
                            Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                          
                   <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToValidate="txtconfirmpassword" ControlToCompare="txtpassword" Display="Dynamic" SetFocusOnError="True" Text="Mismatch Password"></asp:CompareValidator>
						<div class="f-row bwrap"> <asp:Button ID="btnregister" runat="server" 
                                Text="Register Now" onclick="btnregister_Click"></asp:Button></div>
						<p>Already have an account yet? <a href="Login.aspx">Log in.</a></p>
					<div class="col-lg-3"></div>
            </div>
  </section>
  </div>
  </main>

</asp:Content>

