<%@ page import="achauhan.security.UserRole"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>User Role | techbook</title>
</head>
<body>
	<div class="common_container" role="navigation">
		<div class="div70nav">
			<ul>
				<li><g:link class="list" action="list">
				User Roles
					</g:link></li>
			</ul>
		</div>
		<div class="div70">
			<h1>Create User Role</h1>
			<hr>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${
						flash.message
					}
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
			<g:form action="save">
				<fieldset class="form">
					<g:render template="form" />
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="saveDiv70"
						value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
