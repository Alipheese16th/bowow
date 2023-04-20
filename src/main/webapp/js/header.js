$(document).ready(function(){
	$(".lnb").hide();
	$("ul .lnb-down").mouseenter(function(){ $(this).children(".lnb").stop().slideDown(300);})
	$("ul .lnb-down").mouseleave(function(){ $(this).children(".lnb").stop().slideUp(300);})
	$("ul .lnb-down").click(function(){ $(this).children(".lnb").slideToggle(300);});
	$(".search").click(function(){
		$(".search-view").toggleClass("up");
	});
});