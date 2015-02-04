<div class="commontCont">
	<ul>
		<g:each var="comment" in="${postComments}">
			<li>
				<div class="usrDet">
					<g:link controller="user" action="show" id="${comment.user.id}">
						<g:if test="${comment.user?.photo}">
							<img
								src="<g:createLink controller='user' action='renderImage' id='${comment.user.id}'/>"
								class="profile_pic" />
						</g:if>
					</g:link>
				</div>
				<div class="comntDets">
					${comment.comment }
					<div class="comntAct">
						<g:if
							test="${currentLogedInUser.username ==  comment.user.username}">
							<g:remoteLink controller="comment" action="deletePostComment"
								id="${comment.id}" update="updatePostCommentWall${divUpdate}"
								params='[commentRef:"${divUpdate}"]'>
								<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
							</g:remoteLink>
						</g:if>
					</div>
				</div>
			</li>
		</g:each>
	</ul>
	<g:remoteLink controller="post" action="loadmorepost"
		params='[commentRef:"${divUpdate}",offset:"0"]' after="afterLoad()"
		update="updatePostCommentWall${divUpdate}" class="load_more"
		id="load_more">load comments</g:remoteLink>
	<div id="updatePostCommentWall${divUpdate}"></div>
	<script type="text/javascript">
		function afterLoad() {
			$("#load_more").remove();
		}

		$(document).ready(function() {
			$('#load_more').click(function() {
				$(this).hide(1000);
			});
		});
	</script>
</div>