package achauhan

import achauhan.security.User

class Comment {

	String comment
	Date dateCreated
	Date lastUpdated

	static constraints = {
		comment size: 1..500,blank:false
	}
	static belongsTo = [user: User, post: Post]
}