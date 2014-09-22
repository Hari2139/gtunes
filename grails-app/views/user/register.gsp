<%@ page import="com.gtunes.MyUser" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Register</title>
		<style type="text/css">
			td.label { text-align:right; }
		</style>
	</head>
	<body id="body">
		<h1>Registration</h1>
		<p>Complete the form below to create an account.</p>
		<g:hasErrors bean="${user}">
			<div class="errors"><g:renderErrors bean="${user}"/> </div>
		</g:hasErrors>
		
		<g:form action="register" name="registerFrom">
			<table>
				<tr>
					<td class="label">Login:</td>
					<td><g:textField name="login" value="${user?.login}"/> </td>
				</tr>
				<tr>
					<td class="label">Password:</td>
					<td><g:passwordField name="password" value="${user?.password}"/></td>
				</tr>
				<tr>
					<td class="label">Confirm Password:</td>
					<td><g:passwordField name="confirm" value="${params?.confirm}"/></td>
				</tr>
				<tr>
					<td class="label">First name:</td>
					<td><g:textField name="firstName" value="${user?.firstName}"/> </td>
				</tr>
				<tr>
					<td class="label">Last name:</td>
					<td><g:textField name="lastName" value="${user?.lastName}"/> </td>
				</tr>
				<tr>
					<td class="label">Email:</td>
					<td><g:textField name="email" value="${user?.email}"/> </td>
				</tr>
				<tr><td></td><td><g:submitButton name="register" value="Register"/> </td></tr>
			</table>
		</g:form>
	</body>
</html>