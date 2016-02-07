<%@ Page Title="" Language="C#" MasterPageFile="~/Consumer/ConsumerMasterPage.master" AutoEventWireup="true" CodeFile="calenderchacking.aspx.cs" Inherits="Consumer_calenderchacking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
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
         function SetDatePicker() {
             $("#<%=textboxDate.ClientID %>").datepicker
             ({
                  dateFormat: 'dd/mm/yy',
                minDate: 0,
                maxDate: 6,
             });
         }
</script>


       <asp:TextBox ID="textboxDate" runat="server" CssClass="remove-border date-selector-height" placeholder="Date of Order Delivery"   AutoPostBack="True"  ValidationGroup="addTocart" Height="37px"></asp:TextBox>
</asp:Content>

