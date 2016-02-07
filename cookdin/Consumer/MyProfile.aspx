<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Consumer_MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<main class="main main-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="MyProfile.aspx" title="Home">Home</a></li>
					<li>Dashboard</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
			
			<!--content-->
			<section class="content top-padding full-width">
				<!--row-->
				<div class="row">
					<!--profile left part-->
					<div style="visibility: visible;" class="my_account one-fourth">
						<figure>
                            <asp:Image ID="ProfilePhoto" runat="server" ImageUrl="~/templete/image/Duser.png" class="profile-pic"></asp:Image>
						</figure>
						<div class="container">
                            <h2>
                                <asp:Label ID="lblusername" runat="server" Text="Chef Desai"></asp:Label>
							</h2> 
						</div>
					</div>
					<!--//profile left part-->
					
					<div style="visibility: visible;" class="three-fourth">
						<nav class="tabs">
							<ul>
								<li class="active full-width-tab"><a href="#about" title="About me">About me</a></li>
							</ul>
						</nav>
						
						<!--about-->
						<div style="display: block;" class="tab-content" id="about">
							<div class="row">
								<dl class="basic full-width">
									<dt>Name</dt>
									<dd><asp:Label ID="lblName" runat="server" Text=""></asp:Label></dd>
                                    <dt>Email Id</dt>
									<dd><asp:Label ID="lblemailid" runat="server" Text=""></asp:Label> </dd>
                                    <dt>Contact Number</dt>
									<dd><asp:Label ID="lblcontactno" runat="server" Text=""></asp:Label></dd>
								</dl>
                                
                                <asp:Button ID="btnedit" runat="server" Text="Edit Profile" onclick="btnedit_Click"></asp:Button>
                                 <%--   <asp:Button ID="btnbillingaddress" runat="server" Text="Billing Address" 
                                                onclick="btnbillingaddress_Click" ></asp:Button>--%>
                                    <asp:Button ID="btnorderlist" runat="server" Text="My Orders" 
                                                onclick="btnorderlist_Click" ></asp:Button>
							</div>
                            
						</div>
						<!--//about-->
					</div>
				</div>
				<!--//row-->
			</section>
			<!--//content-->
                        
		</div>
		<!--//wrap-->
	</main>

</asp:Content>

