package achauhan

class QuoteService {

	boolean transactional = false

	def getStaticQuote() {
		return new Quote(author: "Amarjeet Chauhan",
		content: "Life is not what do you think , it's what do you build.")
	}
	def getRandomQuote() {
		try {
			def allQuotes = Quote.list()
			def randomQuote = null
			if (allQuotes.size() > 0) {
				def randomIdx = new Random().nextInt(allQuotes.size())
				randomQuote = allQuotes[randomIdx]
			} else {
				randomQuote = getStaticQuote()
			}
			return randomQuote
		} catch (Exception e) {
			println ("Quote not found -")
			e.printStackTrace()
		}
	}
}
