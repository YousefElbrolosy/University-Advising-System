<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="linkStudentAdvisor.aspx.cs" Inherits="AdminUI.LinkStudentAdvisor" MasterPageFile="~/SidePanel.Master"%>

<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
    <link rel="stylesheet" type="text/css" href="LinkSA.css" />
</asp:Content>

   <asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="header">
    <h1>Link Student Advisor</h1>
        </div>
        <div>
            <div class="smallcontainer" id="form12" runat="server">
            
            <asp:Label ID="Label1" runat="server" Text="Student ID:"></asp:Label>
         
            <asp:TextBox ID="student_id" runat="server"></asp:TextBox>
         
            <asp:Label ID="Label2" runat="server" Text="Advisor ID:"></asp:Label>
     
            <asp:TextBox ID="advisor_id" runat="server"></asp:TextBox>
    
            <asp:Button ID="Button2" class="button" runat="server" Text="Link" OnClick="adminLink" />
  
                </div>
        </div>
</asp:Content>
