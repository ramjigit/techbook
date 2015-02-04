package achauhan.security

import org.springframework.dao.DataIntegrityViolationException

class UserRoleController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		if(!isUserLogin() || !(userRoleInstance.user.username.equals("achauhan"))){
			redirect(controller: "login", action: "auth")
		}
		params.max = Math.min(max ?: 10, 100)
		[userRoleInstanceList: UserRole.list(params), userRoleInstanceTotal: UserRole.count()]
	}

	def create() {
		[userRoleInstance: new UserRole(params)]
	}

	def save() {
		def userRoleInstance = new UserRole(params)
		if(!isUserLogin() || !(userRoleInstance.user.username.equals("achauhan"))){
			redirect(controller: "login", action: "auth")
		}
		if (!userRoleInstance.save(flush: true)) {
			render(view: "create", model: [userRoleInstance: userRoleInstance])
			return
		}
		flash.message = "User role created."
		redirect(action: "list")
	}

	def edit(Long id) {
		def userRoleInstance = UserRole.get(id)
		if(!isUserLogin() || !(userRoleInstance.user.username.equals("achauhan"))){
			redirect(controller: "login", action: "auth")
		}
		if (!userRoleInstance) {
			flash.message = "User Role not found."
			redirect(action: "list")
			return
		}

		[userRoleInstance: userRoleInstance]
	}

	def update(Long id, Long version) {
		def userRoleInstance = UserRole.get(id)
		if (!userRoleInstance) {
			flash.message = "User Role not found."
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (userRoleInstance.version > version) {
				userRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'userRole.label', default: 'UserRole')] as Object[],
						"Another user has updated this UserRole while you were editing")
				render(view: "edit", model: [userRoleInstance: userRoleInstance])
				return
			}
		}

		userRoleInstance.properties = params

		if (!userRoleInstance.save(flush: true)) {
			render(view: "edit", model: [userRoleInstance: userRoleInstance])
			return
		}
		flash.message = "User Role updated."
		redirect(action: "list")
	}

	def delete(Long id) {
		def userRoleInstance = UserRole.get(id)
		if (!userRoleInstance) {
			flash.message = "User Role not found."
			redirect(action: "list")
			return
		}

		try {
			userRoleInstance.delete(flush: true)
			flash.message = "User Role deleted."
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			redirect(action: "list")
		}
	}

	def isUserLogin(){
		springSecurityService.isLoggedIn()
	}

	private lookupCurrentPerson() {
		User.get(springSecurityService.principal.id)
	}
}
