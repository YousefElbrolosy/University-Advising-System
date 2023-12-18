<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="linkInstructorCourseSlot.aspx.cs" Inherits="AdminUI.linkInstructorCourseSlot" MasterPageFile="~/SidePanel.Master"%>

<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
    <link rel="stylesheet" type="text/css" href="LinkIC.css" />
</asp:Content>

   <asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="header">
    <h1> Instructor Course</h1>
        </div>

        <div>
            <div class="smallcontainer" id ="form1" runat="server">
            
            <asp:Label ID="Label1" runat="server" Text="Instructor ID:"></asp:Label>
            <br />
            <asp:TextBox ID="instructor_id" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Course ID:"></asp:Label>
            <br />
            <asp:TextBox ID="course_id" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="Label3" runat="server" Text="Slot ID:"></asp:Label>
            <br />
            <asp:TextBox ID="slot_id" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" class="button" runat="server" Text="Link" OnClick="adminLink" />
            <br />
            <br />
                </div>
        </div>
</asp:Content>