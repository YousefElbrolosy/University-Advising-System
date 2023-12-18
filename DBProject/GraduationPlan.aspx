<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraduationPlan.aspx.cs" Inherits="Project.GraduationPlan" MasterPageFile="~/SidePanel.Master"%>

<asp:Content ID="con11" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
</asp:Content>

   <asp:Content ID="con22" ContentPlaceHolderID="MainContent" runat="server">
        <div class="header">
    <h1>Graduation Plan</h1>
        </div>
     <div class="table">
             <asp:Table ID="GradPlanTable" runat="server" class="myGridView"> 
                <asp:TableHeaderRow>
                     <asp:TableHeaderCell>Plan ID</asp:TableHeaderCell>
                     <asp:TableHeaderCell>Semester</asp:TableHeaderCell>
                     <asp:TableHeaderCell>Semester Credit Hours</asp:TableHeaderCell>
                     <asp:TableHeaderCell>Expected Graduation Date </asp:TableHeaderCell>
                     <asp:TableHeaderCell>Student ID</asp:TableHeaderCell>
                     <asp:TableHeaderCell>Advisor ID</asp:TableHeaderCell>
                     <asp:TableHeaderCell>Advisor Name</asp:TableHeaderCell>

                </asp:TableHeaderRow>

             </asp:Table> 
         </div>
</asp:Content>
