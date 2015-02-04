<%@ page import="achauhan.Quote"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Quotes | techbook</title>
</head>
<body>
	<div class="common_container" role="navigation">
		<div class="div70nav">
			<ul>
				<li><g:link action="create">
				post a quote
					</g:link></li>
				<li><g:link controller="post" action="create">
				create a tutorial
					</g:link></li>
				<li><g:link controller="user" action="list">
						users
					</g:link></li>
				<li><g:form
						url='[controller: "searchTechbook", action: "searchquote"]'
						id="searchableForm" name="searchableForm" method="get">
						<g:textField name="q" value="${params.q}" size="50"
							placeholder="search quote by author or category" />
					</g:form></li>
			</ul>
		</div>
		<div class="div70">
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="alert">
					${flash.message}
				</div>
			</g:if>
			<div class="quote_tiles_left">
				<g:each in="${quoteInstanceList}" status="i" var="quoteInstance">
					<div class="quote_tile_left">
						<div class="quote_tile-inner_left">
							<postDate:dateFromNow date="${quoteInstance.dateCreated}" />
							<span>by -</span>
							<g:link controller="user" action="show"
								id="${quoteInstance.user.id}">
								${ quoteInstance.user.firstName}
								${ quoteInstance.user.lastName}
								<g:if test="${ quoteInstance?.user?.photo}">
									<img
										src="<g:createLink controller='user' action='renderImage' id='${quoteInstance.user.id}'/>"
										class="profile_pic" />
								</g:if>
							</g:link>
							<br>
							<hr>
							<g:link action="show" id="${quoteInstance.id}">
								<span> ${quoteInstance.content}
								</span> -</g:link>
							<strong> ${fieldValue(bean: quoteInstance, field: "author")}
							</strong>
							<hr>
							<span class="category"> ${fieldValue(bean: quoteInstance, field: "category")}
							</span>
						</div>
					</div>
				</g:each>
			</div>
			<div class="paging">
				<g:paginate total="${quoteInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
