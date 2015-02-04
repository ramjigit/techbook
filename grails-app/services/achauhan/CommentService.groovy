package achauhan

class CommentService {

	private static final String currentClassName = CommentService.class.getName();

	def getCommentByCommentRefAndType(Post commentRef){
		def link = Comment.withCriteria {
			eq('post', commentRef)
			maxResults(3)
			order("dateCreated", "desc")
			cache true
		}
		return link
	}

	/*********************************************************************************************/

	def loadCommentsByCommentRefAndType(Post commentRef, int offset){
		def c = Comment.createCriteria()
		def results = c.list (max: 25, offset: offset) {
			eq('post', commentRef)
			order("dateCreated", "desc")
			cache true
		}
		return results
	}


	/*********************************************************************************************/

	def countPost(Post commentRef){
		def c = Comment.createCriteria()
		def countPost = c.get {
			projections {  count('id') }
			eq('post', commentRef)
		}
	}
}
