<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateGradDate.aspx.cs" Inherits="Project.updateGradDate" MasterPageFile="~/Advisor/AdvSidePanel.Master" %>


<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="UpdateAd.css" />
</asp:Content>
    <asp:Content ID="c88" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container1">
            <div class="smallcontainer">
            
            <asp:Label ID="Label1" runat="server" Text="Expected Graduation Date:"></asp:Label>
            <br />
            <asp:TextBox ID="date" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Student ID"></asp:Label>
            <br />
            <asp:TextBox ID="s_id" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" class="button" runat="server" Text="Update" OnClick="updateGradPlan" />
            <br />
            <asp:Label ID="err" runat="server"></asp:Label>

        </div>
            </div>
</asp:Content>
