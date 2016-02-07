<%@ Page Language="C#" AutoEventWireup="true" CodeFile="popuptest.aspx.cs" Inherits="Consumer_popuptest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:Button ID="btnShowPopup" runat="server" Text="show" 
            onclick="btnShowPopup_Click"  />
   
              <asp:ModalPopupExtender ID="ModalPopupaddress" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" > </asp:ModalPopupExtender>

              <asp:Panel ID="pnlpopup" runat="server">

              <table>
                 <tr>
                   <td>
                       <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                   <td>
                       <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                 </tr>
              </table>

             
              </asp:Panel>

    </div>
    </form>
</body>
</html>
