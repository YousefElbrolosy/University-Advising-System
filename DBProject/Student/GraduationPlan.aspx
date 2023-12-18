<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraduationPlan.aspx.cs" Inherits="trial.GraduationPlan" MasterPageFile="~/Student/StudentNavBar.Master"%>

<asp:Content ID="c1" ContentPlaceholderID="head" runat="server">
    <title>Graduation Plan</title>
    <link rel="stylesheet" href="MC.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceholderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
               <div class="header">
        <h1>Graduation Plan</h1>
    </div>
    <div class="table">
    <asp:Table ID="myTable" runat="server" class="myGridView">  
    <asp:TableHeaderRow>
        <asp:TableHeaderCell>Student Name</asp:TableHeaderCell>
        <asp:TableHeaderCell>Plan id</asp:TableHeaderCell>
        <asp:TableHeaderCell>Course ID</asp:TableHeaderCell>
        <asp:TableHeaderCell>Course Name</asp:TableHeaderCell>
        <asp:TableHeaderCell>Semester Code</asp:TableHeaderCell>
        <asp:TableHeaderCell>Expected Graduation Date</asp:TableHeaderCell>
        <asp:TableHeaderCell>Semester Credit Hours</asp:TableHeaderCell>
        <asp:TableHeaderCell>Advisor Id</asp:TableHeaderCell>
 
    </asp:TableHeaderRow>
    </asp:Table>
        <asp:Label ID="lblEmptyMessage" runat="server" Visible="false" Text="You have no graduation plan."></asp:Label>
       </div>
        </div>
</asp:Content>
