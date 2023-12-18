<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentViewSlots.aspx.cs" Inherits="trial.studentViewSlots" MasterPageFile="~/Student/StudentNavBar.Master" %>

<asp:Content ID="c1" ContentPlaceholderID="head" runat="server">
       <title>InsructorCourse Slot</title>
    <link rel="stylesheet" href="MC.css" />
    <link rel="stylesheet" href="choose.css" />
</asp:Content>


<asp:Content ID="Content1" ContentPlaceholderID="ContentPlaceHolder1" runat="server">
     <div class="container1">
        <div class="header">
    <h1>View Instructor/Course slots</h1>
</div>


                        <div class="selectic">
                            <asp:Label ID="Label1" runat="server" Text="Please select a Course/Instructor" Visible="false" ></asp:Label>
  <asp:DropDownList ID="ddl" runat="server" Width="188px" >
      <asp:ListItem Text="Select Course" Value="-1"></asp:ListItem>
   </asp:DropDownList>
          
<asp:DropDownList ID="ddl2" runat="server" Width="188px" >
    <asp:ListItem Text="Select Instructor" Value="-1"></asp:ListItem>
 </asp:DropDownList>
              <asp:Button Text="Show" runat="server" OnClick="show" class="ShowButton"/>
      </div>
          <div id="myTable" class="table" runat="server" visible="false">
          
        <asp:GridView ID="GridView1" CssClass="myGridView" runat="server" >
    <EmptyDataTemplate>
        There is no available Slots for the Chosen Course/Instructor.
    </EmptyDataTemplate>
</asp:GridView>

       
             

        </div>
         </div>
</asp:content>
