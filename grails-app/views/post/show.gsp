<%@ page import="achauhan.Post"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Post | <g:if test="${postInstance?.title}">
		${postInstance.title}
	</g:if> <g:else>
			techbook
		</g:else>
</title>
<script type="text/javascript">
	function clearPostComment() {
		$(".textCommentArea input[type='text']").val("");
	};
</script>
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
				<li><g:link class="list" action="list">
			view all tutorial
				</g:link></li>
				<li><g:link class="create" action="create">
			create a post
				</g:link></li>
			</ul>
		</div>
		<div class="div70">
			<g:if test="${flash.message}">
				<div class="alert alert-success" role="alert">
					${flash.message}
				</div>
			</g:if>
			<g:if test="${postInstance?.postPic}">
				<g:link controller="post" action="show" id="${postInstance.id}">
					<img
						src="<g:createLink controller='post' action='renderPostImage' id='${postInstance.id}'/>"
						class="userpic" />
				</g:link>
			</g:if>
			<g:if test="${postInstance?.dateCreated}">
				<postDate:dateFromNow date="${postInstance?.dateCreated}" />
			</g:if>
			<span> --- by</span>
			<g:if test="${postInstance?.user}">
				<g:link controller="user" action="show"
					id="${postInstance?.user?.id}">
					${postInstance?.user?.encodeAsHTML()}
				</g:link>
			</g:if>
			<hr>
			<g:if test="${postInstance?.title}">
				<div class="page-header">
					<h1>
						<g:fieldValue bean="${postInstance}" field="title" />
						<br> <small> <g:if test="${postInstance?.subject}">
								<g:fieldValue bean="${postInstance}" field="subject" />
							</g:if> <g:if test="${postInstance?.topic}">
								<g:fieldValue bean="${postInstance}" field="topic" />
							</g:if>
						</small>
					</h1>
				</div>
			</g:if>
			<g:if test="${postInstance?.message}">
				${postInstance.message }
			</g:if>
			<hr>
			<g:if
				test="${customUserInstance?.username == postInstance?.user?.username}">
				<g:form>
					<fieldset class="buttons">
						<g:hiddenField name="id" value="${postInstance?.id}" />
						<g:link class="saveDiv70" action="edit" id="${postInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:actionSubmit class="deleteDiv70" action="delete" value="Delete"
							onclick="return confirm('Are you sure ,you want to delete this post ?');" />
					</fieldset>
				</g:form>
			</g:if>
			<g:else>
				<sec:ifAllGranted roles="USER_ADMIN">
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${postInstance?.id}" />
							<g:link class="saveDiv70" action="edit" id="${postInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							<g:actionSubmit class="deleteDiv70" action="delete"
								value="Delete"
								onclick="return confirm('Are you sure ,you want to delete this post ?');" />
						</fieldset>
					</g:form>
				</sec:ifAllGranted>
			</g:else>
			<div class="divider"></div>
			<div class="dateCommentArea">
				<div class="textPostDate">
					<ul class="post_action_list_left">
						<li><g:link controller="post" action="show"
								id="${postInstance.id}">Comment(${postCount})
				</g:link></li>
					</ul>
				</div>
				<div class="commonCommentArea">
					<div class="textCommentArea">
						<g:formRemote
							url="[controller:'comment' ,action: 'savePostComment']"
							update="updatePostCommentWall${postInstance.id}"
							name="addComment" after="clearPostComment()">
							<g:hiddenField name="commentRef" value="${postInstance.id}" />
							<g:textField name="comment" placeholder="write a comment..."
								id="commentField" maxlength="500" />
						</g:formRemote>
						<div id="updatePostCommentWall${postInstance.id}">
							<g:remoteLink controller="post" action="loadmorepost"
								params='[commentRef:"${postInstance.id}",offset:"0"]'
								update="updatePostCommentWall${postInstance.id}"
								class="load_more">load comments</g:remoteLink>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
