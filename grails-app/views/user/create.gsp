<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Register | techbook</title>
</head>
<body>
	<div class="common_container" role="navigation">
		<div class="quote_post_details">
			<g:if test="${quote?.content}">
				<span> ${quote.content}
				</span>
			</g:if>
			<br> -
			<g:if test="${quote?.author}">
				<strong><g:fieldValue bean="${quote}" field="author" /></strong>
			</g:if>
		</div>
		<div class="div70nav">
			<ul>
				<li><g:link class="list" action="list">
				all users
					</g:link></li>
			</ul>
		</div>
		<div class="div70">
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="alert">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${userInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
							<div class="alert alert-warning" role="alert">
								<g:message error="${error}" />
							</div>
						</li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form action="save" enctype="multipart/form-data">
				<fieldset class="form">
					<g:render template="form" />
				</fieldset>
				<hr>
				<fieldset class="buttons">
					<g:submitButton name="create" class="saveDiv70" value="Create" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
