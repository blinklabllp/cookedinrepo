<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="usercontrol_dishview.aspx.cs" Inherits="Consumer_usercontrol_dishview" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register TagPrefix="ViewDishDetail" TagName="links" Src="~/usercontrol/ViewDish.ascx" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<ViewDishDetail:links id="links1" runat="server"/>
</asp:Content>

