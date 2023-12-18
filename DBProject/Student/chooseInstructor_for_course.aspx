<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chooseInstructor_for_course.aspx.cs" Inherits="trial.chooseInstructor_for_course"  MasterPageFile="~/Student/StudentNavBar.Master" %>

<asp:Content ID="c1" ContentPlaceholderID="head" runat="server">
       <title>Choose Instructor</title>
    <link rel="stylesheet" href="MC.css" />
    <link rel="stylesheet" href="choose.css" />
</asp:Content>


<asp:Content ID="Content1" ContentPlaceholderID="ContentPlaceHolder1" runat="server">
     <div class="container1">
        <div class="header">
    <h1>Choose Instructor</h1>
</div>


                        <div class="selectic">
                 <asp:DropDownList ID="ddl" runat="server" Width="188px" AutoPostBack="true" OnSelectedIndexChanged="loadInstructors">
                     <asp:ListItem Text="Select Course" Value="-1"></asp:ListItem>
                  </asp:DropDownList>
              
              <asp:DropDownList ID="ddl2" runat="server" Width="188px">
                  <asp:ListItem Text="Select Instructor" Value="-1"></asp:ListItem>
               </asp:DropDownList>
                     <asp:Button Text="Confirm" runat="server" OnClick="Confirm" />
            <h5 runat="server" id="status1" style="color:#4caf50"></h5> 
             <h5 runat="server" id="status2" style="color:#cc0000"></h5>
                </div>
            </div>
</asp:content>
