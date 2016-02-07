<%@ Page Title="" Language="C#" MasterPageFile="~/Chef/ChefMasterPage.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="Chef_MyProfile" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register src="~/DishListing.ascx" TagName="DishListing" TagPrefix="UserInformation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<%--back to top not working
 Content is override at top header
--%>
<style type="text/css">
        .Star
        {
            background-image: url(../images/Star.gif);
            height: 17px;
            width: 17px;
        }
        .WaitingStar
        {
            background-image: url(../images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }
        .FilledStar
        {
            background-image: url(../images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
    </style>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
 <main class="main main-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="#" title="Home">Home</a></li>
					<li>Dashboard</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
			
		
			<!--content-->
			<section class="content full-width">
				<!--row-->
				<div class="row">
					<!--profile left part-->
					<div style="visibility: visible;" class="my_account one-fourth">
						<figure>
                            <asp:Image ID="ProfilePhoto" runat="server" ImageUrl="template/image/avatar4.jpg" class="profile-pic"></asp:Image>
						</figure>
						<div class="container">
                            <h2>
                                <asp:Label ID="lblname" runat="server" Text="Chef Desai"></asp:Label>
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
									<dd>Name</dd>
									<dt>
                                        <asp:Label ID="lblUserName" runat="server" Text="Chef Desai"></asp:Label>
                                    </dt>
                                    <dd>Dishes Served</dd>
									<dt>
                                        <asp:Label ID="lblNoOfDishes" runat="server" Text="22222"></asp:Label>
                                    </dt>
                                    <dd>Reviews</dd>
									<dt>
                                        <asp:Label ID="lblNoOfReviews" runat="server" Text="10000"></asp:Label>
                                    </dt>
								    <p class="container drop-cap secondary">
                                    <asp:Label ID="lblDescription" runat="server" Text="Lorem ipsum dolor sit amet, consectetuer adipiscing 
                                        elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam 
                                        erat volutpat eget libero tellus ementellentesque tempor.">
                                        </asp:Label>
                                    </p>
                                </dl>
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
	<!--//main-->
    <main class="main remove-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			
			<!--row-->
			<div class="row">
				<section style="visibility: visible;" class="content full-width">
					<!--entries-->
					<div class="entries row">
						<!--item-->
                        
							<div class="quicklinks remove-padding">
                            <asp:Button ID="Button1" runat="server" Text="Dish Manager" onclick="Button1_Click" 
                                    ></asp:Button>
								
								<a class="button" href="KitchenSettings.aspx">Kitchen Settings</a>
                                <a class="button" href="MyWallet.aspx">Account</a>
								<asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" 
                                    onclick="btnEditProfile_Click"></asp:Button>
							</div>
						
					</div>
					<!--//entries-->
				</section>
				<!--//content-->
                    <section style="visibility: visible;" class="content full-width">
					<!--entries-->
			       <div class="row">
					        <div class="full-width" style="visibility: visible;">
						        <div class="container box">						
							        <h1 class="center">Today's Orders</h1>
							      <asp:DataList ID="DataList1" runat="server" onitemcommand="DataList1_ItemCommand">
                         <HeaderTemplate>
                          <div class="checkout-title">
                               <table cellpadding="10" cellspacing="10" >
                                    <tr>
                                      <td align="center">Item</td>
                                      <td align="center">Dish</td>
                                      <td align="center">Date & Time</td>
                                      <td align="center">Qty</td>
                                      <td align="center">Total Price</td>
                                      <td align="center">Status</td>
                                      <td align="center">Action</td>
                                    </tr>
                                    <tr><td colspan="7"><div style="height:1px; background-color:gray" id="devider"></div> </td></tr>
                           </div>


                         </HeaderTemplate>
                     <ItemTemplate>


                      <%-- <table cellpadding="10" cellspacing="10" >--%>
                    <tr>
                        <td align="center">
                             <img src='<%# "../dishphotoupload/"+Eval("Dish_Image")%>' alt="" width="70px" height="70px">
                        </td>
                        <td align="center">
                            <%#Eval("Dish_Name") %>
                        </td>
                        <td align="center">
                           <span class="net_price"> <asp:Label ID="Label2" runat="server" Text='<%#Eval("DeliveryDate", "{0:M-dd-yyyy}") %>'></asp:Label></span>
                                            <span class="net_price"> <asp:Label ID="Label3" runat="server" Text='<%#Eval("Slot") %>'></asp:Label></span>
                                             <asp:Label ID="lblid" runat="server" Text='<%#Eval("InvoiceDish_ID") %>' Visible="false"></asp:Label>
                        </td>
                        <td align="center">
                           <%#Eval("Qty") %>
                        </td>
                        <td align="center">
                           <%#Eval("Total") %>
                        </td>
                        <td align="center">
                            <%#Eval("Cooking_Status")%>
                        </td>
                        <td align="center">
                             <asp:Button ID="Button2" runat="server" Text="Cooked" CommandName="cooked" CssClass="button gold btn-small"></asp:Button>
                                        <asp:Button ID="Button5" runat="server" Text="Ready For Pick" CommandName="ready" CssClass="button gold btn-small"></asp:Button>
                        </td>
                    </tr>
              <%--  </table>--%>



                         
                       </ItemTemplate>
                       <FooterTemplate>
                       </table>
                        <%-- <asp:Label forecolor="#9ACD32" Visible='<%# IIF(DataList1.Items.Count=0 And ddlLocation.SelectedItem.Value<>"0", "True", "False")%>' runat="server" ID="lblMsg" Text="No records found"></asp:Label>--%>
                       <center>
                          <asp:Label ForeColor="#d94352" Visible='<%# DataList1.Items.Count==0 %>' runat="server" ID="lblmsg" Text="No Orders Found Yet"></asp:Label>
                       </center>
                       </FooterTemplate>
                        </asp:DataList>
						        </div>
					        </div>
				   </div>

                <div class="row">
				
				<!--//content-->
                                <section style="visibility: visible;" class="content full-width">
					<!--entries-->
					<div class="entries row">
						<!--item-->
                        <h1>Dishes Served</h1>
						<%-- <UserInformation:DishListing id="UserInformation" runat="server"/>  --%>
                           <asp:Repeater ID="Repeaterdish" runat="server">
                <HeaderTemplate> </HeaderTemplate>
                <ItemTemplate>
                 <div style="visibility: visible; animation-name: fadeInLeft;" class="entry one-fourth">
                	<figure>
							<header class="s-title"><%--<img src="templete/image/sveg.png" class="meal-type-img"/>--%>
                             <asp:Image ID="ImgIsVeg" runat="server" ImageUrl="~/templete/image/sveg.png" class="meal-type-img"></asp:Image></header>
                                 <asp:Image ID="Image1" class="prod-img" runat="server" ImageUrl='<%# "../dishphotoupload/"+Eval("Dish_Image")%>'></asp:Image>
								<figcaption>
                                    <a href='ViewDish.aspx?did=<%# EncryptString(Eval("Dish_ID").ToString()) %>'>
                                                 <i class="ico i-chef-img hover-dish"> <asp:Image ID="Image2" CssClass="img-dish-list" runat="server" ImageUrl='<%# "../Profile_Photo/"+Eval("Photo")%>' alt="" style="border-radius: 50%"></asp:Image> </i>
                                                 <span>Chef <%#Eval("fullname")%></span> 
                                                 <span class="normal-font"><%#Eval ("Area") %></span>
                                                 <span class="normal-font"><asp:Rating ID="ChefRating" runat="server"   StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"  FilledStarCssClass="FilledStar" ReadOnly="true"></asp:Rating></span>
                                    </a>
                                 </figcaption>
							</figure>
							<div class="container dish-name">
								  <h2 class="normal-font"><a href='ViewDish.aspx?did=<%# EncryptString(Eval("Dish_ID").ToString()) %>'> 
                                    <%#Eval("Dish_Name").ToString().Length <= 20 ? Eval("Dish_Name") : Eval("Dish_Name").ToString().Substring(0, 20)+ "..."%></a>
                                  <!-- ToDo: Add a condtion to hide icon if no icon is available -->
                                  <%--<img src='<%# "UploadIcon/"+Eval("Icon")%>' class="veg-icon" />--%> 
                                  <span title="veg" class="veg-icon"></span> </h2>
                                   
                                <div class="actions">
									<div>
										     <div class="comments"><asp:Rating ID="DishRating" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar" ReadOnly="true"></asp:Rating></div>
                                             <span class="price-text-new normal-font"><asp:Label ID="lblOfferPrice" runat="server" Text='<%# "&#x20B9;" + Eval("SpecialOfferPrice")%>'></asp:Label></span>
                                              
                                            <span class="price-text-new normal-font"><asp:Label ID="lblPrice" runat="server" Text='<%#"&#x20B9;" + Eval ("Price") %>'></asp:Label></span>
                                             <%--<div class="comments"><i class="ico i-comments"></i> <a href="#"><%#Eval("Diet_Type")%></a></div>--%>
									</div>
								</div>
                             </div>
                            <div>
								<a class="button full-width" href='ViewDish.aspx?did=<%# EncryptString(Eval("Dish_ID").ToString()) %>'>View More</a>


        <%--              <a href='Login.aspx?id=<%#HttpUtility.UrlEncode(Encrypt(Eval("Dish_ID").ToString()))%>' style="text-decoration:none">nnnnn </a>--%>
    					</div>
                           <asp:Label ID="lblOfferStartDate" runat="server" Text='<%#Eval("OfferStartDate")%>' Visible="false"></asp:Label>
                           <asp:Label ID="lblOfferEndDate" runat="server" Text='<%#Eval("OfferEndDate")%>' Visible="false"></asp:Label>
                            <asp:Label ID="lblChefID" runat="server" Text='<%#Eval("Chef_ID")%>' Visible="false"></asp:Label>
                           <asp:Label ID="lblDishID" runat="server" Text='<%#Eval("Dish_ID")%>' Visible="false"></asp:Label>
                            <asp:Label ID="lblISVeg" runat="server" Text='<%#Eval("Is_Veg")%>' Visible="false"></asp:Label>
                            </div>
               
                      
                </ItemTemplate>
                <FooterTemplate>
               
                </FooterTemplate>
                </asp:Repeater>
            
						<!--item-->
                        <div class="quicklinks">
							<a href="javascript:void(0)" class="button scroll-to-top right-important">Back to top</a>
						</div>
					</div>
					<!--//entries-->
				</section>
			</div>
					<!--//entries-->
				</section>
			</div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>
   


</asp:Content>

