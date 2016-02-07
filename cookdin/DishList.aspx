<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DishList.aspx.cs" Inherits="DishList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <main class="main" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="#" title="Home">Home</a></li>
					<li>DishList</li>
				</ul>
			</nav>
			<div class="row">
		
                <section class="content full-width" style="visibility: visible;">
                <div class="entries row">
       <asp:Repeater ID="Repeaterdish" runat="server">
          <ItemTemplate>
                   
              <div style="visibility: visible;" class="entry one-fourth">
                	<figure>
                                 <header class="s-title"><h2 class="ribbon nveg">veg-nonveg</h2></header>
                                 <asp:Image ID="Image1" class="prod-img" runat="server" ImageUrl='<%# "Chef/upload/"+Eval("Dish_Image")%>'></asp:Image>
								<figcaption>
                                    <a href='ViewDish.aspx?did=<%# Eval("Dish_ID") %>'>
                                                 <i class="ico i-chef-img"> <asp:Image ID="Image2" CssClass="img-dish-list" runat="server" ImageUrl='<%# "Profile_Photo/"+Eval("Photo")%>' alt="" style="border-radius: 50%"></asp:Image> </i>
                                                 <span>Chef <%#Eval("fullname")%></span> 
                                                 <span><%#Eval ("Area") %></span>
                                                 <span>rating </span>
                                    </a>
                                 </figcaption>
					</figure>
							<div class="container dish-name">
								  <h2 class="normal-font"><a href='ViewDish.aspx?did=<%# Eval("Dish_ID")%>'> <%#Eval ("Dish_Name") %></a>
                                  <span title="veg" class="veg-icon"></span> </h2>
                                <div class="actions">
									<div>
										     <div class="comments"><i class="ico i-likes"></i><a href="#">Ratings</a></div>
                                             <span class="price-text-new"><asp:Label ID="lblOfferPrice" runat="server" Text='<%# "&#x20B9;" + Eval("SpecialOfferPrice")%>'></asp:Label></span>
                                             <span class="price-text-new price-text normal-font"><asp:Label ID="lblPrice" runat="server" Text='<%# "&#x20B9;" +Eval ("Price") %>'></asp:Label></span>
									</div>
								</div>
                             </div>
                            <div><a class="button full-width" href='ViewDish.aspx?did=<%# EncryptString(Eval("Dish_ID").ToString())  %>'>View More</a></div>
                            <%--=EncryptionDecryption.EncryptString("Dish_ID")--%>
                            <%--<%# myname.EncryptionDecryption.EncryptString(Eval("Dish_ID").ToString())  %>--%>

                           <asp:Label ID="lblOfferStartDate" runat="server" Text='<%#Eval("OfferStartDate")%>' Visible="false"></asp:Label>
                           <asp:Label ID="lblOfferEndDate" runat="server" Text='<%#Eval("OfferEndDate")%>' Visible="false"></asp:Label>
               </div>
               
          </ItemTemplate>      
       </asp:Repeater>
                </div>
                </section>

             </div>
			
		</div>
	
	</main>
</asp:Content>

