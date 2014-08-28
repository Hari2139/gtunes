package com.gtunes

class Artist {

	String name
	int age
	String email

	static constraints = {
		name blank: false
		age min: 10, max: 100
		email email:true, blank: false
	}

	static hasMany = [albums: Album] //Grails will inject java.util.Set<Album> albums

	String toString() {
		name
	}
}
