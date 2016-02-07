<%@ Page Title="" Language="C#" MasterPageFile="~/Chef/ChefMasterPage.master" AutoEventWireup="true" CodeFile="ViewDish.aspx.cs" Inherits="Chef_ViewDish" %>

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

    <!--main-->
	<main class="main main-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="" title="Home">Home</a></li>
					<li><a href="#" title="Recipes">Recipes</a></li>
					<li><a href="" title="Cocktails">Deserts</a></li>
					<li>Recipe</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
			<!--row-->
			<div class="row">
				<header style="visibility: visible;" class="s-title">
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
                            <asp:Label ID="lbldishtype" runat="server" Text="BreakFast"> </asp:Label>
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
							<article style="visibility: visible;" class="two-third">
							     <!--start-->
                                <div class="">
                                <div id="ninja-slider">
                                    <div class="slider-inner">
                                    
                                    <asp:Repeater ID="Repeater1" runat="server">
                                     <HeaderTemplate> <ul></HeaderTemplate>
                                     <ItemTemplate>
                                        <li>
                                           <%-- <a class="ns-img" href='<%#Eval("Dish_Image","upload/") %>'></a>--%>

                                            <a class="ns-img" href='<%# "../dishphotoupload/"+Eval("Dish_Image")%>'></a>

                                            <!--<div class="caption">RESPONSIVE</div>-->
                                        </li>
                                     </ItemTemplate>
                                     <FooterTemplate></ul></FooterTemplate>
                                    </asp:Repeater>
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
							<article style="visibility: visible;" class="one-third">
								<dl class="basic"><dt>Price</dt><dd><b>&#x20B9;<asp:Label ID="lblOfferPrice" runat="server" Text="" CssClass="price-size"></asp:Label> <asp:Label ID="lblprice" runat="server" Text="" CssClass="price-size"></asp:Label> </b></dd></dl>
                                       

                                <div class="f-row bwrap">
                                    <%--<input type="submit" value="Add To Cart!">--%>
                                </div>
                                <div class="intro remove-padding">
                                    <article class="">
                                        <div class="entry-meta">
                                            <div class="avatar">
                                                    <a href='Chef_Profile.aspx?cid=<%=this.lblchefid.Text%>'>
                                                    <asp:Image class="img-view-dish" ID="imgchefimage" runat="server" ImageUrl="../templete/image/avatar1.jpg"></asp:Image>
                                                    </a>
                                            </div>
                                        </div>
                                        <div class="container width-content">
                                            <p class="lead">
                                            <asp:Label ID="lblchefid" runat="server" Text="" Visible="false"></asp:Label>
                                            <asp:Label ID="lblchefname" runat="server" Text="Chef Name"></asp:Label>
                                            </p>
                                        </div>
                                    </article>
                                </div>
                                
                                <dl class="ingredients">
									<dd>Locality</dd>
                                    <dt><asp:Label ID="lblarea" runat="server" Text="Label"></asp:Label></dt>
								</dl>

                                <dl class="ingredients">
									<dd>Ratings</dd>
                                    <dt><asp:Rating ID="ChefRating" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar" ReadOnly="true"></asp:Rating></dt>
								</dl>
								<dl class="basic">
									<dt>Meal Includes</dt>
									<dd>
                                     <asp:Label ID="lblmealinclude" runat="server" Text=""></asp:Label>
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

                        <asp:Repeater ID="repeterReview" runat="server">
      <HeaderTemplate>
      
      	<div class="comments wow fadeInUp" id="comments">
						<h2>Reviews </h2>
						<ol class="comment-list">
      </HeaderTemplate>
      <ItemTemplate>

      <!--comment-->
							<li class="comment depth-1">
								<div class="avatar"><a href=""> <asp:Image ID="Image1" runat="server" ImageUrl='<%# "../Profile_Photo/"+Eval("Photo")%>'></asp:Image></a></div>

                                

								<div class="comment-box">
									<div class="comment-author meta"> 
										<strong><%#Eval("Consumer_Fname")%></strong> 
                                        
                                        <%--<asp:Rating ID="Rating2" runat="server"></asp:Rating>--%>
                                        <asp:Rating ID="Rating1" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar" CurrentRating='<%#Eval("Rate")%>' ReadOnly="true"></asp:Rating> 
									</div>
									<div class="comment-text">
										<p><%#Eval("Review")%></p>
									</div>
								</div> 
							</li>
							<!--//comment-->
      
      </ItemTemplate>
      <FooterTemplate>
      </ol>
					</div>
					<!--//comments-->  
      </FooterTemplate>
      </asp:Repeater>
						
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
						<li><div class="avatar"><a href="http://www.themeenergy.com/themes/html/social-chef/my_profile.html"><img src="template/image/avatar1.jpg" alt=""><span>Kimberly C.</span></a></div></li>
						<li><div class="avatar"><a href="http://www.themeenergy.com/themes/html/social-chef/my_profile.html"><img src="template/image/avatar1.jpg" alt=""><span>Alex J.</span></a></div></li>
						<li><div class="avatar"><a href="http://www.themeenergy.com/themes/html/social-chef/my_profile.html"><img src="template/image/avatar1.jpg" alt=""><span>Denise M.</span></a></div></li>
						<li><div class="avatar"><a href="http://www.themeenergy.com/themes/html/social-chef/my_profile.html"><img src="template/image/avatar1.jpg" alt=""><span>Jason H.</span></a></div></li>
						<li><div class="avatar"><a href="http://www.themeenergy.com/themes/html/social-chef/my_profile.html"><img src="template/image/avatar1.jpg" alt=""><span>Jennifer W.</span></a></div></li>
						<li><div class="avatar"><a href="http://www.themeenergy.com/themes/html/social-chef/my_profile.html"><img src="template/image/avatar1.jpg" alt=""><span>Anabelle Q.</span></a></div></li>
						<li><div class="avatar"><a href="http://www.themeenergy.com/themes/html/social-chef/my_profile.html"><img src="template/image/avatar1.jpg" alt=""><span>Thomas M.</span></a></div></li>
						<li><div class="avatar"><a href="http://www.themeenergy.com/themes/html/social-chef/my_profile.html"><img src="template/image/avatar1.jpg" alt=""><span>Michelle S.</span></a></div></li>
						<li><div class="avatar"><a href="http://www.themeenergy.com/themes/html/social-chef/my_profile.html"><img src="template/image/avatar1.jpg" alt=""><span>Bryan A.</span></a></div></li>
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
		<script type="text/javascript">
				var totalSlides = document.getElementById("ninja-slider").getElementsByTagName("li").length;
				if (totalSlides == 1) {
					document.getElementById("ninja-slider-prev").style.display = "none";
					document.getElementById("ninja-slider-next").style.display = "none";
				}
		</script>
</asp:Content>

