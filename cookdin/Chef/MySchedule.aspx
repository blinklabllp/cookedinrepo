<%@ Page Title="" Language="C#" MasterPageFile="~/Chef/ChefMasterPage.master" AutoEventWireup="true" CodeFile="MySchedule.aspx.cs" Inherits="Chef_MySchedule" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    

<%--<script type="text/javascript" lang="javascript">
        $(function () {
            $("#<%=textboxDate.ClientID %>").multiDatesPicker
                ({
                dateFormat: 'dd/mm/yy',
                minDate: 0,
               /* maxDate: 7,*/
            });
        });
    </script>--%>


         <script type="text/javascript" language="javascript">
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
         function SetDatePicker()
          {
             $("#<%=textboxDate.ClientID %>").multiDatesPicker
             ({
                  dateFormat: 'dd/mm/yy',
                minDate: 0,
              
             });
         }
</script>


    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <main class="main" role="main">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="#" title="Home">Schedule</a></li>
					<li>Schedule</li>
				</ul>
			</nav>
			<div class="row">
				
				<!--//content-->
                                <section style="visibility: visible;" class="content full-width">
					<!--entries-->
					<div class="entries row">
						<!--item-->
                        <h1>Vacation Mode</h1>
                           
                           <div class="f-row">
                              <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
                           </div>
                         
						<div class="f-row">

                                     <asp:TextBox ID="textboxDate" runat="server" placeholder="Choose Vacation Days" Height="60px" CssClass="DatePicker"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ErrorMessage="Select Atleast One Date" 
                                     Text="Select Atleast One Date" ControlToValidate="textboxDate" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ValidationGroup="vacationdates">
                                     </asp:RequiredFieldValidator>
							
					    </div>
                        <div class="f-row">
                                     <asp:Button ID="Button1" runat="server" Text="Save Vacation Dates" onclick="Button1_Click" ValidationGroup="vacationdates" />
						</div>


                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="False"  UpdateMode="Conditional">
                        
                        <Triggers><asp:AsyncPostBackTrigger ControlID ="btnfirst" EventName="Click" /></Triggers>
                        <Triggers><asp:AsyncPostBackTrigger ControlID ="btnsecond" EventName="Click" /></Triggers>
                        <Triggers><asp:AsyncPostBackTrigger ControlID ="btnthird" EventName="Click" /></Triggers>
                        <Triggers><asp:AsyncPostBackTrigger ControlID ="btnforth" EventName="Click" /></Triggers>
                        <Triggers><asp:AsyncPostBackTrigger ControlID ="btnfifth" EventName="Click" /></Triggers>
                        <Triggers><asp:AsyncPostBackTrigger ControlID ="btnsix" EventName="Click" /></Triggers>
                        <Triggers><asp:AsyncPostBackTrigger ControlID ="btnseven" EventName="Click" /></Triggers>

                        <ContentTemplate>


                         <div class="f-row">
                                       <h1>My Orders</h1>
                         </div>

                          <div class="f-row"><asp:Label ID="lblorderlistdate" runat="server" Text=""></asp:Label></div>

                        <div class="f-row">
                         
                           <table>
                         <tr>
                           <td><asp:Button ID="btnfirst" runat="server" Text="" onclick="btnfirst_Click"></asp:Button></td>
                           <td><asp:Button ID="btnsecond" runat="server" Text="" onclick="btnsecond_Click"></asp:Button></td>
                           <td><asp:Button ID="btnthird" runat="server" Text="" onclick="btnthird_Click" ></asp:Button></td>
                           <td><asp:Button ID="btnforth" runat="server" Text="" onclick="btnforth_Click"></asp:Button></td>
                           <td><asp:Button ID="btnfifth" runat="server" Text="" onclick="btnfifth_Click"></asp:Button></td>
                           <td><asp:Button ID="btnsix" runat="server" Text="" onclick="btnsix_Click"></asp:Button></td>
                           <td><asp:Button ID="btnseven" runat="server" Text="" onclick="btnseven_Click" ></asp:Button></td>
                         </tr>
                         
     
                         <tr>
                 

                    
                         <asp:DataList ID="DataList1" runat="server" onitemcommand="DataList1_ItemCommand">
                         <HeaderTemplate>
                          <div class="checkout-title">
                                   <table cellpadding="10" cellspacing="10" >
                                    <tr>
                                      <td align="center">Item</td>
                                      <td align="center">Dish</td>
                                      <td align="center">Date & Time</td>
                                      <td align="center">Qty</td>
                                      <td align="center">Total Price</td>
                                      <td align="center">Status</td>
                                      <td align="center">Action</td>
                                    </tr>
                                    <tr><td colspan="7"><div style="height:1px; background-color:gray" id="devider"></div> </td></tr>
                                </div>
                         </HeaderTemplate>
                     <ItemTemplate>
                         <div class="order-group">
                                    <div class="checkout-content">
                                
                       <tr>
                        <td align="center">
                             <img src='<%# "../dishphotoupload/"+Eval("Dish_Image")%>' alt="" width="70px" height="70px">
                        </td>
                        <td align="center">
                            <%#Eval("Dish_Name") %>
                        </td>
                        <td align="center">
                           <span class="net_price"> <asp:Label ID="Label2" runat="server" Text='<%#Eval("DeliveryDate", "{0:M-dd-yyyy}") %>'></asp:Label></span>
                                            <span class="net_price"> <asp:Label ID="Label3" runat="server" Text='<%#Eval("Slot") %>'></asp:Label></span>
                                             <asp:Label ID="lblid" runat="server" Text='<%#Eval("InvoiceDish_ID") %>' Visible="false"></asp:Label>
                        </td>
                        <td align="center">
                           <%#Eval("Qty") %>
                        </td>
                        <td align="center">
                           <%#Eval("Total") %>
                        </td>
                        <td align="center">
                            <%#Eval("Cooking_Status")%>
                        </td>
                        <td align="center">
                                        <asp:Button ID="Button2" runat="server" Text="Cooked" CommandName="cooked" CssClass="button gold btn-small"></asp:Button>
                                        <asp:Button ID="Button5" runat="server" Text="Ready For Pick" CommandName="ready" CssClass="button gold btn-small"></asp:Button>
                        </td>
                    </tr>
              <%--  </table>--%>

                                    </div>
                           </div>
                       </ItemTemplate>
                       <FooterTemplate>
                       </table>
                       <center>
                          <asp:Label ForeColor="#d94352" Visible='<%# DataList1.Items.Count==0 %>' runat="server" ID="lblmsg" Text="No Records Found"></asp:Label>
                       </center>
                       </FooterTemplate>
                        </asp:DataList>

                               


                         </tr>
                        </table>
                        </div>

                   </ContentTemplate>
                        </asp:UpdatePanel>
					</div>
					<!--//entries-->
				</section>
				<!--//content-->
            </div>
			<!--//row-->
		</div>
		<!--//wrap-->
	</main>

    
</asp:Content>

