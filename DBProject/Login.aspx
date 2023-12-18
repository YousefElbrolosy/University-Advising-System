<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DBProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
   <link rel="stylesheet" type="text/css" href="StyleSheet1.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet" />
</head>
<body id="body">
    <form id="form1" runat="server" dir="auto" draggable="false">

        <div id="studentLoginSection">
            
            <div class="loginform" >
                <div class="sup" draggable="false">
                <button class="bphoto" type="button" onclick="showAdvisorLogin()"><img class="arrow" src="studentarrow.png" draggable="false"/></button>  <label class="sarrowl" onclick="showAdvisorLogin()">Advisor?</label>
                </div>
             <span id="ssucc" runat="server" ></span>
             <span id="srej" runat="server" ></span>
             <h1>Login</h1>
             <h2>Enter your account details</h2>
            <div id="studentIDfield" class="textfield" runat="server">
                <input id="studentID" type="text"  runat="server" draggable="false" class="loginTextbox" onfocus="studentIDF()" oninput="sidn()" required />
                <span class="span1"></span>
                <label id="studentIDLabel" runat="server">ID</label>
            </div>

            <div id="studentPasswordfield" class="textfield" runat="server">
                <input id="studentPasswordL" type="password"  runat="server" draggable="false" class="loginTextbox" onfocus="studentPasswordLF()" required/>
                <span class="span1"></span>
                <label id="StudentPasswordLLabel" runat="server">Password</label>
            </div>

            <asp:Button ID="Button1" runat="server" OnClick="StudentLogin" OnClientClick="studentIPE()" Text="Log in" draggable="false"/>
             
                    <div class="regfield" draggable="false">
                 Don’t have an account?
                <input class="regbutton" id="Button2" type="button" value="Sign up"  onclick="showSRegistrationForm()"/>
                </div>
            </div>

            
        </div>
        <div class="wholeimage" draggable="false">
        <img id="photo1" alt="studentWelcome" src="studentphoto.png" draggable="false"  />
            <img src="studentlogo.png" id="photo1logo" draggable="false"/>
            </div>
        <div class="wholeimage" draggable="false">   
        <img id="photo2" alt="AdvisorWelcome" src="advisorphoto.png" draggable="false"/>
            <img src="advisorlogo.png" id="photo2logo" draggable="false"/>
            </div>


        <div id="advisorLoginSection" style="display:none">
            <div class="loginform">
            <div class="aup" draggable="false" >
            <button class="bphoto" type="button" onclick="showStudentLogin()" draggable="false"><img class="arrow" src="advisorarrow.png" draggable="false"/></button>  <label class="aarrowl" onclick="showStudentLogin()">Student?</label>
            </div>
            <span id="asucc" runat="server" ></span>
            <span id="arej" runat="server" ></span>
            <h1>Login</h1>
            <h2>Enter your account details</h2>
            <div class="textfield" id="advisorIDfield" runat="server">
                <input id="advisorID" type="text"  runat="server" draggable="false" onfocus="advisorIDF()" oninput="aidn()" />
                 <span class="span2"></span>
                 <label id="advisorIDLabel" runat="server">ID</label>
            </div>

            <div class="textfield" id="advisorPasswordfield" runat="server">
                <input id="advisorPasswordL" type="password"  runat="server" draggable="false" onfocus="advisorPaswordLF()"/>
                 <span class="span2"></span>
                 <label id="AdvisorPasswordLLabel" runat="server">Password</label>
            </div>
            
            <asp:Button ID="Button3" runat="server" OnClick="AdvisorLogin" OnClientClick="return advisorIPE();" Text="Log in"/>
             <div class="regfield">
              Don’t have an account?
              <input class="regbutton" id="Button4" type="button" value="Sign up"  onclick="showARegistrationForm()"/>
        </div>
                </div>
        </div>
        

        <div id="studentRegisterSection" class="RegisterSection">
             
            <div class="regg">
                <div class="sup" draggable="false">
                <button class="bphoto" type="button" onclick="BackS()" draggable="false"><img class="arrow" src="studentarrow.png" draggable="false"/></button>  <label class="sarrowl" onclick="BackS()">Back</label>
                 </div> 
            <div class="twotext">
            <div class="textfield1">
                <input id="StudentFirstName" type="text"  runat="server" draggable="false" placeholder=" " oninput="sfname()" maxlength="40"  />
                <span></span>
                <label>First Name</label>
            </div>
            <div class="textfield1">
                <input  id="StudentLastName" type="text"  runat="server" draggable="false" placeholder=" " oninput="slname()" maxlength="40"  />
                <span></span>
                <label>Last Name</label>
            </div>
            </div>
            <div class="twotext">
            <div class="textfield1">
                <input id="StudentEmail" type="email"  runat="server" draggable="false" placeholder=" " maxlength="40"  />
                <span></span>
                <label>Email</label>
            </div>
            <div class="textfield1">
                <input id="StudentPassword" type="password"  runat="server" draggable="false" placeholder=" " maxlength="40" />
                <span></span>
                <label>Password</label>
            </div>
