<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PendingRequests.aspx.cs" Inherits="DBProject.Advisor.PendingRequests" MasterPageFile="~/Advisor/AdvSidePanel.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Pending Requests</title>
    <link rel="stylesheet" href="MC.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
        <div class="header">
            <h1>Pending Requests</h1>
        </div>
        <div class="table">
            <asp:GridView ID="GridView1" runat="server" CssClass="myGridView" AllowSorting="True" OnSorting="GridView1_Sorting" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
                <emptydatatemplate>
                    There is no pending requests.
                </emptydatatemplate>
                <columns>
                    <asp:BoundField DataField="request_id" HeaderText="Request ID" SortExpression="request_id" />
                    <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                    <asp:BoundField DataField="comment" HeaderText="Comment" SortExpression="comment" />
                    <asp:BoundField DataField="f_name" HeaderText="Student First Name" SortExpression="f_name" />
                    <asp:BoundField DataField="l_name" HeaderText="Student Last Name" SortExpression="l_name" />
                    <asp:BoundField DataField="student_id" HeaderText="Student ID" SortExpression="student_id" />
                    <asp:BoundField DataField="credit_hours" HeaderText="Credit Hours" SortExpression="credit_hours" />
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" SortExpression="course_id" />
                    <asp:TemplateField>
                        <itemtemplate>
                            <asp:Button ID="Button1" runat="server" Text="Respond" CommandName="ButtonClick" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                        </itemtemplate>
                    </asp:TemplateField>
                </columns>
            </asp:GridView>



        </div>
    </div>

</asp:Content>
