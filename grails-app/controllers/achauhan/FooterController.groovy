package achauhan

class FooterController {

	def quoteService

	def about() {
		[quote: quoteService.getRandomQuote()]
	}
	def terms() {
		[quote: quoteService.getRandomQuote()]
	}
	def privacy(){
		[quote: quoteService.getRandomQuote()]
	}
	def copyright(){
		[quote: quoteService.getRandomQuote()]
	}
}
