<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SemesterCourses.aspx.cs" Inherits="Project.SemesterCourses"MasterPageFile="~/SidePanel.Master" %>


<asp:Content ID="con111" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
</asp:Content>
   



   <asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="header">
            <h1>Semester Details Along With Their Courses</h1>
        </div>
        <div class="table">
         <asp:Table ID="TranscriptTable" runat="server" class="myGridView"> 
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Semester</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Course ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Course Name</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table> 
        </div>
       </asp:Content>