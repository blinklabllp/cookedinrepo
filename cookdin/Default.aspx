<%@ Page Title="" Language="C#" MasterPageFile="~/basic.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row">
     <div class="full-width wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
      <div class="container box">
       <h2>Messages</h2>
       <div role="alert" class="alert alert-info"><button class="close">x</button>Info message box.</div>
       <div role="alert" class="alert alert-success"><button class="close">x</button>Success message box.</div>
       <div role="alert" class="alert alert-warning"><button class="close">x</button>Warning message box.</div>
       <div role="alert" class="alert alert-danger"><button class="close">x</button>Danger message box.</div>
      </div>
     </div>
</div>
</asp:Content>

