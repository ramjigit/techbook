<html>
<head>
<meta name='layout' content='main' />
<title>Login | techbook</title>
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
		<div class="container">
			<div id="loginbox" style="margin-top: 50px;"
				class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
				<g:if test='${flash.message}'>
					<div class="alert alert-danger" role="alert">
						${flash.message}
					</div>
				</g:if>
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="panel-title">Enter you username or email id -</div>
					</div>
					<div style="padding-top: 30px" class="panel-body">
						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>

						<g:form method="post">
							<g:field type="text" name="emailOrUsername" required=""
								style="width:503px" />
							<g:actionSubmit class="saveDiv70" controller="user"
								name="password-reset" action="setPassword" value="Search" />
						</g:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
