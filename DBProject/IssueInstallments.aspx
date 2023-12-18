<%@ Page Title="" Language="C#" MasterPageFile="~/SidePanel.Master" AutoEventWireup="true" CodeBehind="IssueInstallments.aspx.cs" Inherits="Project.IssueInstallments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link rel="stylesheet" type="text/css" href="Issue.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="smallcontainer"
    <p runat="server" class="title" style="font-weight: bold;">Enter Payment ID:</p>
    <p runat="server" ID="error" class="err"></p>
    <asp:TextBox ID="txtInput" runat="server" CssClass="txtInput"></asp:TextBox>
    <br/>
    <asp:Button ID="btnIssue" runat="server" text="Issue" OnClick="btnIssue_Click" CssClass="button" />
    <p runat="server" id="comments" class="stat"></p>
        </div>
</asp:Content>

