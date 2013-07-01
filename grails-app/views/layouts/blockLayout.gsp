<!doctype html>
<html lang="en">
<head>
	<meta name="layout" content="baseLayout" />
	<g:render template="/layouts/homeHead"/>
	<g:set var="fileName" value="${URLDecoder.decode(request.forwardURI, 'UTF-8')}"/>
    <g:set var="subName" value="${fileName.substring(fileName.lastIndexOf('/') + 1)}"/>
	<g:layoutHead/>
</head>
<body>
    <div class="clear"></div> 
    <!--content  [Start]-->
	<div class="contentContainer">
		<div class="container_12"> 
		  <!--Channel [Start]-->
		  <div class="subchannel">
		     <h2 class="grid_8 prefix_4"><fts:title filePath="${fileName}" messageKey="${subName}" /></h2>
		  </div>
		   <!--Channel [End]-->
		  <div class="content">  
		    <div class="submenu grid_3">     
		      <h2>Tutorials Point</h2>
               <ul class="leftMenu">
              		<li><a href="#" >SoapUI</a></li>
              		<li><a href="#">The Daily Scrum Meeting</a></li>
                </ul>
		    </div> 
		       
			<div class="grid_8 prefix_1">
			   <input type="hidden" value="features"/>
               <div class="grid_3 alpha marginBottomTwenty min-height-325">
               	<h3>SoapUI</h3>
               	<span class="imageContainer"><img src="images/soapUI_header_logo.png" alt="What We Believe In"/></span>
               	<p>SoapUI is a free and open source cross-platform Functional Testing solution. With an easy-to-use graphical interface, and enterprise-class features....</p>
               	<a href="http://www.soapui.org/About-SoapUI/what-is-soapui.html">Read more</a>
               </div>

               <div class="grid_3 alpha marginBottomTwenty min-height-325">
               	<h3>Daily Scrum Meeting</h3>
               	<span class="imageContainer"><img src="images/getting-agile.png" alt="Daily Scrum"/></span>
               	<p>On each day of a sprint, the team holds daily meetings ("the daily scrum”). Meetings are typically held in the same location and at the same time each day....</p>
               	<a href="http://www.mountaingoatsoftware.com/scrum/daily-scrum">Read more</a>
               </div>
			</div>	
			<div class="clear"></div>
		  </div>
		</div>
	</div>
    <!--content  [End]-->  
    <div class="clear"></div>
</body>
</html>
