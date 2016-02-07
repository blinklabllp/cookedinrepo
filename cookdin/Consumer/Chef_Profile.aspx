<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="Chef_Profile.aspx.cs" Inherits="Chef_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <main class="main main-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="" title="Home">Home</a></li>
					<li>About Chef</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
			
		
			<!--content-->
			<section class="content">
				<!--row-->
				<div class="row">
					<!--profile left part-->
					<div style="visibility: visible;" class="my_account one-fourth">
						<figure>
                            <asp:Image ID="ProfilePhoto" runat="server" ImageUrl="../template/image/avatar4.jpg" class="profile-pic"></asp:Image>
						</figure>
						<%--<div class="container">
                            <h2>
                              <asp:Label ID="lblusername" runat="server" Text="Chef Desai" Visible="false"></asp:Label>
							</h2> 
						</div>--%>
					</div>
					<!--//profile left part-->
					
					<div style="visibility: visible;" class="three-fourth">
						<nav class="tabs">
							<ul>
								<li class="active full-width-tab"><a href="#about" title="About me">About Chef</a></li>
							</ul>
						</nav>
						
						<!--about-->
						<div style="display: block;" class="tab-content" id="about">
							<div class="row">
								<dl class="basic two-third">
									<dt>Name</dt>
									<dd>
                                        <asp:Label ID="lblname" runat="server" Text=""></asp:Label>
                                    </dd>
                                    <dt>Dishes Served</dt>
									<dd>
                                        <asp:Label ID="lblNoOfDishes" runat="server" Text="22222"></asp:Label>
                                    </dd>
                                    <dt>Reviews</dt>
									<dd>
                                        <asp:Label ID="lblNoOfReviews" runat="server" Text="10000"></asp:Label>
                                    </dd>
								    <p class="container drop-cap secondary" style="width:700px">
                                    <asp:Label ID="lblDescription" runat="server" Text="Lorem ipsum dolor sit amet, consectetuer adipiscing 
                                        elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam 
                                        erat volutpat eget libero tellus ementellentesque tempor.">
                                        </asp:Label>
                                    </p>
                                </dl>
								<div class="one-third">
									<%--<ul class="boxed gold">
										<li class="light"><a href="#" title="Best recipe"><i class="ico i-had_best_recipe"></i> <span>Had a best recipe</span></a></li>
										<li class="medium"><a href="#" title="Was featured"><i class="ico i-was_featured"></i> <span>Was featured</span></a></li>
										<li class="dark"><a href="#" title="Added a first recipe"><i class="ico i-added_first_recipe"></i> <span>Added a first recipe</span></a></li>
										
										<li class="medium"><a href="#" title="Added 10-20 recipes"><i class="ico i-added_several_recipes"></i> <span>Added 10-20 recipes</span></a></li>
										<li class="dark"><a href="http://www.themeenergy.com/themes/html/social-chef/recipes.html" title="Events"><i class="ico i-wrote_blog_post"></i> <span>Wrote a blog post</span></a></li>
										<li class="light"><a href="http://www.themeenergy.com/themes/html/social-chef/recipes.html" title="Fish"><i class="ico i-wrote_comment"></i> <span>Wrote a comment</span></a></li>
										
										<li class="dark"><a href="http://www.themeenergy.com/themes/html/social-chef/recipes.html" title="Fish"><i class="ico i-won_contest"></i> <span>Won a contest</span></a></li>
										<li class="light"><a href="http://www.themeenergy.com/themes/html/social-chef/recipes.html" title="Healthy"><i class="ico i-shared_recipe"></i> <span>Shared a recipe</span></a></li>
										<li class="medium"><a href="#" title="Was featured"><i class="ico i-was_featured"></i> <span>Was featured</span></a></li>
									</ul>--%>
								</div>
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
   <%-- <main class="main main-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			
			<!--row-->
			<div class="row">
				<section style="visibility: visible; animation-name: fadeInUp;" class="content full-width wow fadeInUp animated">
					<!--entries-->
					<div class="entries row">
						<!--item-->
                        
							<div class="quicklinks">
                            <asp:Button ID="Button1" runat="server" Text="Dish Manager" onclick="Button1_Click" 
                                    ></asp:Button>
								
								<a class="button" href="#">Shop Settings</a>
                                <a class="button" href="#">Wallet</a>
								<asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" 
                                    onclick="btnEditProfile_Click"></asp:Button>
							</div>
						
					</div>
					<!--//entries-->
				</section>
				<!--//content-->
                    <section style="visibility: visible; animation-name: fadeInUp;" class="content full-width wow fadeInUp animated">
					<!--entries-->
					    <div class="row">
					<div class="full-width wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
						<div class="container box">						
							<h1 class="center">Today's Orders</h1>
							<table>
								<tbody><tr>
									<th>Dish</th>
									<th>Meal Type</th>
                                    <th>Quantity</th>
									<th>Price</th>
									<th>Actions</th>
								</tr>
								<%--<tr>
									<td>Consectetuer</td>
                                    <td>Breakfast/Dinner</td>
									<td>Adipiscing</td>
									<td>Nonummy</td>
									<td>
                                        <div class="quicklinks">
                                        <a class="button" href="#">View</a>
								            <a class="button" href="#">Accept</a>
								            <a class="button" href="#">Reject</a>
                                            
								            <a class="button" href="#">Cooked</a>
							            </div>
                                    </td>
								</tr>--%>
																
						<%--	</tbody></table>
						</div>
					</div>
				</div>
					<!--//entries-->
				</section>
			</div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>
    <main class="main" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			
			<!--row-->
			<div class="row">
				<section style="visibility: visible; animation-name: fadeInUp;" class="content full-width wow fadeInUp animated">
					<!--entries-->
					<div class="entries row">
						<!--item-->
                        <h1>Dishes Serving Today</h1>
					<%--	<div style="visibility: visible; animation-name: fadeInLeft;" class="entry one-fourth wow fadeInLeft animated">
							<figure>
								<img src="template/image/11.jpg" alt="">
								<figcaption><a href="ViewDish.aspx"><i class="ico i-view"></i> <span>View Dish</span></a></figcaption>
							</figure>
							<div class="container">
								<h2>
                                    <a href="#">
                                    <asp:Label ID="Label4" runat="server" Text="Thai fried rice with fruit and vegetables"></asp:Label>        
                                    </a>
                                    <span title="veg" class="meal-type-icon"></span>
                               </h2> 
								<div class="actions">
									<div>
										<div class="comments"><i class="ico i-medium"></i><a href="#">Price</a></div>
										<div class="comments"><i class="ico i-comments"></i><a href="http://www.themeenergy.com/themes/html/social-chef/recipe.html#comments">Ratings</a></div>
									</div>
								</div>
                                <div class="f-row bwrap">
									<input type="submit" value="Add To Cart">
								</div>
							</div>
						</div>
						<!--item-->
                        <div style="visibility: visible; animation-name: fadeInLeft;" class="entry one-fourth wow fadeInLeft animated">
							<figure>
								<img src="template/image/11.jpg" alt="">
								<figcaption><a href="ViewDish.aspx"><i class="ico i-view"></i> <span>View Dish</span></a></figcaption>
							</figure>
							<div class="container">
								<h2>
                                    <a href="#">
                                    <asp:Label ID="Label7" runat="server" Text="Thai fried rice with fruit and vegetables"></asp:Label>        
                                    </a>
                                    <span title="veg" class="meal-type-icon"></span>
                               </h2> 
								<div class="actions">
									<div>
										<div class="comments"><i class="ico i-medium"></i><a href="#">Price</a></div>
										<div class="comments"><i class="ico i-comments"></i><a href="http://www.themeenergy.com/themes/html/social-chef/recipe.html#comments">Ratings</a></div>
									</div>
								</div>
                                <div class="f-row bwrap">
									<input type="submit" value="Add To Cart">
								</div>
							</div>
						</div>
						<!--item-->
                        <div style="visibility: visible; animation-name: fadeInLeft;" class="entry one-fourth wow fadeInLeft animated">
							<figure>
								<img src="template/image/11.jpg" alt="">
								<figcaption><a href="ViewDish.aspx"><i class="ico i-view"></i> <span>View Dish</span></a></figcaption>
							</figure>
							<div class="container">
								<h2>
                                    <a href="#">
                                    <asp:Label ID="Label8" runat="server" Text="Thai fried rice with fruit and vegetables"></asp:Label>        
                                    </a>
                                    <span title="veg" class="meal-type-icon"></span>
                               </h2> 
								<div class="actions">
									<div>
										<div class="comments"><i class="ico i-medium"></i><a href="#">Price</a></div>
										<div class="comments"><i class="ico i-comments"></i><a href="http://www.themeenergy.com/themes/html/social-chef/recipe.html#comments">Ratings</a></div>
									</div>
								</div>
                                <div class="f-row bwrap">
									<input type="submit" value="Add To Cart">
								</div>
							</div>
						</div>--%>
						<!--item-->
                       <%-- <div style="visibility: visible; animation-name: fadeInLeft;" class="entry one-fourth wow fadeInLeft animated">
							<figure>
								<img src="template/image/11.jpg" alt="">
								<figcaption><a href="ViewDish.aspx"><i class="ico i-view"></i> <span>View Dish</span></a></figcaption>
							</figure>
							<div class="container">
								<h2>
                                    <a href="#">
                                    <asp:Label ID="Label9" runat="server" Text="Thai fried rice with fruit and vegetables"></asp:Label>        
                                    </a>
                                    <span title="veg" class="meal-type-icon"></span>
                               </h2> 
								<div class="actions">
									<div>
										<div class="comments"><i class="ico i-medium"></i><a href="#">Price</a></div>
										<div class="comments"><i class="ico i-comments"></i><a href="http://www.themeenergy.com/themes/html/social-chef/recipe.html#comments">Ratings</a></div>
									</div>
								</div>
                                <div class="f-row bwrap">
									<input type="submit" value="Add To Cart">
								</div>
							</div>
						</div>--%>
						<!--item-->
                       
                      <%--  <div class="quicklinks">
							<a href="#" class="button">More Dishes</a>
						</div>
					</div>
					<!--//entries-->
				</section>
				<!--//content-->
                                <section style="visibility: visible; animation-name: fadeInUp;" class="content full-width wow fadeInUp animated">
					<!--entries-->
					<div class="entries row">
						<!--item-->
                        <h1>Top Dishes Served</h1>
						<asp:Repeater ID="Repeaterdish" runat="server">
                <HeaderTemplate>
                
                </HeaderTemplate>
                <ItemTemplate>
              <div style="visibility: visible; animation-name: fadeInLeft;" class="entry one-fourth wow fadeInLeft animated">
                	<figure>
								<%--<img class="img-dish-list" src="../templete/image/img6.jpg" alt="">--%>
                             
                               <%--  <asp:Image ID="Image1" runat="server" class="prod-img" ImageUrl='<%# "upload/"+Eval("Dish_Image")%>'></asp:Image>
								<figcaption>
                                    <a href="#"><i class="ico i-chef-img">
                                                 <%--   <img class="img-dish-list" src="../templete/image/avatar4.jpg" alt="" style="border-radius: 50%">--%>
                                                    <%--<asp:Image ID="Image2" CssClass="img-dish-list" runat="server" ImageUrl='<%# "../Profile_Photo/"+Eval("Photo")%>' alt="" style="border-radius: 50%"></asp:Image>
                                                </i><span><%#Eval ("fullname") %></span> </a>
                                 </figcaption>
							</figure>
							<div class="container">
								  <h2><a href='ViewDish.aspx?did=<%# Eval("Dish_ID")%>'><%#Eval ("Dish_Name") %></a>
                                   <span title="veg" class="meal-type-icon"></span> </h2>
                                   <div><span class="price-text-new">New Price </span> <span class="price-text-new price-text"><%#Eval ("Price") %></span> </div>
                                <div class="actions">
									<div>
										     <div class="comments"><i class="ico i-likes"></i><a href="#">Ratings</a></div>
                                             <div class="comments"><i class="ico i-comments"></i> <a href="#"><%#Eval("Diet_Type")%></a></div>
									</div>
								</div>
                             </div>
                            <div class="quicklinks"><a href="#" class="button qut-btn">Quantity</a>
                                                   <a href="javascript:void(0)" class="button add-to-cart-btn">Add To Cart</a>
                           </div>
                            </div>
                </ItemTemplate>
                <FooterTemplate>
               
                </FooterTemplate>
                </asp:Repeater>
						<!--item-->
                        <div class="quicklinks">
							<a href="#" class="button">More Dishes</a>
							<a href="javascript:void(0)" class="button scroll-to-top">Back to top</a>
						</div>
					</div>--%>
					<!--//entries-->
				</section>
			</div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>
</asp:Content>

