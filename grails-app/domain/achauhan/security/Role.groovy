package achauhan.security

class Role {

	String authority

	static mapping = { cache true }

	static constraints = {
		authority blank: false, unique: true
	}

	@Override
	public String toString() {
		return authority.toString();
	}
}
