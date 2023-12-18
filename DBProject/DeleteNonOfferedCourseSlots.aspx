<%@ Page Title="" Language="C#" MasterPageFile="~/SidePanel.Master" AutoEventWireup="true" CodeBehind="DeleteNonOfferedCourseSlots.aspx.cs" Inherits="Project.DeleteNonOfferedCourseSlots" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="DeleteNonOfferred.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="smallcontainer">
    <p id="title" runat="server" class="title"> Are you sure you want to delete?</p>
            <div runat="server" style="margin-right:80px">
                <asp:Button ID="buttonYes" CssClass="buttonYes" runat="server"  Text="Yes" OnClick="buttonYes_Click" />
                <asp:Button ID="buttonNo" CssClass="buttonNo" runat="server"  Text="No" OnClick="buttonNo_Click" />
            </div>
        <p runat="server" id="status" class="stat"></p>
    </div>
</div>
</asp:Content>
