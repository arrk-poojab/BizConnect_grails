class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view: 'home/home')
        "/home"(view: 'home/home')
        "/tutorial"(view: 'tutorial/tutorial')
        "/login"(controller: "login", action: "index")
        "/index"(controller: "twitter", action: "index")
		"500"(view:'/error')
	}
}
