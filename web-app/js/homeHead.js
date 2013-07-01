<script type="text/javascript">
$(document).ready(function() {
	  $(".content ul.navMenu li ul").hide(); 
	  $(".content ul.navMenu li a").click(function(){
	  $(this).next().toggle('slow');
	 });
});



$(document).ready(function() {
	$("#play").css("display","none");
    $('.slideshow').cycle({
		fx:     'scrollVert', 
    	timeout: 5000, 
    	delay:  -2000,
		next: '#prev',
		prev: '#next',
		rev: 1
	});

	//$("#next").click(function() {
	  //$('.slideshow').cycle('resume');
	//});
	
	$("#pause").click(function() {
	  $('.slideshow').cycle('pause');
	  $("#play").css("display","block");
	  $(this).css("display","none");
	});
	
	$("#play").click(function() {
	  $('.slideshow').cycle('resume');
	  $(this).css("display","none");
	  $("#pause").css("display","block");
	});
	
	//$("#prev").click(function() {
	  //$('.slideshow').cycle('resume');
	//});
	
	$(".slideshow").hover(function() {
		$(".whatwedo-nav").stop().animate({ opacity: 0.5 }, 800);
	},
	function() {
		$(".whatwedo-nav").stop().animate({ opacity: 0 }, 800);
	});
	
	$(".whatwedo-nav").hover(function() {
		$(this).stop().animate({ opacity: 0.8 }, 800);
	});	


});

$(document).ready(function() {
	 $('#list').click(function() {
		 alert("hi");
		  $('.hi').removeClass('hi');
	        $(this).addClass('hi');
	 });
});


  $(window).load(function() {
    $('#domain').flexslider({
	controlNav: false,
	direction: "horizontal",
	animation: "slide",
	slideshow: false,
	itemWidth: 304,
	animationLoop: false, 
	minItems: 1,
	maxItems: 3,	
	startAt: 0
	});
  });
</script>

<%--Code for Pagination using Jquery--%>

<script type="text/javascript">
$(document).ready(function(){
	
	//how much items per page to show
	var show_per_page = 12; 
	//getting the amount of elements inside content div
	var number_of_items = $('#content').children().size();
	//calculate the number of pages we are going to have
	var number_of_pages = Math.ceil(number_of_items/show_per_page);
	
	//set the value of our hidden input fields
	$('#current_page').val(0);
	$('#show_per_page').val(show_per_page);
	
	//now when we got all we need for the navigation let's make it '
	
	/* 
	what are we going to have in the navigation?
		- link to previous page
		- links to specific pages
		- link to next page
	*/
	var navigation_html = '<a class="previous_link" href="javascript:previous();"><<</a>';
	var current_link = 0;
	while(number_of_pages > current_link){
		navigation_html += '<a class="page_link" href="javascript:go_to_page(' + current_link +')" longdesc="' + current_link +'">'+ (current_link + 1) +'</a>';
		current_link++;
	}
	navigation_html += '<a class="next_link" href="javascript:next();">>></a>';
	
	$('#page_navigation').html(navigation_html);
	
	//add active_page class to the first page link
	$('#page_navigation .page_link:first').addClass('active_page');
	
	//hide all the elements inside content div
	$('#content').children().css('display', 'none');
	
	//and show the first n (show_per_page) elements
	$('#content').children().slice(0, show_per_page).css('display', 'block');
	
});

 function Back() {window.history.back();} 

 

function previous(){
	
	new_page = parseInt($('#current_page').val()) - 1;
	//if there is an item before the current active link run the function
	if($('.active_page').prev('.page_link').length==true){
		go_to_page(new_page);
	}
	
}

function next(){
	new_page = parseInt($('#current_page').val()) + 1;
	//if there is an item after the current active link run the function
	if($('.active_page').next('.page_link').length==true){
		go_to_page(new_page);
	}
	
}

function go_to_page(page_num){
	//get the number of items shown per page
	var show_per_page = parseInt($('#show_per_page').val());
	
	//get the element number where to start the slice from
	start_from = page_num * show_per_page;
	
	//get the element number where to end the slice
	end_on = start_from + show_per_page;
	
	//hide all children elements of content div, get specific items and show them
	$('#content').children().css('display', 'none').slice(start_from, end_on).css('display', 'block');
	
	/*get the page link that has longdesc attribute of the current page and add active_page class to it
	and remove that class from previously active page link*/
	$('.page_link[longdesc=' + page_num +']').addClass('active_page').siblings('.active_page').removeClass('active_page');
	
	//update the current page input field
	$('#current_page').val(page_num);
}

function wait(ms) {
    var d = new Date(), c;
    do { c = new Date(); } while(c-d < ms);
}


function disp_confirm(e)
{
	
	if(document.getElementById('userSession').value=='N'){
		
		var r=confirm("You need to sign in or register before continuing!")
		if (r==true)
		  {	  
			  var location="${basePath}" + "/login";
			  var goToPath= "${path}";
			  window.location.href= location + "?" + "goToPath=${path}";			  		
		      return false;			  
		  }
		else
		  {	  		
		     return false;
		  }
	}else{

			  var username ="${loggedInUserInfo(field:'username')}";	
			  hrefValue = e.href.split('/');		  
			  var downloadables= hrefValue[5];			
			  ${remoteFunction(controller: 'downloadReport', action: 'save',params:'\'username=\'+username+\'&downloadables=\'+downloadables')}			 	  		
		      return true;
	  		
		}

}


</script>
<style>
#page_navigation a{
	padding:3px;
	/*border:1px solid gray;*/
	margin:3px;
	color: #666666;
	text-decoration:none
}
.active_page{
	/*background:darkblue;*/
	color: #572773 !important;
	font-weight: bold;
}
.previous_link, .next_link{
	display:inline;
	color: #000000 !important;
}
</style>