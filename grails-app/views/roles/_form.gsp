<%@ page import="com.bizconnect.Roles" %>



<div class="fieldcontain ${hasErrors(bean: rolesInstance, field: 'authority', 'error')} required">
	<label for="authority">
		<g:message code="roles.authority.label" default="Authority" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="authority" required="" value="${rolesInstance?.authority}"/>
</div>

