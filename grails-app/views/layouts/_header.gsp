<!-- Header starts here -->

<div class="headerContainer">
<div class="container_12">
<div id="skip">
  <ul>
    <li><a href="#content" id="skiptocontent" name="skiptocontent" class="skipcontent">Skip to Content</a></li>
    <li><a href="#navigation" id="skiptonavigation" name="skiptonavigation" class="skipnavigation">Skip to Navigation</a></li>
  </ul>
</div>

 <div class="header">
    <h1 class="logo grid_2"><a href="home" title="Arrk Logo"><img src="images/BizConnect_Logo.PNG" alt="Arrk Logo" /></a></h1>
     <div class="contactInfo-admin grid_4 floatRight">
   	 <div class="padding-bottom-5 overflow-hidden">
   	   <span class="welcomeuser-msg floatLeft padding-left-15">
	   <sec:ifLoggedIn>Welcome Back</sec:ifLoggedIn>
	   <sec:username /> 
	   <sec:ifAllGranted roles="ROLE_ADMIN">
         <a href="index" id="index" accesskey="#">Index</a></li>
       </sec:ifAllGranted>
	   </span> 
	 </div>  
      <div class="clear"></div>
      <span class="contactLink">
     <a href="contactUs" class="bottomBorder" id="contactUsTab"><g:message code="tab.contactUs"/></a>
     </span>
	     <span class="contactNumber">
	     <sec:ifNotLoggedIn>
		 <g:link controller="login" action="auth"><g:message code="tab.login"/></g:link>
		 </sec:ifNotLoggedIn>
		 <sec:ifLoggedIn>
		 <g:link controller="logout">Logout</g:link>
		 </sec:ifLoggedIn> 
	     </span>
      </div>
<div class="clear"></div>
<div class="nav" id="navigation">
	 <a href="javascript:void(0)" class="phone-menu">Navigate<span class="phone-menu-icon"></span></a>
      <ul>
     <li class="first"><a href="home" id="homeTab" accesskey="A">Home</a></li>
     <li><a href="tutorial" id="featuresTab" accesskey="B">Tutorials</a></li>
     <li><a href="#" id="caseStudiesTab" accesskey="D">Case Studies</a></li>
     <li><a href="#" id="bookDemoTab" accesskey="E">Demo's</a></li>
	 <li><a href="#" id="newsAndEventsTab" accesskey="E">About Me</a></li>
     <li class="last"><a href="contactUs" id="contactUsTab" accesskey="F">Contact Us</a></li>
      </ul>
   </div>
</div>
<div id="bottom"> <a href="javascript:void(0);" accesskey="X">To Bottom</a> <span class="remove">(X)</span></div>
 </div>
 </div> 

<!-- Header ends here -->