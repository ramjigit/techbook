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
						<div class="panel-title">Sign In</div>
					</div>

					<div style="padding-top: 30px" class="panel-body">
						<div style="display: none" id="login-alert"
							class="alert alert-danger col-sm-12"></div>
						<form action='${postUrl}' method='POST' id="loginform"
							class="form-horizontal" role="form">

							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input type='text'
									class='form-control' name='j_username' id='login-username'
									placeholder="username" />
							</div>

							<div style="margin-bottom: 25px" class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input type='password'
									class='form-control' name='j_password' id='login-password'
									placeholder="password" />
							</div>

							<div class="input-group">
								<input type='checkbox' name='${rememberMeParameter}'
									id='login-remember'
									<g:if test='${hasCookie}'>checked='checked'</g:if> /> <label
									for='remember_me'><g:message
										code="springSecurity.login.remember.me.label" /></label>
							</div>

							<div style="margin-top: 10px" class="form-group">
								<div class="col-sm-12 controls">
									<input type='submit' id="btn-login" class="btn btn-success"
										value='${message(code: "springSecurity.login.button")}' />
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-12 control">
									<div
										style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
										Don't have an account!
										<g:link controller="user" action="create">Sign Up Here</g:link>
										<g:link controller="user" action="forgetpass">Forgotten your password?</g:link>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
