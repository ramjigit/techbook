<%@ page import="achauhan.Quote"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Post Quote | techbook</title>
</head>
<body>
	<div class="common_container" role="navigation">
		<div class="div70nav">
			<ul>
				<li><g:link controller="post" action="create">
				create a tutorial
					</g:link></li>
				<li><g:link controller="user" action="list">
						users
					</g:link></li>
			</ul>
		</div>
		<div class="div70">
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${quoteInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${quoteInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
							<div class="alert alert-danger" role="alert">
								<g:message error="${error}" />
							</div>
						</li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form controller="quote" action="save">
				<fieldset class="form">
					<g:render template="form" />
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="saveDiv70" value="Create" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
