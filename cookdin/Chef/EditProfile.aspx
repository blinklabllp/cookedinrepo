<%@ Page Title="" Language="C#" MasterPageFile="~/Chef/ChefMasterPage.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="Chef_EditProfile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <main class="main" role="main">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="#" title="Home">Dashboard</a></li>
					<li>Edit Profile</li>
				</ul>
			</nav>
<section class="">
<div class="row">
					<!--profile left part-->
					<div style="visibility: visible;" class="my_account one-fourth">
						<figure>
							
                            <asp:Image ID="ProfilePhoto" runat="server"></asp:Image>
						</figure>
						<div class="container">
							<h2><asp:Label ID="lblusername" runat="server" Text="Label" Font-Size="Medium"></asp:Label></h2>	 
						</div>
                        <div class="container">
                        <h4> Change Profile Puicture</h4>
                                <asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
       
     <script type="text/javascript">
                                     function UploadFile(fileUpload) {
                                         if (fileUpload.value != '') {  
                                             document.getElementById("<%=btnUpload.ClientID %>").click();
                                         }
                                     }
    </script>
                                <asp:Button ID="btnphotosave" runat="server" Text="Save"   onclick="btnphotosave_Click" Visible="false" ></asp:Button> 
                                 <asp:Button ID="btnUpload" runat="server" Text="Save"  OnClick="Upload" Style="display: none"></asp:Button> 
                        </div>

					</div>
					<!--//profile left part-->
					
					<div style="visibility: visible;" class="three-fourth">
						<nav class="tabs tabs-width">
							<ul>
								<li class="active"><a href="#about" title="About me">About me</a></li>
								<li class=""><a href="#Financial" title="Financial Detail">Financial Detail</a></li>
								<li class=""><a href="#Password" title="Change Password">Change Password</a></li>
							</ul>
						</nav>
						
						<!--about-->
						<div style="display: Block;" class="tab-content" id="about">
							<div class="row">
								<dl class="basic two-third light-bg">
                                <dd>User Name</dd>
									<dt>
                                        <div class="f-row">
                                            <asp:TextBox ID="txtUserName" runat="server" placeholder="First Name" CssClass="remove-border" Enabled="false"></asp:TextBox>
                                        </div>
                                    </dt>
									<dd>First Name</dd>
									<dt>
                                        <div class="f-row">
                                        <%--      <input type="text" id="name" placeholder="First Name" class="remove-border">--%>
                                            <asp:TextBox ID="txtfname" runat="server" placeholder="First Name" CssClass="remove-border"></asp:TextBox>
                                        </div>
                                    </dt>
                                    <dd>Middle Name</dd>
                                    <dt>
                                        <div class="f-row">
                                            <%--  <input type="text" id="Text1" placeholder="Middle Name" class="remove-border">--%>
                                            <asp:TextBox ID="txtmname" runat="server" placeholder="Middle Name" CssClass="remove-border"></asp:TextBox>
                                        </div>
                                    </dt> 
                                    <dd>Last Name</dd>
                                    <dt>
                                    <div class="f-row">
                                    <%--     <input type="text" id="Text2" placeholder="Last Name" class="remove-border">--%>
                                        <asp:TextBox ID="txtlname" runat="server" placeholder="Last Name" cssClass="remove-border"></asp:TextBox>
                                    </div>
                                </dt>
                                <dd>Date of Birth</dd>
									<dt>
                                    <div class="f-row">
                                        <%-- <input type="text" id="name" placeholder="Your Date of Birth" class="remove-border">--%>
                                        <asp:TextBox ID="txtdob" runat="server" placeholder="Your Date of Birth" cssClass="remove-border"></asp:TextBox>
                                        <asp:CalendarExtender ID="txtdob_CalendarExtender" runat="server" 
                                            Enabled="True" TargetControlID="txtdob">
                                        </asp:CalendarExtender>
                                    </div>
                                </dt>
                                <dd>Gender</dd>
									<dt>
                                    <div class="f-row">
                                        <%--<input type="text" id="name" placeholder="Your Gender" class="remove-border">--%>
                                        <asp:TextBox ID="txtgender" runat="server" placeholder="Gender" ValidationGroup="personal" cssClass="remove-border"></asp:TextBox>
                                        <%-- <asp:TextBox ID="txtgener" runat="server" placeholder="Your Gender" cssClass="remove-border"></asp:TextBox>--%>
                                    </div>
                                </dt>
                                <dd>Email</dd>
						        <dt>
                                    <div class="f-row">
                                        <%-- <input type="text" id="name" placeholder="Your Email Address" class="remove-border">--%>
                                        <asp:TextBox ID="txtemail" runat="server" placeholder="Your Email Address" cssClass="remove-border"></asp:TextBox>
                                    </div>
                                </dt>
                                <dd>Mobile No</dd>
									<dt>
                                    <div class="f-row">
                                        <%--<input type="text" id="name" placeholder="Your Mobile No" class="remove-border">--%>
                                        <asp:TextBox ID="txtmobile" runat="server" placeholder="Your Mobile No" cssClass="remove-border"></asp:TextBox>
                                    </div>
                                </dt>
                                <dd>Landline</dd>
									<dt>
                                        <div class="f-row">
                                            <%-- <input type="text" id="name" placeholder="Your Landline No" class="remove-border">--%>
                                            <asp:TextBox ID="txtphone" runat="server" placeholder="Your Landline No" cssClass="remove-border"></asp:TextBox>
                                        </div>
                                    </dt>
                                        <dd>Apartment No</dd>
									<dt>
                                        <div class="f-row">
                                            <%-- <input type="text" id="name" placeholder="Your Landline No" class="remove-border">--%>
                                            <asp:TextBox ID="txtApart" runat="server" placeholder="Your Landline No" cssClass="remove-border"></asp:TextBox>
                                        </div>
                                    </dt>
                                        <dd>Block No</dd>
									<dt>
                                    <div class="f-row">
                                        <%-- <input type="text" id="name" placeholder="Your Landline No" class="remove-border">--%>
                                        <asp:TextBox ID="txtBlock" runat="server" placeholder="Your Landline No" cssClass="remove-border"></asp:TextBox>
                                    </div>
                                </dt>
                                    <dd>Society Name</dd>
									<dt>
                                        <div class="f-row">
                                            <%-- <input type="text" id="name" placeholder="Your Landline No" class="remove-border">--%>
                                            <asp:TextBox ID="txtSoc" runat="server" placeholder="Your Landline No" cssClass="remove-border"></asp:TextBox>
                                        </div>
                                    </dt>
                                        <dd>Area</dd>
									<dt>
                                        <div class="f-row">
                                            <%-- <input type="text" id="name" placeholder="Your Landline No" class="remove-border">--%>
                                            <asp:DropDownList ID="ddlarea" runat="server" Width="100%" cssClass="remove-border"></asp:DropDownList>
                                        </div>
                                    </dt>
                                        <dd>City</dd>
									<dt>
                                        <div class="f-row">
                                            <%-- <input type="text" id="name" placeholder="Your Landline No" class="remove-border">--%>
                                                <asp:DropDownList ID="ddlcity" runat="server" Width="100%" cssClass="remove-border"></asp:DropDownList>
                                        </div>
                                    </dt>
                                        <dd>LandMark</dd>
									<dt>
                                        <div class="f-row">
                                            <%-- <input type="text" id="name" placeholder="Your Landline No" class="remove-border">--%>
                                            <asp:TextBox ID="txtlandmark" runat="server" placeholder="LandMark" ValidationGroup="personal" cssClass="remove-border"></asp:TextBox>
                                        </div>
                                    </dt>

                                                                       
						      
                                <dd>Meal Quantity</dd>
									<dt>
                                    <div class="f-row">
                                        <asp:TextBox ID="txtqty" runat="server" placeholder="Meal quantity" Width="100%"  cssClass="remove-border"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" Display="Dynamic" Text="not" Type="Integer" 
                                            ControlToValidate="txtqty" Operator="DataTypeCheck"></asp:CompareValidator>
                                    </div>
                                </dt>

									<div class="f-row">
									<div class="full">
                                   <%-- <textarea placeholder="About You"></textarea>--%>
                                        <asp:TextBox ID="txtabout" runat="server" placeholder="About You" TextMode="MultiLine"></asp:TextBox>
                                    </div>
								</div>

                                <div class="f-row">
                                     <asp:Button ID="btnPersonal" runat="server" Text="Submit" 
                                         onclick="btnPersonal_Click" />
                                 </div>
								</dl>
								 
						
							</div>
						</div>
						<!--//about-->
					<!--my posts-->
						<div style="display: Block;" class="tab-content" id="Financial">
							<!--entries-->
							<div class="row">
								<dl class="basic two-third light-bg">
									<dd>S/B Account No</dd>
                                                                        <dt>
                                                                            <div class="f-row">
                                                                                <%--<input type="text" id="name" placeholder="A/c No" class="remove-border">--%>
                                                                                <asp:TextBox ID="txtaccountno" runat="server" placeholder="A/c No" cssClass="remove-border"></asp:TextBox>
                                                                            </div>
                                                                        </dt>
									<dd>A/c Holder Name</dd>
                                                                        <dt>
                                                                            <div class="f-row">
                                                                            <%--    <input type="text" id="name" placeholder="Name" class="remove-border">--%>
                                                                                <asp:TextBox ID="txtholdername" runat="server" placeholder="Name" cssClass="remove-border"></asp:TextBox>
                                                                            </div>
                                                                        </dt>
									<dd>Bank Name</dd>
                                                                        <dt>
                                                                            <div class="f-row">
                                                                               <%-- <input type="text" id="name" placeholder="Bank Name" class="remove-border">--%>
                                                                                <asp:TextBox ID="txtbankname" runat="server" placeholder="Bank Name" cssClass="remove-border"></asp:TextBox>
                                                                            </div>
                                                                        </dt>
									<dd>Branch Code</dd>
                                                                        <dt>
                                                                            <div class="f-row">
                                                                               <%-- <input type="text" id="name" placeholder="Branch Code" class="remove-border">--%>
                                                                                <asp:TextBox ID="txtbranchcode" runat="server" placeholder="Branch Code" cssClass="remove-border"></asp:TextBox>
                                                                            </div>
                                                                        </dt>
                                                                        <dd>Bank Branch</dd>
									<dt><div class="f-row">
                                                                               <%-- <input type="text" id="name" placeholder="Bank Branch" class="remove-border">--%>
                                                                                <asp:TextBox ID="txtbankbranck" runat="server" placeholder="Bank Branch" cssClass="remove-border"></asp:TextBox>
                                                                            </div>
                                                                        </dt>
                                                                       
                                                                         <dd>IFSC Code</dd>
									<dt><div class="f-row">
                                                                               <%-- <input type="text" id="name" placeholder="Bank Branch" class="remove-border">--%>
                                                                                <asp:TextBox ID="txtIFSC" runat="server" MaxLength=11 placeholder="IFSC Code" cssClass="remove-border"></asp:TextBox>
                                                                            </div>
                                                                        </dt>
                                                                        <dd>MICR Code</dd>
                                                                        <dt>
                                                                            <div class="f-row">
                                                                                <%--<input type="text" id="name" placeholder="MICR Code" class="remove-border">--%>
                                                                                <asp:TextBox ID="txtmicr" runat="server" MaxLength=9 placeholder="MICR Code" cssClass="remove-border"></asp:TextBox>
                                                                            </div>
                                                                        </dt>

                                                                        <div class="f-row">
                                     <asp:Button ID="btnFinancial" runat="server" Text="Submit" 
                                         onclick="btnFinancial_Click" />
                                 </div>
								</dl>
                                
							<%--	
								<div class="one-third">
									<ul class="boxed gold">
										<li class="light"><a href="#" title="Best recipe"><i class="ico i-had_best_recipe"></i> <span>Had a best recipe</span></a></li>
										<li class="medium"><a href="#" title="Was featured"><i class="ico i-was_featured"></i> <span>Was featured</span></a></li>
										<li class="dark"><a href="#" title="Added a first recipe"><i class="ico i-added_first_recipe"></i> <span>Added a first recipe</span></a></li>
										
										<li class="medium"><a href="#" title="Added 10-20 recipes"><i class="ico i-added_several_recipes"></i> <span>Added 10-20 recipes</span></a></li>
										<li class="dark"><a href="http://www.themeenergy.com/themes/html/social-chef/recipes.html" title="Events"><i class="ico i-wrote_blog_post"></i> <span>Wrote a blog post</span></a></li>
										<li class="light"><a href="http://www.themeenergy.com/themes/html/social-chef/recipes.html" title="Fish"><i class="ico i-wrote_comment"></i> <span>Wrote a comment</span></a></li>
										
										<li class="dark"><a href="http://www.themeenergy.com/themes/html/social-chef/recipes.html" title="Fish"><i class="ico i-won_contest"></i> <span>Won a contest</span></a></li>
										<li class="light"><a href="http://www.themeenergy.com/themes/html/social-chef/recipes.html" title="Healthy"><i class="ico i-shared_recipe"></i> <span>Shared a recipe</span></a></li>
										<li class="medium"><a href="#" title="Was featured"><i class="ico i-was_featured"></i> <span>Was featured</span></a></li>
									</ul>
								</div>--%>
							</div>
							<!--//entries-->
						</div>
						<!--//my posts-->

                        	<!--my favorites-->
						<div style="display: Block;" class="tab-content" id="Password">
							<div class="row">
								<dl class="basic two-third light-bg">
									<dt>
                                     <div class="f-row">
                                                                          <%--      <input type="text" id="name" placeholder="First Name" class="remove-border">--%>
                                                                                <asp:TextBox ID="txtOldPwd" runat="server" placeholder="Current Password" CssClass="remove-border" TextMode="Password"></asp:TextBox>
                                                                            </div></dt>
									<dd>Old Password</dd>
									<dt> <div class="f-row">
                                                                          <%--      <input type="text" id="name" placeholder="First Name" class="remove-border">--%>
                                                                                <asp:TextBox ID="txtNewPwd" runat="server" placeholder="New Password" CssClass="remove-border" TextMode="Password"></asp:TextBox>
                                                                            </div></dt>
									<dd>New Password</dd>
									<dt> <div class="f-row">
                                                                          <%--      <input type="text" id="name" placeholder="First Name" class="remove-border">--%>
                                                                                <asp:TextBox ID="txtRePwd" runat="server" placeholder="Confirm Password" CssClass="remove-border" TextMode="Password"></asp:TextBox>
                                                                            </div></dt>
									<dd>Repeat Password</dd>
								

                                    	<div class="f-row">
                                     <asp:Button ID="btnPassword" runat="server" Text="Submit" 
                                         onclick="btnPassword_Click" />
                                 </div>
								</dl>
							
							
							</div>
						</div>
						<!--//my favorites-->
						



					</div>
</div>
</section>
</div>
</main>
<script src="../templete/js/jquery-1.js"></script>
	<script src="../templete/js/jquery_002.js"></script>
	<script src="../templete/js/wow.js"></script>
	<script src="../templete/js/jquery.js"></script>
	<script src="../templete/js/scripts.js"></script>
    <script>        new WOW().init();</script>
</asp:Content>


