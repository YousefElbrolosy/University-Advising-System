<%@ Page Title="" Language="C#" MasterPageFile="~/SidePanel.Master" AutoEventWireup="true" CodeBehind="UpdateStatus.aspx.cs" Inherits="Project.UpdateStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Issue.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="smallcontainer">
    <p runat="server" class="title">Enter Student ID:</p>
    <p runat="server" ID="error" class="err"></p>
    <asp:TextBox ID="txtInput" runat="server" CssClass="txtInput"></asp:TextBox>
    <br/>
    <asp:Button ID="btnUpdate" runat="server" text="Update" CssClass="button" OnClick="btnUpdate_Click" />
    <p runat="server" id="comments" class="stat"></p>
        </div>
</asp:Content>
