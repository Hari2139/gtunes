<p class="legend">Please login to your account</p>
<g:form url="[controller: 'user', action: 'login']" name="loginForm"
	id="loginForm" class="form">
	<div class="input">
		<g:textField name="login"
			value="${fieldValue(bean:loginCmd, field:login) }" required="true"
			placeholder="Username" />
		<g:hasErrors bean="${loginCmd}" field="login">
			<p class="error">
				<g:fieldError bean="${loginCmd}" field="login"></g:fieldError>
			</p>
		</g:hasErrors>
	</div>
	<br>
	<div class="input">
		<g:passwordField name="password" required="true"
			placeholder="Password" />
		<g:hasErrors bean="${loginCmd}" field="password">
			<p class="error">
				<g:fieldError bean="${loginCmd}" field="password"></g:fieldError>
			</p>
		</g:hasErrors>
	</div>
	<br>
	<div class="submit">
		<input class="btn" type="submit" value="Login">
	</div>
</g:form>
