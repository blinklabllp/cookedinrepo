<%@ Page Title="" Language="C#" MasterPageFile="~/Chef/ChefMasterPage.master" AutoEventWireup="true" CodeFile="KitchenSettings.aspx.cs" Inherits="KitchenSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

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
   }
</script>

    <main class="main main-padding" role="main">
		<!--wrap-->
		<div class="wrap clearfix top-padding">
        <!--breadcrumbs-->
			<nav class="breadcrumbs">
				<ul>
					<li><a title="Home" href="#">Dashboard</a></li>
					<li>Kitchen Settings</li>
				</ul>
			</nav>
			<!--//breadcrumbs-->
            <section class="content">
		  <!--row-->
			<div class="row">
				
				<!--content-->
				<section style="visibility: visible;" class="container full-width">
					<header style="visibility: visible;" class="s-title">
					<h1>Kitchen Setting</h1>
				</header>
					<div class="widget nutrition remove-border kitchen-setting-row">
						            <table>
						                <tbody>
                                      
						                <tr>
							                    <td><span id="ContentPlaceHolder1_Label13">Meal Type</span></td>
							                    <td>
                                                    <asp:DataList ID="DataListdishtype" runat="server" RepeatDirection="Horizontal"> 
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkdishtypecheck" runat="server" Text='<%#Eval("Dish_Type") %>' CssClass="checkbox-align ListControl"></asp:CheckBox>
                                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("Dish_Type_ID") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                               <td><asp:Button ID="btndishtypesave" runat="server" Text="Save" onclick="btndishtypesave_Click"></asp:Button></td>
						                </tr>
                                       <tr>
                                              <td><span id="Span1">I can Cook Dish Per Day</span></td>
                                              <td> <asp:TextBox ID="txtcookcapacity" runat="server"></asp:TextBox></td>
                                          
                                              <td><asp:Button ID="btncapacitysave" runat="server" Text="Save" onclick="btncapacitysave_Click"  ></asp:Button></td>
                                       </tr>
						                <tr>
                                            <td><span id="Span2">Payout Option</span> </td>
                                            <td class=""><span id="Span3"><asp:Label ID="Label1" runat="server" Text="Auto Payment"></asp:Label>
                                                  <asp:CheckBox ID="chkpaymode" runat="server" CssClass="ListControl"></asp:CheckBox> </span>
                                            </td>
                                            <td><asp:Button ID="btnpaymentmode" runat="server" Text="Save"  onclick="btnpaymentmode_Click"  ></asp:Button></td>
                                        </tr>
                                        <tr>
                                            <td><span id="Span4">Cooking Day</span></td>
                                            <td>
                                                <asp:CheckBoxList ID="chkworkingdays" runat="server" 
                                                    RepeatDirection="Horizontal" CssClass="ListControl">
                                                    <asp:ListItem Value="Monday">Monday</asp:ListItem>
                                                    <asp:ListItem Value="Tuesday">Tuesday</asp:ListItem>
                                                    <asp:ListItem Value="Wednesday">Wednesday</asp:ListItem>
                                                    <asp:ListItem Value="Thursday">Thursday</asp:ListItem>
                                                    <asp:ListItem Value="Friday">Friday</asp:ListItem>
                                                    <asp:ListItem Value="Saturday">Saturday</asp:ListItem>
                                                    <asp:ListItem Value="Sunday">Sunday</asp:ListItem>
                                                </asp:CheckBoxList>
                                            </td>
                                               <td><asp:Button ID="btnworkingdays" runat="server" Text="Save" 
                                                       onclick="btnworkingdays_Click"  ></asp:Button></td>
                                        </tr>


					                </tbody>
                                    </table>
					            </div>
                    
                    
                    <div class="container recipefinder">
						<div class="left">
							<h3>National/Regional Cuisine</h3>
							<p>Click the ‘-’ to remove an ingredient, or click the Cuisine itself to emphasize</p>
							<div class="f-row">
								<asp:TextBox ID="txtnational" runat="server" style = "width:300px" ClientIDMode="Static" placeholder="Add Cuisine (one at a time)" ToolTip="Add Cuisine (one at a time)"></asp:TextBox>
                                <asp:HiddenField ID="hfnational" runat="server" />
                                <asp:Button ID="btnaddcuisine" runat="server" Text="+" CssClass="add btn-place"  onclick="btnaddcuisine_Click"></asp:Button>

							</div>
							<div class="f-row">
                                <%--<input value="garlic" type="text">--%>
                                <asp:TextBox ID="txtselectedcuisine" runat="server"></asp:TextBox><asp:Label ID="lblcuisineid" runat="server" Text="Label" Visible="false"></asp:Label>
                                 <asp:Button ID="btndelete" runat="server" Text="-" CssClass="remove btn-place" 
                                    onclick="btndelete_Click" ></asp:Button>
							</div>
							
						</div>
						<div class="right">
							<div class="ingredients">
								<h3>You Have Already Selected</h3>

                                <asp:DataList ID="DataListnationalcuisine" runat="server" RepeatColumns="8" 
                                    onitemcommand="DataListnationalcuisine_ItemCommand">
                                <ItemTemplate>
                                   <asp:Button ID="Button2" runat="server" Text='<%#Eval("Place_Name")%>' CssClass="button gold cross"></asp:Button>
                                   
                                   <asp:Label ID="lblid" runat="server" Text='<%#Eval("Regional_Cuisine_ID")%>' Visible="false"></asp:Label>
                                </ItemTemplate>
                                </asp:DataList>
							</div>
						
							</div>
						</div>
				
				
               
					<div class="container recipefinder">
						<div class="left">
							<h3>Cooking Oil</h3>
							<p>Click the ‘-’ to remove an ingredient, or click the Cuisine itself to emphasize</p>
							<div class="f-row">
								 <asp:TextBox ID="txtcookingoil" runat="server" style = "width:300px" placeholder="Cooking Oil "></asp:TextBox>
                              <asp:HiddenField ID="hfcookingoil" runat="server" />
                         
                                <asp:Button ID="btncookingoiladd" runat="server" Text="+" CssClass="add btn-place"  onclick="btncookingoiladd_Click" ></asp:Button>

							</div>
							<div class="f-row">
								<%--<input value="garlic" type="text">--%>
                                <asp:TextBox ID="txtselectedcookingoil" runat="server"></asp:TextBox><asp:Label ID="lblcookingoilid" runat="server" Text="Label" Visible="false"></asp:Label>
                                 <asp:Button ID="btncookingoildelete" runat="server" Text="-" CssClass="remove btn-place" onclick="btncookingoildelete_Click" ></asp:Button>
							</div>
							
						</div>
						<div class="right">
							<div class="ingredients">
								<h3>You Have Already Selected</h3>

                                <asp:DataList ID="DataListcookingoil" runat="server" RepeatColumns="8" 
                                    onitemcommand="DataListcookingoil_ItemCommand" >
                                <ItemTemplate>
                               
                                   <asp:Button ID="Button2" runat="server" Text='<%#Eval("Ingridiant_Name")%>' CssClass="button gold cross"></asp:Button>
                                   
                                   <asp:Label ID="lblid" runat="server" Text='<%#Eval("Ingridiant_ID")%>' Visible="false"></asp:Label>
                                </ItemTemplate>
                                </asp:DataList>
							</div>
						
							</div>
						</div>
				
				</section>
				<!--//content-->
		</div>
			<!--//row-->
            </section>
	</div>
		<!--//wrap-->
	</main>
</asp:Content>

