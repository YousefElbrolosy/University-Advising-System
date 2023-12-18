<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertCoursesGP.aspx.cs" Inherits="Project.InsertCoursesGP" MasterPageFile="~/Advisor/AdvSidePanel.Master"
 %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="InsertCrsGP.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
    <div class="smallcontainer">
        <p id="e1" runat="server" class="e1"></p>
        <asp:DropDownList ID="Semddl" runat="server" class="Cddl">
            <asp:ListItem Text="Select Semester" Value="-1">
            </asp:ListItem>
        </asp:DropDownList>
        <p id="e2" runat="server" class="e2"></p>
        <asp:DropDownList ID="Cddl" runat="server" class="tddl">
            <asp:ListItem Text="Select Course" Value="-1">
            </asp:ListItem>
        </asp:DropDownList>
        <p id="e3" runat="server" class="e3"></p>
        <asp:TextBox ID="Studtextbox" runat="server" Text="Enter Student ID:" ClientIDMode="Static"></asp:TextBox>
        <script>
            var textBox = document.getElementById('<%= Studtextbox.ClientID %>');

            textBox.addEventListener('focus', function () {
                clearDefaultText(textBox);
            });

            textBox.addEventListener('blur', function () {
                restoreDefaultText(textBox);
            });

            function clearDefaultText(element) {
                if (element.value === 'Enter Student ID:') {
                    element.value = '';
                }
            }

            function restoreDefaultText(element) {
                if (element.value === '') {
                    element.value = 'Enter Student ID:';
                }
            }
        </script>
        <asp:Button ID="Button1" runat="server" Text="Create" class="button" OnClick="Button_Click"></asp:Button>
        <p id="examresp" runat="server" class="stat"></p>
    </div>
        </div>
</asp:Content>
