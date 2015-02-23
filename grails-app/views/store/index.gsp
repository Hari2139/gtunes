
<%@ page import="com.gtunes.Store"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>gTunes Store</title>
</head>
<body id="body">
	<h1>Your online music store and storage service</h1>
	<p>Manage your own library, browse music and purchase new tracks as
		they become available.</p>
	<br>
	<br>

	<div id="loginBox" class="loginBox">
		<g:if test="${session?.user}">
			<div style="margin-top: 20px">
				Welcome back
				${session?.user?.firstName}
				!<br> <br> You have purchased
				${session?.user?.purchasedSongs?.size() ?: 0}
				songs.<br>
			</div>
		</g:if>
		<g:else>
			<g:form controller="user" name="loginForm">
				<div>Username:</div>
				<g:textField name="login"
					value="${fieldValue(bean:loginCmd, field:login) }" required="true" />
				<br>
				<div>Password:</div>
				<g:passwordField name="password" required="true" />
				<br>
				<g:actionSubmit action="login" value="Login" />
			</g:form>
			<g:renderErrors bean="${loginCmd}" />
		</g:else>
	</div>
<br>
	<br>
	<div id="navPane">
		<g:unless test="${session?.user}">
			<div id="registerPane">
				Need an account?<br> Sign up now to start your own personal
				Music collection!<br>
				<g:link controller="user" action="register">
					<g:submitButton name="signup" value="Sign Up"></g:submitButton>
				</g:link>
			</div>
		</g:unless>
	</div>
	<br>
	<br>
</body>
</html>
