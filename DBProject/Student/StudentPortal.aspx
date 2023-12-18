<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentPortal.aspx.cs" Inherits="DBProject.StudentPortal" MasterPageFile="~/Student/StudentNavBar.Master" %>


<asp:Content ID="c1" ContentPlaceholderID="head" runat="server">
        <title>Dashboard</title>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="StudentPortal1.css">
</asp:Content>
   
<asp:Content ID="Content1" ContentPlaceholderID="ContentPlaceHolder1" runat="server">
    <div class="right-side">
        <div class="perpendicular-rectangle">
            <h3 id="hello" runat="server">Hello,</h3>
        </div>

      <!-- the big container carying telephone and finance -->
      <div class="finance-and-tele">
        <!-- finance box -->
           <div class="finance-and-request">

        <div class="finance">
          <i class="fa-solid fa-coins fa-4x" style="color: #5fa3e2;"></i>
            <label id="install" runat="server"></label>
        </div>
                           <div class="Send-request">
             

            <!-- Radio buttons bta3t just -->
            
              <div class="radio-form">  
                <label>  
                Request Type:   
                </label>
                <asp:RadioButton id="credit" value="credits" GroupName="req" runAt="server" Checked="true" OnCheckedChanged="LoadSelect" AutoPostBack="true" /> Add Credit Hours  
                <asp:RadioButton id="course" value="courses" GroupName="req" runat="server" Checked="false" onCheckedChanged="LoadSelect" AutoPostBack="true" /> Add Courses <br/>  

                <asp:button runat="server" class="button" type="button" Text="Send Request" OnClick="SubmitRequest" />

              </div> 
                               <div class="withmsg">
    <div class="sc">
              <asp:DropDownList ID="optionsdropdown" runat="server">
                

              </asp:DropDownList>
              
              <div class="input-text-box">
                <textarea runat="server" id="comment" class="textbox2" type="text" placeholder="Comment" maxlength="40"></textarea>
              </div>
        </div>
                                   <asp:Label ID="Label1" runat="server" Text="" style="color:#4caf15" ></asp:Label>
                                   </div>
     

            <i class="fa-solid fa-hand-point-up fa-4x" style="color: #5fa3e2;"></i> 

            </div>
          </div>

        <!-- the whole box of the telephone -->
        <div class="telephone">

          <!-- the telephone icon -->
          <div class="telephone-icon">
            
            <i class="fa-solid fa-phone fa-2x" style="color: #5fa3e2;"></i>
            <br>
            <h4>Add Telephone Number(s)</h4>
          </div>
          
          <!-- the box where you enter the number -->
          <div class="input-text-box">
            <input id="phone2" runAt="server" class="textbox" type="text" placeholder="Enter Telephone Number">
          </div>
            <div class="phoneerr">
                <asp:Label id="phonestatus" Text ="" runat="server" />
            </div>

          <!-- button to add the phone number -->
          <div class="add-button">
            <asp:button runat="server" class="button" type="button" Text="Add" OnClick="SubmitPhone"/>
          </div>
     </div>
     </div>
        </div>
<script>
       localStorage.setItem('studentstatus', 'true');


</script>
</asp:Content>