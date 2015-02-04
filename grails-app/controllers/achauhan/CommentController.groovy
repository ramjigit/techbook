package achauhan

import org.springframework.dao.DataIntegrityViolationException

import achauhan.security.User

class CommentController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	private static String currentClassName = CommentController.class.getName();
	def springSecurityService
	def commentService

	def savePostComment() {
		try {
			if(isUserLogin()){
				def currentLogedInUser = lookupCurrentPerson()
				def commentInstance = new Comment(params)
				def commentRef = params.commentRef.toInteger()
				commentInstance.user = lookupCurrentPerson()
				commentInstance.post =  Post.get(commentRef)
				if(commentInstance.user && commentInstance.post){
					if (!commentInstance.save(flush: true)) {
						return
					}
					def postCommentList = commentService.getCommentByCommentRefAndType(commentInstance.post)
					def content = techbookComment.renderPostComment(postComment: postCommentList, commentRef: commentRef,currentLogedInUser: currentLogedInUser)
					render content
				}
			}else{
				redirect(controller: "login" , action: "auth")
			}
		} catch (Exception e) {
			e.printStackTrace()
		}
	}

	def deletePostComment(Long id) {
		def commentInstance = Comment.get(id)
		if (!commentInstance) {
			flash.message = "comment not found."
			return
		}
		def currentLogedInUser = lookupCurrentPerson()
		def commentRef = params.commentRef.toInteger()
		try {
			commentInstance.delete(flush: true)
			def postCommentList = commentService.getCommentByCommentRefAndType(Post.get(commentRef))
			def content = techbookComment.renderPostComment(postComment: postCommentList, commentRef: commentRef,currentLogedInUser: currentLogedInUser)
			render content
		}
		catch (DataIntegrityViolationException e) {
			flash.message = "something went wrong."
			redirect(controller:"navigation", action: "home")
		}
	}

	def loadmorepost(){
		try{
			def currentLogedInUser = lookupCurrentPerson()
			def commentRef = params.commentRef.toInteger()
			int offset = params.offset.toInteger()
			def postRef = Post.get(commentRef)
			def loadComment = commentService.loadCommentsByCommentRefAndType(postRef, offset);
			int total = commentService.countPost(postRef)
			if(offset >= total){
				def content = techbookComment.rendernomoreComment()
				render content
				return
			}
			def content = techbookComment.renderLoadPostComment(loadComment: loadComment,
			currentLogedInUser: currentLogedInUser, commentRef: commentRef, total: total)
			render content
		}catch(Exception er){
			er.printStackTrace();
		}
	}

	def isUserLogin(){
		springSecurityService.isLoggedIn()
	}

	private lookupCurrentPerson() {
		User.get(springSecurityService.principal.id)
	}
}
