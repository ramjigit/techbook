package achauhan

import org.springframework.dao.DataIntegrityViolationException

import achauhan.security.User

class PostController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService
	def commentService
	def quoteService
	def recentTutorialService
	def recentUserService

	def index() {
		redirect(action: "list", params: params)
	}

	def renderPostImage(Long id) {
		def postInstance = Post.get(id)
		if (postInstance?.postPic) {
			response.setContentLength(postInstance.postPic.length)
			response.outputStream.write(postInstance.postPic)
		} else{
			response.sendError(404)
		}
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		params.sort= "dateCreated"
		params.order="desc"
		if(isUserLogin()){
			[postInstanceList: Post.list(params), postInstanceTotal: Post.count(), quote: quoteService.getRandomQuote(),
				recentPost: recentTutorialService.getRecentPost(), recentUser: recentUserService.getRecentUser()
				, userInstance: lookupCurrentPerson()]
		}else{
			[postInstanceList: Post.list(params), postInstanceTotal: Post.count(), quote: quoteService.getRandomQuote(),
				recentPost: recentTutorialService.getRecentPost(), recentUser: recentUserService.getRecentUser()
			]
		}
	}

	def create() {
		if(!isUserLogin()){
			redirect(controller: "login", action:"auth")
		}
		[postInstance: new Post(params),quote: quoteService.getRandomQuote()]
	}

	def save() {
		def postInstance = new Post(params)
		postInstance.user = lookupCurrentPerson()
		if (!postInstance.save(flush: true)) {
			render(view: "create", model: [postInstance: postInstance])
			return
		}

		flash.message = "Post ${postInstance.title} created successfully."
		redirect(action: "show", id: postInstance.id)
	}

	def show(Long id) {
		def postInstance = Post.get(id)
		if (!postInstance) {
			flash.message = "Post not found."
			redirect(action: "list")
			return
		}
		int postCount = commentService.countPost(postInstance)
		if(!isUserLogin()){
			[postInstance: postInstance,postCount: postCount,quote: quoteService.getRandomQuote()]
		}
		else{
			def customUserInstance = lookupCurrentPerson()
			[postInstance: postInstance, customUserInstance: customUserInstance,postCount: postCount, quote: quoteService.getRandomQuote()]
		}
	}

	def edit(Long id) {
		def postInstance = Post.get(id)
		def customUserInstance
		if(!isUserLogin()){
			redirect(controller: "login" , action: "auth")
		}else{
			customUserInstance = lookupCurrentPerson()
			if(postInstance.user.username != customUserInstance.username){
				redirect(controller: "login" , action: "denied")
			}
		}
		if (!postInstance) {
			flash.message = "Post not found."
			redirect(action: "list")
			return
		}
		[postInstance: postInstance, customUserInstance: customUserInstance]
	}

	def update(Long id, Long version) {
		def postInstance = Post.get(id)
		if (!postInstance) {
			flash.message = "Post not found."
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (postInstance.version > version) {
				postInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'post.label', default: 'Post')] as Object[],
						"Another user has updated this Post while you were editing")
				render(view: "edit", model: [postInstance: postInstance])
				return
			}
		}

		postInstance.properties = params

		if (!postInstance.save(flush: true)) {
			render(view: "edit", model: [postInstance: postInstance])
			return
		}
		flash.message = "Post ${postInstance.title} updated successfully."
		redirect(action: "show", id: postInstance.id)
	}

	def delete(Long id) {
		def postInstance = Post.get(id)
		if (!postInstance) {
			flash.message ="Post not found."
			redirect(action: "list")
			return
		}

		try {
			postInstance.delete(flush: true)
			flash.message = "Post ${postInstance.title} deleted successfully."
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = "Something went wrong."
			redirect(action: "show", id: id)
		}
	}

	def isUserLogin(){
		springSecurityService.isLoggedIn()
	}

	private lookupCurrentPerson() {
		User.get(springSecurityService.principal.id)
	}

	def loadmorepost(){
		try{
			if(!isUserLogin()){
				redirect(controller: "login" , action: "auth")
			}
			def currentLogedInUser = lookupCurrentPerson()
			def commentRef = params.commentRef.toInteger()
			int offset = params.offset.toInteger()
			def postRef = Post.get(commentRef)
			def loadComment = commentService.loadCommentsByCommentRefAndType(postRef, offset);
			int total = commentService.countPost(postRef)
			int nextRecords = offset + 25;
			if(offset >= total){
				def content = techbookComment.rendernomoreComment()
				render content
				return
			}
			def content = techbookComment.renderLoadMorePostComment(loadComment: loadComment, nextRecords: nextRecords,
			currentLogedInUser: currentLogedInUser, commentRef: commentRef, total: total)
			render content
		}catch(Exception er){
			er.printStackTrace();
		}
	}
}
