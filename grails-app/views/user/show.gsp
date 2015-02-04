<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>User | <g:if test="${userInstance?.username}">
		${userInstance.firstName}
		${userInstance.lastName}
	</g:if> <g:else>
			techwalk
		</g:else>
</title>
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
				<li><g:link action="list">
			all user
				</g:link></li>
				<li><g:link controller="post" action="create">
			create a tutorial
				</g:link></li>
			</ul>
		</div>
		<div class="div70">
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="alert">
					${flash.message}
				</div>
			</g:if>
			<g:if test="${userInstance?.photo}">
				<g:link controller="user" action="show" id="${userInstance.id}">
					<img
						src="<g:createLink controller='user' action='renderImage' id='${userInstance.id}'/>"
						class="userpic" />
					<g:fieldValue bean="${userInstance}" field="username" />
				</g:link>
			</g:if>
			<br> <br>
			<g:if test="${userInstance?.firstName}">
				<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue
						bean="${userInstance}" field="firstName" /></span>
			</g:if>

			<g:if test="${userInstance?.lastName}">
				<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue
						bean="${userInstance}" field="lastName" /></span>
			</g:if>
			<br>
			<g:if test="${userInstance?.email}">
				<span class="property-value" aria-labelledby="email-label"><g:fieldValue
						bean="${userInstance}" field="email" /></span>
			</g:if>
			<hr>
			<g:if test="${userInstance?.bio}">
				<span class="property-value" aria-labelledby="bio-label"><g:fieldValue
						bean="${userInstance}" field="bio" /></span>
			</g:if>
			<br> <br>
			<g:if test="${userInstance?.dateCreated}">
				<strong> User Created on:</strong>
				<span class="property-value" aria-labelledby="dateCreated-label"><postDate:dateFromNow
						date="${userInstance?.dateCreated}" /></span>
			</g:if>
			<hr>
			<g:if
				test="${customUserInstance?.username == userInstance?.username}">
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${userInstance?.id}" />
						<g:link class="saveDiv70" action="edit" id="${userInstance?.id}">
					Update User
					</g:link>
						<g:actionSubmit class="deleteDiv70" action="delete" value="Delete"
							onclick="return confirm('Are you sure ,you want to delete this user ?');" />
					</fieldset>
				</g:form>
			</g:if>
			<g:else>
				<sec:ifAllGranted roles="USER_ADMIN">
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${userInstance?.id}" />
							<g:link class="saveDiv70" action="edit" id="${userInstance?.id}">
					Update User
					</g:link>
							<g:actionSubmit class="deleteDiv70" action="delete"
								value="Delete"
								onclick="return confirm('Are you sure ,you want to delete this user ?');" />
						</fieldset>
					</g:form>
				</sec:ifAllGranted>
			</g:else>
		</div>
		<div class="right_cont">
			
		</div>
	</div>
</body>
</html>
