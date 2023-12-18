<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addSemester.aspx.cs" Inherits="AdminUI.addSemester" MasterPageFile="~/SidePanel.Master"%>


<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />

    <link rel="stylesheet" type="text/css" href="Semester.css" />
</asp:Content>
<asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="header">
<h1>Add Semester</h1>
    </div>
    <div >
        <div>
            
            <div class="smallcontainer"  id="form1" runat="server">
              
            <asp:Label ID="Label1" runat="server" Text="Start Date:"></asp:Label>
          
            <asp:TextBox ID="start_date" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="End Date:"></asp:Label>
           
            <asp:TextBox ID="end_date" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="Label3" runat="server" Text="Semester Code"></asp:Label>
            
            <asp:TextBox ID="semester_code" runat="server"></asp:TextBox>
            

            <asp:Button class="button" runat="server" Text="Add" OnClick="adminAdd" />
            </div>
        </div>
    </div>
</asp:Content>
