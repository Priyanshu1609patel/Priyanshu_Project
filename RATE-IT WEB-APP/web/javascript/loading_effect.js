$(document).ready(function(){
    $("#preloader").animate({
        "opacity":0
    },1000,"swing",function(){
        $("#preloader").css({"display":"none"})
    });
});