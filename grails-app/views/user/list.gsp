<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Users | techbook</title>
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
				<li><g:link controller="post" action="create">
						create a tutorial
					</g:link></li>
				<li><g:form
						url='[controller: "searchTechbook", action: "searchuser"]'
						id="searchableForm" name="searchableForm" method="get">
						<g:textField name="q" value="${params.q}" size="50"
							placeholder="search user by username, first last name or email" />
					</g:form></li>
			</ul>
		</div>
		<div class="div70">
			<g:if test="${flash.message}">
				<div class="alert alert-danger" role="alert">
					${flash.message}
				</div>
			</g:if>
			<div class="tiles">
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<div class="tile">
						<g:if test="${userInstance?.photo}">
							<g:link controller="user" action="show" id="${userInstance.id}">
								<img
									src="<g:createLink controller='user' action='renderImage' id='${userInstance.id}'/>"
									class="userpic" />
							</g:link>
						</g:if>
						<g:link controller="user" action="show" id="${userInstance.id}">
							<g:fieldValue bean="${userInstance}" field="username" />
						</g:link>
						<span> ${fieldValue(bean: userInstance, field: "firstName")}
							${fieldValue(bean: userInstance, field: "lastName")}
						</span><span> ${fieldValue(bean: userInstance, field: "email")}
						</span>
					</div>
				</g:each>
			</div>
			<div class="pagination">
				<g:paginate total="${userInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
