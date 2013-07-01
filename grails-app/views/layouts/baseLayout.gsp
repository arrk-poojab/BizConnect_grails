<!DOCTYPE HTML>
<html lang="en">
<head>
	<g:render template="/layouts/head"></g:render>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			highlightMenuItem();
		});
	</script>
       <style>
      #skip,.hidden {display:none;]
        </style>
	<g:layoutHead/>
</head>
<body data-responsejs='{
	"create" : {"mode" : "src", "prefix" : "src"}
}'>
       
	<g:render template="/layouts/header"></g:render>
		<script type="text/javascript">
		jQuery(document).ready(function() {
			highlightMenuItem();
		});
	</script>

	<g:layoutBody />
	
	<div class="clear"></div>
       <div id="top"> <a href="javascript:void(0);" accesskey="Z">To top</a> <span class="remove">(Z)</span></div>
	<g:render template="/layouts/footer"></g:render>
</body>
</html>