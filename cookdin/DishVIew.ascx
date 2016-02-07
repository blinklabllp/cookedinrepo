<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DishVIew.ascx.cs" Inherits="DishVIew" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
    <style type="text/css">
        .Star
        {
            background-image: url(images/Star.gif);
            height: 17px;
            width: 17px;
        }
        .WaitingStar
        {
            background-image: url(images/WaitingStar.gif);
            height: 17px;
            width: 17px;
        }
        .FilledStar
        {
            background-image: url(images/FilledStar.gif);
            height: 17px;
            width: 17px;
        }
    </style>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            -webkit-border-radius: 50px;
            -moz-border-radius: 50px;
               border-radius: 10px;
            border: 3px solid rgb(253,121,114);
            padding: 0;
        }
        .modalPopup .header
        {
            background-color: rgb(253,121,114);
            height: 30px;
            color: White;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
            
        }
        .modalPopup .body
        {
            min-height: 50px;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
            margin-bottom: 5px;
   
        }
        .popup-width
        {
            width: 80%;
        }
    </style>
<%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>
    
		<div class="wrap clearfix">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="" title="Home">Home</a></li>
					<li><a href="" title="Meal">Meal</a></li>
					<li>Dish Name</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
			<!--row-->
			<div class="row">
<%--				<header style="visibility: visible; animation-name: fadeInLeft;" class="s-title wow fadeInLeft animated">--%>
                <header style="visibility: visible;" class="s-title">
	                <h1><asp:Label ID="lbldishname" runat="server" Text="A luxurious black &amp; white chocolate cupcake"></asp:Label></h1>
				</header>
                <section class="content title-below">
                    <div>
                        <span class="type">Dish Type : </span>
                        <span class="type-margin-right">
                            <asp:Label ID="lbldishtype" runat="server" Text='<%#Eval("Dish_Type") %>'> </asp:Label>
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
                            <asp:Label ID="lblcuisine" runat="server" Text="">
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

                                            <a class="ns-img" href='<%# "dishphotoupload/"+Eval("Dish_Image")%>'></a>

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
                                <div class="intro dish-desc"><p><asp:Label ID="lbldescription" runat="server" Text=""></asp:Label> </p></div>
                                <div class="widget nutrition repeater-td">
						            <h3>Ingredient List</h3>
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
                                    <dt>
                                        <b><span class="price-size">
                                            </span><asp:Label ID="lblOfferPrice" runat="server" Text="" CssClass="price-size"></asp:Label> &nbsp;&nbsp;
                                            <asp:Label ID="lblprice" runat="server" Text="" CssClass="price-size"></asp:Label> 
                                        </b>
                                        <span class="price-size">&#x20B9;</span>
                                        
                                        </dt>

                       
                       <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
                       <Triggers> <asp:AsyncPostBackTrigger ControlID = "textboxDate" EventName="TextChanged" /></Triggers>
                             <ContentTemplate>
                                    <div class="selector date-selector" style="width: 145px;">
                                        <span style="width: 133px; -moz-user-select: none;"> 
                                           <asp:TextBox ID="textboxDate" runat="server" CssClass="remove-border date-selector-height" placeholder="Select Date"   AutoPostBack="True" ontextchanged="textboxDate_TextChanged"  ValidationGroup="addTocart"></asp:TextBox>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="textboxDate" Display="Dynamic" Text="*" SetFocusOnError="True" ValidationGroup="addTocart"></asp:RequiredFieldValidator>
                                        </span>
                                    </div>
                                     <div class="f-row">
                                     <asp:DropDownList ID="ddlTime" runat="server" Width="100%" CssClass="remove-border" placeholder="Select Date"></asp:DropDownList>
						</div>
                            </ContentTemplate>
                       </asp:UpdatePanel>

								</dl>
                                 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
                                   <Triggers> <asp:AsyncPostBackTrigger ControlID = "btnPlus" EventName="Click" /></Triggers>
                                   <Triggers> <asp:AsyncPostBackTrigger ControlID = "btnMinus" EventName="Click" /></Triggers>
                                 <ContentTemplate>
                                                <div class="div-margin-bottom white-font-color">
                                                     <span class="type div-margin-right">Dish Quantity </span>
                                                      <asp:Button ID="btnMinus" runat="server" Text="-" CssClass="qtyBtn plus-minus-btn"  onclick="btnMinus_Click"></asp:Button>
                                                      <span class="qty-text"><asp:Label ID="lblqty" runat="server" Text="1" CssClass="plus-minus-num"></asp:Label></span>
                                                      <asp:Button ID="btnPlus" runat="server" Text="+" CssClass="qtyBtn addBtn plus plus-minus-btn"  onclick="btnPlus_Click"></asp:Button>
                                                 </div>
                                                 </ContentTemplate>
                                               <%--   <Triggers> <asp:PostBackTrigger ControlID = "btnPlus" /></Triggers>
                                                  <Triggers> <asp:PostBackTrigger ControlID = "btnMinus" /></Triggers>--%>
                                             </asp:UpdatePanel>
                                        
                                       
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False">
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
                          </ContentTemplate></asp:UpdatePanel>



                          <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                          <ContentTemplate>
                                <div class="f-row bwrap">
                                <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart!"  ValidationGroup="addTocart" onclick="btnAddToCart_Click1"></asp:Button>
                               </div>
                                <!-- Login popup start -->
  <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlpopup" TargetControlID="btnAddToCart" BehaviorID="mpe" BackgroundCssClass="modalBackground"> </asp:ModalPopupExtender>
  <asp:Panel ID="pnlpopup" runat="server" Style="display: none" CssClass="">
        <div class="body">
           <section style="visibility: visible;" class="content center full-width">
					<div class="modal container popup-width">
						<h3>Login For Foody</h3>
						<div class="f-row">
							<asp:TextBox ID="txtusername" runat="server" placeholder="Your username"></asp:TextBox>
						</div>
						<div class="f-row">
							<asp:TextBox ID="txtPassword" runat="server" placeholder="Your Password" TextMode="Password"></asp:TextBox>
						</div>
						<div class="f-row bwrap">
							<asp:Button ID="btnlogin" runat="server" Text="login" onclick="btnlogin_Click"></asp:Button>
						</div>
						<%--<p><a href="#">Forgotten password?</a></p>--%>
						<p>Dont have an account yet? <a href="consumer_signup.aspx">Sign up.</a></p>
					</div>
            </section>
        </div>
