<!doctype html>
<html lang="en">
<head>
	<meta name="layout" content="baseLayout" />
	<g:render template="/layouts/homeHead"/>
	<g:set var="fileName" value="${URLDecoder.decode(request.forwardURI, 'UTF-8')}"/>
    <g:set var="subName" value="${fileName.substring(fileName.lastIndexOf('/') + 1)}"/>
   	<script type="text/javascript">
   	    var id='${subName}';
		$(document).ready(function() {
			if((id=='hotJobs') || (id=='photoGallery')) {
				highlightTab("#workForUsTab")
			} 
		});
	</script>
</head>
<body>
<div class="clear"></div>				  
<!--content  [Start]-->
<div class="contentContainer">
	<div class="container_12">
		<div class="subchannel">
		  <h2 class="grid_8 prefix_4"><fts:title filePath="${fileName}" messageKey="${subName}"/></h2>
	    </div>
		<div class="content">
	    	<div class="grid_8 prefix_4">
		    	<fts:display filePath="${fileName}"/>
	        </div>
	        <div class="clear"></div>
	    </div>
	</div>
</div>
<!--content  [End]-->
</body>
</html>