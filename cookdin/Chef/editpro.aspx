<%@ Page Title="" Language="C#" MasterPageFile="~/Chef/ChefMasterPage.master" AutoEventWireup="true" CodeFile="editpro.aspx.cs" Inherits="Chef_editpro" %>

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
							<center>
                            <asp:Image ID="ProfilePhoto" runat="server"></asp:Image>
                            </center>
						</figure>
						<div class="container">
							<h2>Chef <asp:Label ID="lblusername" runat="server" Text="Label"></asp:Label></h2>	 
						<%--</div>
                        <div class="container">--%>
                        <span> Change Profile Puicture</span>
                                <asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
       

                                  <script type="text/javascript">
                                      function UploadFile(fileUpload) {
                                          if (fileUpload.value != '') {
                                              document.getElementById("<%=btnUpload.ClientID %>").click();
                                          }
                                      }
    </script>
                                 <asp:Button ID="btnUpload" runat="server" Text="Save"  OnClick="Upload" Style="display: none"></asp:Button> 
                       
                                
                        </div>

					</div>
					<!--//profile left part-->
			<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
            		<div style="visibility: visible;" class="three-fourth">
						<nav class="tabs tabs-width">
							<ul>
								<li class=""><asp:Button ID="btnper" runat="server" Text="About me" Width="100%" 
                                        Height="100%" onclick="btnper_Click"></asp:Button></li>
								<li class=""><asp:Button ID="btnfin" runat="server" Text="Financial Detail" Width="100%" Height="100%"
                                onclick="btnper_Click"></asp:Button></li>
								<li class=""><asp:Button ID="btncng" runat="server" Text="Change Password" Width="100%" Height="100%"
                                onclick="btnper_Click"></asp:Button></li>
							</ul>
						</nav>
						
						<!--about-->
						<div style="display: Block;" class="tab-content" id="about">
							<div class="row">
								<dl class="basic two-third">
                                <h3><asp:Label ID="lblmessage" runat="server" Text="Save Change Successfully" Visible="false" ForeColor="#009900"></asp:Label></h3>
                                <asp:MultiView ID="MultiView1" runat="server">
                                    <asp:View ID="View1" runat="server">
                                    <div class="row">
								<dl class="basic full-width light-bg">
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
                                        <asp:TextBox ID="txtqty" runat="server" placeholder="Meal quantity" Width="100%"  cssClass="remove-border"
                                        onkeypress="return IsNumeric(event);" onpaste="return false;" ondrop = "return false;" ></asp:TextBox>
                                      <%--  <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" Display="Dynamic" Text="not" Type="Integer" 
                                            ControlToValidate="txtqty" Operator="DataTypeCheck"></asp:CompareValidator>--%>
                                               <script type="text/javascript">
                                                   var specialKeys = new Array();
                                                   specialKeys.push(8); //Backspace
                                                   function IsNumeric(e) {
                                                       var keyCode = e.which ? e.which : e.keyCode
                                                       var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
                                                       document.getElementById("error").style.display = ret ? "none" : "inline";
                                                       return ret;
                                                   }
    </script>
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
                                    </asp:View>
                                    <asp:View ID="View2" runat="server">
                                    <div class="row">
								<dl class="basic full-width light-bg">
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
                                                                                <asp:TextBox ID="txtIFSC" runat="server" MaxLength="11" placeholder="IFSC Code" cssClass="remove-border"></asp:TextBox>
                                                                            </div>
                                                                        </dt>
                                                                        <dd>MICR Code</dd>
                                                                        <dt>
                                                                            <div class="f-row">
                                                                                <%--<input type="text" id="name" placeholder="MICR Code" class="remove-border">--%>
                                                                                <asp:TextBox ID="txtmicr" runat="server" MaxLength="9" placeholder="MICR Code" cssClass="remove-border"></asp:TextBox>
                                                                            </div>
                                                                        </dt>

                                                                        <div class="f-row">
                                   <asp:Button ID="btnFinancial" runat="server" Text="Submit" 
                                         onclick="btnFinancial_Click" />
                                 </div>
								</dl>
                                
							
							</div>
                                    </asp:View>
                                    <asp:View ID="View3" runat="server">
                                    <div class="row">
								<dl class="basic full-width light-bg">
									
                                    <dd>Old Password</dd>
                                    <dt>
                                     <div class="f-row">
                                        <%--<input type="text" id="name" placeholder="First Name" class="remove-border">--%>
                                            <asp:TextBox ID="txtOldPwd" runat="server" placeholder="Current Password" CssClass="remove-border" TextMode="Password"></asp:TextBox>
                                        </div></dt>
									<dd>New Password</dd>
									<dt> <div class="f-row">
                                        <%--<input type="text" id="name" placeholder="First Name" class="remove-border">--%>
                                            <asp:TextBox ID="txtNewPwd" runat="server" placeholder="New Password" CssClass="remove-border" TextMode="Password"></asp:TextBox>
                                        </div></dt>
									<dd>Repeat Password</dd>
									<dt> <div class="f-row">
                                        <%--<input type="text" id="name" placeholder="First Name" class="remove-border">--%>
                                            <asp:TextBox ID="txtRePwd" runat="server" placeholder="Confirm Password" CssClass="remove-border" TextMode="Password"></asp:TextBox>
                                        </div></dt>
									
							        	<div class="f-row">
                                     <asp:Button ID="btnPassword" runat="server" Text="Submit" 
                                         onclick="btnPassword_Click" />
                                 </div>
								</dl>
							
							</div>
                                    </asp:View>
                                </asp:MultiView>
								</dl>
							</div>
						</div>
						<!--//about-->
			



					</div>
                    </ContentTemplate>
            </asp:UpdatePanel>
			
</div>
</section>
</div>
</main>
</asp:Content>

