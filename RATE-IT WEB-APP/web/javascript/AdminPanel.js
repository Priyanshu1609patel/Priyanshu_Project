

/* JQUERY PART */

$(document).ready(function () {
    
//            const Admin_password_forLogin = "1234";
//            let pass = prompt("Enter Admin key");
//            if (Admin_password_forLogin != pass){
//            alert("You are not authenticated user.");
//            window.location.assign("error_page.jsp");
//            }
            // this will focus on  the clicked element
            
            $("tr a").click(function (a) {
            $("td").css({ "background-color": "rgba(12, 12, 12, 0.959)", "color": "white" });
            $(a.target).parent().css({ "background": " white", "color": "black" })
            })
            
            
    })
        
        // CODE TO CHANGE PAGE 
$("#filter").change(function () {
        let option = $("#filter").val();
        $.post("FilterCompany", { "value": option }, function (response) {
        console.log(response)
    });
});

$("#searchById").change(function (){
        let companyId = $("#searchById").val();
        
        $(".cmpReport").hide();
        $(".cmp"+companyId).show();
})

$("#searchByName").change(function (){
        let companyName = $("#searchByName").val().toLowerCase();
        $("#searchById").val("");
        
        $(".cmpReport").hide();
        let all = $(".companyName");
        
        for(let i = 0; i < all.length; i++)
        {
                if(all[i].value.trim().toLowerCase().includes(companyName)){
                $(all[i].parentNode).show();
                }
        }
})

/* JAVASCRIPT FOR OTHER PART */

         // SEARCH BAR [ FILTER COMPANY ]
