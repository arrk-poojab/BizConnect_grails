<meta charset="utf-8" />
<title><g:layoutTitle default="${message(code:'page.title.Bizconnect',default:'Bizconnect')}"/></title>
<meta name="viewport" content="width=device-width, initial-scale = 1.0, maximum-scale = 1.0" />
<% def basePath=(request.getScheme()+':'+'//'+request.getServerName()+':'+request.getServerPort()+request.contextPath+'/') %>


<base href="${basePath}" />

<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/text.css" />
<link rel="stylesheet" href="css/960.css" />
<link rel="stylesheet" href="css/flexslider.css" />
<link rel="stylesheet" href="css/cycle.css" />
<link rel="stylesheet" href="css/jcarousel.css" />
<link rel="stylesheet" href="css/arrk.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/responsiveslides.css" />
<link rel="stylesheet" href="css/themes.css" />


<g:javascript src="jquery.min.js"/>
<g:javascript src="jquery.flexslider.js"/>
<g:javascript src="highlight.js"/>
<g:javascript src="jquery.placehold.js"/>
<g:javascript src="jquery.jcarousel.min.js"/>
<g:javascript src="response.js"/>




<script type="text/javascript" charset="utf-8">

/**********************************************************************/
/* Flexslider 
/**********************************************************************/


  $(window).load(function() {
	    $("#sector1").addClass("flex-active");
	   
     $('#homeSlider').flexslider({
		controlNav: true,
		direction: "horizontal",
		animation: "slide",
		pauseOnAction: true,
		pauseOnHover: true,
		//pausePlay: true,
             slideshow: true,
		slideshowSpeed: 7000,
		after: afterSlide	
	});


	
	 
  $("#sector1").click(function(event) {
	  
     event.preventDefault();
       
  
 $('#homeSlider').flexslider("pause");
 	 $('#homeSlider').flexslider(0);
      	 $('#homeSlider').flexslider("play");
	 
  });
  
  
  $("#sector2").click(function() {
	  
	  var productChannels;
	  var secondChannel;
	  
	  if((document.getElementById('countSlides').value!=null) && (document.getElementById('countSlides').value!='')){
		     productChannels = document.getElementById('countSlides').value.split('-');
	    	 secondChannel = parseInt(productChannels[0]);
	  }
		        	
    	 $('#homeSlider').flexslider("pause");
	 $('#homeSlider').flexslider(secondChannel);
	 $('#homeSlider').flexslider("play");
 
  });
  
    $("#sector3").click(function() {
          
  	var productChannels;
	var thirdChannel;
	  
	 if((document.getElementById('countSlides').value!=null) && (document.getElementById('countSlides').value!='')){
		     productChannels = document.getElementById('countSlides').value.split('-');
		     thirdChannel = parseInt(productChannels[0]) + parseInt(productChannels[1]);
	  }
	
     	$('#homeSlider').flexslider("pause");
	$('#homeSlider').flexslider(thirdChannel);
	$('#homeSlider').flexslider("play");
 
  });
  
    $("#sector4").click(function() {

   	  var productChannels;
   	  var fourthChannel;
   	  
   	  if((document.getElementById('countSlides').value!=null) && (document.getElementById('countSlides').value!='')){
   		     productChannels = document.getElementById('countSlides').value.split('-');
   		     fourthChannel = parseInt(productChannels[0]) + parseInt(productChannels[1]) + parseInt(productChannels[2]);
   	  }
   	  
     	 $('#homeSlider').flexslider("pause");
	 $('#homeSlider').flexslider(fourthChannel);
	 $('#homeSlider').flexslider("play");
 
  });

    $(".homeslider-play").css("display","none");
    
	$(".homeslider-pause").bind ('touchstart', function() {
		$(".homeslider-play").css("display","block");
		$('#homeSlider').flexslider("pause");
		return false;
	});
	
	$(".homeslider-play").bind ('touchstart', function() {
		$(".homeslider-pause").css("display","block");
		$(".homeslider-play").css("display","none");
		$('#homeSlider').flexslider("play");
		return false;
	});

	$('#homeSlider').bind ('touchstart', function(){
		$(".homeslider-play").css("display","block");
	});

	
  $(".flex-control-nav.flex-control-paging").css("display","none");

	
  });
  
<%--  function afterSlide(){--%>
<%--  --%>
<%--  resetSectors();--%>
<%-- // alert("id "+($(".flex-active-slide").attr("id")));--%>
<%--  var tokens = $(".flex-active-slide").attr("id").split('-');--%>
<%-- // alert("tokens.."+tokens)--%>
<%--  sectorNo = tokens[1];--%>
<%--  $("#sector"+sectorNo).addClass("flex-active");--%>
<%--  }--%>
<%--  --%>

function afterSlide(){
	  
	  resetSectors();
	  if(($(".flex-active-slide").attr("id")) != null && ($(".flex-active-slide").attr("id"))!=""){
		  var tokens = $(".flex-active-slide").attr("id").split('-');
		  if(tokens[1]!=""){
			  sectorNo = tokens[1];
			  $("#sector"+sectorNo).addClass("flex-active");
		  }
	  }
 }
  function resetSectors(){
  
  $("#sector1").removeClass("flex-active");
  $("#sector2").removeClass("flex-active");
  $("#sector3").removeClass("flex-active");
  $("#sector4").removeClass("flex-active");
  
  
  }


    
</script>



<g:javascript src="ag_sitesearch.js"/>
<script>
/**********************************************************************/
/* Google Search
/**********************************************************************/
$(document).ready(function() {
 

	var x = $(window).width();
	if(x < 750) {		
		$('.phone-menu').toggle(function() {
			$(this).closest(".nav").find("ul").slideDown();
		}, function() {
			$(this).closest(".nav").find("ul").slideUp();
		});
	} else{
		$(".nav").find("ul").show();
	}



$(".search-btn").click(function() {  
  var data= document.getElementById('s').value;
  var location="${basePath}" + "google";
  window.location.href= location + "?" + "search="+data;

 });
});

</script>

<script>
$(document).ready(function() {

function GetURLParameter(sParam)
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) 
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) 
        {
            return sParameterName[1];
        }
    }
}

var tech = GetURLParameter('search');

if(tech){
	var n=tech.indexOf("%20"); 

    while(n != -1){

    	tech = tech.replace("%20"," "); 

        n = tech.indexOf("%20"); 

    }

	var p=tech.indexOf("%27"); 

    while(p != -1){

    	tech = tech.replace("%27","'"); 

        p = tech.indexOf("%27"); 

    }

document.getElementById('s').value=tech;

$("#submitButton").submit();
}
});
</script>



