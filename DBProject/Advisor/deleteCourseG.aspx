<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteCourseG.aspx.cs" Inherits="Project.deleteCourseG" MasterPageFile="~/Advisor/AdvSidePanel.Master" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="deleteCG.css" />

</asp:Content>
<asp:Content ID="c88" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
        <div class="smallcontainer">

            <asp:Label ID="Label1" runat="server" Text="Student ID:"></asp:Label>
            <asp:TextBox ID="studentID" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Semester Code:"></asp:Label>
            
            <asp:TextBox ID="semester_code" runat="server"></asp:TextBox>

            <asp:Label ID="Label3" runat="server" Text="Course ID:"></asp:Label>
            <asp:TextBox ID="c_id" runat="server"></asp:TextBox>

            <asp:Button ID="Button1" class="button" runat="server" Text="Delete" OnClick="deleteFromG" />
            <br />
            <asp:Label ID="err" runat="server"></asp:Label>


        </div>
    </div>
</asp:Content>
