package achauhan

import achauhan.Post;

class RecentTutorialService {

	private getRecentPost(){
		try {
			def query = Post.whereAny {
			}.order 'dateCreated', 'desc'
			def posts = query.list(max: 10,offset: 0)
			return posts
		} catch (Exception e) {
			log.error(e)
		}
	}
}