<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="advisorList.aspx.cs" Inherits="AdminUI.adminList" MasterPageFile="~/SidePanel.Master"%>

<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
</asp:Content>

   <asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="header">
    <h1>Advisor List</h1>
        </div>
            <div class="table">
                <asp:Table ID="advisorTable" runat="server" class="myGridView"> 
                   <asp:TableHeaderRow>
                        <asp:TableHeaderCell>Id</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Name</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Email</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Office</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Password</asp:TableHeaderCell>
                   </asp:TableHeaderRow>

                </asp:Table> 
            </div>
          </asp:Content>