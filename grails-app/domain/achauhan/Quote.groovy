package achauhan

import achauhan.security.User

/**
 * <p>
 *  	Quote domain class for creating quote into techbook system.
 *  	This class can be search by seachable plugin by author name.
 * </p>
 * @author Amarjet CHUAHAN
 * @version 1.0
 * @mail <a href="mailto:rahulcse1@gmail.com">rahulcse1@gmail.com</a>
 *
 */
class Quote {

	String content
	String author
	String category
	Date dateCreated
	Date lastUpdated

	static constraints = {
		author(blank:false, maxSize: 30)
		content(maxSize:1000, blank:false)
		category(blank:false, maxSize: 30)
	}
	static searchable = {
		only: ['author','category']
		mapping { spellCheck "include" }
	}
	static belongsTo = [ user: User ]
}
