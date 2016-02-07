<%@ Page Title="" Language="C#" MasterPageFile="~/Chef/ChefMasterPage.master" AutoEventWireup="true" CodeFile="add_New_Dish.aspx.cs" Inherits="Chef_add_New_recipe" %>

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
     $("#<%=txtingri.ClientID %>").autocomplete({
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
                var value = $("[id*=hfingri]").val().split(/,\s*/);
                value.pop();
                value.push(i.item.val);
                value.push("");
                $("#[id*=hfingri]")[0].value = value.join(", ");
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
                this.value = text.join("");
                var value = $("[id*=hfdiettype]").val().split(/,\s*/);
                value.pop();
                value.push(i.item.val);
                value.push("");
                $("#[id*=hfdiettype]")[0].value = value.join(", ");
                return false;
            },
            minLength: 1
        });
        
      
        $("#<%=txtcuisine.ClientID %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Service.asmx/GetNationalCuisine") %>',
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
                this.value = text.join("");
                var value = $("[id*=hfcuisine]").val().split(/,\s*/);
                value.pop();
                value.push(i.item.val);
                value.push("");
                $("#[id*=hfcuisine]")[0].value = value.join(", ");
                return false;
            },
            minLength: 1
        });


        $("#<%=txtmealinclude.ClientID %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Service.asmx/GetMealInclude") %>',
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
                this.value = text.join("");
                var value = $("[id*=hfmealinclude]").val().split(/,\s*/);
                value.pop();
                value.push(i.item.val);
                value.push("");
                $("#[id*=hfmealinclude]")[0].value = value.join(", ");
                return false;
            },
            minLength: 1
        });

      }
</script>


    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>


    <main role="main" class="main main-padding">
		<!--wrap-->
