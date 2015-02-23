<%@ page import="com.gtunes.Song"%>
<!DOCTYPE HTML>
<html>
<head>
<meta name="layout" content="main">
<title>The Music Store</title>

<script type="text/javascript">
	$(function() {
		$('#songs').hide();
		$('#albums').show();
	});

	function showHide(divId) {
		$('#songs').hide();
		$('#albums').hide();
		$(divId).show();
	}
</script>
</head>

<body id="body">
	<div id="top5Panel" class="top5Panel">
		<output onclick="showHide(songs)" style="cursor: pointer;">
			<span style="text-decoration: underline;">Top 5 Songs</span>
		</output>
		<br>
		<output onclick="showHide(albums)" style="cursor: pointer;">
			<span style="text-decoration: underline;">Top 5 Albums</span>
		</output>

		<br>
		<br>
		<div id="songs">
			<g:render template="/store/songList" model="[songs: top5Songs]"></g:render>
		</div>

		<div id="albums">
			<g:render template="/store/albumList" model="[albums: top5Albums]"></g:render>
		</div>
	</div>
</body>
</html>