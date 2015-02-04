<%@ page import="achauhan.security.UserRole"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="common_container" role="navigation">
		<div class="div70nav">
			<ul>
				<li><g:link class="list" action="list">
				all user role
					</g:link></li>
				<li><g:link class="create" action="create">
				create user role
					</g:link></li>
			</ul>
		</div>
		<div class="div70">
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${userRoleInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${userRoleInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form method="post">
				<g:hiddenField name="id" value="${userRoleInstance?.id}" />
				<g:hiddenField name="version" value="${userRoleInstance?.version}" />
				<fieldset class="form">
					<g:render template="form" />
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="Update" />
					<g:actionSubmit class="delete" action="delete" value="Delete"
						formnovalidate=""
						onclick="return confirm('Are you sure, you want to delete this role?');" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
