<%@ Page Title="HomeChef Signup - Cook'dIn" EnableViewStateMac="false" Language="C#" MasterPageFile="~/basic.master" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
 
 
<script type="text/javascript">
  
   // if you use jQuery, you can load them when dom is read.
   $(document).ready(function () {
       var prm = Sys.WebForms.PageRequestManager.getInstance();    
       prm.add_initializeRequest(InitializeRequest);
       prm.add_endRequest(EndRequest);

       // Place here the first init of the autocomplete
       InitAutoCompl();
    });        

    function InitializeRequest(sender, args) {
    }

    function EndRequest(sender, args) {
       // after update occur on UpdatePanel re-init the Autocomplete
       InitAutoCompl();
   }

  function InitAutoCompl() {    
 $("#<%=txtnational.ClientID %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Service.asmx/GetAllCuisine") %>',
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                var text = this.value.split(/,\s*/);
                text.pop();
                text.push(i.item.value);
                text.push("");
                this.value = text.join(", ");
                var value = $("[id*=hfnational]").val().split(/,\s*/);
                value.pop();
                value.push(i.item.val);
                value.push("");
                $("#[id*=hfnational]")[0].value = value.join(", ");
                return false;
            },
            minLength: 1
        });



        $("#<%=txtcookingoil.ClientID %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Service.asmx/GetCookingOilUsed") %>',
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                var text = this.value.split(/,\s*/);
                text.pop();
                text.push(i.item.value);
                text.push("");
                this.value = text.join(", ");
                var value = $("[id*=hfcookingoil]").val().split(/,\s*/);
                value.pop();
                value.push(i.item.val);
                value.push("");
                $("#[id*=hfcookingoil]")[0].value = value.join(", ");
                return false;
            },
            minLength: 1
        });


        $("#<%=txtdishtype.ClientID %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Service.asmx/GetDishType") %>',
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                var text = this.value.split(/,\s*/);
                text.pop();
                text.push(i.item.value);
                text.push("");
                this.value = text.join(", ");
                var value = $("[id*=hfdishtype]").val().split(/,\s*/);
                value.pop();
                value.push(i.item.val);
                value.push("");
                $("#[id*=hfdishtype]")[0].value = value.join(", ");
                return false;
            },
            minLength: 1
        });

        $("#<%=txtdiettype.ClientID %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Service.asmx/GetDietType") %>',
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                var text = this.value.split(/,\s*/);
                text.pop();
                text.push(i.item.value);
                text.push("");
                this.value = text.join(", ");
                var value = $("[id*=hfdiettype]").val().split(/,\s*/);
                value.pop();
                value.push(i.item.val);
                value.push("");
                $("#[id*=hfdiettype]")[0].value = value.join(", ");
                return false;
            },
            minLength: 1
        });




        $("#<%=txtlandmark.ClientID %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Service.asmx/GetLandMark") %>',
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },

            minLength: 1
        });

    }
</script> 

