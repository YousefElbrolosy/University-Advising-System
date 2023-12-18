<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewExams.aspx.cs" Inherits="trial.viewExams" MasterPageFile="~/Student/StudentNavBar.Master" %>

<asp:Content ID="c1" ContentPlaceholderID="head" runat="server">
       <title>View Exams</title>
    <link rel="stylesheet" href="MC.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceholderID="ContentPlaceHolder1" runat="server">
     <div class="container1">
        <div class="header">
    <h1>Exams</h1>
</div>
 <div class="table">
        <asp:Table ID="myTable" CssClass="myGridView" runat="server" Width="100%"> 
    <asp:TableHeaderRow>
        <asp:TableHeaderCell>Course Name</asp:TableHeaderCell>
        <asp:TableHeaderCell>Course Semester</asp:TableHeaderCell>
        <asp:TableHeaderCell>Exam Id</asp:TableHeaderCell>
        <asp:TableHeaderCell>Date</asp:TableHeaderCell>
        <asp:TableHeaderCell>Type</asp:TableHeaderCell>
        <asp:TableHeaderCell>CourseID</asp:TableHeaderCell>
        
       

    </asp:TableHeaderRow>
</asp:Table>
      <asp:Label ID="lblEmptyMessage" runat="server" Visible="false" Text="You have no graduation plan."></asp:Label>
    </div>
        </div>
</asp:content>