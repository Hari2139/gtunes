
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
	User not in session.
</g:else>