package com.gtunes

class MyUser {
	String login
	String password
	String firstName
	String lastName
	String email

	static hasMany = [purchasedSongs: Song]

	static constraints = {
		login blank: false, size:3..15, unique:true, matches:/[\S]+/
		password blank:false, size:3..15, matches:/[\S]+/
		firstName blank:false
		lastName blank:false
		email email:true, blank:false
	}
}
