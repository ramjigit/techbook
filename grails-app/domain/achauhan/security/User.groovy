package achauhan.security

import achauhan.Post

class User {

	transient springSecurityService

	String username
	String password
	byte[] photo
	String firstName
	String lastName
	String bio
	String email
	Date dateCreated
	Date lastUpdated
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static searchable = {
		only: [
			'lastName',
			'firstName',
			'username',
			'email'
		]
		mapping { spellCheck "include" }
	}

	static hasMany = [
		posts : Post,
	]

	static constraints = {
		photo(nullable: true, maxSize: 5242880) // max 5mb
		username (size: 8..20, unique:true,blank:false)
		firstName(nullable: false, blank: false, maxSize: 20)
		password (minSize: 8, blank: false, validator: { passwd, user ->
			return passwd != user.username
		})
		lastName(nullable: false, blank: false, maxSize: 10)
		bio(nullable: true, maxSize: 2000)
		email(email: true, blank: false,unique:true)
		dateCreated()
	}

	@Override
	public String toString() {
		return this.firstName + " " + this.lastName;
	}

	static mapping = { password column: '`password`' }

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
