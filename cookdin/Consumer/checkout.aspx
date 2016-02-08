<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="Consumer_checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
				<!--content-->
				<section class="content full-width top-padding-extra" style="visibility: visible;">
					<!--one-half-->
					<section class="container">
                    <div class="full-width wow fadeInUp animated" style="visibility: visible;">
						<div class="container box container-padding">
                            <div class="left">Total Payment to be made: <b>Rs. <asp:Label ID="lblOrderAmt" runat="server" Text="0" Visible="true"></asp:Label></b></div>
                            <%--<div class="right">Order ID: <b><asp:Label ID="lblOrderID" runat="server" Text="0" Visible="true"></asp:Label></b></div>--%>
						</div>
					</div>
					</section>
					<!--//one-half-->
                
				<!--//content-->
                <!--content-->
				<section class="" style="visibility: visible; animation-name: fadeInUp;">
					<!--one-half-->
					<section class="container" style="background: #F5F8F9">
                            <div class="row">
					<div class="one-third wow fadeInLeft animated" style="visibility: visible; animation-name: fadeInLeft;">
						<div class="container box container-padding">
							<div class="font-size-12 padding-botttom-1">Payment to be made</div>
                            <span>Rs. <b><asp:Label ID="lblTotAmt" runat="server" Text="0" Visible="true"></asp:Label></b></span>
						</div>
					</div>
					
					<div data-wow-delay=".2s" class="one-sixth payment-boxes-small" style="visibility: visible;">
						<div class="">
							<h2>-</h2>
						</div>
					</div>
					
					<div data-wow-delay=".4s" class="one-fourth" style="visibility: visible;">
						<div class="container box container-padding">
                            <div class="font-size-12 padding-botttom-1">Discount</div>
							<span>Rs. <b><asp:Label ID="lblDiscount" runat="server" Text="0" Visible="true"></asp:Label></b></span>
						</div>
					</div>
					
					<div data-wow-delay=".6s" class="one-sixth payment-boxes-small" style="visibility: visible;">
						<div class="">
							<h2>=</h2>
						</div>
					</div>
					
					<div data-wow-delay=".8s" class="one-third" style="visibility: visible;">
						<div class="container box container-padding">
                             <div class="font-size-12 padding-botttom-1">Total Payable</div>
							<span>Rs. <b><asp:Label ID="lblPayableAmt" runat="server" Text="0" Visible="true"></asp:Label></b></span>
						</div>
					</div>
				</div>
					</section>
					<!--//one-half-->
                <!--//content-->
                </section>
                <section class="" style="visibility: visible;">
					<!--one-half-->
				<section class="container">
                <div class="row">
					<div data-wow-delay=".2s" class="one-fourth wow fadeInLeft animated" style="visibility: visible; ">
						<div class="container box">
							<h2>Choose Payment Option</h2>
							<p>
                                <div class="f-row full">
							    <%--<div class="radio" id="Div3"><span><input type="radio" name="radio" id="Radio3"></span></div>
							    <label for="r1">Cash On Delivery</label>--%>

                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True"  >
                                    <asp:ListItem Selected="True">Cash On Delivery</asp:ListItem>
                                    <%--<asp:ListItem>Credit Card</asp:ListItem>--%>
                                    </asp:RadioButtonList>


						        </div>
						        <%--<div class="f-row full">
							        <div class="radio" id="Div4"><span><input type="radio" name="radio" id="Radio4"></span></div>
							        <label for="r2">By Credit Card</label>
						        </div>--%>
                        </p>
						</div>
					</div>
                    <div class="three-fourth wow fadeInLeft animated" style="visibility: visible; animation-name: fadeInLeft;">

                    <div class="container box">
						<h2>Delivery Address</h2>
                        <asp:Panel ID="pnladdressbar" runat="server">
                            <div><asp:Label ID="lblfoodyname" runat="server" Text=""></asp:Label></div>
                            <asp:Label ID="lblAddressID" runat="server" Text="" Visible="false"></asp:Label>
                            <div>Apartment:<asp:Label ID="lblhouseno" runat="server" Text=""></asp:Label>,</div>
                            <div>Block No. : <asp:Label ID="lblblockno" runat="server" Text=""></asp:Label>,</div>
                            <div>Sociaty:<asp:Label ID="lblsocityname" runat="server" Text=""></asp:Label></div>
                            <div><asp:Label ID="lblarea" runat="server" Text=""></asp:Label>, </div>  
                                <div><asp:Label ID="lblandmark" runat="server" Text=""></asp:Label></div>
                            <div><asp:Label ID="lblcity" runat="server" Text=""></asp:Label> - <asp:Label ID="lblpincode" runat="server" Text=""></asp:Label></div>
                     
                            <div></div>
                         </asp:Panel>
                    
                  
                    </div>
						<%--<div >
							<h2>Delivery Address</h2>
							<p>
                                <b>Karan Gandhi</b><br />
                                12-A, PrernaKutir Bunglows,<br />
                                Sarthi Hotel,<br />
                                Ahmedabad<br />
                            </p>
						</div>
					</div>--%>
                   
				</div>
                 <div class="f-row full margin-top-div center">
								<%--<input type="submit" value="Proceed" id="submitRecipe" class="button" onclick="return submitRecipe_onclick()">--%>

                                <asp:Button ID="btnProceed" runat="server" Text="Proceed" class="button" 
                                    onclick="btnProceed_Click" CssClass="btn-width"></asp:Button>
							</div>
                </div>
                	</section>
				</section>
					<!--//one-half-->
                    </section>
			</div>
    <script language="javascript" type="text/javascript">
// <![CDATA[

      
// ]]>
    </script>
</asp:Content>

