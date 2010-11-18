$(document).ready(function() {

// Expand Panel
$("#water").click(function(){
$("div#panel").slideDown("slow");
$("div#panel").animate({top: '-=50px'}, "slow");

});	

$("#education").click(function(){
$("div#panel").slideDown("slow");
$("div#panel").animate({top: '-=50px'}, "slow");


});	

$("#energy").click(function(){
$("div#panel").slideDown("slow");
$("div#panel").animate({top: '-=50px'}, "slow");


});	

$("#health").click(function(){
$("div#panel").slideDown("slow");
$("div#panel").animate({top: '-=50px'}, "slow");


});	

// Collapse Panel
$("#close").click(function(){
$("div#panel").slideUp("slow");	
});		

// Switch buttons from "Log In | Register" to "Close Panel" on click
$("#toggle a").click(function () {
$("#toggle a").toggle();
});		

});