<%--   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>--%>

  
<div class="">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
        <section style="visibility: visible;" class="content center full-width">
				
                	<div class="modal container">
                    <img src="templete/image/logo.png" alt="cook'dIN logo" style="width: 40%; text-align: center; margin: auto;">
						<div class="">
							<div style="text-align:center">
								<h3>Register as a Home Chef</h3>
							</div>
						<div class="">
  <asp:Panel ID="pnlwarning" runat="server" Visible="false">
     <div class="row">
         <div class="full-width wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
             <div role="alert" class="alert alert-danger">
                 <asp:Label ID="lblwarningmessage" runat="server" Text="Label"></asp:Label></div>
         </div>
    </div>
 </asp:Panel>

                        <div class="f-row">
                        <table>
                          <tr>
                             <td> 
                                 <asp:TextBox ID="txtfname" runat="server"   placeholder="First name"  ValidationGroup="personal" ></asp:TextBox>
                           	</td>
                             <td> <asp:TextBox ID="txtmname" runat="server"   placeholder="Middle name" ValidationGroup="personal"></asp:TextBox>
                           </td>
                             <td> <asp:TextBox ID="txtlname" runat="server"   placeholder="Last name" ValidationGroup="personal"></asp:TextBox>
                           </td>
                          </tr>
                          <tr>
                            <td>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="txtfname" Display="Dynamic" Text="*" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2"  runat="server" Text="Only Character Allow" ForeColor="Red" ControlToValidate="txtfname" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="" Display="Dynamic" SetFocusOnError="True" ValidationGroup="personal" />
					
                            </td>
                            <td>
                           <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="txtmname" Display="Dynamic" Text="*" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>--%>
					         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Text="Only Character Allow" ForeColor="Red" ControlToValidate="txtmname" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="" Display="Dynamic" SetFocusOnError="True" ValidationGroup="personal" />
                    	
                            </td>
                            <td>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="txtlname" Display="Dynamic" Text="*" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
						     <asp:RegularExpressionValidator ID="RegularExpressionValidator4"  runat="server" Text="Only Character Allow" ForeColor="Red" ControlToValidate="txtlname" ValidationExpression="[a-zA-Z ]*$" ErrorMessage="" Display="Dynamic" SetFocusOnError="True" ValidationGroup="personal" />
                       
                            </td>
                          </tr>
                        </table>
                           </div>
                  
                            <div class="f-row">
                                <table>
                                  <tr>

                                  <td> <asp:TextBox ID="txtemailid" runat="server" placeholder="Email" ValidationGroup="personal"></asp:TextBox>
                                </td>
                                    <td>
                                        <asp:TextBox ID="txtUsername" runat="server"   placeholder="User name"  ValidationGroup="personal" ></asp:TextBox>
                                         </td>
                                    
                                  </tr>
                                  <tr>
                                   <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtemailid" ForeColor="Red" Display="Dynamic" Text="*" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
						            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"    ErrorMessage="" ControlToValidate="txtemailid"   Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="personal"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Invalid EmailId</asp:RegularExpressionValidator>
                           
                                   </td>
                                   <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="txtUsername" Display="Dynamic" Text="*" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" Text="Special Character Not Allow" ForeColor="Red" ControlToValidate="txtUsername" ValidationExpression="^[a-zA-Z0-9]+$" ErrorMessage="" Display="Dynamic" SetFocusOnError="True" ValidationGroup="personal" />
						       
                                   </td>
                                  </tr>
                                </table>
                              </div>

                         <div class="f-row">
                         <table>
                           <tr>
                             <td>
                                <asp:TextBox ID="txtPwd" runat="server"   placeholder="Password" ValidationGroup="personal" TextMode="Password"></asp:TextBox>
                            
					
                             </td>
                             <td>
                             <asp:TextBox ID="txtRepwd" runat="server"   placeholder="Confirm password" ValidationGroup="personal" TextMode="Password"></asp:TextBox>
                           
                             </td>
                           </tr>

                           <tr>
                             <td>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPwd" Display="Dynamic" Text="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
                             </td>
                             <td>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtRepwd" Display="Dynamic" Text="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToCompare="txtPwd" ControlToValidate="txtRepwd" Display="Dynamic"   ErrorMessage="" ForeColor="Red" ValidationGroup="personal">Mismatch Password</asp:CompareValidator>
						
                             </td>
                       

                         </table>
                         	</div>
                    

                          <div class="f-row">
                        <table>
                          <tr>
                            <td><asp:TextBox ID="txtmobile" runat="server" placeholder="Mobile No." ValidationGroup="personal"></asp:TextBox>
                           
                        </td>
                            <td>
                            	<asp:TextBox ID="txtphone" runat="server" placeholder="Phone No." ValidationGroup="personal"></asp:TextBox>
                           </td>
                          </tr>
                          <tr>
                             <td>
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtmobile" ForeColor="Red" Display="Dynamic" Text="*" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
						<%-- <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToValidate="txtmobile" Display="Dynamic" ErrorMessage="CompareValidator"   ForeColor="Red" Operator="DataTypeCheck" SetFocusOnError="True" Type="Integer" ValidationGroup="personal">Invalid Mobile Number</asp:CompareValidator>--%>
                        
                             </td>
                             <td>
                           <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtphone" ForeColor="Red" Display="Dynamic" Text="*" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
						 <asp:CompareValidator ID="CompareValidator2" runat="server"  ControlToValidate="txtphone" Display="Dynamic" ErrorMessage="CompareValidator"  ForeColor="Red" Operator="DataTypeCheck" SetFocusOnError="True" Type="Integer" ValidationGroup="personal">Invalid Mobile Number</asp:CompareValidator>
                           --%> 
                             </td>
                           </tr>
                        </table>
							</div>
                      <div class="f-row" id="tbl-birthdate-selector">
                        <table>
                          <tr class="border-none">
                             <td width="60%" class="border-none">
                                 <table>
                                  <tr class="border-none">
                                       <td class="border-none"><asp:Label ID="Label2" runat="server" Text="Birth Date" ></asp:Label></td>
                                         <td class="form-dropdown1"><asp:DropDownList ID="ddldate" runat="server" width="100%" ></asp:DropDownList></td>
                                         <td class="form-dropdown1"><asp:DropDownList ID="ddlmonth" runat="server" width="100%" ></asp:DropDownList></td>
                                         <td class="form-dropdown1"><asp:DropDownList ID="ddlyear" runat="server" Width="100%" ></asp:DropDownList></td>
                                   </tr>
                                 </table>
                             </td>
                             <td width="40%" class="border-none">
                              <table>
                                <tr class="border-none">
                               <td><asp:Label ID="Label6" runat="server" Text="Gender" ></asp:Label></td>
                                  <td class="form-dropdown1" style="width:100%">
                                     <asp:DropDownList ID="rdogender" runat="server" width="100%" >
                                  <asp:ListItem>Male</asp:ListItem>
                                  <asp:ListItem>Female</asp:ListItem>
                                  <asp:ListItem>other</asp:ListItem>
                               </asp:DropDownList>
                                  </td>
                                </tr>
                                </table>
                             </td>
                          </tr>
                        </table>
                          </div>
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
                                  <asp:TextBox ID="txtsociatyname" runat="server" placeholder="Society name" ValidationGroup="personal"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtsociatyname" Display="Dynamic" Text="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
						
                                 </td>
                              </tr>
                            </table>
                           </div>
                         

                           <div class="f-row">

                           <table>
                           <tr>
                           <td class="form-dropdown">
                              <asp:DropDownList ID="ddlarea" runat="server" Width="100%"></asp:DropDownList>
                            </td>
                              <td class="form-dropdown">
                              <asp:DropDownList ID="ddlcity" runat="server" Width="100%"></asp:DropDownList>
                             </td>
                            
                           </tr>
                           </table>
                          
						</div>
                        <div class="f-row">
                          <table>
                           <tr>
                                     <td><asp:TextBox ID="txtlandmark" runat="server" placeholder="Landmark" ValidationGroup="personal"></asp:TextBox></td>
                                     <td><asp:TextBox ID="txtPinCode" runat="server" placeholder="Pin code" ValidationGroup="personal"></asp:TextBox></td>
                            
                           </tr>

                           <tr>
                                  <td></td>
                                  <td> 
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPinCode" Display="Dynamic" Text="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator></td>
                           </tr>
                          </table>
						</div>
                     
                         <div class="f-row">
                         <table>
                           <tr>
                           <td>
                                 <asp:Label ID="Label1" runat="server" Text="Select Profile Photo"></asp:Label>
                           </td>
                             <td>
                             <asp:FileUpload ID="FileUpload1" runat="server" ValidationGroup="personal" Width="100%"></asp:FileUpload>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="FileUpload1" Display="Dynamic" Text="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
						--%>
                             </td>
                           </tr>
                         </table>
							</div>
                         <div class="f-row">
                        <asp:TextBox ID="txtaboutme" runat="server" TextMode="MultiLine" Height="115px" placeholder="About me" ValidationGroup="personal" MaxLength="200"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtaboutme" Display="Dynamic" Text="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="personal"></asp:RequiredFieldValidator>
						</div>
                       
					  <div class="f-row">
                       <h3>Preferred hour of communication</h3>
                       <%-- <div class="SingleCheckbox">--%>
                             <asp:CheckBoxList ID="chkpreferred" runat="server" CssClass="ListControl"  RepeatLayout="Flow" >
                                    <asp:ListItem Value="9.00 AM to 12.00 AM">9.00 AM to 12.00 AM</asp:ListItem>
                                    <asp:ListItem Value="12.00 AM to 6.00 PM">12.00 AM to 6.00 PM</asp:ListItem>
                                    <asp:ListItem Value="6.00 PM to 9.00 PM">6.00 PM to 9.00 PM</asp:ListItem>
                            </asp:CheckBoxList>
                          <%-- </div>--%>
						</div>
                         
						<div class="f-row bwrap">
							
                             <asp:Button ID="Button1" runat="server" Text="Next" onclick="Button1_Click" ValidationGroup="personal"> </asp:Button>
                         
                           
						</div>
						<p>Already Registered ? <a href="Login.aspx">Log in.</a></p>
					</div>
                    </div>
				</section>
        </asp:View>
        
        <asp:View ID="View2" runat="server">
         <section style="visibility: visible;" class="content center full-width">
      
       
