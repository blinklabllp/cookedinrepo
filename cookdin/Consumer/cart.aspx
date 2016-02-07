<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="Consumer_cart" %>

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

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <main class="main" role="main">
		<!--wrap-->
		<div class="wrap clearfix">
                <!--row-->
                <div class="row">
                <header style="visibility: visible;" class="s-title"><h1>Checkout</h1> </header>
                <!--content-->
                
                    <section style="visibility: visible;" class="content full-width">
                        <!--one-half-->
                        <section class="container">


                          <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                         </ContentTemplate>
                     </asp:UpdatePanel>--%>

                     <asp:DataList ID="DataList1" runat="server" 
                        onitemcommand="DataListdishitem_ItemCommand">
                         <HeaderTemplate>
                          <div class="checkout-title">
                                    <div class="food-name">Items</div>
                                    <div class="food-dish text-center">Dish Name</div>
                                    <div class="food-date text-center">Delivery Date & Time</div>
                                    <div class="food-price text-center">Price</div>
                                    <div class="food-qty text-center">QTY</div>
                                     <div class="food-amt text-center">Discount</div>
                                    <div class="food-amt text-center">amount</div>
                                    <div class="food-del text-center"></div>
                                </div>
                         </HeaderTemplate>
                     <ItemTemplate>
                         <div class="order-group">
                                    <div class="checkout-content">
                                        <div class="members"> <ul class=""> <div class="avatar" style="margin-right:15px"><a href=""><img src='<%# "../Chef/upload/"+Eval("Dish_Image")%>' alt="" class="dish-image-square"></a></div></ul></div>
                                        <%--<div class="food-description"><div><%#Eval("Dish_Name") %></div><div><asp:Label ID="lblChefUserName" runat="server" Text='<%#Eval("Chef_UserName") %>'></asp:Label></div></div>--%>
                                        <div class="food-amt text-center"><span class="net_price"><%#Eval("Dish_Type") %></span></div> 
                                        <div class="food-amt text-center"><span class="net_price"> 
                                            <asp:Label ID="lblDeliveryDate" runat="server" Text='<%#Eval("Order_Date", "{0:M-dd-yyyy}") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="lblSlot" runat="server" Text='<%#Eval("Slot") %>'></asp:Label>
                                            </span></div> 

                                 <%--    <asp:Label ID="lblid" runat="server" Text='<%#Eval("Serial_No") %>'></asp:Label>--%>

                                        <%--<div class="food-amt text-center"><span class="net_price"><asp:Label ID="lblSlot" runat="server" Text='<%#Eval("Slot") %>'></asp:Label></span></div> --%>
                                        <div class="food-amt text-center"><span class="font-rupee"></span><span class="net_price">&#x20B9; <asp:Label ID="lblUnitPrice" runat="server" Text='<%#Eval("price") %>'></asp:Label></span></div>      
                                        <div class="food-qty text-center">
                                            <asp:Button ID="Button1" runat="server" Text="-" CssClass="qtyBtn" CommandName="Minus"></asp:Button>
                                            <span class="qty-text"><asp:Label ID="lblqty" runat="server" Text='<%#Eval("Qty") %>'></asp:Label></span>
                                            <asp:Button ID="Button2" runat="server" Text="+" CssClass="qtyBtn addBtn plus" CommandName="Plus"></asp:Button>
                                        </div>
                                        <div class="food-amt text-center"><span class="font-rupee"></span><span class="net_price"> <asp:Label ID="Label2" runat="server" Text="-"></asp:Label></span></div>    
                                        <div class="food-amt text-center"><span class="font-rupee"></span><span class="net_price">&#x20B9; <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("totPrice") %>'></asp:Label></span></div>    
                                        <div class="food-del text-center"> <asp:Button ID="Button3" runat="server" Text="x" CssClass="qtyBtn addBtn plus" CommandName="remove"></asp:Button></div>   
                                        <div class="food-description"><div><%#Eval("Dish_Name") %></div><div><asp:Label ID="lblChefUserName" runat="server" Text='<%#Eval("Chef_UserName") %>'></asp:Label></div></div>
                                        <asp:Label ID="lblDishcartid" runat="server" Text='<%#Eval("ConsumerDishCart_ID") %>' Visible="false" ></asp:Label> 
                                         <asp:Label ID="lblCartid" runat="server" Text='<%#Eval("Cart_ID") %>' Visible="false" ></asp:Label>
                                          <asp:Label ID="lblChefid" runat="server" Text='<%#Eval("Chef_ID") %>' Visible="false" ></asp:Label>
                                           <asp:Label ID="lbldishid" runat="server" Text='<%#Eval("Dish_ID") %>' Visible="false" ></asp:Label>
                                           <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Order_Date") %>' Visible="false"></asp:Label>
                                    </div>
                           </div>
                       </ItemTemplate>
                     </asp:DataList>
                
                        </section>
                        <!--//one-half-->
                </section>
                <!--content-->
               
               
                 <section class="container padding-div">
                            <div class="row totalDiv">
                                <div class="left cupon-div">
                                      <%--  <div class="left"><span class="tax-font">Tax 12%:</span></div>    --%>
                                         <div id="Div3" class="left width-text totalPrice">
                                         
                                  </div>
                                </div>
                                <div class="margin-left-cart">
                                  <div class="left width-text"><span class="cart-total">Cart Total:</span></div>
                                  <div id="sub_total-2015-12-14-2" class="left width-text totalPrice">
                                          <span class="remove-padding font-color-text">&#x20B9; <asp:Label ID="lblTotalAmt" runat="server" Text="600"></asp:Label></span>
                                  </div>
                                </div>
                              </div>
                        </section>
             
                 <section class="container padding-div">

                          <div class="row totalDiv">
                                <div class="left cupon-div">
                                        <%--<span class="left cupon-text">Coupons</span>--%>
                                       <%-- <div class="left padding-cupon-textbox"> <asp:TextBox ID="TextBox1" runat="server" placeholder="Put Coupon Code Here.."></asp:TextBox></div>
                                        <asp:Button ID="Button5" runat="server" Text="Apply" onclick="btnCoupon_Click" CssClass="btn-discount"  ></asp:Button>--%>
                                </div>


                                <div class="margin-left-cart">
                                          <div class="left width-text"><span class="cart-total">TAX 12%:</span></div>
                                          <div id="Div2" class="left width-text totalPrice">
                                             <span class="remove-padding font-color-text">&#x20B9; <asp:Label ID="lblTax" runat="server" Text="0"></asp:Label></span>
                                         </div>
                                </div>
                              </div>

                        </section>



                        <section class="container padding-div">
                            <div class="row totalDiv">
                                <div class="left cupon-div">
                                        <%--<span class="left cupon-text">Coupons</span>--%>
                                        <div class="left padding-cupon-textbox"> <asp:TextBox ID="txtCoupon" runat="server" placeholder="Put Coupon Code Here.."></asp:TextBox></div>
                                        <asp:Button ID="btnCoupon" runat="server" Text="Apply" onclick="btnCoupon_Click" CssClass="btn-discount"  ></asp:Button>
                                </div>


                                <div class="margin-left-cart">
                                          <div class="left width-text"><span class="cart-total">Discount:</span></div>
                                          <div id="Div5" class="left width-text totalPrice">
                                             <span class="remove-padding font-color-text">     &#x20B9; <asp:Label ID="lblDiscount" runat="server" Text="0"></asp:Label></span>
                                          </div>
                                </div>
                              </div>
                        </section>

                     

                     <section class="container padding-div">
                            <div class="row totalDiv">
                                   <div class="left cupon-div">

                                   <div class="left padding-cupon-textbox">
                                    <asp:DropDownList ID="ddladdress" runat="server" Width="300px" onselectedindexchanged="ddladdress_SelectedIndexChanged"  AutoPostBack="True"></asp:DropDownList>
                                     <br />
                                     <asp:Label ID="lblError" runat="server" Text="" Visible="true"></asp:Label>
                                    </div>
                                           <asp:Button ID="btnAdd" runat="server" Text="Add Address" onclick="btnAdd_Click" CssClass="btn-discount"></asp:Button>
                                        
                                   </div>
                                  <div class="margin-left-cart">
                                            <div class="left width-text"><span class="cart-total">Shipping Charge:</span></div>
                                              <div id="Div4" class="left width-text totalPrice">
                                            <span class="remove-padding font-color-text">  &#x20B9;
                                            <asp:Label ID="lblshippingcharge" runat="server" Text="0" Visible="true"></asp:Label> 
                                           
                                            </span></div>
                                  </div>
                               </div>
                        </section>




                        <section class="container padding-div">
                                   <div class="row totalDiv">
                                <div class="left cupon-div">
                                   <div class="left padding-cupon-textbox">
                                          
                                         
                                        </div>
                                         
                                 
                                   
  <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlpopup" TargetControlID="btnAdd" BehaviorID="mpe" BackgroundCssClass="modalBackground" CancelControlID="btncancel"> </asp:ModalPopupExtender>
   <asp:Panel ID="pnlpopup" runat="server" Style="display: none" CssClass="modalPopup" >
       <%-- <div class="body"> </div>--%>
          <div class="modal container">
          <%--  <div>--%>
						<h3>Add New Address</h3>                           
					
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                    
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
                              

                                </div>
                                <div class="margin-left-cart">
                                  <div class="left width-text"><span class="cart-total">Final Total : </span></div>
                                  <div id="Div1" class="left width-text totalPrice"><span class="remove-padding font-color-text">
                                  &#x20B9; <asp:Label ID="lblFinalTotal" runat="server" Text="0"></asp:Label></span> </div>
                                </div>
                              </div>

                        </section>
                        <div class="f-row full text-center">

                        <asp:Label ID="lblcontactno" runat="server" Text="Label" Visible="true"></asp:Label>

                          <asp:Button ID="btnCheckOut" runat="server" Text="Check Out"  onclick="btnCheckOut_Click" CssClass="button btn-chekout"></asp:Button>
                          
                          <asp:Button ID="Button5" runat="server" Text="Check Out Test"   CssClass="button btn-chekout" ></asp:Button>
                          

    <asp:ModalPopupExtender ID="ModalPopupExtender2" runat="server" PopupControlID="Pnlvarivicationpopup" TargetControlID="btnCheckOut" BehaviorID="mpe" BackgroundCssClass="modalBackground" > </asp:ModalPopupExtender>
   <asp:Panel ID="Pnlvarivicationpopup" runat="server" Style="display: none" CssClass="modalPopup" >
       <%-- <div class="body"> </div>--%>
          <div class="modal container">
          <%--  <div>--%>
						<h3>Order Varification</h3>                           
					      
                    	<div class="f-row">
							<table>
                              <tr>
                                 <td>
                                  <asp:TextBox ID="TextBox1" runat="server" placeholder="Apartment / House No." ValidationGroup="personal"></asp:TextBox>
                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtapartment" Display="Dynamic" ForeColor="Red" Text="*" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>--%>
						
                                 </td>
                                 <td> <asp:Button ID="Button6" runat="server" Text="Submit"></asp:Button></td>
                                
                              </tr>
                            </table>
                           </div>
                      
                          </div> 
                    
</asp:Panel>
                          </div>    
						</div>
                        
              
                <!--//content-->
			</div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>
    </span>
</asp:Content>