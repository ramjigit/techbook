<%@ page import="achauhan.security.UserRole"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>User Role | techbook</title>
</head>
<body>
	<div class="common_container">
		<div class="div70nav">
			<ul>
				<li><g:link class="create" action="create">
					user role
					</g:link></li>
			</ul>
		</div>
		<div class="div70">
			<h1>User's Role</h1>
			<hr>
			<g:if test="${flash.message}">
				<div class="message" role="status">
					${flash.message}
				</div>
			</g:if>
			<div class="tiles">
				<g:each in="${userRoleInstanceList}" status="i"
					var="userRoleInstance">
					<div class="tile">
						${userRoleInstance }
						${ userRoleInstance.id}
						${userRoleInstance.role.authority }
						<g:link controller="user" action="show"
							id="${ userRoleInstance.user.id}">
							${fieldValue(bean: userRoleInstance, field: "user")}
						</g:link>
						<g:link controller="userRole" action="edit"
							id="${ userRoleInstance.id}">edit</g:link>
					</div>
				</g:each>
			</div>
			<div class="paging">
				<g:paginate total="${userRoleInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
