<div style="width:800px;">
	<div style="float: left; width:50%;">
		<h1>Need an account?</h1>
		Sign up now to start your own personal Music collection!<br>
		<g:link controller="user" action="register">
			<g:submitButton name="signup" value="Sign Up"></g:submitButton>
		</g:link>
	</div>

	<div id="loginBox" style="float: right;">
		<h1>Already a member?</h1>
		<g:render template="/store/loginForm"></g:render>
	</div>
</div>