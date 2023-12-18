<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transcript.aspx.cs" Inherits="Project.Transcript"  MasterPageFile="~/SidePanel.Master"%>


<asp:Content ID="con111" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
</asp:Content>


<asp:Content ID="con22" ContentPlaceHolderID="MainContent" runat="server">
    <div class="header">
        <h1>Transcripts</h1>
    </div>
    <div class="table">
        <asp:Table ID="TranscriptTable" runat="server" class="myGridView">
            <asp:TableHeaderRow>
                <asp:TableHeaderCell>Student ID</asp:TableHeaderCell>
                <asp:TableHeaderCell>Student Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Course ID</asp:TableHeaderCell>
                <asp:TableHeaderCell>Course Name</asp:TableHeaderCell>
                <asp:TableHeaderCell>Exam Type</asp:TableHeaderCell>
                <asp:TableHeaderCell>Grade</asp:TableHeaderCell>
                <asp:TableHeaderCell>Semester</asp:TableHeaderCell>
                <asp:TableHeaderCell>Instructor Name</asp:TableHeaderCell>
            </asp:TableHeaderRow>
        </asp:Table>
    </div>
</asp:Content>
