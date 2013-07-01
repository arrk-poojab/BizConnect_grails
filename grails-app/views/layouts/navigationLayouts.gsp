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

<div class="contentContainer">
	<div class="container_12"> 
		<!--Channel [Start]-->
		<div class="subchannel">
			  <h2 class="grid_8 prefix_4"><fts:title filePath="${fileName}" messageKey="${subName}"/></h2>
		</div>
		<!--Channel [End]-->
		
		<!--content  [Start]-->
		<div class="content">
			<div class="submenu grid_3 suffix_1" id="leftNav" >
			    <g:pageProperty name="page.left-link" default=""/>
			    <div class="clear"></div>
			    
			    <g:isLoggedIn>       
			    	<input type='hidden' id='userSession' value='Y' name="userSession"/>    
			    </g:isLoggedIn>
			    
			    <g:isNotLoggedIn>
			    	<input type='hidden' id='userSession' value="N" name="userSession"/>
			    </g:isNotLoggedIn> 
			            
			    <fts:displayActionPanel filePath="/downloadLink/${subName}"  panelPath="/downloadLink/callToActionPanel" />      	
			</div>
			<div class="grid_8">
				 <input type='hidden' id='current_page' />
				 <input type='hidden' id='show_per_page' />
				 <fts:display filePath="${fileName}" />	    
			</div>
			<div class="clear"></div>
		</div>
		<!--content  [End]-->
	</div>
</div>
</body>
</html>