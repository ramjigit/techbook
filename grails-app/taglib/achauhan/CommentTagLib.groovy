package achauhan

class CommentTagLib {
	static namespace = 'techbookComment'
	def springSecurityService
	def commentService
	
	def renderPostComment = { attrs ->
		def commentPostList = attrs.postComment
		out << g.render(template: 'postCommentList', model: [postComments: commentPostList,
			divUpdate :attrs.commentRef, currentLogedInUser: attrs.currentLogedInUser])
	}
	
	def renderLoadMorePostComment = { attrs ->
		out << g.render(template: 'loadPostComment',model: [postComments: attrs.loadComment, offset: attrs.nextRecords,
			divUpdate :attrs.commentRef, currentLogedInUser: attrs.currentLogedInUser, totalRecords: attrs.total]);
	}
	
	def rendernomoreComment = { attrs ->
		out << g.render(template: 'nomorecomment');
	}
}
