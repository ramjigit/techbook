<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Edit | <g:if test="${userInstance?.username}">
		${userInstance.firstName}
		${userInstance.lastName}
	</g:if> <g:else>
		User
	</g:else></title>
</head>
<body>
	<div class="common_container" role="navigation">
		<div class="div70nav">
			<ul>
				<li><g:link action="list">
				all users
					</g:link></li>
				<li><g:link controller="post" action="create">
				create a tutorial
					</g:link></li>
			</ul>
		</div>
		<div class="div70">
			<g:if test="${flash.message}">
				<div class="alert alert-warning" role="alert">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${userInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
							<div class="alert alert-danger" role="alert">
								<g:message error="${error}" />
							</div>
						</li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form method="post" enctype="multipart/form-data">
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<h4>Change your password:</h4>
				<div
					class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
					<g:passwordField name="password" required=""
						placeholder="Enter Password" id="passwordfield" />
				</div>
				<g:passwordField name="confirm" placeholder="Confirm Password"
					id="passwordfield" />
				<g:actionSubmit class="saveDiv70" action="updatePassword"
					value="Update" />
			</g:form>
			<hr>
			<g:form method="post" enctype="multipart/form-data">
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<fieldset class="form">
					<g:render template="edituser" />
				</fieldset>
				<hr>
				<fieldset class="buttons">
					<g:actionSubmit class="saveDiv70" action="update" value="Update" />
					<g:actionSubmit class="deleteDiv70" action="delete" value="Delete"
						formnovalidate="" onclick="Are you sure ?" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
