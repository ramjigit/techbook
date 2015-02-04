<!DOCTYPE html>
<html>
<head>
<title>About | techbook</title>
<meta name="layout" content="main">
</head>
<body>
	<div class="aboutus-main-container">
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
		<div class="common_container" role="navigation">
			<div class="div70nav">
				<ul>
					<li><g:link controller="post" action="list">
			view all tutorial
				</g:link></li>
					<li><g:link controller="user" action="list">
			view all user
				</g:link></li>
					<li><g:link controller="quote" action="list">
			view all quote
				</g:link></li>
				</ul>
			</div>
		</div>
		<div id="aboutus-container-complete">
			<div class="tile tile-med tile-txt">
				<div class="tile-inner">
					<h3>WELCOME TO TECHBOOK</h3>
					<p>techbook is a commmon place for your tutorial. Share you
						knowledge with people.</p>
					<hr>
					<h4>Important Points</h4>
					<div class="mini">
						<h3>About the site:</h3>
						<p>
							I am working on a big social networking site. This website is the
							small part of my that project. But as an individual techbook is a
							tutorial website developed and maintained by me, Amarjeet
							Chauhan. This entire website is written in just two days.you can
							download full source code for this website form my github
							account.Here is my <a
								href="https://github.com/rahulcse1/techbook" target="_new">github
								link</a> <a href="http://en.wikipedia.org/wiki/GitHub" target="_new">github@wikipedia</a>
						</p>
						<p>I could not test this website so if you found any issue,
							please create issue related to website at my github account.</p>
					</div>

					<div class="mini">
						<h3>About Posting Tutorial:</h3>
						<p>Sharing your knowledge with people is the best thing, you
							can do for the community.</p>
						<p>
							Write good quality tutorial and post for free. Whatever subject
							you know please write about it. There are two benefit for writing
							tutorial, it will help other to gain knowledge and also it helps
							you to improve you knowledge. <br>Please upload tutorial
							specific image during tutorial writing, we appreciate it.
						</p>
					</div>
					<div class="mini">
						<h3>About Posting Quote:</h3>
						<p>I love reading quotes.Quote are the thought of peoples,
							it's their experience. It's good to learn from them.Quote inspire
							people. Quote help people to make thing possible.</p>
					</div>
				</div>
				<div id="future_task">
					<strong> Future task - you are most welcome for any kind
						of suggestions. If you have something in your mind and want it
						with techbook. You suggest me and write code with me. <br>
					</strong> <span>I am open source guy and have been working with
						software for the past 4 years. I am from Meerut, India. I
						currently live in Hyderabad. </span>
					<hr>
					Feel free to connect with me on different channel. <br>Mail
					Me: <a href="mailto:rahulcse1@gmail.com">rahulcse1@gmail.com</a><br>
					<script src="https://apis.google.com/js/platform.js" async defer></script>
					<div class="g-follow" data-annotation="bubble" data-height="20"
						data-href="//plus.google.com/u/0/100111565803297288941"
						data-rel="author"></div>
					<br>
					<iframe
						src="//www.facebook.com/plugins/follow?href=https%3A%2F%2Fwww.facebook.com%2Frahulcse1&amp;layout=standard&amp;show_faces=true&amp;colorscheme=light&amp;width=450&amp;height=20"
						scrolling="no" frameborder="0"
						style="border: none; margin-left: 0px; overflow: hidden; width: 450px; height: 20px;"
						allowTransparency="true"></iframe>
					<br> <a href="https://www.facebook.com/rahulcse1"
						target="_new">add me on fb</a><br> <br> <a
						href="https://twitter.com/rahulcse1" class="twitter-follow-button"
						data-show-count="false">Follow @rahulcse1</a>
					<script>
						!function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
									.test(d.location) ? 'http' : 'https';
							if (!d.getElementById(id)) {
								js = d.createElement(s);
								js.id = id;
								js.src = p
										+ '://platform.twitter.com/widgets.js';
								fjs.parentNode.insertBefore(js, fjs);
							}
						}(document, 'script', 'twitter-wjs');
					</script>
					<br> <a
						href="https://www.linkedin.com/profile/view?id=52790151&trk=spm_pic"
						target="_new">add me on linkedin</a> <br>
				</div>
			</div>
			<div class="tile tile-small tile-txt tile-info">
				<div class="tile-inner">
					<h4>my favourite -</h4>
					<span> I am passionate about open source technologies. I
						will write tutorial on JVM based technologies.</span>
					<ul>
						<li><strong>Technology </strong>: <a
							href="https://www.oracle.com/java/index.html" target="_new">Java
								& Family</a> <a href="http://www.apache.org/" target="_new">Apache
								Foundation</a> <a href="https://spring.io/" target="_new">Spring.io</a>
							<a href="http://lucene.apache.org/solr/" target="_new">Apache
								Solr</a> <a href="http://lucene.apache.org/core/" target="_new">Apache
								Lucene</a><br>I am also learning big data & family. I will
							share my experience with big data very soon.</li>
						<li><strong>Hobby </strong>:
							<ul>
								<li>Meeting to new people.</li>
								<li>Teaching</li>
								<li>Cooking</li>
								<li>Spending time with children</li>
								<li>Gym</li>
							</ul></li>
					</ul>
				</div>
			</div>
			<div class="tile tile-small1 tile-txt tile-info" id="contact">
				<div class="tile-inner">
					<h4>techbook contact information -</h4>
					<ul class="help">
						<li><strong>achauhan </strong>: <a
							href="mailto:achauhan@techbook.me">achauhan@techbook.me</a></li>
						<li><strong>Information </strong>: <a
							href="mailto:info@techbook.me">info@techbook.me</a></li>
						<li><strong>Call Me </strong>:+91 9640360270</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
