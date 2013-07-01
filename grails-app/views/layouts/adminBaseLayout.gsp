<!doctype html>
<html>
<head>
	<g:render template="/layouts/head"></g:render>
    <link rel="stylesheet" href="css/style.css" />
   
    <g:javascript src="jquery-latest.js"/>
	<g:layoutHead/>
	<script>
            $(document).ready(function(){

                $("#header_nav > li ").addClass("level1");
                $("#header_nav  > li > ul > li ").addClass("level2");
                $("#header_nav  > li > ul > li > ul > li ").addClass("level3");

                $(".level1").live("hover",function(){

                    $(".level1").removeClass("main_menu_hover");
                    $(this).addClass("main_menu_hover");


                    var numberofChildren = $(this).find("> ul").children().length;

                    if(numberofChildren != 0){
                        // Section 1
                        $(".level1").removeClass("active_main_menu");
                        $(this).addClass("active_main_menu");

                        // Section 2
                        $(".level1").find("ul").css("display","none");
                        $(this).find(" > ul").css("display","block");
                
                        // Section 3
                        $(".level2").removeClass("active_first_element");
                        $(".level2").removeClass("active_last_element");
                        $(".level2").removeClass("active_only_element");

                        // Section 4
                        if(numberofChildren == 1){
                            $(this).find("ul li:first").addClass("active_only_element");
                        }else{
                            $(this).find("ul li:first").addClass("active_first_element");
                            $(this).find("ul li:last-child").addClass("active_last_element");
                        }

                        // Section 5
                        $(".level2 a").removeClass("sub_active");
                        $(".level2").removeClass("menu_hover");


                    }else{
                        // Section 6
                        $(".level1").find("ul").css("display","none");
                        $(".level1").removeClass("active_main_menu");

                    }

                });

                $(".level2").find(".arrow-right").attr("href","javascript:void(0);");

                $(".level2 > a").live("hover",function(e){
                    $("li").removeClass("menu_hover");
                    $(this).parent().addClass("menu_hover");
                    e.preventDefault();
                });

                $(".level2 a").live("click",function(){
                    $("li").removeClass("menu_hover");

                    if($(this).hasClass("sub_active")){
                        $(this).removeClass("sub_active");
                        $(".level2 > ul").slideUp();
                    }else{
                        $(".level2 ul").slideUp();
                        $(".level2 a").removeClass("sub_active");
                        $(this).addClass("sub_active");
                        $(this).parent().find("ul").slideDown();
                    }
                });

 

 

                $(".level3 a").live("hover",function(){
                    if(!($(this).parent().hasClass("accordian_element_hover"))){
                        $(this).parent().removeClass("level3").addClass("accordian_element_hover");
                    }
                });
                $(".accordian_element_hover a").live("hover",function(){
                    $(this).parent().addClass("level3").removeClass("accordian_element_hover");
                });

           
            });
        </script>
	
</head>
<body>

	<g:render template="/layouts/adminheader"></g:render>

	<g:layoutBody />
	
	<div class="clear"></div>
	<g:render template="/layouts/footer"></g:render>
</body>
</html>