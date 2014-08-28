package com.gtunes



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class UserController {

	static allowedMethods = [register:
		["POST", "GET"]]



	def register(){
		if(request.method == 'POST') {
			def u = new User(params)
			if(u.password != params.confirm) {
				u.errors.rejectValue("password", "user.password.dontmatch")
				return [user:u]
			} else if (u.save()) {
				session.user = u
				redirect controller: "store"
			} else {
				return [user:u]
			}
		}
	}

	def login(LoginCommand cmd){
		if(request.method == 'POST') {
			if(cmd.hasErrors()) {
				render model:[loginCmd:cmd], view:'/store/index'
			} else {
				session.user = cmd.user
				redirect controller: "store"
			}
		} else {
			render view:'/store/index'
		}
	}
}