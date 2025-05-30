console.log("Jay Shree krishna")

$(document).ready(function(){
    let count = 0;
    
    // code to add new item in the checkbox list
    $("#add_item").click(function(){
       let text = $("#add-text").val();
       console.log(text)
       if(text != ""){
           let item = document.createElement("input");
           item.setAttribute("value",text);
           item.setAttribute("type","checkbox");
           item.setAttribute("name","services");
           item.setAttribute("checked","true")
           console.log(item)
           $("#services").append(item)
           $("#services").append(text + "<br>")   
       }
   }) 


});


            function saveProfile1() {
                let arr = document.getElementsByClassName("profile_input");
                // console.log(arr);
                for (var i = 0; i < arr.length; i++) {
                    arr[i].setAttribute("disabled", "true");
                    arr[i].style.border = "none";
                }
                $("#addnewDiv").hide(500); 

                
                updateData1();
                document.getElementById("save_btn").style.display = "none";
                $("#profile_edit_btn").show();
            }

            function editProfile1() {
                let arr = document.getElementsByClassName("editable");
//                console.log(arr);
                 
                for (var i = 0; i < arr.length; i++) {
                    arr[i].removeAttribute("disabled");
                    arr[i].style.borderBottom = "1px solid black";
                    // console.log(arr[i])
                }
                  $("#addnewDiv").show(500);         
                document.getElementById("profile_edit_btn").style.display = "none";
                document.getElementById("save_btn").style.display = "block";

            }

            function updateData1(){
                
                const name = document.getElementById("name").value;
                const email = document.getElementById("email").value;
                let category = document.getElementById("category").value;
                let services = new Array();
                
                (document.getElementsByName("services")).forEach((val,i)=>{
                        if(val.checked)
                        services.push(val.value);
                });
                
                services = services.join(",");
                
//                console.log(services)
                
                $.post("Company_Profile_Update",
                       {"name":name,
                        "email":email,
                        "category":category,
                        "services":services}
                ,function(response){
                    if(response == false){
                        alert("Invalid inputs");
                    }
                    else{
                        alert("Data updated successfully");
                    }
                });
//                $.post("Company_Profile_Update",
//                       {"name":name,
//                        "email":email,
//                        "category":category,
//                        "services":services}
//                ,function(response){
//                    if(response == false){
//                        console.log("Nope done");
//                    }
//                    else{
//                        console.log("Done");
//                    }
//                });
            }
        