</div>
            <div class="twotext">
            <div class="textfield1" >
                <input id="Faculty" type="text"  runat="server" draggable="false" placeholder=" " oninput="faculty()" maxlength="40" />
                <span></span>
                <label>Faculty</label>
            </div>  
            <div class="textfield1" >
                <input id="Major" type="text"  runat="server" draggable="false" placeholder=" " oninput="major()" maxlength="40" />
                <span></span>
                <label>Major</label>
             </div>
        </div> 
             <div class="twotext">
                 <div class="textfield1">
                 <input id="Semester" runat="server" draggable="false" placeholder=" " type="number" min="1" max="10" oninput="sem()" style=" -moz-appearance: textfield;" />
                 <span></span>
                 <label>Semester</label>
                </div>
                  <div class="textfield1">
                    <input id="Phone" type="text" maxlength="13" runat="server" draggable="false" title="01X XXXX XXXX" pattern="[0-9 ]{13}" oninput="formatPhoneNumber()" placeholder=" " />
                    <span></span>
                     <label>Phone number</label>
                    </div>
            </div>
            <asp:Button ID="StudentReg" runat="server" OnClick="StudentRegister" Text="Register"/>
                </div>
            </div>


            <div id="advisorRegisterSection" class="RegisterSection">
                <div class="regg">
                    <div class="aup" draggable="false">
                    <button class="bphoto" type="button" onclick="BackA()" draggable="false"><img class="arrow" src="advisorarrow.png" draggable="false"/></button>  <label class="aarrowl" onclick="BackA()">Back</label>
                    </div>  
                <div class="twotext">
                <div class="textfield2">
                    <input id="AdvisorName" type="text"  runat="server" draggable="false" oninput="aname()" placeholder=" " />
                    <span></span>
                    <label>Name</label>
                </div>
                <div class="textfield2">
                    <input  id="Office" type="text"  runat="server" draggable="false" placeholder=" " />
                    <span></span>
                    <label>Office</label>
                </div>
                </div>
                <div class="twotext">
                <div class="textfield2">
                    <input id="AdvisorEmail" type="email"  runat="server" draggable="false" placeholder=" " />
                    <span></span>
                    <label>Email</label>
                </div>
                <div class="textfield2">
                    <input id="AdvisorPassword" type="password"  runat="server" draggable="false" placeholder=" " />
                    <span></span>
                    <label>Password</label>
                </div>
            </div>
              <asp:Button ID="AdvisorReg" runat="server" OnClick="AdvisorRegister" Text="Register"/>

        </div>
        </div>
        <script>
            var animationInProgress = false;
            if (!localStorage.getItem('page')) 
                localStorage.setItem('page', 'student');

            if (localStorage.getItem('page') === "advisor") {
                showAdvisorLogin();
            }
            else {
                showStudentLogin();
            }
            function showStudentLogin() {
                if (!animationInProgress) {
                    localStorage.setItem('page', 'student');
                    animationInProgress = true;
                    document.getElementById('studentLoginSection').style.display = 'flex';
                    document.getElementById('studentID').setAttribute('required', 'required');
                    document.getElementById('studentPasswordL').setAttribute('required', 'required');

                    var imageContainer1 = document.getElementById('photo1');
                    var imageContainer2 = document.getElementById('photo2');
                    var imageContainer1logo = document.getElementById('photo1logo');
                    var imageContainer2logo = document.getElementById('photo2logo');
                    imageContainer1logo.style.opacity = 1;
                    imageContainer2logo.style.opacity = 0;

                    imageContainer1.style.right = '0';
                    imageContainer1.style.opacity = 1;
                    imageContainer1logo.style.right = '0';

                    imageContainer2.style.right = '0';
                    imageContainer2.style.opacity = 0;
                    imageContainer2logo.style.right = '0';

                    setTimeout(function () {
                        document.getElementById('advisorLoginSection').style.display = 'none';
                        document.getElementById('advisorID').removeAttribute('required');
                        document.getElementById('advisorPasswordL').removeAttribute('required');
                        imageContainer1.style.zIndex = 2;
                        imageContainer1logo.style.zIndex = 2;
                        imageContainer2.style.zIndex = 1;
                        imageContainer2logo.style.zIndex = 1;
                        setTimeout(function () {
                            imageContainer2.style.opacity = 1;
                            imageContainer2logo.style.opacity = 1;
                            animationInProgress = false;
                        }, 500);
                    }, 1000);

                }
            }

            function showAdvisorLogin() {
                if (!animationInProgress) {
                    localStorage.setItem('page', 'advisor');
                    animationInProgress = true;
                    document.getElementById('advisorLoginSection').style.display = 'flex';
                    document.getElementById('advisorID').setAttribute('required', 'required');
                    document.getElementById('advisorPasswordL').setAttribute('required', 'required');
                    var imageContainer1 = document.getElementById('photo1');
                    var imageContainer2 = document.getElementById('photo2');
                    var imageContainer1logo = document.getElementById('photo1logo');
                    var imageContainer2logo = document.getElementById('photo2logo');
                    imageContainer2logo.style.opacity = 1;
                    imageContainer1logo.style.opacity = 0;

                    imageContainer1.style.right = 'calc(100% - 455.625px)';
                    imageContainer1.style.opacity = 0;
                    imageContainer1logo.style.right = 'calc(100% - 455.625px)';

                    imageContainer2.style.right = 'calc(100% - 455.625px)';
                    imageContainer2.style.opacity = 1;
                    imageContainer2logo.style.right = 'calc(100% - 455.625px)';

                    setTimeout(function () {
                        document.getElementById('studentLoginSection').style.display = 'none';
                        document.getElementById('studentID').removeAttribute('required');
                        document.getElementById('studentPasswordL').removeAttribute('required');
                        imageContainer2.style.zIndex = 2;
                        imageContainer2logo.style.zIndex = 2;
                        imageContainer1.style.zIndex = 1;
                        imageContainer1logo.style.zIndex = 1;
                        setTimeout(function () {
                            imageContainer1.style.opacity = 1;
                            imageContainer1logo.style.opacity = 1;
                            animationInProgress = false;
                        }, 500);
                    }, 1000);


                }
            }
            function showSRegistrationForm() {
                if (!animationInProgress) {
                    animationInProgress = true;

                    document.getElementById('StudentFirstName').setAttribute('required', 'required');
                    document.getElementById('StudentLastName').setAttribute('required', 'required');
                    document.getElementById('StudentEmail').setAttribute('required', 'required');
                    document.getElementById('StudentPassword').setAttribute('required', 'required');
                    document.getElementById('Faculty').setAttribute('required', 'required');
                    document.getElementById('Major').setAttribute('required', 'required');
                    document.getElementById('Semester').setAttribute('required', 'required');
                    document.getElementById('Phone').setAttribute('required', 'required');

                    document.getElementById('studentRegisterSection').style.opacity = '1';
                    document.getElementById('studentLoginSection').style.opacity = '0';
                    document.getElementById('studentRegisterSection').style.pointerEvents = 'all';
                    document.getElementById('studentLoginSection').style.pointerEvents = 'none';
                    var imageContainer1 = document.getElementById('photo1');
                    var imageContainer2 = document.getElementById('photo2');
                    var imageContainer1logo = document.getElementById('photo1logo');
                    var imageContainer2logo = document.getElementById('photo2logo');


                    imageContainer1.style.right = '-455.625px';
                    imageContainer1logo.style.right = '-455.625px';
                    imageContainer2.style.right = '-455.625px';
                    imageContainer2logo.style.right = '-455.625px';




                    setTimeout(function () {
                        document.getElementById('studentID').removeAttribute('required');
                        document.getElementById('studentPasswordL').removeAttribute('required');
                        animationInProgress = false;
                    }, 1000);
                }
            }

            function BackS() {
                if (!animationInProgress) {
                    animationInProgress = true;

                    document.getElementById('studentID').setAttribute('required', 'required');
                    document.getElementById('studentPasswordL').setAttribute('required', 'required');
                    document.getElementById('studentLoginSection').style.opacity = '1';
                    document.getElementById('studentRegisterSection').style.opacity = '0';
                    document.getElementById('studentRegisterSection').style.pointerEvents = 'none';
                    document.getElementById('studentLoginSection').style.pointerEvents = 'all';


                    var imageContainer1 = document.getElementById('photo1');
                    var imageContainer2 = document.getElementById('photo2');
                    var imageContainer1logo = document.getElementById('photo1logo');
                    var imageContainer2logo = document.getElementById('photo2logo');


                    imageContainer1.style.right = '0';
                    imageContainer1logo.style.right = '0';
                    imageContainer2.style.right = '0';
                    imageContainer2logo.style.right = '0';



                    setTimeout(function () {
                        document.getElementById('StudentFirstName').removeAttribute('required');
                        document.getElementById('StudentLastName').removeAttribute('required');
                        document.getElementById('StudentEmail').removeAttribute('required');
                        document.getElementById('StudentPassword').removeAttribute('required');
                        document.getElementById('Faculty').removeAttribute('required');
                        document.getElementById('Major').removeAttribute('required');
                        document.getElementById('Semester').removeAttribute('required');
                        document.getElementById('Phone').removeAttribute('required');
                        animationInProgress = false;
                    }, 1000);
                }
            }
            function showARegistrationForm() {
                if (!animationInProgress) {
                    animationInProgress = true;
                    document.getElementById('AdvisorName').setAttribute('required', 'required');
                    document.getElementById('Office').setAttribute('required', 'required');
                    document.getElementById('AdvisorEmail').setAttribute('required', 'required');
                    document.getElementById('AdvisorPassword').setAttribute('required', 'required');

                    document.getElementById('advisorRegisterSection').style.opacity = '1';
                    document.getElementById('advisorLoginSection').style.opacity = '0';
                    document.getElementById('advisorRegisterSection').style.pointerEvents = 'all';
                    document.getElementById('advisorLoginSection').style.pointerEvents = 'none';


                    var imageContainer1 = document.getElementById('photo1');
                    var imageContainer2 = document.getElementById('photo2');
                    var imageContainer1logo = document.getElementById('photo1logo');
                    var imageContainer2logo = document.getElementById('photo2logo');


                    imageContainer1.style.right = '100%';
                    imageContainer1logo.style.right = '100%';
                    imageContainer2.style.right = '100%';
                    imageContainer2logo.style.right = '100%';




                    setTimeout(function () {
                        document.getElementById('advisorID').removeAttribute('required');
                        document.getElementById('advisorPasswordL').removeAttribute('required');
                        animationInProgress = false;
                    }, 1000);
                }
                
            }
            function BackA() {
                if (!animationInProgress) {
                    animationInProgress = true;

                    document.getElementById('advisorID').setAttribute('required', 'required');
                    document.getElementById('advisorPasswordL').setAttribute('required', 'required');
                    document.getElementById('advisorLoginSection').style.opacity = '1';
                    document.getElementById('advisorRegisterSection').style.opacity = '0';
                    document.getElementById('advisorRegisterSection').style.pointerEvents = 'none';
                    document.getElementById('advisorLoginSection').style.pointerEvents = 'all';


                    var imageContainer1 = document.getElementById('photo1');
                    var imageContainer2 = document.getElementById('photo2');
                    var imageContainer1logo = document.getElementById('photo1logo');
                    var imageContainer2logo = document.getElementById('photo2logo');


                    imageContainer1.style.right = 'calc(100% - 455.625px)'
                    imageContainer1logo.style.right = 'calc(100% - 455.625px)';
                    imageContainer2.style.right = 'calc(100% - 455.625px)';
                    imageContainer2logo.style.right = 'calc(100% - 455.625px)';



                    setTimeout(function () {
                        document.getElementById('AdvisorName').removeAttribute('required');
                        document.getElementById('Office').removeAttribute('required');
                        document.getElementById('AdvisorEmail').removeAttribute('required');
                        document.getElementById('AdvisorPassword').removeAttribute('required');
                        animationInProgress = false;
                    }, 1000);

                }
            }
            window.addEventListener('beforeunload', function (event) {
                document.getElementById('studentID').value = '';
                document.getElementById('studentPasswordL').value = '';
                document.getElementById('advisorID').value = '';
                document.getElementById('advisorPasswordL').value = '';
                document.getElementById('StudentFirstName').value = '';
                document.getElementById('StudentLastName').value = '';
                document.getElementById('StudentEmail').value = '';
                document.getElementById('StudentPassword').value = '';
                document.getElementById('Faculty').value = '';
                document.getElementById('Major').value = '';
                document.getElementById('Semester').value = '';
                document.getElementById('AdvisorName').value = '';
                document.getElementById('Office').value = '';
                document.getElementById('AdvisorEmail').value = '';
                document.getElementById('AdvisorPassword').value = '';
                document.getElementById('Phone').value= '';
            });
            function formatPhoneNumber() {
                var phone = document.getElementById('Phone');
                var value = phone.value.replace(/\D/g, '');
                var formattedValue = "";
                for (var i = 0; i < value.length; i++) {
                    if (i == 3 || i==7)
                        formattedValue += " ";
                    if(i==0 && value[i]=='0')
                        formattedValue += value[i];
                    else if (i == 1 && value[i] == '1')
                        formattedValue += value[i];
                    else if(i == 2 && (value[i] == '0' || value[i] == '1' || value[i] == '2' || value[i] == '5'))
                        formattedValue += value[i];
                    else if(i > 2)
                        formattedValue += value[i];
                }
                phone.value = formattedValue;
            }
            function sfname() {
                var fname = document.getElementById('StudentFirstName');
                var value = fname.value;
                var formattedValue = "";
                for (var i = 0; i < value.length; i++) {
                    if ((value[i] >= 'a' && value[i] <= 'z') || (value[i] >= 'A' && value[i] <= 'Z') || value[i] == ' ') {
                        formattedValue += value[i];
                    }
                }
                fname.value = formattedValue;
            }
            function slname() {
                var lname = document.getElementById('StudentLastName');
                var value = lname.value;
                var formattedValue = "";
                for (var i = 0; i < value.length; i++) {
                    if ((value[i] >= 'a' && value[i] <= 'z') || (value[i] >= 'A' && value[i] <= 'Z') || value[i] == ' ') {
                        formattedValue += value[i];
                    }
                }
                lname.value = formattedValue;
            }
            function faculty() {
                var faculty = document.getElementById('Faculty');
                var value = faculty.value;
                var formattedValue = "";
                for (var i = 0; i < value.length; i++) {
                    if ((value[i] >= 'a' && value[i] <= 'z') || (value[i] >= 'A' && value[i] <= 'Z') || value[i] == ' ') {
                        formattedValue += value[i];
                    }
                }
                faculty.value = formattedValue;
            }
            function major() {
                var major = document.getElementById('Major');
                var value = major.value;
                var formattedValue = "";
                for (var i = 0; i < value.length; i++) {
                    if ((value[i] >= 'a' && value[i] <= 'z') || (value[i] >= 'A' && value[i] <= 'Z') || value[i]== ' ' ) {
                        formattedValue += value[i];
                    }
                }
                major.value = formattedValue;
            }
            function sem() {
                var sem = document.getElementById('Semester');
                var value = sem.value;
                var formattedValue = "";
                for (var i = 0; i < value.length; i++) {
                    if ((value[i] >= '0' && value[i] <= '9')) {
                        formattedValue += value[i];
                    }
                }   
                sem.value = formattedValue;
            }
            function aname(){
                var aname = document.getElementById('AdvisorName');
                var value = aname.value;
                var formattedValue = "";
                for (var i = 0; i < value.length; i++) {
                    if ((value[i] >= 'a' && value[i] <= 'z') || (value[i] >= 'A' && value[i] <= 'Z') || value[i] == ' ') {
                        formattedValue += value[i];
                    }
                }
                aname.value = formattedValue;
            }
            function studentIDF() {
                document.getElementById('studentIDfield').style.borderBottomColor = '';
                document.getElementById('studentIDLabel').style.color = '';
            }
            function studentPasswordLF() {
                document.getElementById('studentPasswordfield').style.borderBottomColor = '';
                document.getElementById('StudentPasswordLLabel').style.color = '';
            }
            function advisorIDF() {
                document.getElementById('advisorIDfield').style.borderBottomColor = '';
                document.getElementById('advisorIDLabel').style.color = '';
            }
            function advisorPaswordLF() {
                document.getElementById('advisorPasswordfield').style.borderBottomColor = '';
                document.getElementById('AdvisorPasswordLLabel').style.color = '';
            }

            function studentIPE() {
                localStorage.setItem('studentstatus','false');
                localStorage.setItem('page', 'student');
            }
            function advisorIPE() {
                localStorage.setItem('advisorstatus','false');
                localStorage.setItem('page', 'advisor');
                
            }
            if (localStorage.getItem('advisorstatus') === 'false') {
                localStorage.setItem('advisorstatus', 'true');
                document.getElementById('advisorIDfield').style.borderBottomColor = '#cc0000';
                document.getElementById('advisorIDLabel').style.color = '#cc0000';
                document.getElementById('advisorPasswordfield').style.borderBottomColor = '#cc0000';
                document.getElementById('AdvisorPasswordLLabel').style.color = '#cc0000';
            }
            if (localStorage.getItem('studentstatus') === 'false') {
                localStorage.setItem('studentstatus', 'true');
                document.getElementById('studentIDfield').style.borderBottomColor = '#cc0000';
                document.getElementById('studentIDLabel').style.color = '#cc0000';
                document.getElementById('studentPasswordfield').style.borderBottomColor = '#cc0000';
                document.getElementById('StudentPasswordLLabel').style.color = '#cc0000';
            }


        </script>
    </form>
</body>
</html>




