
        let login = document.getElementById('Login');
        let signUp = document.getElementById('Signup');
        let sendMail = document.getElementById('submit_btn1');
        const eAlert = document.getElementById('emailAlert');
        const pAlert = document.getElementById('passwordAlert');


        let secretUotp;

        function changeBack() {
            login.style.left = "-420px";
            signUp.style.left = "0px";
        }


        sendMail.addEventListener("click", () => {
            const toMail = document.getElementById('Uemail').value;
            
            if (toMail == "") {
                eAlert.innerText = "Please Enter Your Email";
                return;
            }
            
            
            else {
                const reg = new RegExp(/@/g);
                flag = reg.test(toMail);
                console.log("Flag value = " + flag)

                if (flag == true) {
                    const index = toMail.indexOf("@");

                    console.log("index of @ = " + index)
                    if (index > 0) {

                        console.log("test = " + toMail.charAt(0))
                        if (!(toMail.charAt(0) >= 'a' && toMail.charAt(0) <= 'z')) {
                            eAlert.innerText = "Invalid Email";
                            return;
                        }

                        console.log("test -1  = " + toMail.indexOf('.'))
                        if (toMail.indexOf('.') != (-1)) {
                            const i = toMail.lastIndexOf('.');

                            console.log("test -2 ")
                            console.log("index of . = " + i)
                            if (i == (toMail.length - 3) || i == (toMail.length - 4)) {
                                console.log(toMail.charAt(toMail.length - 3));
                                console.log(toMail.charAt(toMail.length - 4));
                            }
                            else {
                                document.getElementById('Uemail').focus()
                                return false;
                            }
                        }//vinay@koshti.com (16) 
                    }
                    else {
                        eAlert.innerText = "Invalid Email"
                        document.getElementById('Uemail').focus()
                        return false;
                    }
                }
                else {
                    eAlert.innerText = "Invalid Email"
                    document.getElementById('Uemail').focus()
                    return false;
                }
            }

            if(valEmail(toMail) == false){
                return false;
            }
            
            secretUotp = parseInt(Math.random() * 10000);
            var secretCode = secretUotp.toString().padStart(4, '0');

        })
        
        function valEmail(email){
            
//            document.getElementById("notifyMsg").innerText = "sending email";
            
            console.log(email)
            var flag = true;
            
            $.post("Forgot",{"email":email},function(response){
                console.log("Response = "+response)
        if(response == true){
                              
            secretUotp = parseInt(Math.random() * 10000);
            var secretCode = secretUotp.toString().padStart(4, '0');

            Email.send({
                SecureToken: "361ab572-fa6a-4d36-be67-4df54bf85368",
                To: `${email}`,
                From: "rateit.contact@gmail.com",
                Subject: "Rete it : Authentication",
                Body: `Dear User, <br><br> You are welcome to our site we want customers like you .<br><br> Your OTP is :  ${secretCode} <br> <b style="color:red;"> Good to have you on our site... </b> <br> keep visit our site, Thanks !`
            }).then(
                message => alert("send mail successfully")
            );  
  
        }
        else{
            $("#emailAlert").text("User doesn't exist")
        }
        
            });
            
            return flag;
        }
        
        function clearAlert() {
            eAlert.innerText = "";
        }

        function validateTheOTP() {
            const enteredOTP = document.getElementById('UserOTP').value;
            const toMail = document.getElementById('Uemail').value;


            if (secretUotp == enteredOTP) {
                alert("successfully authenticated it's you.");
                changeBack();
            }
            else {
                if (toMail == "") {
                    document.getElementById('Uemail').focus;
                    alert("Please Enter Email first")
                }
                else
                    alert("Please enter the correct OTP.")
            }
        }

        function newCheck() {
            const pass = document.getElementById('Upassword').value;



            if (pass.length <= 7) {
                pAlert.innerText = "Password must between 8 to 15 letters";
            }
            else if (pass.length >= 8 && pass.length <= 15) {
                var reg = new RegExp(/[$&+,:;=?@#|'<>.-^*()%!]/g);
                var flag = reg.test(pass);
                console.log("flag = " + flag)

                if (flag == false) pAlert.innerText = "Please use any special character";
                else if (flag == true) {
                    pAlert.innerText = "";

                    var reg = new RegExp(/[0-9]/g);
                    var flag = reg.test(pass);
                    console.log("flag = " + flag)

                    if (flag == false) pAlert.innerText = "password must contain digit";
                    else pAlert.innerText = "";
                }
            }
        }

        function validatePassword() {
            const pass = document.getElementById('Upassword').value;
            const cpass = document.getElementById('Ucpassword').value;

            if (pass == "" || cpass == "") {
                pAlert.innerText = "Please Enter The Password";
            }
            if (pass == cpass) {
                alert("Password changed successfully ")
                pAlert.innerText = "";
                window.location.href = "../index.html"
            }
            else {
                document.getElementById('Ucpassword').style.borderColor = "red";
                pAlert.innerText = "Both password are not same";
            }
        }


