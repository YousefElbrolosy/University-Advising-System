<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listInstructorCourse.aspx.cs" Inherits="AdminUI.listInstructorCourse" MasterPageFile="~/SidePanel.Master" %>

<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
</asp:Content>

   <asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="header">
    <h1>List Instructor Courses</h1>
        </div>
            <div class="table">
            <asp:Table ID="ICTable" runat="server" class="myGridView"> 
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Instructor ID</asp:TableHeaderCell>
                <asp:TableHeaderCell>Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Course ID</asp:TableHeaderCell>
                <asp:TableHeaderCell>Course</asp:TableHeaderCell>
            </asp:TableHeaderRow>

            </asp:Table> 
                     </div>
</asp:Content>
