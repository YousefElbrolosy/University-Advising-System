<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPaymentDetails.aspx.cs" Inherits="Project.ViewPaymentDetails" MasterPageFile="~/SidePanel.Master" %>


<asp:Content ID="con111" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
</asp:Content>


<asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="header">
        <h1>Payments</h1>
    </div>
    <div class="table">
        <asp:Table ID="PaymentDetailsTable" runat="server" class="myGridView">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>PaymentID</asp:TableHeaderCell>
                <asp:TableHeaderCell>Amount</asp:TableHeaderCell>
                <asp:TableHeaderCell>Deadline</asp:TableHeaderCell>
                <asp:TableHeaderCell>Number of installments</asp:TableHeaderCell>
                <asp:TableHeaderCell>Status</asp:TableHeaderCell>
                <asp:TableHeaderCell>Fund Percentage</asp:TableHeaderCell>
                <asp:TableHeaderCell>Start date</asp:TableHeaderCell>
                <asp:TableHeaderCell>Semester</asp:TableHeaderCell>
                <asp:TableHeaderCell>Student ID</asp:TableHeaderCell>
                <asp:TableHeaderCell>Student Name </asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    </div>
</asp:Content>
