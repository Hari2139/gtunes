package com.gtunes

import grails.test.mixin.*
import spock.lang.Specification

@TestFor(UserController)
//@Mock will instruct framework to add GORM API to this domain class and provide a full in-memory
//implementation of GORM
@Mock([MyUser, LoginCommand])
class UserControllerSpec extends Specification {

	void "Test passwords do not match"() {
		request.method = 'POST'
		params.login = 'jill'
		params.password = 'test1'
		params.confirm = 'test100'

		when:"registering"
		def model = controller.register()

		then:"user has errors"
		def user = model.user
		user.hasErrors()
		'user.password.dontmatch' == user.errors['password'].code
	}

	void "Test constraints"() {
		request.method = 'POST'
		params.login = 'jill'
		params.password = 'test1'
		params.confirm = 'test1'

		when:"registering"
		def model = controller.register()

		then:"user has errors"
		def user = model.user
		user.hasErrors()
		'nullable' == user.errors['firstName'].code
		'nullable' == user.errors['lastName'].code
	}

	void "Test register success"() {
		request.method = 'POST'
		params.login = 'jill'
		params.password = 'password'
		params.confirm = 'password'
		params.firstName = 'Jill'
		params.lastName = 'Claire'

		when:"registering"
		controller.register()

		then:"user is saved"
		response.redirectedUrl == '/store'
		def user = session.user
		!user.hasErrors()
		user != null
		user.id != null
	}

	void "Test invalid login id"() {
		request.method = 'POST'
		params.login = 'dummy'

		when:'logging in with invalid ID'
		controller.login()

		then:'throw error message'
		view == '/store/index'
		!session.user
		def cmd = model.loginCmd
		cmd.hasErrors()
		cmd.errors['login'].code == 'user.not.found'
		!cmd.user
	}

	void "Test invalid password"() {
		request.method = 'POST'
		def user = new MyUser(login: 'mitra', password:'reddy', firstName: 'Mitra', lastName:'Vinda')
		user.save()
		params.login = 'mitra'
		params.password = 'dummy'

		when: 'logging in with valid ID but invalid password'
		controller.login()

		then: 'throw error message'
		view == '/store/index'
		!session.user
		def cmd = model.loginCmd
		cmd.user
		cmd.user.login == 'mitra'
		cmd.hasErrors()
		cmd.errors['password'].code == 'user.password.invalid'
	}

	void "Test login success"() {
		request.method = 'POST'
		def user = new MyUser(login: 'mitra', password:'reddy', firstName: 'Mitra', lastName:'Vinda')
		user.save()
		params.login = 'mitra'
		params.password = 'reddy'

		when: 'logging in with valid & password'
		controller.login()

		then: 'login success'
		response.redirectedUrl == '/store'
		session.user
		session.user.login == 'mitra'
		session.user.lastName == 'Vinda'
	}
}
