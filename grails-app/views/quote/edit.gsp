<%@ page import="achauhan.Quote"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Edit quote | techbook</title>
</head>
<body>
	<div class="common_container" role="navigation">
		<div class="div70nav">
			<ul>
				<li><g:link class="create" action="create">
				post a quote
					</g:link></li>
				<li><g:link controller="post" action="create">
				create a tutorial
					</g:link></li>
				<li><g:link controller="user" action="list">
						users
					</g:link></li>
			</ul>
		</div>
		<div class="div70">
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
			<g:form method="post">
				<g:hiddenField name="id" value="${quoteInstance?.id}" />
				<g:hiddenField name="version" value="${quoteInstance?.version}" />
				<fieldset class="form">
					<g:render template="form" />
				</fieldset>
				<div class="useractions">
					<g:actionSubmit class="saveDiv70" action="update" value="update"
						id="maketags" />
					<g:actionSubmit class="deleteDiv70" action="delete" value="delete"
						formnovalidate=""
						onclick="return confirm('Are you sure, you want to delete this quote ?');" />
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>
