package achauhan

import achauhan.security.User

class RecentUserService {

	private getRecentUser(){
		try {
			def query = User.whereAny {
			}.order 'dateCreated', 'desc'
			def users = query.list(max: 10,offset: 0)
			return users
		} catch (Exception e) {
			log.error(e)
		}
	}
}