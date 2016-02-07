<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="DishList.aspx.cs" Inherits="Consumer_DishList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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

<main class="main" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			<!--breadcrumbs-->
		<%--	<nav class="breadcrumbs">
				<ul>
					<li><a href="http://www.themeenergy.com/themes/html/social-chef/index.html" title="Home">Home</a></li>
					<li>Recipes</li>
				</ul>
			</nav>--%>
			<div class="row">
				<header style="visibility: visible;" class="s-title">
					<!--<h1>Recipes</h1>-->
				</header>
				<!--content-->
               <%-- <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" >--%>
                <section class="content full-width" style="visibility: visible; ">
                <div class="entries row">
               <asp:Repeater ID="Repeaterdish" runat="server">
                <HeaderTemplate>
                
                </HeaderTemplate>
                <ItemTemplate>
               
              <div style="visibility: visible;" class="entry one-fourth">
                	<figure>
								<%--<img class="img-dish-list" src="../templete/image/img6.jpg" alt="">--%>
                                 <span class="dish-meal-type"><%#Eval("Dish_Type")%></span>
                                 <asp:Image ID="Image1" class="prod-img" runat="server" ImageUrl='<%# "../Chef/upload/"+Eval("Dish_Image")%>'></asp:Image>
								<figcaption>
                                    <a href='ViewDish.aspx?did=<%# Eval("Dish_ID") %>'><i class="ico i-chef-img">
                                                 <%--   <img class="img-dish-list" src="../templete/image/avatar4.jpg" alt="" style="border-radius: 50%">--%>
                                                    <asp:Image ID="Image2" CssClass="img-dish-list" runat="server" ImageUrl='<%# "../Profile_Photo/"+Eval("Photo")%>' alt="" style="border-radius: 50%"></asp:Image>
                                                </i>
                                                <span>Chef <%#Eval("fullname")%></span> 
                                                 <span><%#Eval ("Area") %></span>
                                                <span><asp:Rating ID="ChefRating" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar" ReadOnly="true"></asp:Rating> </span>
                                                </a>
                                 </figcaption>
							</figure>
							<div class="container">
								  <h2><a href='ViewDish.aspx?did=<%# Eval("Dish_ID")%>'>
                                                                 <%#Eval ("Dish_Name") %></a>


                                   <span title="veg" class="meal-type-icon"></span> </h2>
                                   <div>
                  <span class="price-text-new"><asp:Label ID="lblOfferPrice" runat="server" Text='<%# "&#x20B9;" + Eval("SpecialOfferPrice")%>'></asp:Label></span> 
                                   <span class="price-text-new price-text"><asp:Label ID="lblPrice" runat="server" Text='<%# "&#x20B9; "+Eval ("Price") %>'></asp:Label></span>
                                    </div>
                                <div class="actions">
									<div>
										     <div class="comments"><asp:Rating ID="DishRating" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar" ReadOnly="true"></asp:Rating></div>
                                             <div class="comments"><i class="ico i-comments"></i> <a href="#"><%#Eval("Diet_Type")%></a></div>
									</div>
								</div>
                             </div>
                            <div>
								<a class="button full-width" href='ViewDish.aspx?did=<%# Eval("Dish_ID") %>'>View More</a>


        <%--              <a href='Login.aspx?id=<%#HttpUtility.UrlEncode(Encrypt(Eval("Dish_ID").ToString()))%>' style="text-decoration:none">nnnnn </a>--%>

                      


							</div>
                           <asp:Label ID="lblOfferStartDate" runat="server" Text='<%#Eval("OfferStartDate")%>' Visible="false"></asp:Label>
                           <asp:Label ID="lblOfferEndDate" runat="server" Text='<%#Eval("OfferEndDate")%>' Visible="false"></asp:Label>
                            <asp:Label ID="lblChefID" runat="server" Text='<%#Eval("Chef_ID")%>' Visible="false"></asp:Label>
                           <asp:Label ID="lblDishID" runat="server" Text='<%#Eval("Dish_ID")%>' Visible="false"></asp:Label>
                            </div>
                          
                </ItemTemplate>
                <FooterTemplate>
               
                </FooterTemplate>
                </asp:Repeater>
               <%-- </asp:DataList>--%>
			
                  <%--  <section style="visibility: visible; animation-name: fadeInUp;" class="content full-width wow fadeInUp animated">
					<!--entries-->
					<div class="entries row">
						<div class="quicklinks"><a href="#" class="button">More recipes</a> <a href="javascript:void(0)" class="button scroll-to-top">Back to top</a></div>
					</div>
					<!--//entries-->
				</section>--%>
				<!--//content-->
                </div>
                </section>
             </div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>
</asp:Content>

