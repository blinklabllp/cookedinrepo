<%@ Page Title="" Language="C#" MasterPageFile="~/Chef/ChefMasterPage.master" AutoEventWireup="true" CodeFile="dishlist.aspx.cs" Inherits="Chef_dishlist" %>

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
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="#" title="Home">Dashboard</a></li>
					<li>Dishes</li>
				</ul>
			</nav>
			<div class="row">
				
				<!--//content-->
                <section style="visibility: visible;" class="content full-width">
					<!--entries-->
					<div class="entries row">
						<!--item-->
                        <h1>Dishes Served</h1>
						<asp:Repeater ID="Repeaterdish" runat="server">
                <HeaderTemplate>
                
                </HeaderTemplate>
                <ItemTemplate>
              <div style="visibility: visible;" class="entry one-fourth">
                	<figure>
								<%--<img class="img-dish-list" src="../templete/image/img6.jpg" alt="">--%>
                                   <header class="s-title">
									<h2 class="ribbon nveg">veg-nonveg</h2>
								</header>
                                 <asp:Image ID="Image1" runat="server" class="prod-img" ImageUrl='<%# "upload/"+Eval("Dish_Image")%>'></asp:Image>
								<figcaption>
                                    <a href="#"><i class="ico i-chef-img hover-dish">
                                                 <%--   <img class="img-dish-list" src="../templete/image/avatar4.jpg" alt="" style="border-radius: 50%">--%>
                                                    <asp:Image ID="Image2" CssClass="img-dish-list" runat="server" ImageUrl='<%# "../Profile_Photo/"+Eval("Photo")%>' alt="" style="border-radius: 50%"></asp:Image>
                                                </i><span>Chef <%#Eval ("fullname") %></span> 
                                                 <%--  <span><%#Eval ("Area") %></span>--%>
                                                    <span><asp:Rating ID="ChefRating" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar" ReadOnly="true"></asp:Rating> 
        </span>
                         </a>         
                                 </figcaption>
                                 
							</figure>
							<div class="container dish-name">
								  <h2><a href='ViewDish.aspx?did=<%# Eval("Dish_ID")%>'><%#Eval ("Dish_Name") %></a>
                                   
                                   <span title="veg" class="veg-icon"></span> </h2></h2>
                                   <%--<div>
                                        <span class="price-text-new">New Price </span> <span class="price-text-new price-text"><%#Eval ("Price") %></span> 
                                   </div>--%>
                                <div class="actions">
									<div>
										     <div class="comments"><asp:Rating ID="DishRating" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar" ReadOnly="true"></asp:Rating></div>
                                             <span class="price-text-new"><asp:Label ID="lblOfferPrice" runat="server" Text='<%# "&#x20B9;" + Eval("SpecialOfferPrice")%>'></asp:Label></span>
                                              
                                            <span class="price-text-new price-text normal-font"><asp:Label ID="lblPrice" runat="server" Text='<%# "&#x20B9; "+Eval ("Price") %>'></asp:Label></span>
                                             <%--<div class="comments"><i class="ico i-comments"></i> <a href="#"><%#Eval("Diet_Type")%></a></div>--%>
									</div>
								</div>
                                 <asp:Label ID="lblOfferStartDate" runat="server" Text='<%#Eval("OfferStartDate")%>' Visible="false"></asp:Label>
                           <asp:Label ID="lblOfferEndDate" runat="server" Text='<%#Eval("OfferEndDate")%>' Visible="false"></asp:Label>
                           <asp:Label ID="lblChefID" runat="server" Text='<%#Eval("Chef_ID")%>' Visible="false"></asp:Label>
                           <asp:Label ID="lblDishID" runat="server" Text='<%#Eval("Dish_ID")%>' Visible="false"></asp:Label>
                             </div>
                             <a class="button full-width" href='ViewDish.aspx?did=<%# Eval("Dish_ID") %>'>View More</a>
                          
                            </div>
                </ItemTemplate>
                <FooterTemplate>
                <center>
                          <asp:Label ForeColor="#d94352" Visible='<%# Repeaterdish.Items.Count==0 %>' runat="server" ID="lblmsg" Text="No Records Found"></asp:Label>
                       </center>
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
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>
</asp:Content>