<%--        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
         --%>
        
		<div class="wrap clearfix top-padding">
			<!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a href="#" title="Home">Dashboard</a></li>
					<li>Add a New Dish</li>
				</ul>
			</nav>
			<div class="row">
                 
                <section class="content full-width" style="visibility: visible;">
					<div class="submit_recipe container">
					
							<section>
								<h2>Dish Manager</h2>
								<div class="f-row">
									<div class="full"><asp:TextBox ID="txtdishname" runat="server" placeholder="Dish title" MaxLength="200"></asp:TextBox></div>
								</div>
								<%--<div class="f-row">
									<div class="third"><input type="text" placeholder="Preparation time"></div>
									<div class="third"><input type="text" placeholder="Cooking time"></div>
									<div class="third"><input type="text" placeholder="Difficulty"></div>
								</div>--%>
								<div class="f-row">
									<div class="third">
                                    <asp:DropDownList ID="ddldishtype" runat="server" Width="100%"></asp:DropDownList>
                                   <%-- <asp:TextBox ID="txtdishtype" runat="server" style = "width:300px" placeholder="DishType"></asp:TextBox>
                                         <asp:HiddenField ID="hfdishtype" runat="server" />--%>
                                    </div> 
									<div class="third">
                                   
                                   <asp:TextBox ID="txtdiettype" runat="server" style = "width:300px" placeholder="DietType"></asp:TextBox>
                                         <asp:HiddenField ID="hfdiettype" runat="server" />
                                   <%-- <div class="selector" style="width: 146px;">
                                   <span style="width: 134px; -webkit-user-select: none;">Select a category</span><select><option selected="selected">Select a category</option></select>
                                    </div>--%></div>

                                 

								</div>

                             <div class="f-row">  
                                <div class="third">
                                    
                                    <asp:TextBox ID="txtcuisine" runat="server" style = "width:300px" placeholder="Dish Cuisine"></asp:TextBox>
                                         <asp:HiddenField ID="hfcuisine" runat="server" />
                                    </div>

                                     <div class="third">
                                    
                                    <asp:TextBox ID="txtmealinclude" runat="server" style = "width:300px" placeholder="Meal Include"></asp:TextBox>
                                         <asp:HiddenField ID="hfmealinclude" runat="server" />
                                    </div>

                                    <div class="third">
                                     <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                      <asp:ListItem >Vegetarian</asp:ListItem>
                                      <asp:ListItem >Non-Vegetarian</asp:ListItem>
                                      </asp:RadioButtonList>
                                    </div>
                             </div>

                             <div class="f-row">  
                             <h2>Level of Spices</h2>
                                  <asp:RadioButtonList ID="rdolevelofspice" runat="server" RepeatDirection="Horizontal"></asp:RadioButtonList>
                             </div>
							</section>
							
							<section>
								<h2>Description</h2>
								<div class="f-row">
									<div class="full">
                                   <%-- <textarea placeholder="Recipe title"></textarea>--%>
                                    <asp:TextBox ID="txtdescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </div>
								</div>
							</section>	
							
							<section>
								<h2>Ingredients</h2>
					        <div class="f-row">  
						
                                      <%-- <asp:DataList ID="DataListIngridian" runat="server" RepeatColumns="4">
                                            <ItemTemplate>
                                          
                                                <asp:CheckBox ID="chking" runat="server" Text='<%# Eval("Ingridiant_Name") %>'   />
                                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("Ingridiant_ID") %>'></asp:Label>
                                          
                                            </ItemTemplate>
                                        </asp:DataList>--%>
                                        <asp:TextBox ID="txtingri" runat="server" style = "width:300px" placeholder="Ingredients"></asp:TextBox>
                                         <asp:HiddenField ID="hfingri" runat="server" />
                                    
				            </div>
								
							</section>	
                            <section>
								
					        <div class="row"> 
                                <%--<div class="one-third">
                                    <h2>Ingredients</h2>
						              <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                      <asp:ListItem >Vegetarian</asp:ListItem>
                                      <asp:ListItem >Non-Vegetarian</asp:ListItem>
                                      </asp:RadioButtonList>
				                </div>--%>
						        <div class="one-third">
								<h2>Select Dish Photo</h2>
                                        <asp:FileUpload ID="file_upload" class="multi" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" SetFocusOnError="True" ControlToValidate="file_upload" Text="Select Dish Image"></asp:RequiredFieldValidator>
								</div>
                            </div>
							</section>
								
							
							<section>

                                <h2>Pricing</h2>
                                <div class="f-row">
									
                                  <div class="third">  <asp:TextBox ID="txtprice" runat="server" placeholder="Dish Price"></asp:TextBox></div>
							    
								
								</div>

                                <h2>Special Offer</h2>

                                 <div class="f-row">
									  <div class="third"><asp:TextBox ID="txtofferprice" runat="server" placeholder="Special Offer Price"></asp:TextBox></div>
                                  <div class="third">  <asp:TextBox ID="txtofferstartdate" runat="server" placeholder="Start Date"></asp:TextBox>
                                      <asp:CalendarExtender ID="txtofferstartdate_CalendarExtender" runat="server" 
                                          Enabled="True" TargetControlID="txtofferstartdate">
                                      </asp:CalendarExtender>
                                     </div>
							      <div class="third"><asp:TextBox ID="txtofferenddate" runat="server" placeholder="End Date"></asp:TextBox>
                                      <asp:CalendarExtender ID="txtofferenddate_CalendarExtender" runat="server" 
                                          Enabled="True" TargetControlID="txtofferenddate">
                                      </asp:CalendarExtender>
                                     </div>
								
								</div>


							</section>
							
							<div class="f-row full">
								<%--<input type="submit" class="button" id="submitRecipe" value="Publish this recipe">--%>
                                <asp:Button ID="btnsubmit" runat="server" Text="Publish this dish" 
                                    onclick="btnsubmit_Click"></asp:Button>
							</div>
						
					</div>
				</section>
                </div>
                </div>
                </main>
</asp:Content>

