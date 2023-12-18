<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentAdvisorList.aspx.cs" Inherits="AdminUI.studentAdvisorList" MasterPageFile="~/SidePanel.Master"%>

<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
</asp:Content>
 <asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
      <div class="header">
  <h1>Student Advisor List</h1>
      </div>
            <div class="table">
                <asp:Table ID="Table" runat="server" class="myGridView"> 
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Student ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Student Full Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Advisor ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Advisor name</asp:TableHeaderCell>
                    
                </asp:TableHeaderRow>

                </asp:Table> 
                </div>
     </asp:Content>
