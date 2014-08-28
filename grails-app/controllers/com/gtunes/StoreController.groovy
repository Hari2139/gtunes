package com.gtunes



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StoreController {

	static allowedMethods = []

	def index() {
	}

	def shop() {
		//respond Genre.list(), view:'genre'
	}
}