<%--
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>--%>
                            
	<div class="modal container">
           <div class="f-row">

           <header class="s-title center">
				<h3>Terms & Conditions</h3>
			</header>
         <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="400px">
        	<%--<div class="container box">--%>
            
              
                <div style="padding: 3%;">
               <p class="bold italic">
                    In terms of Information Technology Act, 2000, this document is an electronic record. Being generated by a computer system 
                    it does not require any physical or digital signatures.
                </p>
                <p class="bold italic">
                    This document is published in accordance with the provisions of Rule 3 (1) of the Information Technology (Intermediaries 
                    guidelines) Rules, 2011 that require publishing the rules and regulations, privacy policy and Terms of Use for access or 
                    usage of www.cookedin.com 
                </p>
                <p>
                    This TERMS OF USE are of <b>COOK’DIN Website or /and App which is owned by Blink Tech Ventures Pvt. Ltd.</b>, a Company 
                    registered under the Companies Act, 1956 having its registered office at 16 Rajpath Row Houses, Opposite Rajpath Club, 
                    Bodakdev, Ahmedabad – 15. Gujarat, India.
                </p>
                <p>
                    The Domain Name “www.cookedin.com”, the Brand Name <b>“COOK’DIN”</b> & The Mobile Application (hereinafter referred to as 
                    <b>“Website”</b> or <b>“App”</b> and collectively referred as “COOK’DIN”) are the property of the <b>Blink Tech Ventures Pvt. Ltd.</b> 
                </p>
                <p class="italic underline">
                    Please read the “Terms and Conditions” (“TERMS”) set out below carefully before ordering any Meals or availing any 
                    Services from this Software (“PLATFORM”). By accessing /using the PLATFORM for any means or ordering any Meals or 
                    availing any Services from this Website, by phone, or by our mobile applications you agree to be bound by these Terms. 
                </p>
                <p class="underline">
                    THIS DOCUMENT SETS OUT THE TERMS ON WHICH YOU (“YOU” or “USER” or “HOME CHEFS” or “HOME COOKS” or “CAFE OWNERS” or 
                    “PATRONS”) USE THE COOK’DIN PLATFORM. ACCESSING, BROWSING OR OTHERWISE USING THIS WEBSITE OR MOBILE-APP INDICATES YOUR
                     AGREEMENT TO ALL THE DOCUMENTS RELATED TO THIS WEBSITE OR MOBILE-APP BUT NOT LIMITED TO THE TERMS AND CONDITIONS, 
                     PRIVACY POLICY AND DELIVERY POLICY AVAILABLE AS AMENDED FROM TIME TO TIME. PLEASE READ THE TERMS OF USE CAREFULLY 
                     BEFORE PROCEEDING. THESE TERMS GOVERN YOUR ACCESS TO USE OF THE COOK’DIN PLATFORM AND CONSTITUTE A LEGALLY BINDING 
                     AGREEMENT BETWEEN YOU AND COOK’DIN.
                </p>
                <p>
                    THESE TERMS ARE SUBJECT TO CHANGE FROM TIME TO TIME WITHOUT ANY PRIOR NOTICE SIGNIFYING THE CHANGE, AND HENCEFORTH,
                     ACCORDINGLY YOU ARE ADVISED TO REFER BACK TO THESE TERMS BEFORE ACCESSING THE WEBSITE OR AN APP. 
                </p>
                <h3>Definition</h3>
                <p>
                   <ul>
						<li>
                            “Use” or “Using” means to access, view, download, upload, or any other legal use or otherwise benefit from 
                            using the COOK’DIN Service;
                        </li>
						<li>
                            “User’s Content” means any content, including any text, data, information or other material, that you may 
                            upload, transmit or store using the functionality of the COOK’DIN Service;
                        </li>
						<li>
                            “Agreement” is a reference to these Terms and Conditions, the Privacy Policy, any order form and payment 
                            instructions provided to you;
                        </li>
						<li>
						    “Delivery Policy” means the policy displayed on our Website and our App, which details the mobilising 
                            of food products; 
                        </li>
                        <li>
						    “Privacy Policy” means the policy displayed on our Website and on our App, which details how we collect and 
                            store your personal data;
                        </li>
                        <li>
						    “You”, “your”, “yours” and “patrons” are references to you the person accessing this Website and 
                            ordering any Meals or Services from the Website or from any other channel provided by COOK’DIN;
                        </li>
                        <li>
						    “We”, "us”, “our”, “Cook’dIn” and “COOK’DIN” are references to the Company;
                        </li>
                        <li>
                            “Order” means any order placed for food through the COOK’DIN’s Mobile Application/Website;
                        </li>
                        <li>
                            “Food” means any perishable substance that people eat or drink in order to maintain life and growth, 
                            which is prepared at any of the listed for the User;
                        </li>
                        <li>
                            “Food Lover” or “Food Lovers” or “Foodaholic” or “Foodaholics”  is a reference to any person who 
                            wish to buy or order any Food from the Website / App;
                        </li>
                        <li>
                            “Service” or “Services” is a reference to only the services which we provide via our Website or an 
                            App;
                        </li>
                        <li>
                            “Home Cooks”, “Home Chefs”, “Home Cafe” and “Commercial Kitchens” is a third party, who has agreed to co-operate with 
                            COOK’DIN to prepare and/or deliver the Meals or Services; 
                        </li>
                        <li>
                            “Website” is a reference to our Website http://www.cookedin.com or our mobile applications or on any other 
                            sub-sites on which we offer Food or Meals or any Services. 
                        </li>
                     </ul>
                </p>
                <p>
                    <h2>GENERAL PROVISIONS (APPLICABLE TO ALL USERS)</h2>
                    <h3>A. GENERAL INFORMATION ABOUT COOK’DIN</h3>
                    <ul>
                        <li>
                            COOK’DIN is owned and managed, operated and maintained by Blink Tech Ventures Pvt. Ltd., a company registered in 
                            Ahmedabad, Gujarat, India.	
                        </li>
                        <li>
                            COOK’DIN is an online marketplace offering, where food lovers who wish to find homemade meals can do so 
                            (“Orders”) from other neighbourhood cooks who wish to share their cooking skills and meals with the Food 
                            lovers. Food lovers and Home Cooks can also create personal profiles (“Profiles”), communicate with other 
                            users using this Platform, rate their experiences and avail any such other Services available on the Website 
                            or/and App from time to time.
                        </li>
                        <li>
                            COOK’DIN shall be entitled at its own discretion to suspend the Website/ App for any reason whatsoever, 
                            including but not limited to repairs, planned maintenance or upgrades and shall not be liable to you for 
                            any losses, damages, costs or expenses arising from or in connection with any suspension or unavailability 
                            of the Services, including but not limited to preventing you from using the Platform or using any of the 
                            Services available on the COOK’DIN.
                        </li>
                        <li>
                            COOK’DIN reserves the right to make any changes to the Website/App including any functionalities and content 
                            therein or to discontinue any aspect of the same without notice to you.
                        </li>
                        <li>
                            COOK’DIN relies on third party providers (such as network providers, data centres and telecommunication providers)
                            to make the Website/App and the content therein and the Services available to you. Whilst COOK’DIN takes all 
                            reasonable steps available to it to provide you with a good level of service, you acknowledge and agree that
                            COOK’DIN does not warrant that the Services shall be uninterrupted or fault-free at all times. COOK’DIN 
                            therefore shall not be liable in any way for any losses you suffer as a result of delays or failures 
                            of the Services or Website and App as a result of COOK’DIN’s Service providers.
                        </li>
                        <li>
                            COOK’DIN uses third party payment handlers to process your payment. The third party payment gateway provides
                            services for the issuing, use, and management of e-money. These services are offered on the App as a means 
                            of payment for COOK’DIN. By signing up to www.cookedin.com (both as a Food lover and Home Cook), you agree 
                            to be bound by the Terms and Conditions of the third party payment Gateway service provider.
                        </li>
                        <li>
                            Patrons are subjected to refer and peruse thoroughly the Privacy Policy (hyper-link), Delivery Policy 
                            (hyper-link) and all other policies related to COOK’DIN. We hold no responsibility if the user has not 
                            abided to the same. Accessing, Browsing or otherwise using this website or mobile-app indicates your 
                            agreement to all the documents related to this website or mobile-app. 
                        </li>
                        <li>
                            COOK’DIN may be contacted at by email at info@cookedin.com
                        </li>
                    </ul>
                </p>
                <p>
                     <h3>B. MEMBERSHIP ELIGIBILITY AND CRITERIA</h3>
                     <ul>
                        <li>
                            Use of this Website is only available to those users, above the age of 16, barring those “Incompetent 
                            to Contract” which inter alia include insolvents, as described in the Indian Contract Act, 1872.
                        </li>
                        <li>
                            If you are a minor and wish to use the Website, You may do so through your legal guardian and the Website 
                            reserves the right to terminate your account on knowledge of you being a minor and having registered on the 
                            Platform or availing any of its services.
                        </li>
                     </ul>
                </p>
                <p>
                    <h3>C. REGISTRATION PROCEDURE</h3>
                    <ul>
                        <li>
                            In order to use the COOK’DIN services, you will need to complete the online registration form and set up 
                            an account (“Account”) in www.cookedin.com
                        </li>
                        <li>
                            By registering your details and setting up an Account you consent to COOK’DIN’s verification and security 
                            procedures in respect of the information provided by you online.
                        </li>
                        <li>
                            You hereby warrant that the information provided by you to COOK’DIN is true, accurate and correct. 
                        </li>
                        <li>
                            You further warrant that you shall promptly notify COOK’DIN in the event of any changes to such information.
                        </li>
                        <li>
                            Upon the completion and submission of the online registration Form on the Platform, You shall be sent a 
                            verification email (“Verification Email”) to the email address you provided on the registration Form. This 
                            Verification Email will contain details of how to activate your Account, by signing up, you agree to the Terms
                            of Use and Privacy Policy. After the activation you will receive a computer generated text message regarding 
                            successfully registering as a user on your registered mobile number. The mobile number shall be the one 
                            registered under the respected user’s name.
                        </li>
                        <li>
                            Upon registration, COOK’DIN will give you the opportunity to invite friends to join the Website 
                            / App by emailing an invite (whereby you will be required to enter their email addresses), or by contacting 
                            friends through their Facebook profiles or Google Connect
                        </li>
                        <li>
                            You shall keep your registration details for the Platform (“Login Details”) confidential and secure. 
                            Without prejudice to any other rights and remedies available to COOK’DIN, COOK’DIN reserves the right 
                            to promptly disable your Login Details and suspend your access to the Website/App/any Services in the 
                            event that COOK’DIN has any reason to believe you have breached any of the provisions set out herein.
                        </li>
                        <li>
                            Notwithstanding the foregoing, COOK’DIN reserves the right to:
                            <ul>
								<li>Accept or reject your application to register for any reason; and</li>
								<li>Suspend your Account and/or refuse you access to the Services or Website and/or App (partly or wholly) if you breach any of the provisions hereunder.</li>
							</ul>
                        </li>
                        <li>
                            You are required to provide us with your e-mail, login/ password while placing your order through this Website. By using this Platform, it is deemed that you have consented to receiving calls, autodialed and/or pre-recorded message calls, from us at any time with the use of the telephone that has been provided by you for the use of this website which are subject to the Privacy Policy. This includes contacting you through information received through other parties. The use of this website is also your consent to receive SMS’s from us at any time we deem fit. This consent to be contacted is for purposes that include and are not limited to clarification calls and marketing and promotional calls. In case you wish to stop contact from us for the same, you may send us a mail to the effect atinfo@cookedin.com
                        </li>
                    </ul>
                </p>
                <p>
                    <h3>D. MODE OF PAYMENT</h3>
                    <li>
                       The mode of payment shall be through credit/debit cards, payment gateways and Cash on Delivery.
                    </li>
                    <li>When the patron releases payment against the order placed on COOK’DIN, the same will be stored in a payment gateway maintained by COOK’DIN.</li>
                    <li>The payment gateway shall issue an ALPHA-NUMERIC Code (It is a combination of Alphabets and Numeric’s.) to the Home Cooks that would be redeemable only after the 2 hours of delivery or after receiving comments from the patrons whichever is later.</li>
                    <li>NOTE: The payments transferred to the Home Cook’s account are subjected to commissions or as per the feedback received from the Patron’s. Pursue the below mentioned table for payment commissions:</li>
                <table>
                <tbody>
                <tr>
                <td width="62">Sr. No.</td>
                <td width="259">Comments</td>
                <td width="241">Percentage (%) of Commission</td>
                </tr>
                <tr>
                <td width="62">1.</td>
                <td width="259">Lip-Smacking (*****)</td>
                <td width="241">15%</td>
                </tr>
                <tr>
                <td width="62">2.</td>
                <td width="259">Scrumptious (****)</td>
                <td width="241">17%</td>
                </tr>
                <tr>
                <td width="62">3.</td>
                <td width="259">Delicious (***)</td>
                <td width="241">20%</td>
                </tr>
                <tr>
                <td width="62">4.</td>
                <td width="259"></td>
                <td width="241">&nbsp;</td>
                </tr>
                </tbody>
                </table>
	            <li>The above mentioned modes of payment are subjected to change as per the discretion of COOK’DIN. The parties are bound by the conditions of COOK’DIN without any discrepancies.</li>
                </p>
                <p>
                    <h3>E.	THE PLATFORM (WEBSITE/APP) AS AN INTERMEDIARY</h3>
                    <li>A contract exists between You / Buyer (Party-1) and Home Cooks / Home Chefs / Cafe Owners (Party-2) and in-case of breach of any terms of contract between the said Parties, any claim arising from the said breach shall be the subject matter of the said Parties only and we (“COOK’DIN”) shall in no way be responsible for such breach and should not be involved in any suit arising from the same breach.</li>
                </p>
                <p>
                    <h3>F.  USER OBLIGATIONS</h3>
                    <li>You agree that you are solely responsible and liable for all activities carried out by your use of the Platform.</li>
                    <li>You shall not submit to appear on the Platform through your use of the Services, any information, reviews, comments, images, third party URL links or other material whatsoever in any format (<strong>User Submissions”</strong>), whether within your personal Profile, when rating or submitting a review in relation to another Food lover or Home Cook or elsewhere on the platform that, in COOK’DIN’s reasonable opinion, may be deemed to be offensive, illegal, inappropriate or that in any way:
                        <ul>
							<li>Promote racism, bigotry, hatred or physical harm of any kind against any group or individual;</li>
                            <li>
                                Harass or advocate harassment of another person;
                            </li>
                            <li>
                                 Display pornographic or sexually explicit material;
                            </li>
                            <li>
                                Promote any conduct that is abusive, threatening, obscene, derogatory, defamatory or libellous;
                            </li>
                            <li>
                                 Promote any illegal activities;
                            </li>
                            <li>
                                Provide instructional information about illegal activities, including violating someone else’s privacy or providing or creating computer viruses;
                            </li>
                            <li>
                                Promote or contain information that you know or believe to be inaccurate, false or misleading;
                            </li>
                            <li>
                                Engage in or promote commercial activities and/or sales, including but not limited to contests, sweepstakes, barter, advertising and pyramid schemes, without the prior written consent of COOK’DIN; or
                            </li>
                            <li>
                                Infringe any rights of any third party;
                            </li>
                            <li>
                                Be derogatory and shall not hurt any religious sentiments or feelings of any individual or any group.
                            </li>
						</ul>
                    </li>
                    <li>You acknowledge that making a User Submission does not guarantee that such User Submission, or any part thereof, shall appear on the App whether or not the submission of such User Submission is part of the Services. You agree that COOK’DIN might, at its sole discretion, choose to display or to remove any User Submission or any part of the same that you make on the Platform, and you hereby grant to COOK’DIN a non-exclusive, perpetual, irrevocable licence to do so.</li>
	                <li>You warrant and represent that you own or are licensed to use any and all patents, trade-marks (whether registered or non-registered), designs, rights in database, rights in software (including without limitation the source and object code), copyright and all proprietary rights (<strong>“Intellectual Property Rights”</strong>) in all User Submissions that you make to the Platform as part of your use of the Services.</li>
	                <li>You hereby grant to COOK’DIN a non-exclusive, irrevocable licence to make the User Submissions available to other Users of the Platform.</li>
	                <li>If you feel that any User Submission made by another User is objectionable, please contact COOK’DIN using the contact details set out on the Website/App. COOK’DIN shall use its reasonable endeavours to review the relevant User Submission as soon as is practicable and shall take such action as it deems necessary, if any at all.</li>
	                <li>You further agree that at all times, you shall:
                        <ul>
							<li>
                                Not use your Login Details with the intent of impersonating another person;
                            </li>
                            <li>
                                 Not allow any other person to use your Login Details;
                            </li>
                            <li>
                                Not use the information presented on the Platform or provided to you by COOK’DIN for any commercial purposes;
                            </li>
                            <li>    
                                Not do anything likely to impair, interfere with or damage or cause harm or distress to any persons using the Website/App or in respect of the network;
                            </li>
                            <li>
                                Not infringe any rights of any third parties;
                            </li>
                            <li>
                                Contact COOK’DIN at info@cookedin.com immediately if you consider any User Submission posted by another User to breach any of the Terms herein;
                            </li>
                            <li>
                                Comply with all instructions and policies from COOK’DIN from time to time in respect of the use of the Platform, the Services, the Website and the App; 
                            </li>
                            <li>
                                Co-operate with any reasonable security or other checks or requests for information made by COOK’DIN from time to time; and
                            </li>
                            <li>
                                Use the information made available to you on the Website/App and through the Services at your own risk.
                            </li>
						</ul>
                    </li>
                    <li>In any of the event that you have a dispute with any other User on the Platform, you hereby release COOK’DIN from any claims, demands and damages (whether actual or consequential) of any kind and nature, known and unknown, arising out of or in connection with such dispute.</li>
                </p>
                <p>
                    <h3>G. INTELLECTUAL PROPERTY RIGHTS</h3>
                    <li>COOK’DIN and its licensors own all the intellectual property rights relating to the Website, App, Services and Platform.</li>
                    <li>You are expressly prohibited from:
                        <ul>
                            <li>Reproducing, copying, editing, transmitting, uploading or incorporating into any other materials, any of the App; and</li>
                            <li>Removing, modifying, altering or using any registered or unregistered marks/logos/designs owned by COOK’DIN or its licensors, and doing anything which may be seen to take unfair advantage of the reputation and goodwill of COOK’DIN or could be considered an infringement of any of the rights in the Intellectual Property Rights owned by and/or licensed to COOK’DIN.</li>
                         </ul>
                    </li>
                    <li>Provided that COOK’DIN is unaware of any infringement of any third party intellectual property rights at the time you submit any User Submissions, COOK’DIN shall not be liable in any way to you or any third party for any breach of such rights subsequently notified to you or COOK’DIN.</li>
                </p>
                <p>
                    <h3>H. FORCE MAJEURE</h3>
                    <li>COOK’DIN shall not be liable or responsible for any failure to perform, or delay in performance of, any of its obligations under these Terms that is caused by events outside its reasonable control (“<strong>Force Majeure Event”</strong>).</li>
                    <li>A Force Majeure Event includes any act, event, non-happening, omission or accident beyond COOK’DIN’s reasonable control and includes in particular (without limitation) the following:
                        <ul>
                            <li>Strikes, lock-outs or other industrial action;</li>
                            <li>Civil commotion, riot, invasion, terrorist attack or threat of terrorist attack, war (whether declared or not) or threat or preparation for war;</li>
                            <li>Fire, explosion, storm, flood, earthquake, subsidence, epidemic or other natural disaster;</li>
                            <li>Impossibility of the use of railways, shipping, aircraft, motor transport or other means of public or private transport;</li>
                            <li>Impossibility of the use of public or private telecommunications networks; and</li>
                            <li>The acts, decrees, legislation, regulations or restrictions of any government.</li>
                        </ul>
                    </li>
                    <li>COOK’DIN’s performance under these Terms is deemed to be suspended for the period that the Force Majeure Event continues, and COOK’DIN shall have an extension of time for performance for the duration of that period. COOK’DIN will use its reasonable endeavours to bring the Force Majeure Event to a close or to find a solution by which its obligations under these Terms shall be performed despite the Force Majeure Event.</li>
                </p>
                <p>
                    <h3>I. COMPLAINTS, TERMINATION & DELETION OF ACCOUNT</h3>
                    <li>If you wish to lodge a complaint about another User for breaching any of these Terms, you may do so by clicking on “Report Abuse” on the Website / App or send abuse@cookedin.com details of your complaint by using the “Contact Us” form available on the Platform. COOK’DIN will use its reasonable endeavours to respond to your complaints within a reasonable time and to take reasonable action which it deems appropriate to resolve or rectify the subject matter of such complaints.</li>
	                <li>
                        COOK’DIN may holds every right to suspend or terminate your use of the Services and/or Website and/ or App if COOK’DIN believes that:
                        <ul>
                            <li>
                                Any of COOK’DIN’s third party communication network providers cease to make their services available to COOK’DIN for any reason; 
                            </li>
                            <li>
                                Your login details have failed to comply with any of these Terms; 
                            </li>
                            <li>
                                There has been fraudulent use, misuse or abuse of the Services;
                            </li>
                            <li>
                                You have provided any false, inaccurate or misleading information.
                            </li>
                        </ul>
                    </li>
                    <li>
                        In confirmation to the above mentioned clauses, COOK’DIN solely reserves the right toOn terminateion, your access to the Website and the APP, which may and App shall cease andfurther subject to legal action by COOK’DIN.
                    </li>
                    <li>Deletion of Account by USER: The User Account shall delete his/ her account at any point of time. Any such process initiated by the USER on the Website/ APP will result in restricting the USER to access the account.</li>
                </p>
                <p>
                    <h3>J.  DISPUTE RESOLUTION / JURISDICTION</h3>
                    <li>The formation, interpretation and performance of this Agreement and any disputes arising out of it shall be governed by the law, rules and regulations of India. The exclusive jurisdiction and venue for actions and disputes mentioned above shall be the courts located in Ahmedabad (Gujarat, India) and you hereby submit to the personal jurisdiction of such courts.</li>
                    <li>These Terms are governed by and construed in accordance with Indian law. The Courts of India shall have exclusive jurisdiction over any disputes arising out of these Terms. If you live outside India, Indian law shall apply only to the extent that it does not deprive you of any legal protection accorded under the law of the place where you are habitually resident. If Indian law deprives you of any legal protection which is accorded to you under your local law, these terms will be governed by your local law and any dispute or claim arising out of or in connection with these Terms shall be subject to the non-exclusive jurisdiction of the courts where you are habitually resident.</li>
                </p>
                 <p>
                    <h3>K.	EXCLUSION OF WARRANTIES AND LIMITATION OF LIABILITY</h3>
                    <li>You acknowledge and agree that where the Website or the App includes views, opinions, advice or recommendations, such views, opinions, advice and recommendations are not endorsed by COOK’DIN and to the maximum extent permitted by law, COOK’DIN excludes all liability for the accuracy, defamatory nature, completeness, timeliness, suitability or otherwise of such views, opinions, advice or recommendations.</li>
                  	<li>COOK’DIN does not verify and does not have any control in respect of any User Submission, or other information made available to you through your use of the Platform, the Services, the Website and/or the App. Consequently, COOK’DIN does not warrant or guarantee the accuracy, correctness, reliability, suitability or at all in respect of any User Submission or any other information made available to you through your use of the Meals, the Services, the Website and/or the App. COOK’DIN advises you not to rely on it to assist in making or refraining from making a decision, or to assist in deciding on a course or specific cause of action. If you so intend to use and/or rely upon any User Submission or any other information made available to you through your use of the Platform, the Services, the Website and/or the App, you do so at your own risk and liability.</li>
                    <li>Commentary and other materials posted on the Website or the App or provided by COOK’DIN are not intended to amount to advice on which reliance should be placed. COOK’DIN therefore disclaims all liability and responsibility arising from any reliance placed on such materials by any User of the Platform, or by anyone who may be informed of any of its contents. Further, responsibility for decisions taken on the basis of information, suggestions and advice given to you by COOK’DIN shall remain solely with you.</li>
                    <li>COOK’DIN does not in any way participate nor shall it be liable in any way for whatever reason for any communication, transaction, meet-up, set-up or relationship between you and other Users. COOK’DIN therefore recommends that you take all safety precautions when contacting, socialising and engaging in social gatherings or meetings, including without limitation with regard to the delivery of Meals, with other Users.</li>
                 </p>
                 <p>
                    <h3>L.	GENERAL</h3>
                    	<li>If COOK’DIN fails at any time to insist upon strict performance of its obligations under these Terms, or if it fails to exercise any of the rights or remedies to which it is entitled under these Terms, this will not constitute a waiver of any such rights or remedies and shall not relieve you from compliance with such obligations.</li>
                        <li>A waiver by COOK’DIN of any default shall not constitute a waiver of any subsequent default.</li>
	                    <li>No waiver by COOK’DIN of any of these Terms shall be effective unless it is expressly stated to be a waiver and is communicated to you in writing. (For the avoidance of doubt, references to ‘writing’ shall be deemed to include email.)</li>
    	                <li>COOK’DIN reserves the right to use third party suppliers or sub-contractors at any time and in any way in respect of the performance of its obligations under these Terms.</li>
        	            <li>If any of these Terms is determined by any competent authority to be invalid, unlawful or unenforceable to any extent, such term, condition or provision will to that extent be severed from the remaining terms, conditions and provisions which shall continue to be valid to the fullest extent permitted by law.</li>
            	        <li>These Terms and any document expressly referred to in them represent the entire agreement between you and COOK’DIN in respect of your use of the Website and/or App and your purchase and use of the Platform and the Services, and shall supersede any prior agreement, understanding or arrangement between you and COOK’DIN, whether oral or in writing.</li>
                        <li>You acknowledge that in entering into these Terms, you have not relied on any representation, undertaking or promise given by or implied from anything said or written whether on the Website and/or on the App, the internet or in negotiation between you and COOK’DIN except as expressly set out in these Terms.</li>
                        <li>COOK’DIN shall alter or amend any Terms of use without giving you any reasonable notice. It is the duty of the User to constantly check and stay updated with the latest Terms, Use By continuing to use the Website and/or the App after expiry of the notice period, or accepting the amended Terms (as we may decide at our sole discretion), you will be deemed to have accepted any amendment to these Terms. If, on receipt of such notice, you wish to terminate your access to the Website and/or the App, you shall do so by giving us not less than 7 (seven) day’s written notice, (which may be by e-mail), such termination to take effect on the date upon which the amended Terms would otherwise have come into effect.</li>

                 </p>
                 <p>
                    <h3>3.	TERMS AND CONDITIONS APPLICABLE TO FOODAHOLIC(S) or F.L’s</h3>
                    <h3>A.  INTRODUCTION AND SERVICES AVAILABLE</h3>
                    <li>Upon registration as a F.L, and in consideration of your compliance with these terms and conditions, COOK’DIN will provide you with the F.L Services as described on the Platform. You are a Foodaholic or F.L if you submit Orders through the Platform.</li>
                	<li>The F.L Services will comprise of the following:
                    <ul>
                        <li>The facility to create a Profile page;</li>
                        <li>The ability to search for Home Cooks and their Dishes  who have registered with the Website and/or the App and have Meals available for Order;</li>
                        <li>The ability to communicate with other F.L’s and Home Cook’s using the Platform;</li>
                        <li>The facility to review and rate the Home Cook or their dishes;</li>
                        <li>Access to any other features and functionality for the F.L Services provided by COOK’DIN to F.L’s from time to time.</li>
                    </ul>
                    </li>
                    <li>You acknowledge and agree that all Orders are subject to acceptance by the Cooks. The contract for fulfilment of an Order is created between you and the Home Cook, which will only be formed once you have received such acceptance. COOK’DIN is not responsible for either party’s performance under such a contract and COOK’DIN makes no guarantee that the obligations of either party under the contract will be fulfilled.</li>
                    <li>All Meals sold on the Platform, are perishable, therefore cancellations or refunds shall not be permitted by Home Cooks.</li>
                    <li>In Case of online payment done by the Foodaholic or F.L and the order is not fulfilled by the Home Cooks for some reasons, the Foodaholic or F.L can contact COOK’DIN for claiming the refund. In such cases, COOK’DIN will investigate the issue with the Home Cooks and if found reasonable will initiate the refund to the F.L at its own discretion.</li>
                 </p>
                 <p>
                    <h3>B.  OBLIGATIONS AS A FOODAHOLIC(s) or F.L(s)</h3>
                    <li>You must at all times use the COOK’DIN Services, the Website and/ or the App in accordance with these Terms. In particular, all content and material uploaded to or forming part of your Profile must comply with the rules relating to User Submissions set out in Section-2 (part-F) of these Terms.</li>
	                <li>As a Foodaholic or F.L, you are responsible for:
                        <ul>
                            <li>Understanding the ingredients before ordering the food through COOK’DIN from the Home Chefs, COOK’DIN shall not be responsible to the Patrons for any adverse allergy arising to the Patrons on consumption of Food;</li>
                            <li>Verifying the Price of any Meal, which you acknowledge shall fluctuate from time to time and will be determined at the Home Cook’s sole discretion;</li>
                            <li>Any review or rating of Home Cooks to be fair, honest and reasonable;</li>
                            <li> Verification of all information provided by the Home Cook in relation to any Meals provided, including the ingredients.</li>
                        </ul>
                    </li>
                    <li>
                        In using the Services, you must:
                        <ul>
                            <li>Not provide information (including in your Profile) which you know to be inaccurate, false, incomplete, untrue or is or may be deemed to be a misrepresentation of the facts;</li>
                            <li>Immediately notify COOK’DIN in the event you have any reason to believe or suspect that a Home Cook or another Foodaholic or F.L has breached any of the terms under Section-2 or that any Home Cook Profile is not genuine, or are false, inaccurate and/or incomplete.</li>
                        </ul>
                    </li>
                 </p>
                 <p>
                    <h3>C.  ADDITIONAL EXCLUSION OF WARRANTIES</h3>
                    <li>You acknowledge and agree that the Services provided by COOK’DIN are limited to providing you with a forum to attempt to source and connect with Home Cooks. When you use the Services, COOK’DIN does not warrant or guarantee:
                        <ul>
                            <li>That you will find Meals suitable to your specific taste, dietary or other requirements;</li>
                            <li>The status of any Home Cook as a business or that they are compliant with any standards set by the Food Safety &amp; Standards Authority of India (FSSAI);</li>
	                        <li>The premises used by a Home Cook to prepare Meals are suitable for the cooking and preparing of Meals or, where applicable, registered with FSSAI;</li>
    	                    <li>That the Home Cooks’ Profiles are genuine;</li>
        	                <li>That any information or documentation made available on a Home Cook’s Profile (including but not limited to any recipes for the Meals) is authentic, valid, accurate or otherwise complete;</li>
                	        <li>The identity of the Home Cook using the Platform.</li>
                        </ul>
                    </li>
                    <li>As a F.L, you warrant that you will only purchase Meals for your own personal consumption and will not purchase Meals or use the Services for any commercial purposes, including without limitation to sell Meals to consumers.</li>
	                <li>COOK’DIN is not responsible in any way for the quality or delivery of any Meals by the Home Cooks. Such Meals are to be provided by the Home Cooks on terms and conditions that has been agreed between you and the Home Cook.</li>
	                <li>In the event there is a dispute between you and any Home Cook, or if the Meals provided by a Home Cook are not provided to a satisfactory standard or at all, you agree COOK’DIN is not liable for anything (including but not limited to any loss, damage or personal injury) suffered or incurred by you in the course of receiving such Meals from a Home Cook, and you release and hold harmless COOK’DIN from anything that you suffer or any liability in relation to such dispute.</li>
                 </p>
                 <p>
                    <h3>4.  TERMS AND CONDITIONS APPLICABLE TO HOME-COOK(s) or HOME-CHEF(s) or CAFE-OWNER(s)</h3>
                    <h3>A.  INTRODUCTION AND REGISTRATION</h3>
                    <li>Upon registration as Home Cook(s), in consideration of your compliance with these terms and conditions, COOK’DIN will provide you with the provision to create your own online Cafe as described on the Platform.</li>
                    <li>In addition to the registration requirements in Section-2, you acknowledge and agree that registration as a Cook shall include additional verification requirements.</li>
                 </p>
                 <p>
                    <h3>B.  HOME CAFE SERVICES AND PROFILES</h3>
                    <li>Subject to clause earlier mentioned in Section-2 above, COOK’DIN reserves the right to make changes to the Website and/or App including the functionalities and content therein or to discontinue any aspect of the same without notice to you, Home Cafe services will comprise of:
                        <ul>
                            <li>The facility to create a Home Cafe Profile page (which includes photograph(s)), which can be accessed by the F.L’s;</li>
                            <li>The facility to customise your Cafe Profile by adding information about your experiences, preferences;</li>
	                        <li>The ability to advertise Meals available for Order (including information relating to any speciality bespoke Meals available);</li>
    	                    <li>The ability to set a purchase price<strong>(“Price”)</strong><strong> </strong>payable by the F.L in respect of any Meal;</li>
                            <li>The ability to specify whether you are able to deliver Orders to F.L’s or whether Orders are collection only;</li>
                            <li>Subject to fulfilling certain criteria, as indicated on the App from time to time, to attain the level of “Star Home Cook”;</li>
                            <li>The ability to post reviews and ratings about F.L and other Home-Cooks;</li>
                            <li>Any other features and functionalities of the Cook Services provided by COOK’DIN to you from time to time.</li>
                        </ul>
                    </li>
                    <li>You warrant that you are the provider of the Meals you have posted on your Cafe Profile.</li>
                    <li>You must ensure that your Profile contains the minimum information set out below:
                        <ul>
                            <li>Information as to your identity;</li>
                            <li>A description of the Meals available, including the ingredients used and the extent of any delivery services available;</li>
                        </ul>
                    </li>
                 </p>
                 <p>
                    <h3>C.  OBLIGATIONS AS HOME-COOK(s)</h3>
                    	<li>By choosing to be a Home Cook and to advertise and deliver your Meals to F.L’s through the Website and/or through the App, further to the general obligations on you as a User under Section-2 of these Terms, you agree that all information submitted by you in a Home Cafe Profile, preparation and supply and/or delivery of the Meals, and any other information provided (including the recipes and ingredients relating to the Meals) or comments made to F.L’s or other Home Cooks through the Website and/or through the App, must:
                            <ul>
                                <li>Be accurate, correct and explicitly mention each and every ingredient /information with respect to the Food;</li>
	                            <li>Be provided with all reasonable care and skill in a manner consistent with generally accepted standards in the industry in which you operate;</li>
                                <li>Not breach any applicable statutory or regulatory requirement, including following good hygiene practice in the preparation of any Meals and, where applicable, food safety management procedures based on the standards set by the Food Standards Agency from time to time;</li>
                                <li>Not be misleading, deceptive or in any way contravene any and all applicable consumer, health and safety and e-commerce laws and regulations;</li>
	                            <li>Not be obscene, defamatory or be in the reasonable view of COOK’DIN deemed to be offensive and/or inappropriate;</li>
	                            <li>Ensure that every Home Chef has to adhere and to comply with packaging standards as specified by the COOK’DIN, under no circumstances any other kind of packaging material shall be used except provided. On non-adherence, COOK’DIN reserves every right to deactivate the Home Chefs Account and/ or shall take necessary actions which might include monetary compensation.</li>
                            <ul>
                        </li>
                        <li>In using the Online Home Cafe feature you must:
                            <ul>
                                <li>At all times keep all information including without limitation, communication and correspondences between you and the COOK’DIN, and all information relating to the Order process secure and confidential;</li>
                                <li>Ensure your use of the Home Cafe Services is personal to you;</li>
                                <li>Immediately notify COOK’DIN in the event you have any reason to believe or suspect that a Home Cook or F.L has breached any of its Terms.</li>
                            </ul>
                        </li>
                        <li>You further acknowledge and agree that COOK’DIN has every right and has a sole discretion to immediately remove your Profile from the Website and/or from the App where it reasonably considers that such Profile, any information you have uploaded or Meals provided, no longer meets the standards that COOK’DIN requires of its Home Cooks on the Website and/or on the App, at its absolute discretion and upon written notice to you.</li>
                 </p>
                 <p>
                    <h3>D.  INDEMNIFICATION AND LIMITATION OF LIABILITY</h3>
                    <li>Patron agree to indemnify, defend and hold harmless COOK’DIN website including but not limited to its affiliate vendors, agents and employees from and against any and all losses, liabilities, claims, damages, demands, costs and expenses (including legal fees and disbursements in connection therewith and interest chargeable thereon) asserted against or incurred by us that arise out of, result from, or may be payable by virtue of, any breach or non-performance of any representation, warranty, covenant or agreement made or obligation to be performed by you / us pursuant to these terms of use. Further, you agree to hold us harmless against any claims made by any third party due to, or arising out of, or in connection with, your use of the website, any claim that your material caused damage to a third party, your violation of the terms of use, or your violation of any rights of another, including any intellectual property rights. In no event shall we, our officers, directors, employees, partners or suppliers be liable to you, the COOK’DIN or any third party for any special, incidental, indirect, consequential or punitive damages whatsoever, including those resulting from breach of contract or warranty, negligence or other tortuous action, or any other claim arising out of or in connection with your use of or access to the website, services or materials. The limitations and exclusions in this section apply to the maximum extent permitted by applicable law.</li>
                 </p>
                 <p>
                    <h3>E.  ADDITIONAL EXCLUSION OF WARRANTIES</h3>
                    <li>You acknowledge and agree that COOK’DIN only provides you with the facility to post and supply Meals to F.L’s by providing you with the Online Home Café Services. COOK’DIN does not warrant, represent or guarantee that you will find any Foodies to deliver Meals to or achieve any specific results whatsoever.</li>
                    <li>You acknowledge and agree that using the Platform through the Website and/or through an App may require registration as a business and a food hygiene &amp; safety certificate. Your use and reliance on any information on the Website and/or on the App shall be at your own risk and we shall not be liable whatsoever for any damages and loss which you incur as a result of or in connection with your use and reliance of such information. You undertake to conduct your own research and ensure that you comply with the requirements applicable to you. COOK’DIN shall not be liable to you for any failure by you to comply with any relevant laws and regulations that apply to you in the use of the Platform through the Website and/or through the App.</li>
        	        <li>You further agree that COOK’DIN does not vet or verify the identity of the Foodies posted on the Website and/or App. Consequently, COOK’DIN does not warrant or guarantee:
                        <ul>
                            <li>The completeness, correctness and accuracy of any Foodies’ Profile;</li>
                            <li>That any Orders made by F.L’s are genuine;</li>
                            <li>The identity of the F.L’s using the Website and/or App.</li>
                        </ul>
                    </li>
                    <li>You further acknowledge that COOK’DIN has no control of and therefore has no liability whatsoever in respect of the behaviour, response and quality of the F.L’s on the Platform.</li>
                    <li>COOK’DIN provides the Online Home Cafe Services solely to connect you, the Home-Cooks, with F.L’s those who may be seeksing to Order Meals from you. You acknowledge and agree that you are solely responsible for all communication with, and any subsequent dealings with, F.L’s (including but not limited to the terms upon which you create and deliver Meals to F.L’s). You, the Home-Cooks, hereby indemnify COOK’DIN in full and on demand against all losses, damages, costs, claims and expenses that COOK’DIN incurs (including but not limited to such losses and damages incurred by COOK’DIN in respect of sickness, disease or death of any F.L arising out of or in connection with your acts or omissions in the use of the Platform) arising out of or in connection with any of your dealings with, or Meals provided to, F.L’s. </li>
                 </p>
            </div>
                    
	<%--	</div>--%>

        </asp:Panel>
         </div> 
         <div class="f-row ListControl">
          
            <asp:CheckBox ID="Chkagree" runat="server" Text="I agree Terms and Condition" 
                                    AutoPostBack="True" oncheckedchanged="Chkagree_CheckedChanged"></asp:CheckBox>
         </div>
         
                    <div class="f-row center">
                     <asp:Button ID="btniagreepre" runat="server" Text="Previous"   
            CssClass="btn-width-page btn-padding left" onclick="btniagreepre_Click"></asp:Button>
                       
                        <asp:Button ID="btniagreenext" runat="server"   Text="Next" 
            CssClass="btn-width-page left" Enabled="False" onclick="btniagreenext_Click" /></div>
     </div>
  <%-- </ContentTemplate>
                            </asp:UpdatePanel>--%>
            
        </section>
        </asp:View>

        <asp:View ID="View3" runat="server">
            <section style="visibility: visible;" class="content center full-width">
					<div class="modal container">

                     <h3 class="center">Cooking and Kitchen Details</h3>
                     <%-- <div class="f-row"><h3>&nbsp;2.1 Preferred culinary style</h3> </div>--%>
                      <div class="f-row"><h3>&nbsp;&nbsp;Please tell us type of cuisine you cook</h3></div>
						<div class="f-row">
                            <asp:TextBox ID="txtnational" runat="server" style = "width:300px" ClientIDMode="Static" placeholder="Type of cuisine you cook"></asp:TextBox>
                            <asp:HiddenField ID="hfnational" runat="server" />
                            <span style="font-size:smaller; color:Gray">(Ex. Gujarati, Panjabi,..)</span>
					  </div>

                       <%--  <div class="f-row"><h3>&nbsp;&nbsp; International Cuisine Only</h3></div>
						<div class="f-row">
                           <asp:TextBox ID="txtinternational" runat="server" style = "width:300px" placeholder="International Cuisine Only"></asp:TextBox>
                           <asp:HiddenField ID="hfinternational" runat="server" />
                            <span style="font-size:smaller; color:Gray">(Ex. Chinese, German,..)</span>
					  </div>--%>

                     <div class="f-row"> <h3>&nbsp;What would you cook for</h3></div>
						<div class="f-row">
                          <asp:TextBox ID="txtdishtype" runat="server" style = "width:300px" placeholder="What would you cook for"></asp:TextBox>
                          <asp:HiddenField ID="hfdishtype" runat="server" />
                            <span style="font-size:smaller; color:Gray">(Ex. Breakfast, Lunch, Dinner, Snacks, Baked,..)</span>
					  </div>
                     
                    <%--<div class="f-row"> <h3>2.3 Time Of Meal Prepration</h3></div>
                     
                     <div class="f-row">
                    <asp:TextBox ID="txttimeofmealprepration" runat="server" style = "width:300px" placeholder="2.3 Time Of Meal Prepration"></asp:TextBox>
                    <asp:HiddenField ID="hftimeofmealpreprational" runat="server" />
                     <span style="font-size:smaller; color:Gray">(Ex. Breakfast (7.00 – 10.00 AM),Lunch (10.00 AM – 2.00 PM),Dinner (6.00 PM – 9.00 PM)...)</span>
                       </div>


                        <div class="f-row"> <h3>Preferred Frequency</h3></div>
                    <div class="f-row">
                        <asp:TextBox ID="txtprefferedfrequency" runat="server" style = "width:300px" placeholder="Preferred Frequency"></asp:TextBox>
                        <asp:HiddenField ID="hffrefferedfrequency" runat="server" />
                         <span style="font-size:smaller; color:Gray">(Ex. Thrice Daily, Twice Daily, Once a day, All day...)</span>
                    </div>--%>
                    

                    <div class="f-row"> <h3>Working days</h3></div>
                     <div class="f-row">
                     <asp:CheckBoxList ID="chkworkingdays" runat="server" RepeatColumns="4" 
                                                    RepeatDirection="Horizontal" CssClass="ListControl">
                                                    <asp:ListItem Value="Monday">Monday</asp:ListItem>
                                                    <asp:ListItem Value="Tuesday">Tuesday</asp:ListItem>
                                                    <asp:ListItem Value="Wednesday">Wednesday</asp:ListItem>
                                                    <asp:ListItem Value="Thursday">Thursday</asp:ListItem>
                                                    <asp:ListItem Value="Friday">Friday</asp:ListItem>
                                                    <asp:ListItem Value="Saturday">Saturday</asp:ListItem>
                                                    <asp:ListItem Value="Sunday">Sunday</asp:ListItem>
                                                </asp:CheckBoxList>
                     </div>

                    <div class="f-row">
                        <asp:Button ID="btntimeofmealprevious" runat="server" Text="Previous"   onclick="btntimeofmealprevious_Click" CssClass="btn-width-page btn-padding left"></asp:Button>
                        <asp:Button ID="btnskipsecondview" runat="server"    Text="Skip" onclick="btnskipsecondview_Click" CssClass="col-lg-3 btn-padding left"/>
                        <asp:Button ID="Button2" runat="server" onclick="Button2_Click"   Text="Next" CssClass="btn-width-page left"/>
                    </div>
					
					</div>
				</section>
        </asp:View>	

        <asp:View ID="View4" runat="server">
          <section style="visibility: visible;" class="content center full-width">
					<div class="modal container">
					
                   <h3>Cooking Oil Used</h3>
						<div class="f-row">
                              <asp:TextBox ID="txtcookingoil" runat="server" style = "width:300px" placeholder="Cooking oil used"></asp:TextBox>
                              <asp:HiddenField ID="hfcookingoil" runat="server" />
                                <span style="font-size:smaller; color:Gray">(Ex. Olive Oil, Sunflower Oil, Peanut Oil,..)</span>
						</div>

                         <h3>Diat Type</h3>
						<div class="f-row">
                                 <asp:TextBox ID="txtdiettype" runat="server" style = "width:300px" placeholder="Meal contains"></asp:TextBox>
                              <asp:HiddenField ID="hfdiettype" runat="server" />
                              <span style="font-size:smaller; color:Gray">(Ex. No Animal Product, Only vegan food,..)</span>

						</div>
					
                    <h3>Meal quantity (Total no of dish's you can cook and serve in a day)</h3>
						<div class="f-row" id="meal-type">
                            <asp:TextBox ID="txtqty" runat="server" Text="10" type="text" placeholder="Meal quantity" Width="100%"></asp:TextBox>
						       <%--<asp:NumericUpDownExtender ID="txtqty_NumericUpDownExtender" runat="server"   Enabled="True" Minimum="1" Maximum="35" Width="100"  RefValues="" ServiceDownMethod="" 
                                ServiceDownPath="" ServiceUpMethod="" Tag="" TargetButtonDownID=""   TargetButtonUpID="" TargetControlID="txtqty">
                               </asp:NumericUpDownExtender>--%>
						</div>

                       <div class="f-row">
                        <asp:Button ID="btnprefrredprevious" runat="server" Text="Previous"   onclick="btnprefrredprevious_Click" CssClass="btn-width-page btn-padding left"></asp:Button>
                        <asp:Button ID="btnskipthirdview" runat="server"    Text="Skip" onclick="btnskipthirdview_Click" CssClass="col-lg-3 btn-padding left"/>
                        <asp:Button ID="Button4" runat="server" onclick="Button4_Click"   Text="Next" CssClass="btn-width-page left"/>
                    </div>
					</div>
				</section>
        </asp:View>
    
         <asp:View ID="View5" runat="server">
           <section style="visibility: visible;" class="content center full-width">
					<div class="modal container">
	<asp:Panel ID="pnlfailer" runat="server" Visible="false">
     <div class="row">
         <div class="full-width wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
             <div role="alert" class="alert alert-danger"><asp:Label ID="Label3" runat="server" Text="UserName Already In Used"></asp:Label></div>
         </div>
    </div>
 </asp:Panel>
               <asp:Panel ID="pnlsuccess" runat="server" Visible="false">
     <div class="row">
         <div class="full-width wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
             <div role="alert" class="alert alert-success"><asp:Label ID="Label4" runat="server" Text="Your Registration is Sucessfully done."></asp:Label></div>
         </div>
    </div>
 </asp:Panel>
                       <h3 class="center">Financial Detail</h3>
                       <div class="f-row">
                            <asp:TextBox ID="txtaccountno" runat="server" placeholder="S/B Account No."></asp:TextBox>
						</div>

						<div class="f-row">
                            <asp:TextBox ID="txtbranchcode" runat="server" placeholder="Branch Code"></asp:TextBox>
						</div>
					    <div class="f-row">
                            <asp:TextBox ID="txtbranchname" runat="server" placeholder="Branch Name"></asp:TextBox>
						</div>
						<div class="f-row">
                            <asp:TextBox ID="txtifsccode" runat="server" placeholder="IFSC Code"></asp:TextBox>
						</div>
                        <div class="f-row">
							<asp:TextBox ID="txtacno" runat="server" placeholder="A/C In the Name Of"></asp:TextBox>
						</div>
                        <div class="f-row">
							<asp:TextBox ID="txtbankname" runat="server" placeholder="Bank Name"></asp:TextBox>
						</div>
                        <div class="f-row">
							<asp:TextBox ID="txtmicrcode" runat="server" placeholder="MICR Code"></asp:TextBox>
						</div>
                        <div class="f-row">
                        <asp:Button ID="btncookingoilprevious" runat="server" Text="Previous"   onclick="btncookingoilprevious_Click" CssClass="btn-width-page btn-padding left"></asp:Button>
                        <asp:Button ID="btnskipandcontinue" runat="server"    Text="Skip and SignUp" onclick="Button3_Click" CssClass="col-lg-3 btn-padding left"/>
                        <asp:Button ID="btnregistration" runat="server" onclick="btnregistration_Click"   Text="SignUp" CssClass="btn-width-page left"/>
                    </div>
                  </div>  
				</section>
         </asp:View>


    </asp:MultiView>
    </div>
     <%--  </ContentTemplate>

       <Triggers> <asp:PostBackTrigger ControlID = "Button1" /></Triggers>
   </asp:UpdatePanel>--%>
</asp:Content>

