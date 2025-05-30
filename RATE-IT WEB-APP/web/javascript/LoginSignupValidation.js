
        const upperButtons = document.getElementsByClassName(".upper-btn");
        const buttonBack = document.getElementById('btn');
        let left = 0;
        const login = document.getElementById('Login');
        const signUp = document.getElementById('Signup');
        const container = document.querySelector(".form-box");
        const register = document.getElementById('submit_btn');
        const eAlert = document.getElementById('emailAlert');
        const alertUname = document.getElementById('alertUname');
        const pAlert = document.getElementById('alertPass');
        const passAlert = document.getElementById('alertRPass');
        const bothpass = document.getElementById('bothCheck')

        document.getElementById('Uname').focus();

        function changeBack() {
            if (left == 0) {
                buttonBack.style.left = "200px";
                login.style.left = "-420px";
                signUp.style.left = "0px";
                container.style.height = "480px";
                document.getElementById('URname').focus();
                left = 200;
            }
            else {
                buttonBack.style.left = 0 + "px";
                signUp.style.left = "420px";
                login.style.left = "0px";
                document.getElementById('Uname').focus();
                left = 0;
                container.style.height = "420px";
            }
        }

        function validateLogin() {
            // Validation of UserID or Email
            const userName = document.getElementById('Uname').value;
            const pass = document.getElementById('Upassword').value;
            let reg = new RegExp(/@/g);
            if (reg.test(userName) == true) {
                if (validateEmail(userName, alertUname) == true) {
                    console.log("successfully checked");
                }
                else {
                    console.log("enter correct")
                    return false;
                }

            }

            if (checkPassword(pass, pAlert) == false)
                return false;
            sessionStorage.setItem("RateitLOGGEDIN","true");
            return true;

        }


        function validateReg() {
            const pass = document.getElementById('URpassword');
            const cpass = document.getElementById('URcpassword');
            /// Validation of user name
            if (checkName() == false)
                return false;

            const toMail = document.getElementById('URmail').value;
            if (validateEmail(toMail, eAlert) == false)
                return false;
            /// Validation of password
            if (checkPassword(pass.value, passAlert) == false)
                return false;

            if (validatePassword() == false)                                                /// Validation of confirm password ;
                return false;                                                 /// Validation of email

               sessionStorage.setItem("RateitLOGGEDIN","true");

            return true;

        }

        function checkName() {
            const name = document.getElementById('URname').value;
            const nameAlert = document.getElementById("usernameAlert");
            let reg = new RegExp(/[^a-z | ^A-Z]/g);

            if (name.length <= 2) {
                nameAlert.innerText = "Please enter with surname";
            }
            if (reg.test(name) == true) {
                nameAlert.innerText = "Name must be in letters";
                return false;
            }
            else
                nameAlert.innerText = "";

        }

        function validateEmail(toMail, emailAlert) {
            if (toMail == "") {
                eAlert.innerText = "Please Enter Your Email";
                return false;
            }
            else {
                const reg = new RegExp(/@/g);
                flag = reg.test(toMail);
                // console.log("Flag value = "+flag)

                if (flag == true) {
                    const index = toMail.indexOf("@");

                    // console.log("index of @ = "+index)
                    if (index > 0) {

                        console.log("test = " + toMail.charAt(0))
                        if (!(toMail.charAt(0) >= 'a' && toMail.charAt(0) <= 'z')) {
                            emailAlert.innerText = "Invalid Email";
                            //alertUname.innerText = "Invalid Email";
                            return false;
                        }

                        console.log("test -1  = " + toMail.indexOf('.'))
                        if (toMail.indexOf('.') != (-1)) {
                            const i = toMail.lastIndexOf('.');

                            console.log("test -2 ")
                            // console.log("index of . = "+i)
                            if (i == (toMail.length - 3) || i == (toMail.length - 4)) {
                                // console.log(toMail.charAt(toMail.length-3))
                                // console.log(toMail.charAt(toMail.length-4))
                                emailAlert.innerText = "";
                                return true;
                            }
                            else {
                                // document.getElementById('Umail').focus()
                                return false;
                            }
                        }//vinay@koshti.com (16) 
                        else {
                            emailAlert.innerText = "Invalid Email"; return false;
                        }
                    }
                    else {
                        emailAlert.innerText = "Invalid Email"
                        // document.getElementById('Umail').focus()
                        return false;
                    }
                }
                else {
                    emailAlert.innerText = "Invalid Email"
                    // document.getElementById('Umail').focus()
                    return false;
                }
            }
        }

        function validateUserName(UserName) {
            let reg = new RegExp(/[^a-zA-Z0-9 | #]/g);

            if (reg.test(UserName) == true) {
                alertUname.innerText = "Please Enter Valid Name";
                return false;
            }

            // console.log(UserName.substring(0,5));

            if (UserName.length <= 5) {
                alertUname.innerText = "Entered Invalid User Name";
                return false;
            }
            if (UserName.substring(0, 5) != "user#") {
                alertUname.innerText = "Invalid UID. Must start with : \"user#\"";
                return false;
            }
            alertUname.innerText = "";
        }

        function checkPassword(pass, pAlert) {


            if (pass.length <= 7) {
                pAlert.innerText = "Password must between 8 to 15 letters";
                return false;
            }
            else if (pass.length >= 8 && pass.length <= 15) {
                var reg = new RegExp(/[$&+,:;=?@#|'<>.-^*()%!]/g);
                var flag = false;
                flag = reg.test(pass);
                console.log("flag = " + flag)

                if (flag == false) {
                    pAlert.innerText = "Please use any special character";
                    return false;
                }
                else {
                    pAlert.innerText = "";

                    var reg = new RegExp(/[0-9]/g);
                    var flag = reg.test(pass);
                    // console.log("flag = "+flag)

                    if (flag == false) {
                        pAlert.innerText = "password must contain digit";
                        return false;
                    }
                    else pAlert.innerText = "";
                }
            }
            else {
                pAlert.innerText = "Length Must not greater than 15";
            }
        }


        function validatePassword() {
            const pass = document.getElementById('URpassword').value;
            const cpass = document.getElementById('URcpassword').value;

            if (pass == "" || cpass == "") {
                bothpass.innerText = "Please Enter The Password";
                return false;
            }
            if (pass == cpass) {
                alert("Account Created Successfully")
                bothpass.innerText = "";
                //window.location.href = "../index.html"
            }
            else {
                document.getElementById('URcpassword').style.borderColor = "red";
                bothpass.innerText = "Both password are not same";
                return false;
            }
        }
        