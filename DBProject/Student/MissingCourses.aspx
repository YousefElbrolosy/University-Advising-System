<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MissingCourses.aspx.cs" Inherits="DBProject.MissingCourses" MasterPageFile="~/Student/StudentNavBar.Master" %>

<asp:Content ID="c1" ContentPlaceholderID="head" runat="server">
    <title>Missing Courses</title>
    <link rel="stylesheet" href="MC.css" />
</asp:Content>
       
<asp:Content ID="Content1" ContentPlaceholderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
<div class="header">
            <h1>Missing Courses</h1>
        </div>
        <div class="table">
            <asp:GridView ID="GridView1" runat="server" CssClass="myGridView" AllowSorting="True" OnSorting="GridView1_Sorting" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
                <EmptyDataTemplate>
                    You have no missing courses.
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" SortExpression="course_id" />
                    <asp:BoundField DataField="name" HeaderText="Course Name" SortExpression="name" />
                    <asp:BoundField DataField="is_offered" HeaderText="Offered" SortExpression="is_offered" />
                    <asp:BoundField DataField="credit_hours" HeaderText="Credit Hours" SortExpression="credit_hours" />
                </Columns>
            </asp:GridView>
            
     
            </div>

            </div>
</asp:content>