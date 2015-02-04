package achauhan

import org.springframework.dao.DataIntegrityViolationException

import achauhan.security.User

class QuoteController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		params.sort= "dateCreated"
		params.order="desc"
		[quoteInstanceList: Quote.list(params), quoteInstanceTotal: Quote.count()]
	}

	def create() {
		if(!isUserLogin()){
			redirect(controller: "login", action:"auth")
		}
		[quoteInstance: new Quote(params)]
	}

	def save() {
		if(!isUserLogin()){
			redirect(controller: "login" , action: "auth")
		}
		def quoteInstance = new Quote(params)
		quoteInstance.user = lookupCurrentPerson()
		if (!quoteInstance.save(flush: true)) {
			render(view: "create", model: [quoteInstance: quoteInstance])
			return
		}
		flash.message = "Quote posted successfully."
		redirect(action: "show", id: quoteInstance.id)
	}

	def show(Long id) {
		def quoteInstance = Quote.get(id)
		if (!quoteInstance) {
			flash.message = "Quote not found."
			redirect(action: "list")
			return
		}
		if(!isUserLogin()){
			[quoteInstance: quoteInstance]
		}
		else{
			def customUserInstance = lookupCurrentPerson()
			[quoteInstance: quoteInstance, customUserInstance: customUserInstance]
		}
	}

	def edit(Long id) {
		def quoteInstance = Quote.get(id)
		def customUserInstance
		if(!isUserLogin()){
			redirect(controller: "login" , action: "auth")
		}else{
			customUserInstance = lookupCurrentPerson()
			if(quoteInstance.user.username != customUserInstance.username){
				redirect(controller: "login" , action: "denied")
			}
		}
		if (!quoteInstance) {
			flash.message = "Quote not found."
			redirect(action: "list")
			return
		}
		[quoteInstance: quoteInstance, customUserInstance: customUserInstance]
	}

	def update(Long id, Long version) {
		def quoteInstance = Quote.get(id)
		if (!quoteInstance) {
			flash.message ="Quote not found."
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (quoteInstance.version > version) {
				quoteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'quote.label', default: 'Quote')] as Object[],
						"Another user has updated this Quote while you were editing")
				render(view: "edit", model: [quoteInstance: quoteInstance])
				return
			}
		}

		quoteInstance.properties = params

		if (!quoteInstance.save(flush: true)) {
			render(view: "edit", model: [quoteInstance: quoteInstance])
			return
		}

		flash.message = "Quote updated successfully."
		redirect(action: "show", id: quoteInstance.id)
	}

	def delete(Long id) {
		def quoteInstance = Quote.get(id)
		if (!quoteInstance) {
			flash.message = "Quote not found."
			redirect(action: "list")
			return
		}

		try {
			quoteInstance.delete(flush: true)
			flash.message = "Quote deleted successfully."
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = "Quote not found."
			redirect(action: "show", id: id)
		}
	}

	def isUserLogin(){
		springSecurityService.isLoggedIn()
	}

	private lookupCurrentPerson() {
		User.get(springSecurityService.principal.id)
	}
}