</asp:Panel>

</ContentTemplate>
                          
                          
                          </asp:UpdatePanel>
                          

<!-- Login Popup End-->

                                 <div class="intro remove-padding remove-margin-important">
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
                                            <%--<div style="float:left"><asp:Label ID="lblarea" runat="server" Text="Label"></asp:Label></div>--%>
                                        </div>
                                    </article>
                                </div>
                                
                                <dl class="basic chef-location">
									<dd>Locality</dd>
                                    <dt><asp:Label ID="lblarea" runat="server" Text="Label"></asp:Label></dt>
                                </dl>
                                <dl class="basic bars">
                                    <dd>Ratings</dd>
                                    <dt><asp:Rating ID="ChefRating" runat="server"  StarCssClass="Star" WaitingStarCssClass="WaitingStar" EmptyStarCssClass="Star ratings" FilledStarCssClass="FilledStar ratings" ReadOnly="true"></asp:Rating>
                                 
                                    <dt> <asp:Label ID="lblmealinclude" runat="server" Text=""></asp:Label></dt>
									<dd>Meal Includes</dd>
								</dl>
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
								<div class="avatar"><a href=""> <asp:Image ID="Image1" runat="server" ImageUrl='<%# "Profile_Photo/"+Eval("Photo")%>'></asp:Image></a></div>

                                

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
						<!--//recipe-->
                        <div class="row">
                           
                        </div>
				</section>



				<!--//content-->
				
				<!--right sidebar-->
				<aside style="visibility: visible; animation-name: fadeInRight;" class="sidebar one-fourth">
                <div class="row">
                
                
                    <div class="full-width">
                        <div class="container box">
                           <button style="display: block; animation-duration: 1s; animation-delay: 0.4s; animation-name: swing; 
                               visibility: visible;" class="left demoanimate wow swing animated animated" data-wow-delay=".4s" 
                               data-wow-duration="1s" data-wow-offset="300">
                               Sale Offer Date Range dd-mm-yy
                           </button>
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

<%--</ContentTemplate>
    </asp:UpdatePanel>--%>
