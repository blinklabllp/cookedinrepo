<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="Consumer_EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<main class="main main-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="#" title="Home">Dashboard</a></li>
					<li>Edit Profile</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
<section style="visibility: visible;" class="content center full-width">
					<div class="modal container">
						<h3>Edit My Profile</h3>
						<div class="f-row"><asp:TextBox ID="txtfirstname" runat="server" placeholder="FirstName"></asp:TextBox></div>
						<div class="f-row"><asp:TextBox ID="txtmiddlename" runat="server" placeholder="MiddleName"></asp:TextBox></div>
					    <div class="f-row"><asp:TextBox ID="txtlastname" runat="server" placeholder="LastName"></asp:TextBox></div>
                        <div class="f-row"><asp:TextBox ID="txtcontactno" runat="server" placeholder="Mobile Number"></asp:TextBox></div>
                        <div class="f-row"><asp:TextBox ID="txtgender" runat="server" placeholder="Gender"></asp:TextBox></div>
                        <div class="f-row"><asp:FileUpload ID="FileUpload1" runat="server" Width="100%"></asp:FileUpload></div>
                        <div class="f-row bwrap"><asp:Button ID="btnsubmit" runat="server" Text="Submit"  onclick="btnsubmit_Click"></asp:Button></div>
					</div>

                    <div class="modal container">
                    <h3>Change Password</h3>
                        <div class="f-row"><asp:TextBox ID="txtcurrent" runat="server" placeholder="Current Password"></asp:TextBox></div>
                        <div class="f-row"><asp:TextBox ID="txtnew" runat="server" placeholder="New Password"></asp:TextBox></div>
                        <div class="f-row"><asp:TextBox ID="txtconfirm" runat="server" placeholder="Confirm Password"></asp:TextBox></div>
                        <div class="f-row bwrap"> <asp:Button ID="btnchange" runat="server" 
                                Text="Change Password" onclick="btnchange_Click" ></asp:Button>
						</div>

                    </div>

				</section>
                </div>
                </main>
</asp:Content>

