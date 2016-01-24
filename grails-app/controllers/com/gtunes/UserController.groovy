package com.gtunes



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = false)
class UserController {

	static allowedMethods = [register:
		["POST", "GET"]]

	def register(){
		if(request.method == 'POST') {
			def u = new MyUser(params)
			if(u.password != params.confirm) {
				u.errors.rejectValue("password", "user.password.dontmatch")
				return [user:u]
			} else if (u.save()) {
				session.user = u
				sendEmailConfirmation(u)
				redirect controller: "store"
			} else {
				return [user:u]
			}
		}
	}

	def sendEmailConfirmation(MyUser u) {
		try{
			sendMail {
				to u.email
				subject 'Registration Complete!'
				body view: '/emails/confirmRegistration', model: [user:u]
			}
		} catch (Exception ex) {
			logger.error('Error sending email')
		}
	}

	def login(LoginCommand cmd){
		if(request.method == 'POST') {
			if(cmd.hasErrors()) {
				//render model:[loginCmd:cmd], view:'/store/index'
				render template: '/store/loginBox', model:[loginCmd:cmd]
			} else {
				session.user = cmd.user
				//redirect controller: "store"
				render template: '/store/welcomeMessage'
			}
		} else {
			//render view:'/store/index'
			render template: '/store/loginBox'
		}
	}

	def logout() {
		session.user = null
		render view:'/store/index'
	}
}