// JavaScript Document

$(document).ready(function(e) {
    $('a.allresult').click(function(){
		$('ul.sub').slideToggle();
		})
	$('#advancesearch').click(function(){
		$('.search-panel').slideToggle();
		})
	$('.nav-bar-toggle').click(function(){
		$('ul#subnav').slideToggle();
		
		})
	$(window).load(function(){
			$("#video_paenl-1").mCustomScrollbar({});
		});
	 $('ul.tabs li').hover(function(){
        var tab_id = $(this).attr('data-tab');
        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');
        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    })
	   $('#slide1').click(function(){
    var hidden = $('.hidden1');
    if (hidden.hasClass('visible1')){
        hidden.animate({"width":"0%"}, "slow").removeClass('visible1');
    } else {
        hidden.animate({"width":"95%"}, "slow").addClass('visible1');
    }
    });
	
});






