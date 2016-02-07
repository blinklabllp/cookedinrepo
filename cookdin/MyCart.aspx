<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyCart.aspx.cs" Inherits="Consumer_MyCart" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
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
            text-align: center;
            -webkit-border-radius: 50px;
            border-radius: 5px;
            -moz-border-radius: 50px;
               border-radius: 10px;
            padding: 0;
           /* width:500px;*/
           
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
           /*  margin-left:10px;
            margin-right:10px;*/
          
            
   
        }
    </style>
    
   <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
    
    <main class="main main-padding" role="main">

    <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="#" title="Home">Home</a></li>
					<li>My Cart</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
			
			<!--row-->
			<div class="row">
				<!--content-->
				<section class="content three-fourth" style="visibility: visible; animation-name: fadeInLeft;">
					<!--one-half-->
					<section class="container" style="padding-bottom: 17px;">
						<span> <asp:Label ID="lblcartcount" runat="server" Text="Label"></asp:Label> Dishes In My Cart</span>
					</section>
					<!--//one-half-->
				</section>
				<!--//content-->
                <!--content-->
				<section class="content three-fourth" style="visibility: visible; animation-name: fadeInLeft;">
					<!--one-half-->
					<aside class="" style="visibility: visible; animation-name: fadeInRight;">
					<div class="widget">
						<div class="widget nutrition">	
                    <%--<h1 class="center" style="color: #444;">No Dishes In Your Cart</h1>--%>    
    
   <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>--%>
                  

        <asp:DataList ID="DataList1" runat="server" onitemcommand="DataList1_ItemCommand">
        <ItemTemplate>
        <table>
							<tbody>
                            <tr>
                                <td>
                                    <b><asp:Label ID="Label21" runat="server" Text="Chef" ForeColor="#999999" Font-Size="Small" Font-Bold="True" style="float:left"></asp:Label>
                                    <asp:Label ID="Label22" runat="server" Text='<%#Eval("Chef_UserName") %>' Font-Bold="True" Font-Size="small" style="float:left"></asp:Label></b>
                                </td>
                                <td colspan="4">
                                      <asp:Label ID="Label13" runat="server" Text="Rating"></asp:Label>
                                </td>
                            </tr>
							<tr>
                                <td rowspan="3">
                                <div class="members"> 
                                    <ul class=""> 
                                        <div class="avatar remove-padding" >
                                            <a href="">
                                                <img src='<%# "dishphotoupload/"+Eval("Dish_Image")%>' alt="" class="dish-image-square">
                                            </a>
                                        &nbsp;</div>
                                    </ul>
                                </div>
                                        <asp:Label ID="lblDishcartid" runat="server" Text='<%#Eval("ConsumerDishCart_ID") %>' Visible="false" ></asp:Label> 
                                        <asp:Label ID="lblCartid" runat="server" Text='<%#Eval("Cart_ID") %>' Visible="false" ></asp:Label>
                                        <asp:Label ID="lblChefid" runat="server" Text='<%#Eval("Chef_ID") %>' Visible="false" ></asp:Label>
                                        <asp:Label ID="lbldishid" runat="server" Text='<%#Eval("Dish_ID") %>' Visible="false" ></asp:Label>
                                        <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Order_Date") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>' Visible="false"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("Dish_Name") %>' Font-Bold="True" Font-Size="small" style="float:left"></asp:Label><br />
                                    
                                    <asp:Button ID="Button1" runat="server" Text="-" CssClass="qtyBtn margin-top-one" CommandName="Minus" style="float:left; padding: 6px 9px;"></asp:Button>
                                    <span class="qty-text"><asp:Label ID="lblqty" runat="server" Text='<%#Eval("Qty") %>' CssClass="quantity-text" style="float:left"></asp:Label></span>
                                    <asp:Button ID="Button2" runat="server" Text="+" CssClass="qtyBtn addBtn plus margin-top-one" CommandName="Plus" style="float:left; padding: 6px 9px;"></asp:Button>&nbsp;&nbsp;
                                    <br />
                                    <asp:Label ID="lblcoupon" runat="server" Text="" Font-Size="Small" ForeColor="#006600"  style="float:left" CssClass="margin-top-one"></asp:Label><br />
                                    <div class="small remove-padding">
                                        <asp:TextBox ID="txtCoupon" runat="server" style="float:left" placeholder="Enter Coupon code" CssClass="margin-top-one"></asp:TextBox>
                                    </div><br />
                                    <asp:LinkButton ID="Apply" runat="server" Text="X" CssClass="qtyBtn" style="float:left" CommandName="Apply">Apply</asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Shipping :Rs" ForeColor="#999999" Font-Size="Small" CssClass="margin-top-one"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblDelivery" runat="server" Text="0" ForeColor="#999999" Font-Size="Small"></asp:Label><br />
                                    <asp:Label ID="Label8" runat="server" Text='<%# "Deliver Slot:" +Eval("Order_Date", "{0:M-dd-yyyy}") %>' ForeColor="#999999" Font-Size="Small" CssClass="margin-top-one"></asp:Label><br />
                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("Slot") %>' ForeColor="#999999" Font-Size="Small" CssClass="margin-top-one"></asp:Label>
                                </td>
                                <td >
                     
                                </td>
                                <td>
                                    Dish Price :Rs. <asp:Label ID="lblUnitPrice" runat="server" Text='<%#Eval("price") %>' CssClass="margin-top-one"></asp:Label><br />
                                    Total Price :Rs. <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("totPrice") %>' CssClass="margin-top-one"></asp:Label></br>
                                     <asp:LinkButton ID="remove" runat="server" Text="X" CssClass="qtyBtn margin-top-one" CommandName="Remove">Remove</asp:LinkButton>
                                    </td>
                                   
                                </td>
							</tr>
                           <%-- <tr>
                                <td>
                                        <asp:Button ID="Button1" runat="server" Text="-" CssClass="qtyBtn" CommandName="Minus"></asp:Button>
                                        <span class="qty-text"><asp:Label ID="lblqty" runat="server" Text='<%#Eval("Qty") %>'></asp:Label></span>
                                        <asp:Button ID="Button2" runat="server" Text="+" CssClass="qtyBtn addBtn plus" CommandName="Plus"></asp:Button>
                                </td>
                                <td>
                                        <asp:Label ID="Label8" runat="server" Text='<%# "Deliver Slot:" +Eval("Order_Date", "{0:M-dd-yyyy}") %>' ForeColor="#999999" Font-Size="Small"></asp:Label><br />
                                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("Slot") %>' ForeColor="#999999" Font-Size="Small"></asp:Label>
                                </td>
                                <td colspan="2" style="padding: 0; margin: 0;">
                                   Total Price :Rs. <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("totPrice") %>'></asp:Label></td>
							</tr>--%>
                            <%--<tr>
                                 <td>
                                        <asp:Label ID="lblDishcartid" runat="server" Text='<%#Eval("ConsumerDishCart_ID") %>' Visible="false" ></asp:Label> 
                                        <asp:Label ID="lblCartid" runat="server" Text='<%#Eval("Cart_ID") %>' Visible="false" ></asp:Label>
                                        <asp:Label ID="lblChefid" runat="server" Text='<%#Eval("Chef_ID") %>' Visible="false" ></asp:Label>
                                        <asp:Label ID="lbldishid" runat="server" Text='<%#Eval("Dish_ID") %>' Visible="false" ></asp:Label>
                                        <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Order_Date") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>' Visible="false"></asp:Label>
                                </td>
                                <td>
                                        <asp:Label ID="Label6" runat="server" Text="Promo Code Applied" Font-Size="Small" ForeColor="#006600" Visible="false"></asp:Label><br />
                                        <div class="small">
                                            <asp:TextBox ID="txtCoupon" runat="server" CssClass="" placeholder="Enter Coupon code" Font-Underline="True" ></asp:TextBox>
                                        </div>
                                        <asp:LinkButton ID="Apply" runat="server" Text="X" CssClass="qtyBtn" CommandName="Apply">Apply</asp:LinkButton>
                                </td>
                                <td>
                  
                                </td>
                                <td colspan="2">
                                        <asp:LinkButton ID="remove" runat="server" Text="X" CssClass="qtyBtn" CommandName="Remove">Remove</asp:LinkButton>
                                </td>          
							</tr>--%>
						</tbody></table>
       <%-- <table>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label21" runat="server" Text="Chef" ForeColor="#999999" Font-Size="Small" Font-Bold="True"></asp:Label>
                    <asp:Label ID="Label22" runat="server" Text='<%#Eval("Chef_UserName") %>' Font-Bold="True" Font-Size="small"></asp:Label>
                </td>
                <td align="right" colspan="3">
                    <asp:Label ID="Label13" runat="server" Text="Rating"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="5">
                   <div style=" border-bottom: 1px dotted #deeaee; padding: 0 1% 1%;" id="devider"></div></td>
            </tr>
            <tr>
                <td rowspan="2">
                     <div class="members"> 
                            <ul class=""> 
                                <div class="avatar">
                                    <a href="">
                                      <img src='<%# "../Chef/upload/"+Eval("Dish_Image")%>' alt="" class="dish-image-square">
                                   </a>
                               &nbsp;</div>
                            </ul>
                        </div>
                    <%--<asp:Image ID="Image1" runat="server" Height="50px" Width="50px" />--%>
                <%--</td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("Dish_Name") %>' Font-Bold="True" Font-Size="small"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Shipping :Rs" ForeColor="#999999" Font-Size="Small"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblDelivery" runat="server" Text="0" ForeColor="#999999" Font-Size="Small"></asp:Label>
                </td>
                <td >
                     
                </td>
                <td>
                    Dish Price :Rs. <asp:Label ID="lblUnitPrice" runat="server" Text='<%#Eval("price") %>'  ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                  <asp:Button ID="Button1" runat="server" Text="-" CssClass="qtyBtn" CommandName="Minus"></asp:Button>
                                            <span class="qty-text"><asp:Label ID="lblqty" runat="server" Text='<%#Eval("Qty") %>'></asp:Label></span>
                                            <asp:Button ID="Button2" runat="server" Text="+" CssClass="qtyBtn addBtn plus" CommandName="Plus"></asp:Button>
                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text='<%# "Deliver Slot:" +Eval("Order_Date", "{0:M-dd-yyyy}") %>' ForeColor="#999999" Font-Size="Small"></asp:Label><br />
                     <asp:Label ID="Label3" runat="server" Text='<%#Eval("Slot") %>' ForeColor="#999999" Font-Size="Small"></asp:Label>
                </td>
                <td colspan="2" style="padding: 0; margin: 0;">
                   Total Price :Rs. <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("totPrice") %>'></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDishcartid" runat="server" Text='<%#Eval("ConsumerDishCart_ID") %>' Visible="false" ></asp:Label> 
                                         <asp:Label ID="lblCartid" runat="server" Text='<%#Eval("Cart_ID") %>' Visible="false" ></asp:Label>
                                          <asp:Label ID="lblChefid" runat="server" Text='<%#Eval("Chef_ID") %>' Visible="false" ></asp:Label>
                                           <asp:Label ID="lbldishid" runat="server" Text='<%#Eval("Dish_ID") %>' Visible="false" ></asp:Label>
                                           <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Order_Date") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>' Visible="false"></asp:Label>
                   
                   </td>
                <td>
                     <asp:Label ID="Label6" runat="server" Text="Promo Code Applied  " 
                        Font-Size="Small" ForeColor="#006600" Visible="false"></asp:Label><br />
                    <div class="small">
                        <asp:TextBox ID="txtCoupon" runat="server" CssClass="" placeholder="Enter Coupon code" Font-Underline="True" ></asp:TextBox>
                    </div>
                    <asp:LinkButton ID="Apply" runat="server" Text="X" CssClass="qtyBtn" CommandName="Apply">Apply</asp:LinkButton>
                </td>
                <td>
                  
                </td>
                <td colspan="2">
                <asp:LinkButton ID="remove" runat="server" Text="X" CssClass="qtyBtn" CommandName="Remove">Remove</asp:LinkButton>
                    <%--<asp:HyperLink ID="HyperLink1" runat="server">Remove</asp:HyperLink>--%>
                <%--</td>
            </tr>
          
            <tr>
                <td colspan="5">
                   <div class="cart-dish" id="Div1"></div></td>
            </tr>
        </table>--%>
        </ItemTemplate>
        </asp:DataList>

       <%-- </ContentTemplate></asp:UpdatePanel>--%>
					
					<!--//one-half-->
				</div>
                </div>
                </aside>
                </section>
				<!--//content-->
				
				<!--right sidebar-->
				<aside class="sidebar one-fourth" style="visibility: visible;">
					<div class="widget">
						<h3>Delivery Address</h3>
                        <asp:Panel ID="pnladdressbar" runat="server">
                            <div><asp:Label ID="lblfoodyname" runat="server" Text=""></asp:Label></div>
                            <asp:Label ID="lblAddressID" runat="server" Text="" Visible="false"></asp:Label>
                            <div class="address"><asp:Label ID="lblhouseno" runat="server" Text=""></asp:Label> -
                                <asp:Label ID="lblblockno" runat="server" Text=""></asp:Label>,
                            </div>
                            <%--<div class="address"><asp:Label ID="lblblockno" runat="server" Text=""></asp:Label>,</div>--%>
                            <div class="address"><asp:Label ID="lblsocityname" runat="server" Text=""></asp:Label>,</div>
                            <div class="address"><asp:Label ID="lblarea" runat="server" Text=""></asp:Label>, </div>  
                                <div class="address"><asp:Label ID="lblandmark" runat="server" Text=""></asp:Label>,</div>
                            <div class="address"><asp:Label ID="lblcity" runat="server" Text=""></asp:Label> - <asp:Label ID="lblpincode" runat="server" Text=""></asp:Label></div>
                     
                            <div></div>
                         </asp:Panel>
                    
                    <%--    <a href="" class="button full-width">Add a New Address</a>--%>

                    <asp:Button ID="btnAdd" runat="server" Text="Change Address"  
                            CssClass="button full-width" onclick="btnAdd_Click"></asp:Button>
                           
                    </div>
					<div class="widget">
						<div class="widget nutrition">
						<h3>Payment Summary</h3>
						<table>
							<tbody>
                            <tr>
								<td>Order Total</td>
								<td>Rs.<asp:Label ID="lblOrderAmt" runat="server" Text="0" Visible="true"></asp:Label></td>
							</tr>
							<tr>
								<td>Shipping</td>
								<td><asp:Label ID="lblshippingcharge" runat="server" Text="0" Visible="true"></asp:Label> </td>
							</tr>
							<tr>
								<td>TAX 12%</td>
								<td>Rs.<asp:Label ID="lblTax" runat="server" Text="0" Visible="true"></asp:Label></td>
							</tr>
							<tr>
								<td>Discount </td>
								<td>Rs.<asp:Label ID="lblDiscount" runat="server" Text="0" Visible="true"></asp:Label> </td>
							</tr>
                            <tr>
								<td>Payable Amount</td>
								<td>Rs.<asp:Label ID="lblPayable" runat="server" Text="0" Visible="true"></asp:Label> </td>
							</tr>
							
						</tbody></table>
					</div>
                    <asp:Button ID="btnCheckOut" runat="server" Text="Proceed To Checkout"  
                            class="button full-width" onclick="btnCheckOut_Click"></asp:Button>
                  
					</div>
				</aside>


                <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlpopup" TargetControlID="btnAdd" BehaviorID="mpe" BackgroundCssClass="modalBackground" CancelControlID="btncancel"> </asp:ModalPopupExtender>
   <asp:Panel ID="pnlpopup" runat="server"  CssClass="modalPopup" Style="display: none" >
       <%-- <div class="body"> </div>--%>
          <div class="modal container">
          <%--  <div>--%>

                             
          <div class="f-row">
                            <table>
                             <tr>
                               <td>Select Address :</td>
                               <td><asp:DropDownList ID="ddladdress" runat="server" onselectedindexchanged="ddladdress_SelectedIndexChanged"  AutoPostBack="True" ></asp:DropDownList></td>
                              ̥
                             </tr>
                            </table>
                        </div>
                       <div class="f-row">
                       OR
                       </div>
						<h3>Add New Address</h3>                           
					

                     <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                     	
                    	<div class="f-row">
							<table>
                              <tr>
                                 <td>
                                  <asp:TextBox ID="txtapartment" runat="server" placeholder="Apartment / House No." ValidationGroup="personal"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtapartment" Display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
						
                                 </td>
                                 <td>
                                  <asp:TextBox ID="txtblockno" runat="server" placeholder="Block No." ValidationGroup="personal"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtblockno" Display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
						
                                 </td>
                                
                              </tr>
                            </table>
                           </div>
                        <div class="f-row">
							<table>
                              <tr>
                                  <td>
                                  <asp:TextBox ID="txtsociatyname" runat="server" placeholder="Society Name" ValidationGroup="personal"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtsociatyname" Display="Dynamic" Text="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
						
                                 </td>
                              </tr>
                            </table>
                           </div>
                        <div class="f-row">

                           <table>
                           <tr>
                              <td>
                              <asp:DropDownList ID="ddlarea" runat="server" Width="100%"  placeholder="Area" 
                                      AutoPostBack="True" onselectedindexchanged="ddlarea_SelectedIndexChanged"></asp:DropDownList></td>
                              <td>  <asp:DropDownList ID="ddlcity" runat="server" Width="100%"  placeholder="City" ></asp:DropDownList></td>
                              
                           </tr>
                           </table>
                            
						</div>
                        <div class="f-row">
                          <table>
                           <tr>
                                     <td><asp:DropDownList ID="ddlLandMark" runat="server" Width="100%"  placeholder="PinCode"></asp:DropDownList></td>
                                     <td><asp:TextBox ID="txtPinCode" runat="server" placeholder="PinCode" ValidationGroup="personal" Enabled="false"></asp:TextBox></td>
                            
                           </tr>
                          </table>
						</div>
                        <div class="f-row">
                          <table>
                           <tr>
                                     <td><asp:TextBox ID="txtmobileno" runat="server" placeholder="MobileNo" ValidationGroup="personal"></asp:TextBox></td>
                                     <td><asp:Label ID="Label1" runat="server" Text="This Number is Use For Varification Code" Font-Size="Small" ForeColor="Gray"></asp:Label></td>
                            
                           </tr>
                          </table>
						</div>
                        
                        
                       </ContentTemplate></asp:UpdatePanel>
                        
                        <div class="f-row bwrap">
						<table>
                        <tr>
                          <td>   <asp:Button ID="btncancel" runat="server" Text="Cancel"> </asp:Button> </td>
                          <td><asp:Button ID="Button4" runat="server" Text="Add" ValidationGroup="personal"  onclick="btnAddAddress_Click"> </asp:Button>    </td>
                        </tr>
                        </table>
                         
                          </div> 
                    </div>
</asp:Panel>
				<!--//right sidebar-->
			</div>
			<!--//row-->
		</div>
		<!--//wrap-->
        </asp:View>
        <asp:View ID="View2" runat="server">
            <h1 class="center" style="color: #444;">No Dishes In Your Cart</h1>
        </asp:View>
        </asp:MultiView>
	</main>
</asp:Content>