<script>
/**********************************************************************/
/* Twitter
/**********************************************************************/
$(window).load(function() {
//	alert('in ajax');
	$.ajax({
	     type: "GET",
	     url: "/twitter/index",
	     dataType: "json",
	     cache: true,
	     traditional: true,
	     success: function(response){
	     //do your stuff with the JSON data  
        var jsonString = JSON.stringify(response);       
         $.each(response, function(i, tweets){
        	 for(i=0;i<3;i++){
        		 if(tweets[i].retweetedStatus == undefined){
					//	alert(tweets[i].user.screenName);
						$('#name_'+i).append('<a href="https://twitter.com/' + tweets[i].user.screenName + '">' + tweets[i].user.screenName + '</a>');
						$('#para_'+i).append(tweets[i].text);
						$('#date_'+i).append(tweets[i].user.createdAt);	
						$('#link_'+i).append('<a href="' + tweets[i].user.URL + '">' + tweets[i].user.URL + '</a>');				
					//	$('#result5').append('<li>' +tweets[i].source + '</li>');
                 	}else{
                     	//here are the retweets
                 		$('#name_'+i).append('<a href="https://twitter.com/' + tweets[i].retweetedStatus.user.screenName + '">' + tweets[i].retweetedStatus.user.screenName + '</a>');
                 		$('#para_'+i).append(tweets[i].retweetedStatus.text);
                 		$('#date_'+i).append(tweets[i].retweetedStatus.user.createdAt);
                 		$('#link_'+i).append('<a href="' + tweets[i].retweetedStatus.user.URL + '">' + tweets[i].retweetedStatus.user.URL + '</a>');				
						//$('#result5').append('<li>' +tweets[i].retweetedStatus.source + '</li>');
                     	}					
               	 }       	 
	        });             
	     },
		 error: function(request, status, error) {
		       // alert("Error"+error)
		 }    
   }); 
});

</script>

 <script type="text/javascript">
/**********************************************************************/
/* This adds 'placeholder' to the items listed in the jQuery .support object. 
/**********************************************************************/
  	$(function() {
		$("#searchForm input").blur();
		$("#j_username").focus();
				
	});


jQuery(function() {
   jQuery.support.placeholder = false;
   test = document.createElement('input');
   if('placeholder' in test) jQuery.support.placeholder = true;
});
// This adds placeholder support to browsers that wouldn't otherwise support it. 
$(function() {

   if(!$.support.placeholder) { 

      var active = document.activeElement;
      $(':text').focus(function () {
         if ($(this).attr('placeholder') != '' && $(this).val() == $(this).attr('placeholder')) {

            $(this).val('').removeClass('hasPlaceholder');
         }
      }).blur(function () {
         if ($(this).attr('placeholder') != '' && ($(this).val() == '' || $(this).val() == $(this).attr('placeholder'))) {
            $(this).val($(this).attr('placeholder')).addClass('hasPlaceholder');
         }
      });
      $(':text').blur();
      $(active).focus();
      $('form:eq(0)').submit(function () {
         $(':text.hasPlaceholder').val('');
      });

   }
});

$(document).ready(function() {
	 $('#domainExpertise .slides').jcarousel({
        scroll:1
	});
});


</script>




<script>
/**********************************************************************/
/* Tool tip
/**********************************************************************/
/**window.onload=function(){
 {
  enableTool("freetrial")
  enableTool("rssIcon")
  enableTool("bpshover")  
 };} ***/

$(document).ready(function(){

 //vcardct = $("#vcard").length;
 //if(vcardct>0){
 //{
  //enableTool("vcard")
  //enableTool("qr")
 //};}
 
 vcardct = $("#vcard").length;
 qrcode = $("#qr").length;
 if(vcardct>0 && qrcode>0){
 {
  enableTool("vcard")
  enableTool("qr")
 };}
/**********************************************************************/
/* To top of page
/**********************************************************************/
	$("#top").hide();
	$(window).scroll(function() { 
		if($(window).scrollTop() > 180) {
			$("#top").hide("slow");
		  } else {
			$("#top").hide("slow");
		}
	});	
	$("#top a").click(function() {
		$('html,body').animate({scrollTop:0}, document.body.scrollHeight);	
		return false;
	});
/**********************************************************************/
/* To bottom  of page
/**********************************************************************/
	$("#bottom").hide();
	$(window).scroll(function() { 
         var scrollBottom = $(window).scrollTop() + $(window).height();
		if(scrollBottom  > 400) {
			$("#bottom").hide("slow");
		  } else {
			$("#bottom").hide("slow");
		}
	});	
	$("#bottom a").click(function() {
              $('html,body').animate({scrollTop:document.body.scrollHeight}, 0);	
		return false;
	});
/**********************************************************************/
/* Fixing IE 6.0 navigation menu hover effect
/**********************************************************************/ 
	$("#navigation li a").hover(
      function () {
        $(this).parent().addClass("active");
      }, 
      function () {
        $(this).parent().removeClass("active");
      }
    );
/**********************************************************************/
/* Skip content / nav effect
/**********************************************************************/ 
	$("#skip .skipnavigation").click(function() {
		$('html,body').animate({scrollTop:190}, 400);	
		return false;
	});
	$("#skip .skipcontent").click(function() {
		$('html,body').animate({scrollTop:597}, 400);	
		return false;
	});
/**********************************************************************/
/* Fixing IE 6.0 submit button hover effect
/**********************************************************************/
	$("input[type=submit]").hover(
      function () {
        $(".submit").css({backgroundPosition:"0 -39px",color:"#2C2C2C"});
      }, 
      function () {
        $(".submit").css({backgroundPosition:"0 0",color:"#fff"});
      }
    );
/**********************************************************************/
/* Management slide boxes effect
/**********************************************************************/

		//Caption Sliding (Partially Hidden to Visible)
		$('.boxgridLeft, .boxgridRight, .caption').hover(function(){
			$(".cover", this).stop().animate({top:'0px'},{queue:false,duration:160});
		}, function() {
		$(".cover", this).stop().animate({top:'195px'},{queue:false,duration:160});
		});
/**********************************************************************/
/* Dynamic Tag
/**********************************************************************/ 
$(function(){

jQuery.extend( jQuery.easing,{
	easeInOutExpo: function (x, t, b, c, d){
		if (t==0) return b;
		if (t==d) return b+c;
		if ((t/=d/2) < 1) return c/2 * Math.pow(2, 10 * (t - 1)) + b;
		return c/2 * (-Math.pow(2, -10 * --t) + 2) + b;
	},
	easeInExpo: function (x, t, b, c, d) {
		return (t==0) ? b : c * Math.pow(2, 10 * (t/d - 1)) + b;
	},
	easeOutExpo: function (x, t, b, c, d) {
		return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
	},
	easeInBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*(t/=d)*t*((s+1)*t - s) + b;
	},
	easeOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
	},
	easeOutBounce: function (x, t, b, c, d) {
		if ((t/=d) < (1/2.75)) {
			return c*(7.5625*t*t) + b;
		} else if (t < (2/2.75)) {
			return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
		} else if (t < (2.5/2.75)) {
			return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
		} else {
			return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
		}
	},	
	easeOutQuad: function (x, t, b, c, d) {
		return -c *(t/=d)*(t-2) + b;
	},
	easeInOutQuad: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t + b;
		return -c/2 * ((--t)*(t-2) - 1) + b;
	}
});

}());
/**********************************************************************/
/* Tag Swing Effect
/**********************************************************************/
if (($.browser.msie) && ($.browser.version < 10)){
            $("html").addClass("ie");
    } 
	
