$(document).ready(function(){ 
                $("#profile_div").load("profile.jsp");
                document.getElementById("search-logo").style.left = document.getElementById("search").getBoundingClientRect().x + 40 +"px";
                $("#loginCheck").css("display","none");
                    $("#loginCheckContainer").css({"zIndex":"-2", "opacity":"0"});
                $("#alertClose").click(function(){
                    $("#loginCheck").css("display","none");
                    $("#loginCheckContainer").css({"zIndex":"-2", "opacity":"0"});
                });
                
                
            });

                
            if($(window).width() < 800){
                
            }
            $(".compareBtn").click(function(e){
                
                
                if(e.target.innerText === "Compare Now"){
                    var query = e.target.value;
                    window.location.assign("compare_poll_page.jsp?a="+query);
                }
                    
                
                else{
                // Ajax call to check for validation
                let query = this.value;
                $.post("CheckForLogin",function(response){
                    console.log(response)
                    if(response == false){
                    $("#errMsg").text(" To provide review, you have to login first. ");
                    $("#loginCheck").css("display","flex");
                    $("#loginCheckContainer").css({"zIndex":"2", "opacity":"1"});
                    }
                    else{
                        $.post("CheckReview",{"id":query},function(response){
                           if(response == true){
                    $("#errMsg").text(" You have already submitted review.");
                    $("#loginCheck").css("display","flex");
                    $("#loginCheckContainer").css({"zIndex":"2", "opacity":"1"});
                    $("#alertClose").text("Close");
                    $("#errBtn1").css("display","none");
                           } 
                           else{
                            window.location.assign("poll_review_page.jsp?a="+query);
                           }
                        });
                        
                    }
                }).fail(function(){
                    alert("Some error occured");
                })
            }
            });
            let searchlogo = 750;


            const searchLogo = document.getElementById("search-logo");
            
            searchLogo.addEventListener("click", () => {
                document.getElementById("search-logo").style.left = document.getElementById("search").getBoundingClientRect().right +"px";
                document.querySelector("#search input").style.opacity = "1";
            })

            const profileBtn = document.getElementById("profile_btn");

            profileBtn.addEventListener("click", showProfile);
            
            function showProfile(){
                if(document.getElementById("profile_btn") != null){
                document.querySelector(".container").style.opacity = "0.2";
                document.getElementById("profile_div").style.display = "block";
                }
                else{
                    $("#errMsg").text(" Please Login or Register first. ");
                    $("#loginCheck").css("display","flex");
                    $("#loginCheckContainer").css({"zIndex":"2", "opacity":"1"});
                }
             }


            // console.log(profileClose)
            function closeProfile() {
                document.querySelector(".container").style.opacity = "1";
                document.getElementById("profile_div").style.display = "none";
            }

            function saveProfile() {
                let arr = document.getElementsByClassName("profile_input");
                // console.log(arr);
                for (var i = 0; i < arr.length; i++) {
                    arr[i].setAttribute("disabled", "true");
                    // console.log(arr[i])
                }
                $("#Profile_loading").show("slow");
                updateData();
                document.getElementById("save_btn").style.display = "none";
                document.getElementById("newImageContainer").style.display = "none";
            }

            function editProfile() {
                let arr = document.getElementsByClassName("editable");
                 console.log(arr);
                document.getElementById("save_btn").style.display = "block";
                for (var i = 0; i < arr.length; i++) {
                    arr[i].removeAttribute("disabled");
                    // console.log(arr[i])
                }
                                
                document.getElementById("profile_edit_btn").style.display = "none";
                document.getElementById("newImageContainer").style.display = "table-row";
            }


        
            function updateData(){
                const name = document.getElementById("name").value;
                const image = document.getElementById("get_profile_pic");
                
                let form = new FormData();
                if(image.files.length !== 0)
                form.append('profile_image',image.files[0]);
                form.append('name',name);
                
                let xhr = new XMLHttpRequest();
                xhr.open("post","Update_user_profile");
                xhr.send(form);
                
                xhr.upload.onerror = function(){
                    console.log("some Error occured")
                }
                xhr.upload.onloadend = function(){
                    console.log("success")
                }
                xhr.onreadystatechange = function(){
                    if(xhr.readyState == 4){
                        $("#Profile_loading").hide("slow");
                        document.getElementById("profile_edit_btn").style.display = "block";
                        document.getElementById("save_btn").style.display = "none";
                        alert("Profile Updated");
                        window.location.assign(window.location.href);
                    }
                }
            }
            function searchCompany(){
                if($("#search input").val().length > 2){
//                    let linkref = "comp_review_page.jsp";
//                    let query = "?name="+$("#search input").val();
//                    
//                    window.location.assign(linkref+query);
                    window.location.href = ("comp_review_page.jsp?name=" + $("#search input").val());
                }
                
            }