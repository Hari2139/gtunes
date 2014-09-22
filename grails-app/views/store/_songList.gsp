<%--<div>
			<table>
			<tr><th>Song Title</th></tr>
			<g:each in="${songInstanceList?}">
				<tr><td>${it.title}</td></tr>
			</g:each>
			</table>
		</div>--%>
		
<h3>Songs</h3>
<ol class="list">
	<g:each in="${songs?}">
		<li>${it.title}</li>
	</g:each>
</ol>