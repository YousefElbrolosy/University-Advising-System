<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="listSemesterCourse.aspx.cs" Inherits="AdminUI.listSemesterCourse" MasterPageFile="~/SidePanel.Master"%>

<asp:Content ID="con1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="MC.css" />
</asp:Content>

   <asp:Content ID="con2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="header">
    <h1>Semester Course</h1>
        </div>
            <div class="table">
                <asp:Table ID="SCTable" runat="server" class="myGridView"> 
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Course ID</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Course</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Semester Code</asp:TableHeaderCell>
                </asp:TableHeaderRow>

                </asp:Table> 
                </div>

               
        </div>
</asp:Content>
