
<%@ page import="com.gtunes.Store" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>gTunes Store</title>
	</head>
	<body id="body">
		<h1>Your online music store and storage service</h1>
		<p>Manage your own library, browse music and purchase new tracks as they become available.</p><br><br>
		
		<div id="loginBox" class="loginBox">
			<g:if test="${session?.user}">
				<div style="margin-top:20px">
					<div style="float:right">
						<a href="#">Profile</a> | 
						<g:link controller="user" action="logout">Logout</g:link><br>
					</div>
					Welcome back ${session?.user?.firstName} !<br><br>
					You have purchased ${session?.user?.purchasedSongs?.size() ?: 0} songs.<br>
				</div>
			</g:if>
			<g:else>
				<g:form controller="user" name="loginForm">
					<div>Username:</div>
					<g:textField name="login" value="${fieldValue(bean:loginCmd, field:login) }"/><br>
					<div>Password:</div>
					<g:passwordField name="password"/><br>
					<g:actionSubmit action="login" value="Login"/>
				</g:form>
				<g:renderErrors bean="${loginCmd}"/>
			</g:else>
		</div>
		
		<div id="navPane">
			<g:if test="${session?.user}">
				<ul>
					<li><g:link url="[controller='user', action='music']">My Music</g:link></li>
					<li><g:link url="[contoller='store', action='shop']">The Store</g:link></li>
				</ul>
			</g:if>
			<g:else>
				<div id="registerPane">
					<br><br>Need an account?<br>
					Sign up now to start your own personal Music collection!<br>
					<g:link controller="user" action="register">
						<g:submitButton name="signup" value="Sign Up"/>
					</g:link>
					<br><br>
				</div>
			</g:else>
		</div>
	</body>
</html>
