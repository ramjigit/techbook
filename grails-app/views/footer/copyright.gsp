<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Copyright | techbook</title>
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
				<li><g:link controller="post" action="list">
			view all posts
				</g:link></li>
				<li><g:link controller="user" action="list">
			view all users
				</g:link></li>
			</ul>
		</div>
		<div class="div70">
			<div class="termcont">
				<div class="termcont-inner">
					<ul>
						<li>All the third party logos or trademarks in any form are
							the property of their respective owners and they hold their
							copyrights.</li>
						<li>Please do not copy other works. Study , work hard and
							write.</li>
						<li>Please let's us know if your work has been copied.
							Although we do not control data posting.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
