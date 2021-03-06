
<%@ page import="com.gtunes.Artist" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-artist" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-artist" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'artist.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="age" title="${message(code: 'artist.age.label', default: 'Age')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'artist.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${artistInstanceList}" status="i" var="artistInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${artistInstance.id}">${fieldValue(bean: artistInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: artistInstance, field: "age")}</td>
					
						<td>${fieldValue(bean: artistInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${artistInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
