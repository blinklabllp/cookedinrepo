<%@ Page Title="" Language="C#" MasterPageFile="~/Chef/ChefMasterPage.master" AutoEventWireup="true" CodeFile="ListDish.aspx.cs" Inherits="Chef_ListDish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   
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
					<li>Dish Manager</li>
				</ul>
			</nav>
			<div class="row">
				<section class="content full-width" style="visibility: visible;">


               <%-- <section style="visibility: visible; animation-name: fadeInUp;">--%>
					<!--entries-->
					<div class="entries row">
						<!--item-->
                        <h1>Dish Manager</h1>
   
   
    <asp:Button class="right" ID="Button4" runat="server" Text="Add New Dish" 
        onclick="Button4_Click" />
   <br /><br /><br />
     <asp:Repeater ID="Repeater1" runat="server">
      <HeaderTemplate>
      	<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
                              <th class="center">Image</th>
                             <%-- <th class="center">No</th>--%>
                              <th class="center">Dish Name</th>
                              <th class="center">Admin Approval</th>
                              <th class="center">Enable/Disable</th>
                              <th class="center">Actions</th>
							  </tr>
						  </thead>   
						  <tbody class="background-white">
      </HeaderTemplate>
      <ItemTemplate>
         <tr>
	<td  Width="70"><asp:Image ID="Image1" runat="server" src='<%# "../dishphotoupload/"+Eval("Dish_Image")%>' Height="70px" Width="79px"/></td>
    <%-- <td class="center"><%#Eval("Dish_ID")%></td>--%>
     
     <td class="center"><%#Eval("Dish_Name")%></td>
     <td class="center"><%#Eval("Status")%></td>
     <td class="center"><%#Eval("Enable")%></td>
    
          <td class="center">
          
          <%--<a class="button gold data-with-cross" href='ListDish.aspx?eid=<%# Eval("Dish_ID")%>'>
            Edit</a>--%>
            <a class="button gold data-with-cross" href='ListDish.aspx?did=<%# EncryptString(Eval("Dish_ID").ToString())%>'>
            Enable/Disable</a>
            <a class="button gold data-with-cross" href='ViewDish.aspx?did=<%# EncryptString(Eval("Dish_ID").ToString())%>'>
            View</a>

             <a class="button gold data-with-cross" href='EditDish.aspx?did=<%# EncryptString(Eval("Dish_ID").ToString())%>'>
            Edit Dish</a>
          
		</td>

        
		
	</tr>
      </ItemTemplate>
      <FooterTemplate>
       </tbody>
					  </table>  
      </FooterTemplate>
      </asp:Repeater>

      </div>
      </section>
      </div>
      </div>
      </main>
</asp:Content>

