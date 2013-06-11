
<%@ page import="com.bizconnect.UserRoles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userRoles.label', default: 'UserRoles')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userRoles" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userRoles" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="userRoles.roles.label" default="Roles" /></th>
					
						<th><g:message code="userRoles.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userRolesInstanceList}" status="i" var="userRolesInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userRolesInstance.id}">${fieldValue(bean: userRolesInstance, field: "roles")}</g:link></td>
					
						<td>${fieldValue(bean: userRolesInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userRolesInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
