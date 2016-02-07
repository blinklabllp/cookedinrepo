<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewDish.aspx.cs" Inherits="Chef_ViewDish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <!--main-->
	<main class="main" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="#" title="Home">Home</a></li>
					<li><a href="#" title="Recipes">Recipes</a></li>
					<li><a href="#" title="Cocktails">Deserts</a></li>
					<li>Recipe</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
			<!--row-->
			<div class="row">
				<header style="visibility: visible; animation-name: fadeInLeft;" class="s-title wow fadeInLeft animated">
	                <h1><asp:Label ID="lbldishname" runat="server" Text="A luxurious black &amp; white chocolate cupcake"></asp:Label></h1>
				</header>
                <section class="content title-below">
                    <div>
                        <span class="type">Dish Type : </span>
                        <span class="type-margin-right">
                        <asp:Repeater ID="Repeaterdishtype" runat="server">
                          <HeaderTemplate></HeaderTemplate>
                          <ItemTemplate><asp:Label ID="lbldishtype" runat="server" Text='<%#Eval("Dish_Type") %>'> </asp:Label>
                           </ItemTemplate>
                          <FooterTemplate></FooterTemplate>
                        </asp:Repeater>
                           <%-- <asp:Label ID="lbldishtype" runat="server" Text="BreakFast"> </asp:Label>--%>
                        </span>
                    </div>
                    <div>
                        <span class="type">Diet Type : </span>
                        <span class="type-margin-right">
                            <asp:Label ID="lbldiettype" runat="server" Text="Vegetarian">
                            </asp:Label>
                        </span>
                    </div>
                    <div>
                        <span class="type">Cuisine Type : </span>
                        <span class="type-margin-right">
                            <asp:Label ID="lblcuisine" runat="server" Text="Vegetarian">
                            </asp:Label>
                        </span>
                    </div>
                </section>
                <!--content-->
				<section class="content three-fourth">
					<!--recipe-->
						<div class="recipe">
							<div class="row">
							<!--two-third-->
							<article style="visibility: visible; animation-name: fadeInLeft;" class="two-third wow fadeInLeft animated">
							     <!--start-->
                                <div class="">
                                <div id="ninja-slider">
                                    <div class="slider-inner">
                                    
                                    <asp:Repeater ID="Repeater1" runat="server">
                                     <HeaderTemplate> <ul></HeaderTemplate>
                                     <ItemTemplate>
                                        <li>
                                           <%-- <a class="ns-img" href='<%#Eval("Dish_Image","upload/") %>'></a>--%>

                                            <a class="ns-img" href='<%# "upload/"+Eval("Dish_Image")%>'></a>

                                            <!--<div class="caption">RESPONSIVE</div>-->
                                        </li>
                                     </ItemTemplate>
                                     <FooterTemplate></ul></FooterTemplate>
                                    </asp:Repeater>
                                    
                                   
                                       
                                       <%-- <li>
                                            <a class="ns-img" href="../templete/image/12.jpg"></a>
                                            <!--<div class="caption">RESPONSIVE</div>-->
                                        </li>
                                        <li>
                                            <a class="ns-img" href="../templete/image/13.jpg"></a>
                                            <!--<div class="caption">RESPONSIVE</div>-->
                                        </li>
                                        <li>
                                            <a class="ns-img" href="../templete/image/14.jpg"></a>
                                            <!--<div class="caption">RESPONSIVE</div>-->
                                        </li>--%>
                                    
                                    <div class="navsWrapper">
                                        <div id="ninja-slider-prev"></div>
                                        <div id="ninja-slider-next"></div>
                                    </div>
                                    </div>
                                </div>
                                </div>
                                <div class="intro">
                                    <p>
                                    <asp:Label ID="lbldescription" runat="server" Text="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,"></asp:Label>
                                    </p>
                                </div>
                                <!--end-->
							</article>
							<!--//two-third-->
							<!--one-third-->
							<article style="visibility: visible; animation-name: fadeInDown;" class="one-third wow fadeInDown animated">
								<dl class="basic">
									<dt>Price</dt>
                                    <dd><b>
                                    <asp:Label ID="lblprice" runat="server" Text="$123"></asp:Label>
                                    </b></dd>
								</dl>
                                <div class="f-row bwrap">
                                    <input type="submit" value="Add To Cart!">
                                </div>
                                <div class="intro remove-padding">
                                    <article class="">
                                        <div class="entry-meta">
                                            <div class="avatar">
                                                    <a href="">
                                                    <asp:Image ID="imgchefimage" runat="server" ImageUrl="../templete/image/avatar1.jpg"></asp:Image>
                                                    </a>
                                            </div>
                                        </div>
                                        <div class="container width-content">
                                            <p class="lead">
                                            <asp:Label ID="lblchefname" runat="server" Text="Chef Name"></asp:Label>
                                            </p>
                                        </div>
                                    </article>
                                </div>
                                <dl class="ingredients">
									<dd>Ratings</dd>
                                    <dt>***</dt>
								</dl>
								<dl class="basic">
									<dt>Meal Includes</dt>
									<dd>
                                    <asp:Label ID="Label7" runat="server" Text="Lorem"></asp:Label>
                                    </dd>
								</dl>
                                <div class="widget nutrition">
						            <h3>Ingredient List</h3>

                                    <asp:DataList ID="DataListingridiant" runat="server" RepeatColumns="2">
                                    
                                    <ItemTemplate><asp:Label ID="Label9" runat="server" Text='<%#Eval("Ingridiant_Name") %>'></asp:Label></ItemTemplate>
                                    
                                    </asp:DataList>
					              
							               <%-- <td><asp:Label ID="Label9" runat="server" Text="Ingredient1"></asp:Label></td>
							                <td><asp:Label ID="Label10" runat="server" Text="Ingredient2"></asp:Label></td>--%>
						              
					            </div>
                             </article>
								<!--//one-third-->
							</div>
						</div>
						<!--//recipe-->
                        <div class="row">
                            <div id="Div2" class="tab-content" style="display: block;">
                            <!--respond-->
						    <div style="visibility: hidden; animation-name: none;" class="comment-respond wow fadeInUp" id="Div3">
							    <h2>Review Dish</h2>
							    <div class="container">
								<p><strong>Note:</strong> Comments on the web site reflect the 
                                    views of their authors, and not necessarily the views of the socialchef 
                                    internet portal. Requested to refrain from insults, swearing and vulgar 
                                    expression. We reserve the right to delete any comment without notice 
                                    explanations.</p>
								<p>Your email address will not be published. Required fields are signed with <span class="req">*</span></p>
								<form>
									<div class="f-row">
										<div class="third">
                                            <asp:TextBox ID="TextBox1" runat="server" placeholder="Your name"></asp:TextBox>
											<span class="req">*</span>
										</div>
										
										<div class="third">
                                            <asp:TextBox ID="TextBox2" runat="server" placeholder="Your email"></asp:TextBox>
											<span class="req">*</span>
										</div>
										
										<div class="third">
                                            <asp:TextBox ID="TextBox3" runat="server" placeholder="Ratings here"></asp:TextBox>
										</div>
									</div>
									<div class="f-row">
										<textarea></textarea>
									</div>
									<div class="f-row">
										<div class="third bwrap">
											<input value="Submit comment" type="submit">
										</div>
									</div>
								</form>
							</div>
						</div>
                        </div>
                        </div>
				</section>
				<!--//content-->
				
				<!--right sidebar-->
				<aside style="visibility: visible; animation-name: fadeInRight;" class="sidebar one-fourth wow fadeInRight animated">
                <div class="row">
                    <div class="full-width">
                        <div class="container box">
                           <button style="display: block; animation-duration: 1s; animation-delay: 0.4s; animation-name: swing; visibility: visible;" class="left demoanimate wow swing animated animated" data-wow-delay=".4s" data-wow-duration="1s" data-wow-offset="300">Sale Offer Date Range dd-mm-yy</button>
                        </div>
                    </div>
                </div>
                <div class="widget share">
					<ul class="boxed">
						<li class="light"><a href="#" title="Facebook"><i class="ico i-facebook"></i> <span>Share on Facebook</span></a></li>
						<li class="medium"><a href="#" title="Twitter"><i class="ico i-twitter"></i> <span>Share on Twitter</span></a></li>
						<li class="dark"><a href="#" title="Favourites"><i class="ico i-favourites"></i> <span>Add to Favourites</span></a></li>
					</ul>
				</div>
				<div class="widget members">
					<h3>Members who liked this recipe</h3>
					<ul class="boxed">
						<li><div class="avatar"><a href="#"><img src="#" alt=""><span>Kimberly C.</span></a></div></li>
						<li><div class="avatar"><a href="#"><img src="#" alt=""><span>Alex J.</span></a></div></li>
						<li><div class="avatar"><a href="#"><img src="#" alt=""><span>Denise M.</span></a></div></li>
						<li><div class="avatar"><a href="#"><img src="#" alt=""><span>Jason H.</span></a></div></li>
						<li><div class="avatar"><a href="#"><img src="#" alt=""><span>Jennifer W.</span></a></div></li>
						<li><div class="avatar"><a href="#"><img src="#" alt=""><span>Anabelle Q.</span></a></div></li>
						<li><div class="avatar"><a href="#"><img src="#" alt=""><span>Thomas M.</span></a></div></li>
						<li><div class="avatar"><a href="#"><img src="#" alt=""><span>Michelle S.</span></a></div></li>
						<li><div class="avatar"><a href="#"><img src="#" alt=""><span>Bryan A.</span></a></div></li>
					</ul>
				</div>
				</aside>
				<!--//right sidebar-->
			</div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>
	<!--//main-->
</asp:Content>

