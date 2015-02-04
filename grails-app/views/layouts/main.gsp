<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Common place to write tutorial on different technologies like hadoop, java, mongodb, neo4j, .net etc and share your knowledge with peoples" />
<meta name="keywords"
	content="Core Java,J2EE, Java, Hibernate, ORM, Spring, Struts, JSF,.net, asp .net, c#, Maven, jQuery, Java tutorials, Hibernate tutorials, Spring tutorials, Struts tutorials,Hadoop tutorials, Mondodb tutorials, Redis tutorials, Lucene tutorials, solr tutorials, .net tutorials Maven tutorials, jQuery tutorials, Java example, Hibernate example, Spring example, Maven example, Struts example, jQuery example, JSF example" />
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'techbook.png')}"
	type="image/x-icon">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootstrap.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'techbook.css')}" type="text/css">
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'jquery-1.11.2.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
<g:layoutHead />
<r:layoutResources />
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><g:link controller="post" action="list"
							class="navbar-brand">
							<strong>techbook</strong>
						</g:link></li>
					<li><g:link controller="quote" action="list">
							quotes
						</g:link></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<sec:ifNotLoggedIn>
						<li><g:link controller="login" action="auth">Login</g:link></li>
						<li><g:link controller="user" action="create">Register</g:link></li>
					</sec:ifNotLoggedIn>
					<li><g:link controller="footer" action="about">About</g:link></li>
					<sec:ifLoggedIn>
						<li><g:link controller="logout" action="logout">
							Logout</g:link></li>
					</sec:ifLoggedIn>
					<li><a href="#" class="dropdown-toggle" data-toggle="dropdown"
						role="button" aria-expanded="false">Connect <span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="https://www.facebook.com/rahulcse1"
								target="_new">Facebook</a></li>
							<li><a
								href="https://www.linkedin.com/profile/preview?vpa=pub&locale=en_US"
								target="_new">Linkedin</a></li>
							<li><a href="https://twitter.com/rahulcse1" target="_new">Twitter</a></li>
							<li class="divider"></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<g:layoutBody />
	<div class="common_container">
		<div class="footer">
			<ul>
				<li><g:link controller="footer" action="about">
							About
						</g:link></li>
				<li><g:link controller="footer" action="terms">
							Terms
						</g:link></li>
				<li><g:link controller="footer" action="privacy">
							Privacy
						</g:link></li>
				<li><g:link controller="footer" action="copyright">
							Copyright
						</g:link></li>
			</ul>
		</div>
	</div>
	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>
	<g:javascript library="application" />
	<r:layoutResources />
</body>
</html>
