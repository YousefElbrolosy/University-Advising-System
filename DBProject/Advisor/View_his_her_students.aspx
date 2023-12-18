<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_his_her_students.aspx.cs" Inherits="trial.View_his_her_students" MasterPageFile="~/Advisor/AdvSidePanel.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
    <link rel="stylesheet" type="text/css" href="BoxAboveTable.css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
    <div class="header">
        <h1>My Students</h1>
    </div>

    <div class="smallcontainer">
        <asp:DropDownList ID="ddl" runat="server" Width="188px" class="Cddl">
            <asp:ListItem Text="Select Major" Value="-1"></asp:ListItem>
        </asp:DropDownList>

        <asp:Button Text="View" runat="server" OnClick="View" cssClass="button" />

        <p id="err" runat="server" class="e1"></p>

    </div>


    <div class="table" style="margin-top: 60px;">
        <asp:GridView ID="GridView1" runat="server" CssClass="myGridView">
            <emptydatatemplate>
                There is no available Students for the Chosen Major.
            </emptydatatemplate>
        </asp:GridView>
    </div>
        </div>
</asp:Content>