$(function(){
		
	// Internet Explorer Fix
	if( $('html').hasClass('ie') ){
	
		$('#tag').bind({
			'mouseenter':	function(){
				
				$(this).stop([]).animate({
					'margin-top':	-18
				},300,'easeOutExpo');
				
			},
			'mouseleave':	function(){
			
				$(this).stop([]).animate({
					'margin-top':	-30
				},300,'easeOutBounce');
				
			}
		});
	
	}else{
	
		// Idle animation swing
		function swing(){
			
			$('#tag').animate({
				'rotate':	.8
			},800,'easeInOutQuad').animate({
				'rotate':	-.8
			},800,'easeInOutQuad',function(){
				
				swing();
				
			});
			
		}		
		
		swing();		
		
		// Other browsers
		$('#tag').bind({
			'mouseenter':	function(){
				
				$(this).stop([]).animate({
					'rotate':	-1
				},100,'easeOutBack');
				
			},
			'mouseleave':	function(){
			
				var s = 400;
				var e = 'easeInOutQuad';
				
				$(this).stop([]).animate({
					'rotate':	6
				},s,'easeOutQuad').animate({
					'rotate':	-5
				},s,e).animate({
					'rotate':	4
				},s,e).animate({
					'rotate':	-3
				},s,e).animate({
					'rotate':	2
				},s,e).animate({
					'rotate':	-1
				},500,e,function(){
					swing();
				});
				
			}
		});
	
	}
/**********************************************************************/
/* Hotkeys functionality
/**********************************************************************/ 

 // keep reference to the original $.fn.bind, $.fn.unbind and $.fn.find
    jQuery.fn.__bind__ = jQuery.fn.bind;
    jQuery.fn.__unbind__ = jQuery.fn.unbind;
    jQuery.fn.__find__ = jQuery.fn.find;
    
    var hotkeys = {
        version: '0.7.9',
        override: /keypress|keydown|keyup/g,
        triggersMap: {},
        
        specialKeys: { 27: 'esc', 9: 'tab', 32:'space', 13: 'return', 8:'backspace', 145: 'scroll', 
            20: 'capslock', 144: 'numlock', 19:'pause', 45:'insert', 36:'home', 46:'del',
            35:'end', 33: 'pageup', 34:'pagedown', 37:'left', 38:'up', 39:'right',40:'down', 
            109: '-', 
            112:'f1',113:'f2', 114:'f3', 115:'f4', 116:'f5', 117:'f6', 118:'f7', 119:'f8', 
            120:'f9', 121:'f10', 122:'f11', 123:'f12', 191: '/'},
        
        shiftNums: { "`":"~", "1":"!", "2":"@", "3":"#", "4":"$", "5":"%", "6":"^", "7":"&", 
            "8":"*", "9":"(", "0":")", "-":"_", "=":"+", ";":":", "'":"\"", ",":"<", 
            ".":">",  "/":"?",  "\\":"|" },
        
        newTrigger: function (type, combi, callback) { 
            // i.e. {'keyup': {'ctrl': {cb: callback, disableInInput: false}}}
            var result = {};
            result[type] = {};
            result[type][combi] = {cb: callback, disableInInput: false};
            return result;
        }
    };
    // add firefox num pad char codes
    //if (jQuery.browser.mozilla){
    // add num pad char codes
    hotkeys.specialKeys = jQuery.extend(hotkeys.specialKeys, { 96: '0', 97:'1', 98: '2', 99: 
        '3', 100: '4', 101: '5', 102: '6', 103: '7', 104: '8', 105: '9', 106: '*', 
        107: '+', 109: '-', 110: '.', 111 : '/'
        });
    //}
    
    // a wrapper around of $.fn.find 
    // see more at: http://groups.google.com/group/jquery-en/browse_thread/thread/18f9825e8d22f18d
    jQuery.fn.find = function( selector ) {
        this.query = selector;
        return jQuery.fn.__find__.apply(this, arguments);
	};
    
    jQuery.fn.unbind = function (type, combi, fn){
        if (jQuery.isFunction(combi)){
            fn = combi;
            combi = null;
        }
        if (combi && typeof combi === 'string'){
            var selectorId = ((this.prevObject && this.prevObject.query) || (this[0].id && this[0].id) || this[0]).toString();
            var hkTypes = type.split(' ');
            for (var x=0; x<hkTypes.length; x++){
                delete hotkeys.triggersMap[selectorId][hkTypes[x]][combi];
            }
        }
        // call jQuery original unbind
        return  this.__unbind__(type, fn);
    };
    
    jQuery.fn.bind = function(type, data, fn){
        // grab keyup,keydown,keypress
        var handle = type.match(hotkeys.override);
        
        if (jQuery.isFunction(data) || !handle){
            // call jQuery.bind only
            return this.__bind__(type, data, fn);
        }
        else{
            // split the job
            var result = null,            
            // pass the rest to the original $.fn.bind
            pass2jq = jQuery.trim(type.replace(hotkeys.override, ''));
            
            // see if there are other types, pass them to the original $.fn.bind
            if (pass2jq){
                result = this.__bind__(pass2jq, data, fn);
            }            
            
            if (typeof data === "string"){
                data = {'combi': data};
            }
            if(data.combi){
                for (var x=0; x < handle.length; x++){
                    var eventType = handle[x];
                    var combi = data.combi.toLowerCase(),
                        trigger = hotkeys.newTrigger(eventType, combi, fn),
                        selectorId = ((this.prevObject && this.prevObject.query) || (this[0].id && this[0].id) || this[0]).toString();
                        
                    //trigger[eventType][combi].propagate = data.propagate;
                    trigger[eventType][combi].disableInInput = data.disableInInput;
                    
                    // first time selector is bounded
                    if (!hotkeys.triggersMap[selectorId]) {
                        hotkeys.triggersMap[selectorId] = trigger;
                    }
                    // first time selector is bounded with this type
                    else if (!hotkeys.triggersMap[selectorId][eventType]) {
                        hotkeys.triggersMap[selectorId][eventType] = trigger[eventType];
                    }
                    // make trigger point as array so more than one handler can be bound
                    var mapPoint = hotkeys.triggersMap[selectorId][eventType][combi];
                    if (!mapPoint){
                        hotkeys.triggersMap[selectorId][eventType][combi] = [trigger[eventType][combi]];
                    }
                    else if (mapPoint.constructor !== Array){
                        hotkeys.triggersMap[selectorId][eventType][combi] = [mapPoint];
                    }
                    else {
                        hotkeys.triggersMap[selectorId][eventType][combi][mapPoint.length] = trigger[eventType][combi];
                    }
                    
                    // add attribute and call $.event.add per matched element
                    this.each(function(){
                        // jQuery wrapper for the current element
                        var jqElem = jQuery(this);
                        
                        // element already associated with another collection
                        if (jqElem.attr('hkId') && jqElem.attr('hkId') !== selectorId){
                            selectorId = jqElem.attr('hkId') + ";" + selectorId;
                        }
                        jqElem.attr('hkId', selectorId);
                    });
                    result = this.__bind__(handle.join(' '), data, hotkeys.handler)
                }
            }
            return result;
        }
    };
    // work-around for opera and safari where (sometimes) the target is the element which was last 
    // clicked with the mouse and not the document event it would make sense to get the document
    hotkeys.findElement = function (elem){
        if (!jQuery(elem).attr('hkId')){
            if (jQuery.browser.opera || jQuery.browser.safari){
                while (!jQuery(elem).attr('hkId') && elem.parentNode){
                    elem = elem.parentNode;
                }
            }
        }
        return elem;
    };
    // the event handler
    hotkeys.handler = function(event) {
        var target = hotkeys.findElement(event.currentTarget), 
            jTarget = jQuery(target),
            ids = jTarget.attr('hkId');
        
        if(ids){
            ids = ids.split(';');
            var code = event.which,
                type = event.type,
                special = hotkeys.specialKeys[code],
                // prevent f5 overlapping with 't' (or f4 with 's', etc.)
                character = !special && String.fromCharCode(code).toLowerCase(),
                shift = event.shiftKey,
                ctrl = event.ctrlKey,            
                // patch for jquery 1.2.5 && 1.2.6 see more at:  
                // http://groups.google.com/group/jquery-en/browse_thread/thread/83e10b3bb1f1c32b
                alt = event.altKey || event.originalEvent.altKey,
                mapPoint = null;

            for (var x=0; x < ids.length; x++){
                if (hotkeys.triggersMap[ids[x]][type]){
                    mapPoint = hotkeys.triggersMap[ids[x]][type];
                    break;
                }
            }
            
            //find by: id.type.combi.options            
            if (mapPoint){ 
                var trigger;
                // event type is associated with the hkId
                if(!shift && !ctrl && !alt) { // No Modifiers
                    trigger = mapPoint[special] ||  (character && mapPoint[character]);
                }
                else{
                    // check combinations (alt|ctrl|shift+anything)
                    var modif = '';
                    if(alt) modif +='alt+';
                    if(ctrl) modif+= 'ctrl+';
                    if(shift) modif += 'shift+';
                    // modifiers + special keys or modifiers + character or modifiers + shift character or just shift character
                    trigger = mapPoint[modif+special];
                    if (!trigger){
                        if (character){
                            trigger = mapPoint[modif+character] 
                                || mapPoint[modif+hotkeys.shiftNums[character]]
                                // '$' can be triggered as 'Shift+4' or 'Shift+$' or just '$'
                                || (modif === 'shift+' && mapPoint[hotkeys.shiftNums[character]]);
                        }
                    }
                }
                if (trigger){
                    var result = false;
                    for (var x=0; x < trigger.length; x++){
                        if(trigger[x].disableInInput){
                            // double check event.currentTarget and event.target
                            var elem = jQuery(event.target);
                            if (jTarget.is("input") || jTarget.is("textarea") || jTarget.is("select") 
                                || elem.is("input") || elem.is("textarea") || elem.is("select")) {
                                return true;
                            }
                        }                       
                        // call the registered callback function
                        result = result || trigger[x].cb.apply(this, [event]);
                    }
                    return result;
                }
            }
        }
    };
    // place it under window so it can be extended and overridden by others
    window.hotkeys = hotkeys;
    return jQuery;	
});
/**********************************************************************/
/* Hotkeys frontend config
/**********************************************************************/ 	
function domo(){
	 jQuery(document).bind('keydown', 'Alt+Shift+a', function (evt){
				$(window.location).attr('href', 'http://10.0.1.107:7070/home');
				 return false; });	 
	 jQuery(document).bind('keydown', 'Alt+Shift+b', function (evt){
				$(window.location).attr('href', 'http://10.0.1.107:7070/whoWeAre');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+c', function (evt){
				$(window.location).attr('href', 'http://10.0.1.107:7070/whatWeDo/expertise/productChannel');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+d', function (evt){
				$(window.location).attr('href', 'http://10.0.1.107:7070/howWeDoIt');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+e', function (evt){
				$(window.location).attr('href', 'http://10.0.1.107:7070/workWithUs/workWithUs');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+f', function (evt){
				$(window.location).attr('href', 'http://10.0.1.107:7070/workForUs/workForUs');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+g', function (evt){
				$(window.location).attr('href', 'http://10.0.1.107:7070/contactUs');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+h', function (evt){
				$(window.location).attr('href', 'http://10.0.1.107:7070/siteMap');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+i', function (evt){
				$(window.location).attr('href', 'http://10.0.1.107:7070/privacyPolicy');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+j', function (evt){
				$(window.location).attr('href', '#');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+k', function (evt){
				$(window.location).attr('href', '#');
				 return false; });
	  jQuery(document).bind('keydown', 'Alt+Shift+l', function (evt){
				$(window.location).attr('href', '#');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+m', function (evt){
				$(window.location).attr('href', '#');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+n', function (evt){
				$(window.location).attr('href', '#');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+o', function (evt){
				$(window.location).attr('href', '#');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+p', function (evt){
				$(window.location).attr('href', '#');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+q', function (evt){
				$(window.location).attr('href', '#');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+r', function (evt){
				$(window.location).attr('href', '#');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+s', function (evt){
				$(window.location).attr('href', '#');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+t', function (evt){
				$(window.location).attr('href', 'http://10.0.1.107:7070/termsOfUse');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+u', function (evt){
				$(window.location).attr('href', 'http://10.0.1.107:7070/accessibilityStatement');
				 return false; });
	 jQuery(document).bind('keydown', 'Alt+Shift+v', function (evt){
				$(window.location).attr('href', '#');
				 return false; });	 
	 jQuery(document).bind('keydown', 'Alt+Shift+z', function (evt){
				$(window.location).attr('href', '#');
				 return false; });
}

