<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AvailableCourses.aspx.cs" Inherits="DBProject.AvailableCourses" MasterPageFile="~/Student/StudentNavBar.Master" %>

<asp:Content ID="c1" ContentPlaceholderID="head" runat="server">
    <title>Available Courses</title>
    <link rel="stylesheet" href="MC.css" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceholderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
           <div class="header">
       <h1>Available Courses</h1>
   </div>
    <div class="table">
<asp:GridView ID="GridView1" runat="server" CssClass="myGridView" AllowSorting="True" OnSorting="GridView1_Sorting" AutoGenerateColumns="False">
    
    <EmptyDataTemplate>
        There is no available courses.
    </EmptyDataTemplate>
    
    <Columns>
        <asp:BoundField DataField="CourseID" HeaderText="Course ID" SortExpression="CourseID" />
        <asp:BoundField DataField="Course Name" HeaderText="Course Name" SortExpression="Course Name" />
        <asp:BoundField DataField="Credit Hours" HeaderText="Credit Hours" SortExpression="Credit Hours" />
    </Columns>
        


</asp:GridView>


</div>
        </div>
</asp:content>
