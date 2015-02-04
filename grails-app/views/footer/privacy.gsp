<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Privacy | techbook</title>
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
			<h2>Privacy Policy</h2>
			<div class="termcont">
				<div class="termcont-inner">
					<ul>
						<li>We respect your privacy.
							<h3>Information we collect</h3> We collect information from you
							when you register on our site.<br> you are free to navigate
							through website without providing any personal information if you
							do not want to register with us.<br> What do we use your
							information for ?
							<ul>
								<li>The email address you provide will only be used to send
									you information and updates.</li>
							</ul>
						</li>
						<li>Do we use cookies? Yes, Cookies are small files is used
							to recognize your browser and capture and remember certain
							information.</li>
						<li>Third party products or services on our website, These
							third party sites have separate and independent privacy policies.
							We therefore have no responsibility or liability for the content
							and activities of these linked sites.</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
