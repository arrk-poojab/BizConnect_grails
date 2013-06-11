<%@ page import="com.bizconnect.UserRoles" %>



<div class="fieldcontain ${hasErrors(bean: userRolesInstance, field: 'roles', 'error')} required">
	<label for="roles">
		<g:message code="userRoles.roles.label" default="Roles" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="roles" name="roles.id" from="${com.bizconnect.Roles.list()}" optionKey="id" required="" value="${userRolesInstance?.roles?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userRolesInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userRoles.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.bizconnect.User.list()}" optionKey="id" required="" value="${userRolesInstance?.user?.id}" class="many-to-one"/>
</div>

