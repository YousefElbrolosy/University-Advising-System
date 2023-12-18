<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addCourse.aspx.cs" Inherits="AdminUI.addCourse" MasterPageFile="~/SidePanel.Master"%>

<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
    <link rel="stylesheet" type="text/css" href="Course.css" />
</asp:Content>

   <asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="header">
    <h1>Add Course</h1>
        </div>
        <div>
            
            <div class="smallcontainer" id="form1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Major:"></asp:Label>

            <asp:TextBox ID="course_major" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Semester:"></asp:Label>

            <asp:TextBox ID="semester" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="Label3" runat="server" Text="Credit Hours:"></asp:Label>

            <asp:TextBox ID="credit_hours" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="Label4" runat="server" Text="Course Name:"></asp:Label>

            <asp:TextBox ID="course_name" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="Label5" runat="server" Text="Is it Offered?"></asp:Label>
            
            <asp:RadioButton ID="RadioButtonYes" runat="server" Text="Yes" GroupName="is_offered"></asp:RadioButton>
 
            <asp:RadioButton ID="RadioButtonNo" runat="server" Text="No" GroupName="is_offered"></asp:RadioButton>


            <asp:Button ID="Button1" class="button" runat="server" Text="Add" OnClick="adminAddCourse" />

                </div>
        </div>
</asp:Content>

