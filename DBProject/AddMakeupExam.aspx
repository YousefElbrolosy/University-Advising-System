<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMakeupExam.aspx.cs" Inherits="Project.AddMakeupExam" MasterPageFile="~/SidePanel.Master"  %>

<asp:Content ID="c11" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css"  href="AddMakeUpExam.css" />
</asp:Content>

            <asp:Content ID="c21" ContentPlaceHolderID="MainContent" runat="server">
                <div class="smallcontainer">
                <p id="e1" runat="server"  class="e1">  </p>
            
                <asp:DropDownList ID="Cddl" runat="server" Width="188px" class="Cddl">
                <asp:ListItem Text="Select Course" Value="-1">
                </asp:ListItem>
                </asp:DropDownList>
            <p id="e2" runat="server"   class="e2">  </p>
                <asp:DropDownList ID="typeddl" runat="server" Width="188px" class="typeddl">
                <asp:ListItem Text="Select type" Value="-1"></asp:ListItem>
                <asp:ListItem Text="First Makeup" Value="First_makeup"></asp:ListItem>
                <asp:ListItem Text="Second Makeup" Value="Second_makeup"></asp:ListItem>
                </asp:DropDownList>
            <p id="e3" runat="server"   class="e3">   </p>
            <asp:TextBox ID="txtInput" runat="server" Text="Enter Exam Date:" ClientIDMode="Static"></asp:TextBox>
            <script>
                var textBox = document.getElementById('<%= txtInput.ClientID %>');

                textBox.addEventListener('focus', function () {
                    clearDefaultText(textBox);
                });

                textBox.addEventListener('blur', function () {
                    restoreDefaultText(textBox);
                });

                function clearDefaultText(element) {
                    if (element.value === 'Enter Exam Date:') {
                        element.value = '';
                    }
                }

                function restoreDefaultText(element) {
                    if (element.value === '') {
                        element.value = 'Enter Exam Date:';
                    }
                }
            </script>
                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" class="button"></asp:Button>
                <p id="examresp" runat="server" class="title"></p>
           </div>
           </asp:Content>

