<%@ page import="achauhan.Post"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Tutorials | techbook</title>
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
			<div class="loginuser">
				<g:if test="${userInstance?.username}">
					<g:link controller="user" action="show" id="${userInstance.id}">
						${userInstance?.username}
					</g:link>
				</g:if>
				<g:if test="${userInstance?.photo}">
					<g:link controller="user" action="show" id="${userInstance.id}">
						<img
							src="<g:createLink controller='user' action='renderImage' id='${userInstance.id}'/>"
							class="userpic" />
					</g:link>
				</g:if>
			</div>
			<ul>
				<li><g:link controller="post" action="create">
				create a tutorial
					</g:link></li>
				<li><g:link controller="quote" action="create">
				post a quote
					</g:link></li>
				<li>
				<li><g:link controller="user" action="list">
						users
					</g:link></li>
				<li><g:form
						url='[controller: "searchTechbook", action: "searchpost"]'
						id="searchableForm" name="searchableForm" method="get">
						<g:textField name="q" value="${params.q}" size="50"
							placeholder="search tutorial by title, subject or topic" />
					</g:form></li>
			</ul>
		</div>
		<div class="div70">
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="alert">
					${flash.message}
				</div>

			</g:if>
			<div class="tiles">
				<g:each in="${postInstanceList}" status="i" var="postInstance">
					<div class="tile">
						<g:if test="${postInstance?.postPic}">
							<g:link controller="post" action="show" id="${postInstance.id}">
								<img
									src="<g:createLink controller='post' action='renderPostImage' id='${postInstance.id}'/>"
									class="userpic" />
							</g:link>
						</g:if>
						<br>
						<g:link controller='post' action="show" id="${postInstance.id}">
							${postInstance.title }
						</g:link>
						- posted by:
						<g:link controller='user' action="show"
							id="${postInstance.user.id}">
							${postInstance.user.username }
						</g:link>
						<span> ${postInstance.subject}
						</span> <span> ${postInstance.topic}
						</span>
						<postDate:dateFromNow date="${postInstance.dateCreated}" />

					</div>
				</g:each>
			</div>
			<div class="paging">
				<g:paginate total="${postInstanceTotal}" />
			</div>
		</div>
		<div class="right_cont">
			<h4>recent post -</h4>
			<div class="list-group">
				<g:each in="${recentPost}" status="i" var="post">
					<g:link controller="post" action="show" id="${post.id}"
						class="list-group-item">
						${post.title }
					</g:link>
				</g:each>
			</div>
		</div>
		<div class="right_cont">
			<h4>recent user -</h4>
			<div class="list-group">
				<g:each in="${recentUser}" status="i" var="user">
					<g:link controller="user" action="show" id="${user.id}"
						class="list-group-item">
						${user.firstName }
						${user.lastName }
					</g:link>
				</g:each>
			</div>
		</div>
	</div>
</body>
</html>
