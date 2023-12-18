<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_his_her_students2.aspx.cs" Inherits="trial.View_his_her_students2" MasterPageFile="~/Advisor/AdvSidePanel.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" type="text/css" href="MC.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
    <div class="header">
        <h1>All My Students</h1>
    </div>


    <div class="table" style="margin-top: 50px;">
        <asp:GridView ID="GridView1" runat="server" CssClass="myGridView">
            <emptydatatemplate>
                There is no available Students Assigned to you to Display.
            </emptydatatemplate>
        </asp:GridView>
    </div>
        </div>
</asp:Content>
