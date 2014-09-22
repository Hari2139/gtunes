package com.gtunes

class Album {
	String title
	String genre
	static hasMany = [songs:Song]
	static belongsTo = [artist:Artist]
	static constraints = {
		title blank:false
		genre blank: false, nullable: false
	}

	static mapping = {  songs sort: 'title' //This is same as "Songs" implementing 'Comparable' interface
	}

	String toString() {
		title
	}
}
