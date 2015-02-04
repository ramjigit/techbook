package achauhan

import achauhan.security.User

class Post {

	byte[] postPic
	String title
	String message
	String subject
	String topic
	Date dateCreated
	Date lastUpdated
	static searchable = {
		only: ['title', 'subject', 'topic']
		mapping { spellCheck "include" }
	}
	static constraints = {
		postPic(nullable: true, maxSize: 5242880)
		title blank:false , maxSize: 255
		message (size:1..10000, blank:false)
		subject blank:false , maxSize: 255
		topic blank:false , maxSize: 255
	}
	static hasMany = [comment: Comment]
	static belongsTo = [ user: User ]
}