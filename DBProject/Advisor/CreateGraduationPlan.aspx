<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateGraduationPlan.aspx.cs" Inherits="Project.CreateGraduationPlan" MasterPageFile="~/Advisor/AdvSidePanel.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css"  href="CreateGP.css" />
</asp:Content>


 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="container1">

        <div class="smallcontainer">
            <p id="e1" runat="server" class="e1"></p>
            <asp:DropDownList ID="Semddl" runat="server" class="Cddl">
                <asp:ListItem Text="Select Semester" Value="-1">
                </asp:ListItem>
            </asp:DropDownList>
            <p id="e3" runat="server" class="e3"></p>
            <asp:TextBox ID="txtInput" runat="server" Text="Expected Grad Date:" ClientIDMode="Static"></asp:TextBox>
            
            <p id="e2" runat="server" class="e2"></p>
            <asp:TextBox ID="Studtextbox" runat="server" Text="Enter Student ID:" ClientIDMode="Static"></asp:TextBox>
      

            <p id="e4" runat="server" class="e4"></p>
            <asp:TextBox ID="SemCH" runat="server" Text="Semester Credit Hours:" ClientIDMode="Static"></asp:TextBox>
            <script>
                function initializeTextBoxEvents(textBoxId, defaultText) {
                    var textBox = document.getElementById(textBoxId);

                    textBox.addEventListener('focus', function () {
                        clearDefaultText(textBox, defaultText);
                    });

                    textBox.addEventListener('blur', function () {
                        restoreDefaultText(textBox, defaultText);
                    });

                    function clearDefaultText(element, defaultText) {
                        if (element.value === defaultText) {
                            element.value = '';
                        }
                    }

                    function restoreDefaultText(element, defaultText) {
                        if (element.value === '') {
                            element.value = defaultText;
                        }
                    }
                }

                // Initialize events for each textbox
                initializeTextBoxEvents('<%= txtInput.ClientID %>', 'Expected Grad Date:');
                initializeTextBoxEvents('<%= Studtextbox.ClientID %>', 'Enter Student ID:');
                initializeTextBoxEvents('<%= SemCH.ClientID %>', 'Semester Credit Hours:');
            </script>
            <asp:Button ID="Button1" runat="server" Text="Create" class="button" OnClick="Button1_Click"></asp:Button>
            <p id="examresp" runat="server" style="font-weight: bold; position: absolute; margin-top: 295px; position: absolute;"></p>
        </div>
                </div>
        </div>
   </asp:Content>
