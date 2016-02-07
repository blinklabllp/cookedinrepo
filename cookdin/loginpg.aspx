<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="loginpg.aspx.cs" Inherits="loginpg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="third" style="padding-top:20%;">
    <div class="selector" style="width: 145px;">
        <span style="width: 133px; -moz-user-select: none;">
            Select a category
        </span>
        <select>
            <option selected="selected">
                Select a category
            </option>
        </select>
    </div>
</div>
<div class="third" style="padding-top:20%;">
 <div class="f-row selector">
 <span></span>
    <%-- <input type="text" id="name" placeholder="Your Landline No" class="remove-border">--%>
    <asp:DropDownList runat="server" Width="100%" cssClass="remove-border"></asp:DropDownList>
</div>
</div>
</asp:Content>

