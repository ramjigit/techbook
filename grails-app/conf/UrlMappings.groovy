class UrlMappings {

	static mappings = {

		"/$controller/$action?/$id?"{ constraints { } }

		"/login"(controller: "login", action: "auth")
		"/denied"(controller: "login", action: "denied")
		"/about"(controller: "footer", action: "about")
		"/terms"(controller: "footer", action: "terms")
		"/privacy"(controller: "footer", action: "privacy")
		"/copyright"(controller: "footer", action: "copyright")

		"/"(controller: "post", action: "list")
		"/createTutorial"(controller: "post", action: "create")
		"/showTutorial"(controller: "post", action: "show")
		"/editTutorial"(controller: "post", action: "edit")

		"/quotes"(controller: "quote", action: "list")
		"/createQuote"(controller: "quote", action: "create")
		"/showQuote"(controller: "quote", action: "show")
		"/editQuote"(controller: "quote", action: "edit")

		"/users"(controller: "user", action: "list")
		"/createUser"(controller: "user", action: "create")
		"/showUser"(controller: "user", action: "show")
		"/editUser"(controller: "user", action: "edit")

		"/searchtb"(controller: "searchTechbook", action: "searchtb")
		"/searchuser"(controller: "searchTechbook", action: "searchuser")
		"/searchpost"(controller: "searchTechbook", action: "searchpost")
		"/searchquote"(controller: "searchTechbook", action: "searchquote")

		"/password-reset"(controller: "user", action: "forgetpass")

		"500"(controller: "error", action: "error_500")
		"404"(controller: "error", action: "error_404")
		"405"(controller: "error", action: "error_405")
	}
}
