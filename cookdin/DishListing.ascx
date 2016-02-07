<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DishListing.ascx.cs" Inherits="DishListing" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>



		<!--wrap-->
		<div class="wrap clearfix">
			<!--row-->
			<div class="row">
                <section class="content full-width" style="visibility: visible; animation-name: fadeInUp;">
                <div class="entries row">
               <asp:Repeater ID="Repeaterdish" runat="server">
                <HeaderTemplate> </HeaderTemplate>
                <ItemTemplate>
                 <div style="visibility: visible; animation-name: fadeInLeft;" class="entry one-fourth">
                	<figure>
							<header class="s-title">
								
								<asp:Image ID="ImgIsVeg" runat="server" ImageUrl="~/templete/image/sveg.png" class="veg-icon"></asp:Image></header>
                                 <asp:Image ID="imgdish" class="prod-img" runat="server" ImageUrl='<%# "dishphotoupload/"+Eval("Dish_Image")%>'></asp:Image>
								<figcaption>
                                    <a href='ViewDish.aspx?did=<%# EncryptString(Eval("Dish_ID").ToString()) %>'>
                                                 <i class="ico i-chef-img hover-dish"> <asp:Image ID="Image2" CssClass="img-dish-list" runat="server" ImageUrl='<%# "Profile_Photo/"+Eval("Photo")%>' alt="" style="border-radius: 50%"></asp:Image> </i>
                                                 <span>Chef <%#Eval("fullname")%></span> 
                                                 <span class="normal-font"><%#Eval ("Area") %></span>
                                                 <span class="normal-font"><asp:Rating ID="ChefRating" runat="server"   StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"  FilledStarCssClass="FilledStar" ReadOnly="true"></asp:Rating></span>
                                    </a>
                                 </figcaption>
							</figure>
							<div class="container dish-name">
								  <h2 class="normal-font"><a href='ViewDish.aspx?did=<%# EncryptString(Eval("Dish_ID").ToString()) %>'> 
                                  <%#Eval("Dish_Name").ToString().Length <= 20 ? Eval("Dish_Name") : Eval("Dish_Name").ToString().Substring(0, 20)+ "..."%>
                              
                                  </a>

                                <!--  <img src='<%# "UploadIcon/"+Eval("Icon")%>' class="veg-icon" /> -->

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
                </div>
                </section>
             </div>
			<!--//right sidebar-->
		</div>
		<!--//wrap-->
	</main>
	
     

	
	

  
