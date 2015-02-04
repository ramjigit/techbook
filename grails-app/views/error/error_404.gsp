<head>
<meta name='layout' content='main' />
<title><g:message code="springSecurity.denied.title" /> |
	techbook</title>
</head>
<body>
	<div class="common_container">
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
		<div class="alert alert-danger" role="alert">
			<h1>404 Error !!</h1>
			<p>Sorry, that page doesn’t exist!.</p>
			<h4>The link may be broken, or the page may have been removed.</h4>
		</div>
	</div>
</body>
