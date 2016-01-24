
<%@ page import="com.gtunes.Store"%>
<!DOCTYPE html>
<html>
<head>
<g:javascript library="jquery"></g:javascript>
<script>
$(function(){
	$('form[id=loginForm]').ajaxForm(function(result){
		$('div[id=loginBox]').html(result);
	});
});
</script>
<meta name="layout" content="main">
<title>gTunes Store</title>
</head>
<body id="body">
	<h1>Your online music store and storage service</h1>
	<p>Manage your own library, browse music and purchase new tracks as
		they become available.</p>
	<br>
	<hr>
	<g:render template="/store/loginBox"></g:render>
	<r:script>
		$(function(){
			$('#loginForm').ajaxForm(function(result){
				$('div[id=loginBox]').html(result);
			});
		});
</r:script>

</body>
</html>
