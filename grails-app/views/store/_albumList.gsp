<h3>Albums</h3>
<%--<img src="${art}"/>--%>

<%--
<ol class="list">
	<g:each in="${albums?}">
		<li><music:albumArt album="${it.title}" artist="${it.artist?.name}"/> ${it.title}</li>
	</g:each>
</ol>--%>

<g:each in="${albums?}" var="album">
	<music:albumArt album="${album.title}" artist="${album.artist?.name}"/>${album.title}
	<br>
</g:each>