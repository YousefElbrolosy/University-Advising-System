<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteCourses.aspx.cs" Inherits="Project.DeleteCourses" MasterPageFile="~/SidePanel.Master" %>

    <asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="DeleteCourse.css" />
    </asp:Content>

   
            <asp:Content ID="c2" ContentPlaceHolderID="MainContent" runat="server">

            <div class="smallcontainer">
            <p id="title" runat="server" class="title"> Choose a course to delete:</p>
            <p id="err" runat="server" class="err"></p>
            <asp:DropDownList ID="ddl1" runat="server" Width="188px" class="ddlist" Height="31px">
                <asp:ListItem Text="Select Course" Value="-1"></asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="delCourseButton" CssClass="button" runat="server" Height="28px" Text="Delete" OnClick="delCourseButton_Click" />
            <div class="stat">
                <p runat="server" id="status"></p>
            </div>
        </div>
           </asp:Content>

