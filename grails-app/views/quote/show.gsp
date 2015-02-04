<%@ page import="achauhan.Quote"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Quote | techbook</title>
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
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="alert">
					${flash.message}
				</div>
			</g:if>
			<div class="quote_post_details">
				<g:if test="${quoteInstance?.content}">
					<span> ${quoteInstance.content}
					</span>
				</g:if>
				<br> -
				<g:if test="${quoteInstance?.author}">
					<strong><g:fieldValue bean="${quoteInstance}"
							field="author" /></strong>
				</g:if>
				<br>
				<g:if test="${quoteInstance?.dateCreated}">
					<postDate:dateFromNow date="${quoteInstance?.dateCreated}" />
				</g:if>
				<g:if test="${quoteInstance?.user}">
					<span id="userspan"> posted by - <g:link controller="user"
							action="show" id="${quoteInstance.user.id}">
							${ quoteInstance.user.firstName}
							${ quoteInstance.user.lastName}
							<g:if test="${ quoteInstance.user.photo}">
								<img
									src="<g:createLink controller='user' action='renderImage' id='${quoteInstance.user.id}'/>"
									class="profile_pic" />
							</g:if>
						</g:link></span>
				</g:if>
			</div>
			<g:if
				test="${customUserInstance?.username == quoteInstance?.user?.username}">
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${quoteInstance?.id}" />
						<g:link class="saveDiv70" action="edit" id="${quoteInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:actionSubmit class="deleteDiv70" action="delete" value="Delete"
							onclick="return confirm('Are you sure ,you want to delete this quote ?');" />
					</fieldset>
				</g:form>
			</g:if>
			<g:else>
				<sec:ifAllGranted roles="USER_ADMIN">
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${quoteInstance?.id}" />
							<g:link class="saveDiv70" action="edit" id="${quoteInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							<g:actionSubmit class="deleteDiv70" action="delete"
								value="Delete"
								onclick="return confirm('Are you sure ,you want to delete this post ?');" />
						</fieldset>
					</g:form>
				</sec:ifAllGranted>
			</g:else>
		</div>
	</div>
</body>
</html>
