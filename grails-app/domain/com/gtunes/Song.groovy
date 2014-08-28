package com.gtunes

class Song {
	String title
	Artist artist
	Album album

	static constraints = { title blank: false }

	String toString() {
		title
	}
}
