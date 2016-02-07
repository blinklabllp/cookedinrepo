<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="BillingAddress.aspx.cs" Inherits="Consumer_BillingAddress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


         <section style="visibility: visible;" class="content full-width">
					<!--entries-->
					    <div class="row">
					<div class="full-width" style="visibility: visible;">
						<div class="container box">						
							<h1 class="center">Billing Address List</h1>
							<table>
								<tbody><tr>
									<th>HouseNo./ApartmentNo.</th>
									<th>BlockNo</th>
                                    <th>Society Name</th>
									<th>Area</th>
									<th>City</th>
                                    <th>Landmark</th>
                                    <%--<th>Action</th>--%>
								</tr>
                                <asp:Repeater ID="Repeater1" runat="server">
                                  <ItemTemplate>
                                    <tr>
									<td><%#Eval("House_No")%></td>
                                    <td><%#Eval("Block_No")%></td>
									<td><%#Eval("Society_Name")%></td>
									<td><%#Eval("Area")%></td>
                                    <td><%#Eval("City")%></td>
                                    <td><%#Eval("Landmark")%>r</td>
									<%--<td>
                                        <div class="quicklinks">
                                        <a class="button" href="#">Delete</a>
								           
							            </div>
                                    </td>--%>
								</tr>
                                  </ItemTemplate>
                                </asp:Repeater>
								
																
							</tbody></table>
						</div>
					</div>
				</div>
					<!--//entries-->
				</section>
        
        <section style="visibility: visible;" class="content center full-width">
				
                	<div class="modal container">
						<h3>Address</h3>                           
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
                              <td><asp:DropDownList ID="ddlarea" runat="server" Width="100%"  placeholder="Area" ></asp:DropDownList></td>
                              <td>  <asp:DropDownList ID="ddlcity" runat="server" Width="100%"  placeholder="City" ></asp:DropDownList></td>
                              
                           </tr>
                           </table>
                            
						</div>
                        <div class="f-row">
                          <table>
                           <tr>
                                     <td><asp:DropDownList ID="ddlLandMark" runat="server" Width="100%"  placeholder="PinCode"></asp:DropDownList></td>
                                     <td><asp:TextBox ID="txtPinCode" runat="server" placeholder="PinCode" ValidationGroup="personal"></asp:TextBox></td>
                            
                           </tr>
                          </table>
						</div>
                        <div class="f-row bwrap">
							
                             <asp:Button ID="btnAdd" runat="server" Text="Add" ValidationGroup="personal" 
                                 onclick="btnAdd_Click"> </asp:Button>
                         
                          </div> 
                    </div>
						
	  </section>
    
    

</asp:Content>

