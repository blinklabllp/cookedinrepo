<%@ Page Title="" Language="C#" MasterPageFile="~/basic.master" AutoEventWireup="true" CodeFile="newsletter.aspx.cs" Inherits="newsletter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="wrap clearfix">
			<!--row-->
			<div class="row">
			<!--content-->
 
                
<section class="content center full-width" style="visibility: visible;">
					<div class="modal container">

   <asp:Panel ID="pnlwarning" runat="server" Visible="false">
     <div class="row">
         <div class="full-width wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
             <div role="alert" class="alert alert-danger"><asp:Label ID="lblwarningmessage" runat="server" Text="Already Subscribe the NewsLetter"></asp:Label></div>
         </div>
    </div>
 </asp:Panel>

 <asp:Panel ID="pnlsuccess" runat="server" Visible="false">
     <div class="row">
         <div class="full-width wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
             <div role="alert" class="alert alert-success"><asp:Label ID="Label1" runat="server" Text="Thank you for subscribing"></asp:Label></div>
         </div>
    </div>
 </asp:Panel>

                    <img style="width: 40%; text-align: center; margin: auto;" alt="cook'dIN logo" src="templete/image/logo.png">
						<div style="text-align:center">
								<h3>Please tell us your name, city, email and we will keep you updated on whats happening with cook’din and you will be the first to know when we come to your city</h3>
							</div>
                        <div class="f-row">
							
                            <asp:TextBox ID="txtname" runat="server" placeholder="Your Name"></asp:TextBox>
						    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtname" Display="Dynamic" Font-Size="Small"
                                ErrorMessage="RequiredFieldValidator" ForeColor="Red" SetFocusOnError="True">Please tell us what to call you by</asp:RequiredFieldValidator>
						</div>
						<div class="f-row">
						    <asp:TextBox ID="txtemail" runat="server" placeholder="Your Email"></asp:TextBox>
						    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtemail" Display="Dynamic" 
                                ErrorMessage="RequiredFieldValidator" ForeColor="Red" 
                                SetFocusOnError="True" Font-Size="Small">Please tell us Email</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                runat="server" ErrorMessage="RegularExpressionValidator" ForeColor="Red" 
                                SetFocusOnError="True" ControlToValidate="txtemail"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Please enter a valid email</asp:RegularExpressionValidator>
						</div>
                        <div class="f-row">
                             <div class="form-dropdown drop-down-half left">
                                  <asp:DropDownList ID="ddlstate" runat="server" Width="100%"></asp:DropDownList>
                             </div>
                             <div class="form-dropdown drop-down-half left">
                                  <asp:DropDownList ID="ddlcity" runat="server" Width="100%"></asp:DropDownList>
                             </div>
                        </div>
						<div class="f-row bwrap">
                        <asp:Button ID="btnsubmit" runat="server" Text="Subscribe" onclick="btnsubmit_Click"></asp:Button>
                        <p class="right">Please read our <a href="privacypolicy.aspx">Privacy Policy</a></p>
						</div>
					</div>
				</section>


				<!--//content-->
			</div>
			<!--//row-->
		</div>
</asp:Content>

