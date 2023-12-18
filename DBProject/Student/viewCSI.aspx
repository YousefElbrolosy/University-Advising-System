<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewCSI.aspx.cs" Inherits="trial.viewCSI" MasterPageFile="~/Student/StudentNavBar.Master"%>

<asp:Content ID="c1" ContentPlaceholderID="head" runat="server">
       <title>Slots</title>
    <link rel="stylesheet" href="MC.css" />
</asp:Content>


<asp:Content ID="Content1" ContentPlaceholderID="ContentPlaceHolder1" runat="server">
     <div class="container1">
        <div class="header">
    <h1>Slots</h1>
</div>
 <div class="table">
                <asp:Table ID="myTable" runat="server" CssClass="myGridView" Width="100%"> 
    <asp:TableHeaderRow>
    <asp:TableHeaderCell>Course ID</asp:TableHeaderCell>
    <asp:TableHeaderCell>Course name</asp:TableHeaderCell>
    <asp:TableHeaderCell>Slot ID</asp:TableHeaderCell>
    <asp:TableHeaderCell>Slot Day</asp:TableHeaderCell>
    <asp:TableHeaderCell>Slot Time</asp:TableHeaderCell>
    <asp:TableHeaderCell>Slot Location</asp:TableHeaderCell>
    <asp:TableHeaderCell>Slot’s Instructor name</asp:TableHeaderCell>
</asp:TableHeaderRow>
</asp:Table>
       <asp:Label ID="lblEmptyMessage" runat="server" Visible="false" Text="You have no graduation plan."></asp:Label>
    </div>
        </div>
</asp:content>