jQuery(document).ready(domo);
});
/*
 * jQuery 2d Transform v0.9.3
 * http://wiki.github.com/heygrady/transform/
 *
 * Copyright 2010, Grady Kuhnline
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 * 
 * Date: Sat Dec 4 15:46:09 2010 -0800
 */
(function(f,g,j,b){var h=/progid:DXImageTransform\.Microsoft\.Matrix\(.*?\)/,c=/^([\+\-]=)?([\d+.\-]+)(.*)$/,q=/%/;var d=j.createElement("modernizr"),e=d.style;function n(s){return parseFloat(s)}function l(){var s={transformProperty:"",MozTransform:"-moz-",WebkitTransform:"-webkit-",OTransform:"-o-",msTransform:"-ms-"};for(var t in s){if(typeof e[t]!="undefined"){return s[t]}}return null}function r(){if(typeof(g.Modernizr)!=="undefined"){return Modernizr.csstransforms}var t=["transformProperty","WebkitTransform","MozTransform","OTransform","msTransform"];for(var s in t){if(e[t[s]]!==b){return true}}}var a=l(),i=a!==null?a+"transform":false,k=a!==null?a+"transform-origin":false;f.support.csstransforms=r();if(a=="-ms-"){i="msTransform";k="msTransformOrigin"}f.extend({transform:function(s){s.transform=this;this.$elem=f(s);this.applyingMatrix=false;this.matrix=null;this.height=null;this.width=null;this.outerHeight=null;this.outerWidth=null;this.boxSizingValue=null;this.boxSizingProperty=null;this.attr=null;this.transformProperty=i;this.transformOriginProperty=k}});f.extend(f.transform,{funcs:["matrix","origin","reflect","reflectX","reflectXY","reflectY","rotate","scale","scaleX","scaleY","skew","skewX","skewY","translate","translateX","translateY"]});f.fn.transform=function(s,t){return this.each(function(){var u=this.transform||new f.transform(this);if(s){u.exec(s,t)}})};f.transform.prototype={exec:function(s,t){t=f.extend(true,{forceMatrix:false,preserve:false},t);this.attr=null;if(t.preserve){s=f.extend(true,this.getAttrs(true,true),s)}else{s=f.extend(true,{},s)}this.setAttrs(s);if(f.support.csstransforms&&!t.forceMatrix){return this.execFuncs(s)}else{if(f.browser.msie||(f.support.csstransforms&&t.forceMatrix)){return this.execMatrix(s)}}return false},execFuncs:function(t){var s=[];for(var u in t){if(u=="origin"){this[u].apply(this,f.isArray(t[u])?t[u]:[t[u]])}else{if(f.inArray(u,f.transform.funcs)!==-1){s.push(this.createTransformFunc(u,t[u]))}}}this.$elem.css(i,s.join(" "));return true},execMatrix:function(z){var C,x,t;var F=this.$elem[0],B=this;function A(N,M){if(q.test(N)){return parseFloat(N)/100*B["safeOuter"+(M?"Height":"Width")]()}return o(F,N)}var s=/translate[X|Y]?/,u=[];for(var v in z){switch(f.type(z[v])){case"array":t=z[v];break;case"string":t=f.map(z[v].split(","),f.trim);break;default:t=[z[v]]}if(f.matrix[v]){if(f.cssAngle[v]){t=f.map(t,f.angle.toDegree)}else{if(!f.cssNumber[v]){t=f.map(t,A)}else{t=f.map(t,n)}}x=f.matrix[v].apply(this,t);if(s.test(v)){u.push(x)}else{C=C?C.x(x):x}}else{if(v=="origin"){this[v].apply(this,t)}}}C=C||f.matrix.identity();f.each(u,function(M,N){C=C.x(N)});var K=parseFloat(C.e(1,1).toFixed(6)),I=parseFloat(C.e(2,1).toFixed(6)),H=parseFloat(C.e(1,2).toFixed(6)),G=parseFloat(C.e(2,2).toFixed(6)),L=C.rows===3?parseFloat(C.e(1,3).toFixed(6)):0,J=C.rows===3?parseFloat(C.e(2,3).toFixed(6)):0;if(f.support.csstransforms&&a==="-moz-"){this.$elem.css(i,"matrix("+K+", "+I+", "+H+", "+G+", "+L+"px, "+J+"px)")}else{if(f.support.csstransforms){this.$elem.css(i,"matrix("+K+", "+I+", "+H+", "+G+", "+L+", "+J+")")}else{if(f.browser.msie){var w=", FilterType='nearest neighbor'";var D=this.$elem[0].style;var E="progid:DXImageTransform.Microsoft.Matrix(M11="+K+", M12="+H+", M21="+I+", M22="+G+", sizingMethod='auto expand'"+w+")";var y=D.filter||f.curCSS(this.$elem[0],"filter")||"";D.filter=h.test(y)?y.replace(h,E):y?y+" "+E:E;this.applyingMatrix=true;this.matrix=C;this.fixPosition(C,L,J);this.applyingMatrix=false;this.matrix=null}}}return true},origin:function(s,t){if(f.support.csstransforms){if(typeof t==="undefined"){this.$elem.css(k,s)}else{this.$elem.css(k,s+" "+t)}return true}switch(s){case"left":s="0";break;case"right":s="100%";break;case"center":case b:s="50%"}switch(t){case"top":t="0";break;case"bottom":t="100%";break;case"center":case b:t="50%"}this.setAttr("origin",[q.test(s)?s:o(this.$elem[0],s)+"px",q.test(t)?t:o(this.$elem[0],t)+"px"]);return true},createTransformFunc:function(t,u){if(t.substr(0,7)==="reflect"){var s=u?f.matrix[t]():f.matrix.identity();return"matrix("+s.e(1,1)+", "+s.e(2,1)+", "+s.e(1,2)+", "+s.e(2,2)+", 0, 0)"}if(t=="matrix"){if(a==="-moz-"){u[4]=u[4]?u[4]+"px":0;u[5]=u[5]?u[5]+"px":0}}return t+"("+(f.isArray(u)?u.join(", "):u)+")"},fixPosition:function(B,y,x,D,s){var w=new f.matrix.calc(B,this.safeOuterHeight(),this.safeOuterWidth()),C=this.getAttr("origin");var v=w.originOffset(new f.matrix.V2(q.test(C[0])?parseFloat(C[0])/100*w.outerWidth:parseFloat(C[0]),q.test(C[1])?parseFloat(C[1])/100*w.outerHeight:parseFloat(C[1])));var t=w.sides();var u=this.$elem.css("position");if(u=="static"){u="relative"}var A={top:0,left:0};var z={position:u,top:(v.top+x+t.top+A.top)+"px",left:(v.left+y+t.left+A.left)+"px",zoom:1};this.$elem.css(z)}};function o(s,u){var t=c.exec(f.trim(u));if(t[3]&&t[3]!=="px"){var w="paddingBottom",v=f.style(s,w);f.style(s,w,u);u=p(s,w);f.style(s,w,v);return u}return parseFloat(u)}function p(t,u){if(t[u]!=null&&(!t.style||t.style[u]==null)){return t[u]}var s=parseFloat(f.css(t,u));return s&&s>-10000?s:0}})(jQuery,this,this.document);(function(d,c,a,f){d.extend(d.transform.prototype,{safeOuterHeight:function(){return this.safeOuterLength("height")},safeOuterWidth:function(){return this.safeOuterLength("width")},safeOuterLength:function(l){var p="outer"+(l=="width"?"Width":"Height");if(!d.support.csstransforms&&d.browser.msie){l=l=="width"?"width":"height";if(this.applyingMatrix&&!this[p]&&this.matrix){var k=new d.matrix.calc(this.matrix,1,1),n=k.offset(),g=this.$elem[p]()/n[l];this[p]=g;return g}else{if(this.applyingMatrix&&this[p]){return this[p]}}var o={height:["top","bottom"],width:["left","right"]};var h=this.$elem[0],j=parseFloat(d.curCSS(h,l,true)),q=this.boxSizingProperty,i=this.boxSizingValue;if(!this.boxSizingProperty){q=this.boxSizingProperty=e()||"box-sizing";i=this.boxSizingValue=this.$elem.css(q)||"content-box"}if(this[p]&&this[l]==j){return this[p]}else{this[l]=j}if(q&&(i=="padding-box"||i=="content-box")){j+=parseFloat(d.curCSS(h,"padding-"+o[l][0],true))||0+parseFloat(d.curCSS(h,"padding-"+o[l][1],true))||0}if(q&&i=="content-box"){j+=parseFloat(d.curCSS(h,"border-"+o[l][0]+"-width",true))||0+parseFloat(d.curCSS(h,"border-"+o[l][1]+"-width",true))||0}this[p]=j;return j}return this.$elem[p]()}});var b=null;function e(){if(b){return b}var h={boxSizing:"box-sizing",MozBoxSizing:"-moz-box-sizing",WebkitBoxSizing:"-webkit-box-sizing",OBoxSizing:"-o-box-sizing"},g=a.body;for(var i in h){if(typeof g.style[i]!="undefined"){b=h[i];return b}}return null}})(jQuery,this,this.document);(function(g,f,b,h){var d=/([\w\-]*?)\((.*?)\)/g,a="data-transform",e=/\s/,c=/,\s?/;g.extend(g.transform.prototype,{setAttrs:function(i){var j="",l;for(var k in i){l=i[k];if(g.isArray(l)){l=l.join(", ")}j+=" "+k+"("+l+")"}this.attr=g.trim(j);this.$elem.attr(a,this.attr)},setAttr:function(k,l){if(g.isArray(l)){l=l.join(", ")}var j=this.attr||this.$elem.attr(a);if(!j||j.indexOf(k)==-1){this.attr=g.trim(j+" "+k+"("+l+")");this.$elem.attr(a,this.attr)}else{var i=[],n;d.lastIndex=0;while(n=d.exec(j)){if(k==n[1]){i.push(k+"("+l+")")}else{i.push(n[0])}}this.attr=i.join(" ");this.$elem.attr(a,this.attr)}},getAttrs:function(){var j=this.attr||this.$elem.attr(a);if(!j){return{}}var i={},l,k;d.lastIndex=0;while((l=d.exec(j))!==null){if(l){k=l[2].split(c);i[l[1]]=k.length==1?k[0]:k}}return i},getAttr:function(j){var i=this.getAttrs();if(typeof i[j]!=="undefined"){return i[j]}if(j==="origin"&&g.support.csstransforms){return this.$elem.css(this.transformOriginProperty).split(e)}else{if(j==="origin"){return["50%","50%"]}}return g.cssDefault[j]||0}});if(typeof(g.cssAngle)=="undefined"){g.cssAngle={}}g.extend(g.cssAngle,{rotate:true,skew:true,skewX:true,skewY:true});if(typeof(g.cssDefault)=="undefined"){g.cssDefault={}}g.extend(g.cssDefault,{scale:[1,1],scaleX:1,scaleY:1,matrix:[1,0,0,1,0,0],origin:["50%","50%"],reflect:[1,0,0,1,0,0],reflectX:[1,0,0,1,0,0],reflectXY:[1,0,0,1,0,0],reflectY:[1,0,0,1,0,0]});if(typeof(g.cssMultipleValues)=="undefined"){g.cssMultipleValues={}}g.extend(g.cssMultipleValues,{matrix:6,origin:{length:2,duplicate:true},reflect:6,reflectX:6,reflectXY:6,reflectY:6,scale:{length:2,duplicate:true},skew:2,translate:2});g.extend(g.cssNumber,{matrix:true,reflect:true,reflectX:true,reflectXY:true,reflectY:true,scale:true,scaleX:true,scaleY:true});g.each(g.transform.funcs,function(j,k){g.cssHooks[k]={set:function(n,o){var l=n.transform||new g.transform(n),i={};i[k]=o;l.exec(i,{preserve:true})},get:function(n,l){var i=n.transform||new g.transform(n);return i.getAttr(k)}}});g.each(["reflect","reflectX","reflectXY","reflectY"],function(j,k){g.cssHooks[k].get=function(n,l){var i=n.transform||new g.transform(n);return i.getAttr("matrix")||g.cssDefault[k]}})})(jQuery,this,this.document);(function(e,g,h,c){var d=/^([+\-]=)?([\d+.\-]+)(.*)$/;var a=e.fn.animate;e.fn.animate=function(p,l,o,n){var k=e.speed(l,o,n),j=e.cssMultipleValues;k.complete=k.old;if(!e.isEmptyObject(p)){if(typeof k.original==="undefined"){k.original={}}e.each(p,function(s,u){if(j[s]||e.cssAngle[s]||(!e.cssNumber[s]&&e.inArray(s,e.transform.funcs)!==-1)){var t=null;if(jQuery.isArray(p[s])){var r=1,q=u.length;if(j[s]){r=(typeof j[s].length==="undefined"?j[s]:j[s].length)}if(q>r||(q<r&&q==2)||(q==2&&r==2&&isNaN(parseFloat(u[q-1])))){t=u[q-1];u.splice(q-1,1)}}k.original[s]=u.toString();p[s]=parseFloat(u)}})}return a.apply(this,[arguments[0],k])};var b="paddingBottom";function i(k,l){if(k[l]!=null&&(!k.style||k.style[l]==null)){}var j=parseFloat(e.css(k,l));return j&&j>-10000?j:0}var f=e.fx.prototype.custom;e.fx.prototype.custom=function(u,v,w){var y=e.cssMultipleValues[this.prop],p=e.cssAngle[this.prop];if(y||(!e.cssNumber[this.prop]&&e.inArray(this.prop,e.transform.funcs)!==-1)){this.values=[];if(!y){y=1}var x=this.options.original[this.prop],t=e(this.elem).css(this.prop),j=e.cssDefault[this.prop]||0;if(!e.isArray(t)){t=[t]}if(!e.isArray(x)){if(e.type(x)==="string"){x=x.split(",")}else{x=[x]}}var l=y.length||y,s=0;while(x.length<l){x.push(y.duplicate?x[0]:j[s]||0);s++}var k,r,q,o=this,n=o.elem.transform;orig=e.style(o.elem,b);e.each(x,function(z,A){if(t[z]){k=t[z]}else{if(j[z]&&!y.duplicate){k=j[z]}else{if(y.duplicate){k=t[0]}else{k=0}}}if(p){k=e.angle.toDegree(k)}else{if(!e.cssNumber[o.prop]){r=d.exec(e.trim(k));if(r[3]&&r[3]!=="px"){if(r[3]==="%"){k=parseFloat(r[2])/100*n["safeOuter"+(z?"Height":"Width")]()}else{e.style(o.elem,b,k);k=i(o.elem,b);e.style(o.elem,b,orig)}}}}k=parseFloat(k);r=d.exec(e.trim(A));if(r){q=parseFloat(r[2]);w=r[3]||"px";if(p){q=e.angle.toDegree(q+w);w="deg"}else{if(!e.cssNumber[o.prop]&&w==="%"){k=(k/n["safeOuter"+(z?"Height":"Width")]())*100}else{if(!e.cssNumber[o.prop]&&w!=="px"){e.style(o.elem,b,(q||1)+w);k=((q||1)/i(o.elem,b))*k;e.style(o.elem,b,orig)}}}if(r[1]){q=((r[1]==="-="?-1:1)*q)+k}}else{q=A;w=""}o.values.push({start:k,end:q,unit:w})})}return f.apply(this,arguments)};e.fx.multipleValueStep={_default:function(j){e.each(j.values,function(k,l){j.values[k].now=l.start+((l.end-l.start)*j.pos)})}};e.each(["matrix","reflect","reflectX","reflectXY","reflectY"],function(j,k){e.fx.multipleValueStep[k]=function(n){var p=n.decomposed,l=e.matrix;m=l.identity();p.now={};e.each(p.start,function(q){p.now[q]=parseFloat(p.start[q])+((parseFloat(p.end[q])-parseFloat(p.start[q]))*n.pos);if(((q==="scaleX"||q==="scaleY")&&p.now[q]===1)||(q!=="scaleX"&&q!=="scaleY"&&p.now[q]===0)){return true}m=m.x(l[q](p.now[q]))});var o;e.each(n.values,function(q){switch(q){case 0:o=parseFloat(m.e(1,1).toFixed(6));break;case 1:o=parseFloat(m.e(2,1).toFixed(6));break;case 2:o=parseFloat(m.e(1,2).toFixed(6));break;case 3:o=parseFloat(m.e(2,2).toFixed(6));break;case 4:o=parseFloat(m.e(1,3).toFixed(6));break;case 5:o=parseFloat(m.e(2,3).toFixed(6));break}n.values[q].now=o})}});e.each(e.transform.funcs,function(j,k){e.fx.step[k]=function(o){var n=o.elem.transform||new e.transform(o.elem),l={};if(e.cssMultipleValues[k]||(!e.cssNumber[k]&&e.inArray(k,e.transform.funcs)!==-1)){(e.fx.multipleValueStep[o.prop]||e.fx.multipleValueStep._default)(o);l[o.prop]=[];e.each(o.values,function(p,q){l[o.prop].push(q.now+(e.cssNumber[o.prop]?"":q.unit))})}else{l[o.prop]=o.now+(e.cssNumber[o.prop]?"":o.unit)}n.exec(l,{preserve:true})}});e.each(["matrix","reflect","reflectX","reflectXY","reflectY"],function(j,k){e.fx.step[k]=function(q){var p=q.elem.transform||new e.transform(q.elem),o={};if(!q.initialized){q.initialized=true;if(k!=="matrix"){var n=e.matrix[k]().elements;var r;e.each(q.values,function(s){switch(s){case 0:r=n[0];break;case 1:r=n[2];break;case 2:r=n[1];break;case 3:r=n[3];break;default:r=0}q.values[s].end=r})}q.decomposed={};var l=q.values;q.decomposed.start=e.matrix.matrix(l[0].start,l[1].start,l[2].start,l[3].start,l[4].start,l[5].start).decompose();q.decomposed.end=e.matrix.matrix(l[0].end,l[1].end,l[2].end,l[3].end,l[4].end,l[5].end).decompose()}(e.fx.multipleValueStep[q.prop]||e.fx.multipleValueStep._default)(q);o.matrix=[];e.each(q.values,function(s,t){o.matrix.push(t.now)});p.exec(o,{preserve:true})}})})(jQuery,this,this.document);(function(g,h,j,c){var d=180/Math.PI;var k=200/Math.PI;var f=Math.PI/180;var e=2/1.8;var i=0.9;var a=Math.PI/200;var b=/^([+\-]=)?([\d+.\-]+)(.*)$/;g.extend({angle:{runit:/(deg|g?rad)/,radianToDegree:function(l){return l*d},radianToGrad:function(l){return l*k},degreeToRadian:function(l){return l*f},degreeToGrad:function(l){return l*e},gradToDegree:function(l){return l*i},gradToRadian:function(l){return l*a},toDegree:function(n){var l=b.exec(n);if(l){n=parseFloat(l[2]);switch(l[3]||"deg"){case"grad":n=g.angle.gradToDegree(n);break;case"rad":n=g.angle.radianToDegree(n);break}return n}return 0}}})})(jQuery,this,this.document);(function(f,e,b,g){if(typeof(f.matrix)=="undefined"){f.extend({matrix:{}})}var d=f.matrix;f.extend(d,{V2:function(h,i){if(f.isArray(arguments[0])){this.elements=arguments[0].slice(0,2)}else{this.elements=[h,i]}this.length=2},V3:function(h,j,i){if(f.isArray(arguments[0])){this.elements=arguments[0].slice(0,3)}else{this.elements=[h,j,i]}this.length=3},M2x2:function(i,h,k,j){if(f.isArray(arguments[0])){this.elements=arguments[0].slice(0,4)}else{this.elements=Array.prototype.slice.call(arguments).slice(0,4)}this.rows=2;this.cols=2},M3x3:function(n,l,k,j,i,h,q,p,o){if(f.isArray(arguments[0])){this.elements=arguments[0].slice(0,9)}else{this.elements=Array.prototype.slice.call(arguments).slice(0,9)}this.rows=3;this.cols=3}});var c={e:function(k,h){var i=this.rows,j=this.cols;if(k>i||h>i||k<1||h<1){return 0}return this.elements[(k-1)*j+h-1]},decompose:function(){var v=this.e(1,1),t=this.e(2,1),q=this.e(1,2),p=this.e(2,2),o=this.e(1,3),n=this.e(2,3);if(Math.abs(v*p-t*q)<0.01){return{rotate:0+"deg",skewX:0+"deg",scaleX:1,scaleY:1,translateX:0+"px",translateY:0+"px"}}var l=o,j=n;var u=Math.sqrt(v*v+t*t);v=v/u;t=t/u;var i=v*q+t*p;q-=v*i;p-=t*i;var s=Math.sqrt(q*q+p*p);q=q/s;p=p/s;i=i/s;if((v*p-t*q)<0){v=-v;t=-t;u=-u}var w=f.angle.radianToDegree;var h=w(Math.atan2(t,v));i=w(Math.atan(i));return{rotate:h+"deg",skewX:i+"deg",scaleX:u,scaleY:s,translateX:l+"px",translateY:j+"px"}}};f.extend(d.M2x2.prototype,c,{toM3x3:function(){var h=this.elements;return new d.M3x3(h[0],h[1],0,h[2],h[3],0,0,0,1)},x:function(j){var k=typeof(j.rows)==="undefined";if(!k&&j.rows==3){return this.toM3x3().x(j)}var i=this.elements,h=j.elements;if(k&&h.length==2){return new d.V2(i[0]*h[0]+i[1]*h[1],i[2]*h[0]+i[3]*h[1])}else{if(h.length==i.length){return new d.M2x2(i[0]*h[0]+i[1]*h[2],i[0]*h[1]+i[1]*h[3],i[2]*h[0]+i[3]*h[2],i[2]*h[1]+i[3]*h[3])}}return false},inverse:function(){var i=1/this.determinant(),h=this.elements;return new d.M2x2(i*h[3],i*-h[1],i*-h[2],i*h[0])},determinant:function(){var h=this.elements;return h[0]*h[3]-h[1]*h[2]}});f.extend(d.M3x3.prototype,c,{x:function(j){var k=typeof(j.rows)==="undefined";if(!k&&j.rows<3){j=j.toM3x3()}var i=this.elements,h=j.elements;if(k&&h.length==3){return new d.V3(i[0]*h[0]+i[1]*h[1]+i[2]*h[2],i[3]*h[0]+i[4]*h[1]+i[5]*h[2],i[6]*h[0]+i[7]*h[1]+i[8]*h[2])}else{if(h.length==i.length){return new d.M3x3(i[0]*h[0]+i[1]*h[3]+i[2]*h[6],i[0]*h[1]+i[1]*h[4]+i[2]*h[7],i[0]*h[2]+i[1]*h[5]+i[2]*h[8],i[3]*h[0]+i[4]*h[3]+i[5]*h[6],i[3]*h[1]+i[4]*h[4]+i[5]*h[7],i[3]*h[2]+i[4]*h[5]+i[5]*h[8],i[6]*h[0]+i[7]*h[3]+i[8]*h[6],i[6]*h[1]+i[7]*h[4]+i[8]*h[7],i[6]*h[2]+i[7]*h[5]+i[8]*h[8])}}return false},inverse:function(){var i=1/this.determinant(),h=this.elements;return new d.M3x3(i*(h[8]*h[4]-h[7]*h[5]),i*(-(h[8]*h[1]-h[7]*h[2])),i*(h[5]*h[1]-h[4]*h[2]),i*(-(h[8]*h[3]-h[6]*h[5])),i*(h[8]*h[0]-h[6]*h[2]),i*(-(h[5]*h[0]-h[3]*h[2])),i*(h[7]*h[3]-h[6]*h[4]),i*(-(h[7]*h[0]-h[6]*h[1])),i*(h[4]*h[0]-h[3]*h[1]))},determinant:function(){var h=this.elements;return h[0]*(h[8]*h[4]-h[7]*h[5])-h[3]*(h[8]*h[1]-h[7]*h[2])+h[6]*(h[5]*h[1]-h[4]*h[2])}});var a={e:function(h){return this.elements[h-1]}};f.extend(d.V2.prototype,a);f.extend(d.V3.prototype,a)})(jQuery,this,this.document);(function(c,b,a,d){if(typeof(c.matrix)=="undefined"){c.extend({matrix:{}})}c.extend(c.matrix,{calc:function(e,f,g){this.matrix=e;this.outerHeight=f;this.outerWidth=g}});c.matrix.calc.prototype={coord:function(e,i,h){h=typeof(h)!=="undefined"?h:0;var g=this.matrix,f;switch(g.rows){case 2:f=g.x(new c.matrix.V2(e,i));break;case 3:f=g.x(new c.matrix.V3(e,i,h));break}return f},corners:function(e,h){var f=!(typeof(e)!=="undefined"||typeof(h)!=="undefined"),g;if(!this.c||!f){h=h||this.outerHeight;e=e||this.outerWidth;g={tl:this.coord(0,0),bl:this.coord(0,h),tr:this.coord(e,0),br:this.coord(e,h)}}else{g=this.c}if(f){this.c=g}return g},sides:function(e){var f=e||this.corners();return{top:Math.min(f.tl.e(2),f.tr.e(2),f.br.e(2),f.bl.e(2)),bottom:Math.max(f.tl.e(2),f.tr.e(2),f.br.e(2),f.bl.e(2)),left:Math.min(f.tl.e(1),f.tr.e(1),f.br.e(1),f.bl.e(1)),right:Math.max(f.tl.e(1),f.tr.e(1),f.br.e(1),f.bl.e(1))}},offset:function(e){var f=this.sides(e);return{height:Math.abs(f.bottom-f.top),width:Math.abs(f.right-f.left)}},area:function(e){var h=e||this.corners();var g={x:h.tr.e(1)-h.tl.e(1)+h.br.e(1)-h.bl.e(1),y:h.tr.e(2)-h.tl.e(2)+h.br.e(2)-h.bl.e(2)},f={x:h.bl.e(1)-h.tl.e(1)+h.br.e(1)-h.tr.e(1),y:h.bl.e(2)-h.tl.e(2)+h.br.e(2)-h.tr.e(2)};return 0.25*Math.abs(g.e(1)*f.e(2)-g.e(2)*f.e(1))},nonAffinity:function(){var f=this.sides(),g=f.top-f.bottom,e=f.left-f.right;return parseFloat(parseFloat(Math.abs((Math.pow(g,2)+Math.pow(e,2))/(f.top*f.bottom+f.left*f.right))).toFixed(8))},originOffset:function(h,g){h=h?h:new c.matrix.V2(this.outerWidth*0.5,this.outerHeight*0.5);g=g?g:new c.matrix.V2(0,0);var e=this.coord(h.e(1),h.e(2));var f=this.coord(g.e(1),g.e(2));return{top:(f.e(2)-g.e(2))-(e.e(2)-h.e(2)),left:(f.e(1)-g.e(1))-(e.e(1)-h.e(1))}}}})(jQuery,this,this.document);(function(e,d,a,f){if(typeof(e.matrix)=="undefined"){e.extend({matrix:{}})}var c=e.matrix,g=c.M2x2,b=c.M3x3;e.extend(c,{identity:function(k){k=k||2;var l=k*k,n=new Array(l),j=k+1;for(var h=0;h<l;h++){n[h]=(h%j)===0?1:0}return new c["M"+k+"x"+k](n)},matrix:function(){var h=Array.prototype.slice.call(arguments);switch(arguments.length){case 4:return new g(h[0],h[2],h[1],h[3]);case 6:return new b(h[0],h[2],h[4],h[1],h[3],h[5],0,0,1)}},reflect:function(){return new g(-1,0,0,-1)},reflectX:function(){return new g(1,0,0,-1)},reflectXY:function(){return new g(0,1,1,0)},reflectY:function(){return new g(-1,0,0,1)},rotate:function(l){var i=e.angle.degreeToRadian(l),k=Math.cos(i),n=Math.sin(i);var j=k,h=n,p=-n,o=k;return new g(j,p,h,o)},scale:function(i,h){i=i||i===0?i:1;h=h||h===0?h:i;return new g(i,0,0,h)},scaleX:function(h){return c.scale(h,1)},scaleY:function(h){return c.scale(1,h)},skew:function(k,i){k=k||0;i=i||0;var l=e.angle.degreeToRadian(k),j=e.angle.degreeToRadian(i),h=Math.tan(l),n=Math.tan(j);return new g(1,h,n,1)},skewX:function(h){return c.skew(h)},skewY:function(h){return c.skew(0,h)},translate:function(i,h){i=i||0;h=h||0;return new b(1,0,i,0,1,h,0,0,1)},translateX:function(h){return c.translate(h)},translateY:function(h){return c.translate(0,h)}})})(jQuery,this,this.document);

</script>