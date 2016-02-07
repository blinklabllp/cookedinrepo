<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewDish.ascx.cs" Inherits="usercontrol_ViewDish" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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

	<script type="text/javascript" src="../templete/js/jquery-ui.multidatespicker.js"></script>
	<script src="http://multidatespickr.sourceforge.net/jquery-ui.multidatespicker.js"></‌script>
	
<script type="text/javascript">
         //On Page Load.
         $(function () {
             SetDatePicker();
         });

         //On UpdatePanel Refresh.
         var prm = Sys.WebForms.PageRequestManager.getInstance();
         if (prm != null) {
             prm.add_endRequest(function (sender, e) {
                 if (sender._postBackSettings.panelsToUpdate != null) {
                     SetDatePicker();
                 }
             });
         };
         function SetDatePicker() {
             $("#<%=textboxDate.ClientID %>").datepicker
             ({
                  dateFormat: 'dd/mm/yy',
                minDate: 0,
                maxDate: 6,
             });
         }
</script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
    <!--main-->
	<main class="main" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
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
                                        <li> <a class="ns-img" href='<%# "../dishphotoupload/"+Eval("Dish_Image")%>'></a></li>
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
                                   <div class="widget nutrition repeater-td">
						            <h3>This dish contains following ingredient.</h3>
                                    <asp:DataList ID="DataListingridiant" runat="server" RepeatColumns="6" CssClass="tbl-btn-padding">
                                    <ItemTemplate><asp:Label ID="Label9" class="button gold ingredient-listing-size" runat="server" Text='<%#Eval("Ingridiant_Name") %>'></asp:Label></ItemTemplate>
                                    </asp:DataList>
						        </div>
                                <!--end-->
							</article>
							<!--//two-third-->
							<!--one-third-->
							<article style="visibility: visible;" class="one-third">
								
                                	<dl class="basic dl-margin-bottom">
									<dd>Price</dd>
                                    <%--<dt><b><span class="price-size">&#x20B9; </span><asp:Label ID="lblprice" runat="server" Text="$123" CssClass="price-size"></asp:Label></b></dt>--%>
                                        <dt>
                                        <b><span class="price-size">
                                            </span><asp:Label ID="lblOfferPrice" runat="server" Text="$123" CssClass="price-size"></asp:Label> <asp:Label ID="lblprice" runat="server" Text="$123" CssClass="price-size"></asp:Label>  
                                        </b>
                                        <span class="price-size">&#x20B9;</span>
                                        
                                        </dt>
                       
                       <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                        <Triggers> <asp:AsyncPostBackTrigger ControlID = "textboxDate" EventName="TextChanged" /></Triggers>
                             <ContentTemplate>
                                    <div class="selector date-selector" style="width: 145px;">
                                        <span style="width: 133px; -moz-user-select: none;"> 
                                           <asp:TextBox ID="textboxDate" runat="server" CssClass="remove-border date-selector-height" placeholder="Date of Order Delivery"   AutoPostBack="True" ontextchanged="textboxDate_TextChanged"  ValidationGroup="addTocart" Height="37px"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="textboxDate" Display="Dynamic" Text="*" SetFocusOnError="True" ValidationGroup="addTocart"></asp:RequiredFieldValidator>
                                        </span>
                                    </div>
                                    <div class="selector" style="width: 145px;">
                                        <span style="width: 133px; -moz-user-select: none;">
                                           <asp:DropDownList ID="ddlTime" runat="server" Width="100%" CssClass="remove-border" placeholder="Select the time of Delivery" Height="37px"></asp:DropDownList>
                                         </span>
                                    </div>
                            </ContentTemplate>
                       </asp:UpdatePanel>

								</dl>
                                  <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                                    <Triggers> <asp:AsyncPostBackTrigger ControlID = "btnPlus" EventName="Click" /></Triggers>
                                   <Triggers> <asp:AsyncPostBackTrigger ControlID = "btnMinus" EventName="Click" /></Triggers>
                                                 <ContentTemplate>
                                                  <div class="div-margin-bottom">
                                                     <span class="type div-margin-right">Dish Quantity </span>
                                                      <asp:Button ID="btnMinus" runat="server" Text="-" CssClass="qtyBtn plus-minus-btn"  onclick="btnMinus_Click"></asp:Button>
                                                      <span class="qty-text"><asp:Label ID="lblqty" runat="server" Text="1" CssClass="plus-minus-num"></asp:Label></span>
                                                      <asp:Button ID="btnPlus" runat="server" Text="+" CssClass="qtyBtn addBtn plus plus-minus-btn"  onclick="btnPlus_Click"></asp:Button>
                                                 </div>
                                                 </ContentTemplate>
                                             </asp:UpdatePanel>
                                       
                                       
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                                       <Triggers> <asp:AsyncPostBackTrigger ControlID = "btncalculatedeliverycharge" EventName="Click" /></Triggers>
                                     <ContentTemplate>
                                            <div class="widget nutrition remove-margin-important">
						                       <h3> Delivery Charges : Rs. <asp:Label ID="lblshippingcharge" runat="server" Text="0" Visible="true"></asp:Label>  </h3>
                                                   <div class="small-textbox">
                                                        <asp:TextBox ID="txtdestinationzipcode" runat="server" placeholder="Enter ZipCode" ></asp:TextBox>
                                                   </div>
                                                   <asp:LinkButton ID="btncalculatedeliverycharge" runat="server"  onclick="btncalculatedeliverycharge_Click" CssClass="button padding-btn">Check</asp:LinkButton>
                                                   <asp:Label ID="lblsourcezipcode" runat="server" Text="" Visible="false"></asp:Label>
						                    </div>
                                  </ContentTemplate>
                                </asp:UpdatePanel>

                                <div class="f-row bwrap">
                                <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart!"   ValidationGroup="addTocart"
                                        onclick="btnAddCart_Click"></asp:Button>
                                   
                                </div>

                                <div class="intro remove-padding">
                                    <article class="">
                                        <div class="entry-meta">
                                            <div class="avatar">
                                                    <a href='Chef_Profile.aspx?Chef_ID=<%=this.lblchefid.Text%>'>
                                                    <asp:Image class="img-view-dish" ID="imgchefimage" runat="server" ></asp:Image>
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
                      

                                <dl class="basic">
									<dd>Locality</dd>
                                    <dt><asp:Label ID="lblarea" runat="server" Text="Label"></asp:Label></dt>
                                    <dd>Ratings</dd>
                                    <dt><asp:Rating ID="ChefRating" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star ratings"
        FilledStarCssClass="FilledStar ratings" ReadOnly="true"></asp:Rating>
                                 
                                    <dt>Meal Includes</dt>
									<dd>
                               <asp:Label ID="lblmealinclude" runat="server" Text=""></asp:Label>
                                    </dd>
								</dl>
                             </article>
								<!--//one-third-->
							</div>
						</div>


                        <!-- Rate n Reviews-->
                      
                          <asp:Repeater ID="repeterReview" runat="server">
      <HeaderTemplate>
      
      	<div class="comments wow fadeInUp" id="comments">
						<h2>Reviews </h2>
						<ol class="comment-list">
      </HeaderTemplate>
      <ItemTemplate>
      <!--comment-->
      		<li class="comment depth-1">
								<div class="avatar"><a href=""> <asp:Image ID="Image1" runat="server" ImageUrl='<%# "Profile_Photo/"+Eval("Photo")%>'></asp:Image></a></div>
								<div class="comment-box">
									<div class="comment-author meta"> 
										<strong><%#Eval("Consumer_Fname")%></strong> <asp:Rating ID="Rating1" runat="server"
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
         <asp:Button ID="btnGiveReview" runat="server" Text="Give Your Review" onclick="btnGiveReview_Click" Visible="false"
                                        ></asp:Button>
      <!--comments-->
					
							
							
													
							
						








						<!--//recipe-->
                        <asp:Panel ID="panelReview" runat="server" Visible="false">
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
                                            <asp:TextBox ID="txtConName" runat="server" placeholder="Your name"></asp:TextBox>
											<span class="req">*</span>
										</div>
										
										<div class="third">
                                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Your email"></asp:TextBox>
											<span class="req">*</span>
										</div>
										
										<div class="third">
                                                <asp:Rating ID="Rating1" runat="server"
        StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star"
        FilledStarCssClass="FilledStar"></asp:Rating>
                                           <%-- <asp:TextBox ID="TextBox3" runat="server" placeholder="Ratings here"></asp:TextBox>--%>
										</div>
									</div>
									<div class="f-row">

										<asp:TextBox ID="txtReview" runat="server" TextMode="MultiLine"></asp:TextBox>
									</div>
									<div class="f-row">
										<div class="third bwrap">
                                        <asp:Button ID="btnComments" runat="server" Text="Submit comment" 
                                                onclick="btnComments_Click"></asp:Button>
											
										</div>
									</div>
								</form>
							</div>
						</div>
                        </div>
                        </div>
                        </asp:Panel>
				</section>
                
				<!--//content-->
				
			<!--right sidebar-->
				<aside style="visibility: visible; animation-name: fadeInRight;" class="sidebar one-fourth">
                <%--<div class="row">
                    <div class="full-width">
                        <div class="container box">
                           <button style="display: block; animation-duration: 1s; animation-delay: 0.4s; animation-name: swing; visibility: visible;" class="left demoanimate wow swing animated animated" data-wow-delay=".4s" data-wow-duration="1s" data-wow-offset="300">Sale Offer Date Range dd-mm-yy</button>
                        </div>
                    </div>
                </div>--%>
                <div class="widget share">
					<ul class="boxed">
						<li class="light"><a href="https://www.facebook.com/cookedin?_rdr=p" title="Facebook"><i class="ico i-facebook"></i> <span>Share on Facebook</span></a></li>
						<li class="medium"><a href="https://www.twitter.com/Cookdin" title="Twitter"><i class="ico i-twitter"></i> <span>Share on Twitter</span></a></li>
						<li class="dark"><a href="#" title="Favourites"><i class="ico i-favourites"></i> <span>Email A Friend</span></a></li>
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