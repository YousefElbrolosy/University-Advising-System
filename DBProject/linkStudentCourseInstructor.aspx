<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="linkStudentCourseInstructor.aspx.cs" Inherits="AdminUI.linkStudentCourseInstructor" MasterPageFile="~/SidePanel.Master" %>

<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
    <link rel="stylesheet" type="text/css" href="LinkSCI.css" />
</asp:Content>
   <asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
      <div class="header">
  <h1>Link Student Instructor</h1>
      </div>
        <div>
            <div class="smallcontainer" id="form1" runat="server">
            
            <asp:Label ID="Label1" runat="server" Text="Instructor ID:"></asp:Label>
    
            <asp:TextBox ID="instructor_id" runat="server"></asp:TextBox>
      
            <asp:Label ID="Label3" runat="server" Text="Student ID:"></asp:Label>
        
            <asp:TextBox ID="student_id" runat="server"></asp:TextBox>
         
            <asp:Label ID="Label2" runat="server" Text="Course ID:"></asp:Label>
           
            <asp:TextBox ID="course_id" runat="server"></asp:TextBox>
           

            <asp:Label ID="Label4" runat="server" Text="Semester Code:"></asp:Label>
            

            <asp:TextBox ID="semester_code" runat="server"></asp:TextBox>
            
            <asp:Button ID="Button2" class="button" runat="server" Text="Link" OnClick="adminLink" />
            
                </div>
        </div>
 </asp:Content>
