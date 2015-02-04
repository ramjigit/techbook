package achauhan.error

class ErrorController {

	def quoteService

	def error_404(){
		[quote: quoteService.getRandomQuote()]
	}
	def error_500(){
		[quote: quoteService.getRandomQuote()]
	}
	def error_405(){
		[quote: quoteService.getRandomQuote()]
	}
}