<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register_FM.aspx.cs" Inherits="trial.Register_FM" MasterPageFile="~/Student/StudentNavBar.Master" %>

<asp:Content ID="c1" ContentPlaceholderID="head" runat="server">
    <title>Register First Makeup</title>
     <link rel="stylesheet" href="MC.css" />
     <link rel="stylesheet" href="choose.css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceholderID="ContentPlaceHolder1" runat="server">
             <div class="container1">
        <div class="header">
    <h1>Register First Makeup</h1>
</div>
        <div class="selectic">
            <asp:DropDownList ID="ddl" runat="server" Width="188px">
                <asp:ListItem Text="Select Course" Value="-1"></asp:ListItem>
             </asp:DropDownList>
            <asp:Button Text="Register" runat="server" OnClick="register" />
        <h5 runat="server" id="status1" style="color:#4caf50"></h5> 
            <h5 runat="server" id="status2" style="color:#cc0000"></h5>
        </div>
                 </div>
</asp:content>
