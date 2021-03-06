<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${assetPath(src: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${assetPath(src: 'apple-touch-icon-retina.png')}">
<asset:stylesheet src="application.css" />
<asset:javascript src="application.js" />
<asset:javascript src="jquery.form.min.js" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<g:layoutHead />
</head>
<body>
	<div id="grailsLogo" role="banner">
		<a href="${createLink(controller:store)}"><asset:image
				src="library-music-icon.png" width="80px" alt="gTunes" /></a>

		<div align="right" style="float: right; padding-right: 10px;">
			<g:if test="${session?.user}">
				${session.user?.lastName}, ${session.user?.firstName}<br>
				<g:link url="[controller='user', action='music']">My Music</g:link> |
					<g:link contoller='store' action='shop'>The Store</g:link> |
					<a href="#">Profile</a> | 
					<g:link controller="user" action="logout">Logout</g:link>
			</g:if>
			<g:else>
				<g:link controller="store">Login</g:link>
			</g:else>
		</div>
	</div>
	<div style="padding-left: 30px; padding-right: 30px;">
		<g:layoutBody />
	</div>


	<div class="footer" role="contentinfo" align="center">&copy;
		gTunes 2015</div>
	<div id="spinner" class="spinner" style="display: none;">
		as
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
	<r:layoutResources />
</body>
</html>
