<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="precourses.aspx.cs" Inherits="trial.precourses" MasterPageFile="~/Student/StudentNavBar.Master" %>

<asp:Content ID="c1" ContentPlaceholderID="head" runat="server">
    <title>Prequisite</title>
    <link rel="stylesheet" href="MC.css" />
</asp:Content>


<asp:Content ID="Content1" ContentPlaceholderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
               <div class="header">
        <h1>Courses and Prequisite</h1>
    </div>
    <div class="table">

        <asp:Table ID="myTable" runat="server" class="myGridView"> 
        <asp:TableHeaderRow>
            <asp:TableHeaderCell>Course ID</asp:TableHeaderCell>
            <asp:TableHeaderCell>Course Name</asp:TableHeaderCell>
            <asp:TableHeaderCell>Major</asp:TableHeaderCell>
            <asp:TableHeaderCell>Offered</asp:TableHeaderCell>
            <asp:TableHeaderCell>Credit Hours</asp:TableHeaderCell>
            <asp:TableHeaderCell>Semester</asp:TableHeaderCell>
            <asp:TableHeaderCell>Prerequisite Course ID</asp:TableHeaderCell>
            <asp:TableHeaderCell>prerequisite Course Name</asp:TableHeaderCell>
     </asp:TableHeaderRow>
            </asp:Table>
        <asp:Label ID="lblEmptyMessage" runat="server" Visible="false" Text="You have no graduation plan."></asp:Label>
       </div>
        </div>
</asp:Content>
