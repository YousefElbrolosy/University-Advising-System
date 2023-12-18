<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_All_Requests.aspx.cs" Inherits="trial.View_All_Requests" MasterPageFile="~/Advisor/AdvSidePanel.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <link rel="stylesheet" type="text/css" href="MC.css" />
  </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container1">

    <div class="header">
        <h1>Requests</h1>
    </div>
        <div class="table">
                    <asp:GridView ID="GridView1" runat="server" CssClass="myGridView" >
    <EmptyDataTemplate>
        No Requests at the moment you are good to go
    </EmptyDataTemplate>
</asp:GridView>
            </div>
        </div>
    </asp:Content>