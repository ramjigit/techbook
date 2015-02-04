package achauhan

import org.springframework.dao.DataIntegrityViolationException

import achauhan.security.User

class UserController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService
	def quoteService
	def commonService
	def emailService

	def renderImage(Long id) {
		def userInstance = User.get(id)
		if (userInstance?.photo) {
			response.setContentLength(userInstance.photo.length)
			response.outputStream.write(userInstance.photo)
		} else{
			response.sendError(404)
		}
	}
	def index() {
		redirect(action: "list", params: params)
	}

	def forgetpass(){
		[quote: quoteService.getRandomQuote()]
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		params.sort= "dateCreated"
		params.order="desc"
		[userInstanceList: User.list(params), userInstanceTotal: User.count(),quote: quoteService.getRandomQuote()]
	}

	def create() {
		[userInstance: new User(params),quote: quoteService.getRandomQuote()]
	}

	def save() {
		def userInstance = new User(params)
		if (!userInstance.save(flush: true)) {
			render(view: "create", model: [userInstance: userInstance])
			return
		}
		emailService.sendWelcomeMail(params.email, params.firstName + ' '+ params.lastName);
		flash.message = "User with username: ${userInstance.username} created successfully."
		redirect(action: "show", id: userInstance.id)
	}

	def show(Long id) {
		def userInstance = User.get(id)
		if (!userInstance) {
			flash.message = "User not found."
			redirect(action: "list")
			return
		}
		if(!isUserLogin()){
			[userInstance: userInstance,quote: quoteService.getRandomQuote()]
		}
		else{
			def customUserInstance = lookupCurrentPerson()
			[userInstance: userInstance, customUserInstance: customUserInstance,quote: quoteService.getRandomQuote()]
		}
	}

	def edit(Long id) {
		def userInstance = User.get(id)
		def customUserInstance
		if(!isUserLogin()){
			redirect(controller: "login" , action: "auth")
		}
		else{
			customUserInstance = lookupCurrentPerson()
			if(userInstance.username != customUserInstance.username){
				redirect(controller: "login" , action: "denied")
			}
		}
		if (!userInstance) {
			flash.message = "User not found."
			redirect(action: "list")
			return
		}
		[userInstance: userInstance, customUserInstance: customUserInstance]
	}

	def updatePassword(Long id, Long version) {

		def userInstance = User.get(id)
		if (!userInstance) {
			flash.message ="User not found."
			redirect(action: "list")
			return
		}

		def password = params.password
		def confirm = params.confirm

		if(password.length() == 0 || confirm.length() == 0){
			flash.message = "passowrd and confirm password can not be empty."
			redirect(action: "edit", id: userInstance.id)
			return
		}

		if(!password.equals(confirm)){
			flash.message = "passowrd and confirm password are not same."
			redirect(action: "edit", id: userInstance.id)
			return
		}

		userInstance.password = password

		if (!userInstance.save(flush: true)) {
			render(view: "edit", model: [userInstance: userInstance])
			return
		}

		flash.message = "password updated successfully."
		redirect(action: "edit", id: userInstance.id)
	}

	def setPassword(){

		String emailOrUsername = params.emailOrUsername.toString()

		if(emailOrUsername.length() <= 0){
			flash.message ="Provide email or username."
		}

		EmailValidator emailValidator = new EmailValidator();
		boolean email = emailValidator.validate(emailOrUsername);

		if(email){
			def userInstance = User.findByEmail(emailOrUsername);
			if (!userInstance) {
				flash.message ="User not found with that email."
				redirect(action: "forgetpass")
				return
			}
			def newpass = commonService.randomString(12);
			userInstance.password = newpass

			if (!userInstance.save(flush: true)) {
				render(view: "edit", model: [userInstance: userInstance])
				return
			}
			emailService.sendMail(emailOrUsername,"New password-",newpass)
			flash.message = "password sent to you email."
			redirect(controller: "login", action: "auth")
		}else{
		
			def userInstance = User.findByUsername(emailOrUsername);
			if (!userInstance) {
				flash.message ="User not found with that username or email."
				redirect(action: "forgetpass")
				return
			}
			def newpass = commonService.randomString(12);
			userInstance.password = newpass
			if (!userInstance.save(flush: true)) {
				render(view: "edit", model: [userInstance: userInstance])
				return
			}
			emailService.sendMail(userInstance.email ,"New password-", newpass)
			flash.message = "password sent to you email."
			redirect(controller: "login", action: "auth")
		}
	}

	def update(Long id, Long version) {
		def userInstance = User.get(id)
		if (!userInstance) {
			flash.message ="User not found."
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (userInstance.version > version) {
				userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'user.label', default: 'User')] as Object[],
						"Another user has updated this User while you were editing")
				render(view: "edit", model: [userInstance: userInstance])
				return
			}
		}

		userInstance.properties = params

		if (!userInstance.save(flush: true)) {
			render(view: "edit", model: [userInstance: userInstance])
			return
		}
		flash.message = "User with username: ${userInstance.username} updated successfully."
		redirect(action: "show", id: userInstance.id)
	}

	def delete(Long id) {
		def userInstance = User.get(id)
		if (!userInstance) {
			flash.message = "User not found."
			redirect(action: "list")
			return
		}

		try {
			userInstance.delete(flush: true)
			flash.message = "User with username: ${userInstance.username} deleted successfully."
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = "Something went wrong."
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
