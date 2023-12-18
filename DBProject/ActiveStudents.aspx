<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiveStudents.aspx.cs" Inherits="Project.ActiveStudents"  MasterPageFile="~/SidePanel.Master"%>

<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
</asp:Content>

   <asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="header">
    <h1>Active Students</h1>
        </div>
     <div class="table">
        <asp:Table ID="myTable" runat="server" CssClass="myGridView">
    <asp:TableHeaderRow ID="FR" runat="server">
        <asp:TableHeaderCell>ID</asp:TableHeaderCell>
        <asp:TableHeaderCell>Name</asp:TableHeaderCell>
        <asp:TableHeaderCell>GPA</asp:TableHeaderCell>
        <asp:TableHeaderCell>Faculty</asp:TableHeaderCell>
        <asp:TableHeaderCell>Email</asp:TableHeaderCell>
        <asp:TableHeaderCell>Major</asp:TableHeaderCell>
        <asp:TableHeaderCell>Password</asp:TableHeaderCell>
        <asp:TableHeaderCell>Financial Status</asp:TableHeaderCell>
        <asp:TableHeaderCell>Semester</asp:TableHeaderCell>
        <asp:TableHeaderCell>Acquired Hours</asp:TableHeaderCell>
        <asp:TableHeaderCell>Assigned Hours</asp:TableHeaderCell>
        <asp:TableHeaderCell>Advisor ID</asp:TableHeaderCell>
       
    </asp:TableHeaderRow>
</asp:Table> 
         </div>
</asp:Content>

