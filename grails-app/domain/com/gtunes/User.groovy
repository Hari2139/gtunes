package com.gtunes

class User {
	String login
	String password
	String firstName
	String lastName

	static hasMany = [purchasedSongs: Song]

	static constraints = {
		login blank: false, size:3..15, unique:true, matches:/[\S]+/
		password blank:false, size:3..15, matches:/[\S]+/
		firstName blank:false
		lastName blank:false
	}
}
