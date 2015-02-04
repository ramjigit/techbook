package achauhan.search

import org.compass.core.engine.SearchEngineQueryParseException

import achauhan.Post
import achauhan.Quote
import achauhan.security.User

class SearchTechbookController {

	private static String currentClassName = SearchTechbookController.class.getName();
	def searchableService
	def quoteService

	def searchtb = {

		if(params.q == null){
			redirect(controller:'post',action: "list")
		}

		if (!params.q?.trim()) {
			return [:]
		}
		try {

			def userSearch = User.search(params.q, [max: 25, sort:"lastUpdated", order: "desc", escape: true]);
			def postSearch = Post.search(params.q, [max: 25, sort:"lastUpdated", order: "desc", escape: true]);

			return [userSearch: userSearch, postSearch:postSearch, quote: quoteService.getRandomQuote()]
		} catch (SearchEngineQueryParseException ex) {
			return [parseException: true]
		}
	}

	def searchuser = {
		try {

			def userSearch = User.search(params.q , params,[max: 25, sort:"lastUpdated", order: "desc",escape: true]);
			return [searchResult: userSearch, quote: quoteService.getRandomQuote()]
		} catch (Exception ex) {
			log.info("Exception occurs in - "+ currentClassName);
			log.info(ex);
		}
	}

	def searchpost = {
		try {
			def postSearch = Post.search(params.q , params,[max: 25, sort:"lastUpdated", order: "desc",escape: true]);
			return [searchResult: postSearch, quote: quoteService.getRandomQuote()]
		} catch (Exception ex) {
			log.info("Exception occurs in - "+ currentClassName);
			log.info(ex);
		}
	}

	def searchquote = {
		try {
			def quoteSearch = Quote.search(params.q , params,[max: 25, sort:"lastUpdated", order: "desc",escape: true]);
			return [searchResult: quoteSearch, quote: quoteService.getRandomQuote()]
		} catch (Exception ex) {
			log.info("Exception occurs in - "+ currentClassName);
			log.info(ex);
		}
	}
}
