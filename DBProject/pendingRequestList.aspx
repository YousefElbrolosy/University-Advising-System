<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pendingRequestList.aspx.cs" Inherits="AdminUI.pendingRequestList" MasterPageFile="~/SidePanel.Master"%>

<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
</asp:Content>
<asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="header">
 <h1>Pending Requests</h1>
     </div>
             <div class="table">
                 <asp:Table ID="Table" runat="server" class="myGridView"> 
                 <asp:TableHeaderRow>
                     <asp:TableHeaderCell>Request ID</asp:TableHeaderCell>
                     <asp:TableHeaderCell>Type</asp:TableHeaderCell>
                     <asp:TableHeaderCell>Comment</asp:TableHeaderCell>
                     <asp:TableHeaderCell>Status</asp:TableHeaderCell>
                     <asp:TableHeaderCell>Credit Hours</asp:TableHeaderCell>
                     <asp:TableHeaderCell>Course ID</asp:TableHeaderCell>
                     <asp:TableHeaderCell>Student ID</asp:TableHeaderCell>
                     <asp:TableHeaderCell>Advisor ID</asp:TableHeaderCell>
                 </asp:TableHeaderRow>

                 </asp:Table> 
                 </div>
</asp:Content>
